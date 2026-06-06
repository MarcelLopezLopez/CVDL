# LaTeX Compilation Script for Windows PowerShell
# Compiles FinalReport.tex with full bibliography support

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  LaTeX Report Compilation Script" -ForegroundColor Cyan
Write-Host "  Final Report - CV & Deep Learning" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Check if pdflatex is available
try {
    $pdflatexVersion = & pdflatex --version 2>&1 | Select-Object -First 1
    Write-Host "✓ pdflatex found: $pdflatexVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: pdflatex not found!" -ForegroundColor Red
    Write-Host "`nPlease install a LaTeX distribution:" -ForegroundColor Yellow
    Write-Host "  - MiKTeX: https://miktex.org/" -ForegroundColor Yellow
    Write-Host "  - TeX Live: https://www.tug.org/texlive/" -ForegroundColor Yellow
    exit 1
}

# Check if FinalReport.tex exists
if (-Not (Test-Path "FinalReport.tex")) {
    Write-Host "✗ ERROR: FinalReport.tex not found!" -ForegroundColor Red
    Write-Host "Make sure you're in the FinalReport directory." -ForegroundColor Yellow
    exit 1
}

Write-Host "`nStarting compilation process...`n" -ForegroundColor Yellow

# First pass - generate .aux file
Write-Host "[1/4] First pdflatex pass..." -ForegroundColor Cyan
$output1 = & pdflatex -interaction=nonstopmode FinalReport.tex 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ First pass completed" -ForegroundColor Green
} else {
    Write-Host "✗ First pass failed - check errors below:" -ForegroundColor Red
    Write-Host $output1 -ForegroundColor Gray
    exit 1
}

# Run BibTeX - process references
Write-Host "`n[2/4] Running BibTeX..." -ForegroundColor Cyan
$output2 = & bibtex FinalReport 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ BibTeX completed" -ForegroundColor Green
} else {
    Write-Host "⚠ BibTeX warning (may be OK if no citations)" -ForegroundColor Yellow
}

# Second pass - include references
Write-Host "`n[3/4] Second pdflatex pass..." -ForegroundColor Cyan
$output3 = & pdflatex -interaction=nonstopmode FinalReport.tex 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Second pass completed" -ForegroundColor Green
} else {
    Write-Host "✗ Second pass failed" -ForegroundColor Red
    Write-Host $output3 -ForegroundColor Gray
    exit 1
}

# Third pass - finalize cross-references
Write-Host "`n[4/4] Third pdflatex pass (finalizing)..." -ForegroundColor Cyan
$output4 = & pdflatex -interaction=nonstopmode FinalReport.tex 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Third pass completed" -ForegroundColor Green
} else {
    Write-Host "✗ Third pass failed" -ForegroundColor Red
    Write-Host $output4 -ForegroundColor Gray
    exit 1
}

# Check if PDF was created
if (Test-Path "FinalReport.pdf") {
    $pdfSize = (Get-Item "FinalReport.pdf").Length / 1KB
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "  ✓ COMPILATION SUCCESSFUL!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "`nOutput: FinalReport.pdf" -ForegroundColor Cyan
    Write-Host "Size: $([math]::Round($pdfSize, 2)) KB`n" -ForegroundColor Cyan
    
    # Clean up auxiliary files
    Write-Host "Cleaning up auxiliary files..." -ForegroundColor Yellow
    $auxFiles = @("*.aux", "*.log", "*.out", "*.toc", "*.bbl", "*.blg", "*.synctex.gz")
    foreach ($pattern in $auxFiles) {
        Remove-Item $pattern -ErrorAction SilentlyContinue
    }
    Write-Host "✓ Cleanup completed`n" -ForegroundColor Green
    
    # Offer to open PDF
    $response = Read-Host "Open PDF now? (Y/N)"
    if ($response -eq 'Y' -or $response -eq 'y') {
        Start-Process "FinalReport.pdf"
    }
    
} else {
    Write-Host "`n✗ ERROR: PDF file not created!" -ForegroundColor Red
    Write-Host "Check the log file for errors." -ForegroundColor Yellow
    exit 1
}

Write-Host "Done!`n" -ForegroundColor Green
