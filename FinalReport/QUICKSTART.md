# Quick Start Guide - Final Report

## ⚡ Fast Track (3 Steps)

### Step 1: Generate Figures
```bash
cd c:\Uni\CVDL\FinalReport
python generate_figures.py
```

### Step 2: Compile LaTeX
```bash
.\compile_report.ps1
```

### Step 3: Done!
Your professional PDF report is ready: `FinalReport.pdf`

---

## 📋 What You Get

### Main Document
- **FinalReport.pdf** - Professional IEEE-format conference paper (~15-20 pages)
- Complete analysis of 3 computer vision labs
- Tables, figures, and comparisons
- 10 academic references

### Alternative Format
- **FinalReport.md** - Markdown version (easier to edit/read on GitHub)

### Figures Generated (9 total)
```
figures/
├── lab1_confusion_matrix.pdf/png
├── lab1_classifier_comparison.pdf/png
├── lab1_codebook_size.pdf/png
├── lab2_transfer_strategies.pdf/png
├── lab2_training_curves.pdf/png
├── lab3_metrics_comparison.pdf/png
├── overall_comparison.pdf/png
└── feature_evolution.pdf/png
```

---

## 🔧 Requirements

### For Figures (Python)
```bash
pip install matplotlib seaborn numpy
```

### For LaTeX Compilation
- **Windows:** [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
- Packages needed: IEEEtran, graphicx, amsmath, booktabs, hyperref

---

## 🎨 Customization Tips

### Update Your Results
Edit `generate_figures.py` and change the data arrays:
```python
# Example: Update Lab 1 results
accuracy_kp = [0.5477, 0.5562, 0.6646, 0.6000]  # Change these!
```

### Modify Report Content
Open `FinalReport.tex` and edit:
- Results tables
- Discussion sections
- Add/remove figures
- Update text

### Preview Without Compilation
Check `FinalReport.md` - Markdown version with all content!

---

## 📊 Report Highlights

### Lab 1: Bag of Visual Words
- ✅ Best result: **81.85%** with Dense SIFT + RBF SVM
- 📈 Dense sampling improved accuracy by 15+ percentage points
- 3 comparison figures included

### Lab 2: Transfer Learning
- ✅ Best result: **75.6%** on 200 bird species
- 🎓 Fine-tuning outperformed feature extraction by 12 pp
- Compared ResNet-18 vs MobileNetV3

### Lab 3: Semantic Segmentation
- ✅ Best result: **87.1% mIoU** on pet segmentation
- 🏗️ EfficientNet-B0 encoder with Dice Loss
- Data augmentation crucial for performance

---

## 🐛 Common Issues

### "pdflatex not found"
**Solution:** Install MiKTeX or TeX Live and add to PATH

### "Figure not found"
**Solution:** Run `python generate_figures.py` first!

### "Python module not found"
**Solution:** `pip install matplotlib seaborn numpy`

### "Permission denied" (PowerShell)
**Solution:** Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

---

## 📁 File Organization

```
FinalReport/
├── FinalReport.tex          # Main LaTeX source
├── FinalReport.md           # Markdown alternative
├── FinalReport.pdf          # Compiled output
├── generate_figures.py      # Figure generation script
├── compile_report.ps1       # Compilation script
├── README.md               # Full documentation
├── QUICKSTART.md           # This file
└── figures/                # Generated figures
    ├── *.pdf              # For LaTeX
    └── *.png              # For preview
```

---

## 🚀 All-in-One Command

Want to do everything at once?

```powershell
# Generate figures and compile in one go
python generate_figures.py; .\compile_report.ps1
```

---

## ✅ Before Submission Checklist

- [ ] Ran `generate_figures.py` successfully
- [ ] Compiled LaTeX without errors
- [ ] Checked all figures appear in PDF
- [ ] Verified your name/details are correct
- [ ] Page count reasonable (15-25 pages)
- [ ] File size < 10 MB
- [ ] Reviewed conclusions section

---

## 💡 Pro Tips

1. **Preview quickly:** Open `FinalReport.md` in VS Code for fast preview
2. **Edit iteratively:** Modify LaTeX → compile → check PDF
3. **Version control:** Keep backups before major changes
4. **Export figures:** All figures available as PNG for presentations
5. **Reuse code:** `generate_figures.py` can be adapted for other reports

---

## 📧 Need Help?

Check the full README.md for:
- Detailed troubleshooting
- Customization examples
- LaTeX tips
- Figure modification guide

---

## 🎓 Report Quality

This report follows:
- ✅ IEEE conference paper format
- ✅ Professional academic writing style
- ✅ Proper citations and references
- ✅ High-quality figures (300 DPI)
- ✅ Comprehensive analysis and discussion

Perfect for coursework submission! 🎉

---

**Questions?** Check README.md or contact: marcel.lopez@estudiantat.upc.edu
