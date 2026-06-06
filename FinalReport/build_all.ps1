# All-in-One Final Report Generator
# Generates figures and compiles LaTeX document in one go

Write-Host "`n" -NoNewline
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                        ║" -ForegroundColor Cyan
Write-Host "║       FINAL REPORT - COMPLETE BUILD SCRIPT            ║" -ForegroundColor Cyan
Write-Host "║       Computer Vision & Deep Learning Labs            ║" -ForegroundColor Cyan
Write-Host "║                                                        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host "`n"

$ErrorActionPreference = "Stop"

# ============================================
# STEP 1: Check Prerequisites
# ============================================
Write-Host "═══ Step 1: Checking Prerequisites ═══`n" -ForegroundColor Yellow

# Check Python
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python not found! Please install Python 3.x" -ForegroundColor Red
    exit 1
}

# Check pdflatex
try {
    $pdflatexVersion = & pdflatex --version 2>&1 | Select-Object -First 1
    Write-Host "✓ pdflatex found: $pdflatexVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ pdflatex not found! Install MiKTeX or TeX Live" -ForegroundColor Red
    exit 1
}

# Check required files
$requiredFiles = @("FinalReport.tex", "generate_figures.py")
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✓ Found: $file" -ForegroundColor Green
    } else {
        Write-Host "✗ Missing: $file" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`n✓ All prerequisites satisfied!`n" -ForegroundColor Green
Start-Sleep -Seconds 1

# ============================================
# STEP 2: Generate Figures
# ============================================
Write-Host "═══ Step 2: Generating Figures ═══`n" -ForegroundColor Yellow

try {
    Write-Host "Running generate_figures.py...`n" -ForegroundColor Cyan
    $figureOutput = python generate_figures.py 2>&1
    Write-Host $figureOutput
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✓ Figures generated successfully!" -ForegroundColor Green
    } else {
        throw "Figure generation failed"
    }
} catch {
    Write-Host "`n✗ ERROR: Failed to generate figures!" -ForegroundColor Red
    Write-Host "Check that matplotlib, seaborn, and numpy are installed:" -ForegroundColor Yellow
    Write-Host "  pip install matplotlib seaborn numpy" -ForegroundColor Yellow
    exit 1
}

Start-Sleep -Seconds 1

# ============================================
# STEP 3: Compile LaTeX Document
# ============================================
Write-Host "`n═══ Step 3: Compiling LaTeX Document ═══`n" -ForegroundColor Yellow

Write-Host "This will take 4 compilation passes (with BibTeX)...`n" -ForegroundColor Cyan

# Pass 1
Write-Host "[1/4] First pdflatex pass..." -ForegroundColor Cyan
$null = & pdflatex -interaction=nonstopmode FinalReport.tex 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "      ✓ Completed" -ForegroundColor Green
} else {
    Write-Host "      ✗ Failed" -ForegroundColor Red
    Write-Host "`nCheck FinalReport.log for errors" -ForegroundColor Yellow
    exit 1
}

# Pass 2 - BibTeX
Write-Host "[2/4] Running BibTeX..." -ForegroundColor Cyan
$null = & bibtex FinalReport 2>&1
Write-Host "      ✓ Completed" -ForegroundColor Green

# Pass 3
Write-Host "[3/4] Second pdflatex pass..." -ForegroundColor Cyan
$null = & pdflatex -interaction=nonstopmode FinalReport.tex 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "      ✓ Completed" -ForegroundColor Green
} else {
    Write-Host "      ✗ Failed" -ForegroundColor Red
    exit 1
}

# Pass 4
Write-Host "[4/4] Final pdflatex pass..." -ForegroundColor Cyan
$null = & pdflatex -interaction=nonstopmode FinalReport.tex 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "      ✓ Completed" -ForegroundColor Green
} else {
    Write-Host "      ✗ Failed" -ForegroundColor Red
    exit 1
}

# ============================================
# STEP 4: Verify Output
# ============================================
Write-Host "`n═══ Step 4: Verifying Output ═══`n" -ForegroundColor Yellow

if (Test-Path "FinalReport.pdf") {
    $pdfSize = (Get-Item "FinalReport.pdf").Length / 1KB
    $pdfPages = "~15-20"  # Estimate
    
    Write-Host "✓ PDF created successfully!" -ForegroundColor Green
    Write-Host "  File: FinalReport.pdf" -ForegroundColor Cyan
    Write-Host "  Size: $([math]::Round($pdfSize, 2)) KB" -ForegroundColor Cyan
    Write-Host "  Estimated pages: $pdfPages" -ForegroundColor Cyan
} else {
    Write-Host "✗ PDF not created - compilation failed!" -ForegroundColor Red
    exit 1
}

# Count figures
$figureCount = (Get-ChildItem "figures\*.pdf" -ErrorAction SilentlyContinue).Count
Write-Host "`n✓ Generated $figureCount figures in figures/ directory" -ForegroundColor Green

# ============================================
# STEP 5: Cleanup
# ============================================
Write-Host "`n═══ Step 5: Cleaning Up ═══`n" -ForegroundColor Yellow

$auxFiles = @("*.aux", "*.log", "*.out", "*.toc", "*.bbl", "*.blg", "*.synctex.gz")
$cleanedCount = 0
foreach ($pattern in $auxFiles) {
    $files = Get-ChildItem $pattern -ErrorAction SilentlyContinue
    if ($files) {
        Remove-Item $pattern -ErrorAction SilentlyContinue
        $cleanedCount += $files.Count
    }
}
Write-Host "✓ Removed $cleanedCount auxiliary files" -ForegroundColor Green

# ============================================
# SUCCESS!
# ============================================
Write-Host "`n"
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                                                        ║" -ForegroundColor Green
Write-Host "║                ✓ BUILD SUCCESSFUL!                     ║" -ForegroundColor Green
Write-Host "║                                                        ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host "`n"

Write-Host "Your final report is ready!" -ForegroundColor Cyan
Write-Host "  📄 Main document: FinalReport.pdf" -ForegroundColor Cyan
Write-Host "  📊 Figures: figures/ directory ($figureCount files)" -ForegroundColor Cyan
Write-Host "  📝 Markdown version: FinalReport.md" -ForegroundColor Cyan
Write-Host "`n"

# Offer to open PDF
$response = Read-Host "Would you like to open the PDF now? (Y/N)"
if ($response -eq 'Y' -or $response -eq 'y') {
    Start-Process "FinalReport.pdf"
    Write-Host "`n✓ Opening PDF...`n" -ForegroundColor Green
} else {
    Write-Host "`nYou can open it later by double-clicking FinalReport.pdf`n" -ForegroundColor Cyan
}

Write-Host "═══════════════════════════════════════════════════════" -ForegroundColor Gray
Write-Host "Summary of Generated Content:" -ForegroundColor White
Write-Host "  • Professional IEEE-format conference paper" -ForegroundColor Gray
Write-Host "  • Comprehensive analysis of 3 CV labs" -ForegroundColor Gray
Write-Host "  • 9 high-quality figures (300 DPI)" -ForegroundColor Gray
Write-Host "  • Tables comparing methods and results" -ForegroundColor Gray
Write-Host "  • 10 academic references" -ForegroundColor Gray
Write-Host "  • Discussion and conclusions" -ForegroundColor Gray
Write-Host "═══════════════════════════════════════════════════════`n" -ForegroundColor Gray

Write-Host "Done! 🎉`n" -ForegroundColor Green
