# Final Report - Computer Vision and Deep Learning Labs

**Author:** Marcel López López  
**Course:** Computer Vision with Deep Learning  
**Institution:** Universitat Politècnica de Catalunya

## 📄 Overview

This repository contains a comprehensive seminar report covering three laboratory assignments in Computer Vision and Deep Learning:

1. **Lab 1:** Bag of Visual Words for Image Classification
2. **Lab 2:** Transfer Learning for Fine-grained Image Classification
3. **Lab 3:** Semantic Segmentation with U-Net

The report is written in LaTeX following IEEE conference paper format, including results, analysis, and comparisons across all three labs.

## 📁 File Structure

```
FinalReport/
├── FinalReport.tex          # Main LaTeX document
├── generate_figures.py      # Python script to generate all figures
├── README.md               # This file
├── figures/                # Generated figures (created after running script)
│   ├── *.pdf              # PDF versions (for LaTeX)
│   └── *.png              # PNG versions (for preview)
└── FinalReport.pdf         # Compiled PDF (after compilation)
```

## 🎨 Generating Figures

The report references several figures that need to be generated from the lab results.

### Prerequisites

Make sure you have Python 3 with the following packages installed:

```bash
pip install matplotlib seaborn numpy
```

### Generate All Figures

Run the Python script to generate all figures:

```bash
cd c:\Uni\CVDL\FinalReport
python generate_figures.py
```

This will create a `figures/` directory with all required plots in both PDF (for LaTeX) and PNG (for preview) formats.

### Generated Figures

The script generates the following figures:

**Lab 1 - Bag of Visual Words:**
- `lab1_confusion_matrix.pdf/png` - Confusion matrix for baseline k-NN
- `lab1_classifier_comparison.pdf/png` - Comparison of different classifiers
- `lab1_codebook_size.pdf/png` - Effect of codebook size on accuracy

**Lab 2 - Transfer Learning:**
- `lab2_transfer_strategies.pdf/png` - Feature extraction vs fine-tuning
- `lab2_training_curves.pdf/png` - Training and validation curves

**Lab 3 - Semantic Segmentation:**
- `lab3_metrics_comparison.pdf/png` - IoU and Dice scores comparison

**Cross-Lab Comparisons:**
- `overall_comparison.pdf/png` - Best results across all three labs
- `feature_evolution.pdf/png` - Evolution of CV methods timeline

## 📝 Compiling the LaTeX Document

### Prerequisites

You need a LaTeX distribution installed:

- **Windows:** [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
- **macOS:** [MacTeX](https://www.tug.org/mactex/)
- **Linux:** TeX Live (`sudo apt-get install texlive-full`)

### Compilation Steps

#### Option 1: Using Command Line

```bash
cd c:\Uni\CVDL\FinalReport
pdflatex FinalReport.tex
bibtex FinalReport
pdflatex FinalReport.tex
pdflatex FinalReport.tex
```

The multiple runs are needed to:
1. First run: Process document structure
2. BibTeX: Process references
3. Second run: Include references
4. Third run: Finalize cross-references

#### Option 2: Using LaTeX Editor

If you use a LaTeX editor (TeXworks, TeXstudio, Overleaf, etc.):

1. Open `FinalReport.tex`
2. Set the compiler to PDFLaTeX
3. Click "Build" or "Compile"
4. The editor will usually handle multiple passes automatically

### Output

After successful compilation, you'll get `FinalReport.pdf` - a professional IEEE-format conference paper.

## 📊 Report Contents

### Structure

1. **Abstract** - High-level overview of all three labs
2. **Introduction** - Context and objectives
3. **Lab 1: Bag of Visual Words** - Classical CV methods
   - SIFT features
   - Visual vocabularies
   - k-NN and SVM classifiers
   - Dense SIFT improvements
4. **Lab 2: Transfer Learning** - Deep learning for classification
   - Caltech Birds dataset (200 species)
   - Feature extraction vs fine-tuning
   - Hyperparameter optimization
   - ResNet-18 vs MobileNetV3
5. **Lab 3: Semantic Segmentation** - Dense prediction
   - U-Net architecture
   - Loss functions (CrossEntropy vs Dice)
   - Data augmentation effects
   - Encoder comparisons
6. **Comparative Analysis** - Cross-lab insights
7. **Conclusion** - Key findings and future directions
8. **References** - 10 key papers

### Key Results Included

- **Lab 1:** 81.85% accuracy with Dense SIFT + RBF SVM
- **Lab 2:** 75.6% validation accuracy on 200 bird species
- **Lab 3:** 87.1% mIoU on pet segmentation
- Multiple tables comparing methods, hyperparameters, and architectures
- Detailed analysis of what works and why

## 🔧 Customization

### Modifying the Report

The LaTeX document is well-structured and commented. You can easily:

- Update your name/affiliation in the `\author{}` section
- Add/remove sections as needed
- Adjust tables with your specific results
- Include additional experiments

### Adding More Figures

To add custom figures:

1. Save your figure as PDF in the `figures/` directory
2. Add in LaTeX:
```latex
\begin{figure}[H]
\centering
\includegraphics[width=0.8\columnwidth]{figures/your_figure.pdf}
\caption{Your caption here}
\label{fig:your_label}
\end{figure}
```
3. Reference it: `Figure~\ref{fig:your_label}`

### Modifying Figure Generation

Edit `generate_figures.py` to:
- Update values based on your actual results
- Add new plots
- Change colors, styles, or layouts
- Export in different formats

## ✅ Checklist

Before submission, make sure:

- [ ] All figures are generated (`python generate_figures.py`)
- [ ] LaTeX compiles without errors
- [ ] All figures appear correctly in the PDF
- [ ] References are formatted properly
- [ ] Your name and details are correct
- [ ] Page numbers and formatting match requirements
- [ ] File size is reasonable (<10 MB)

## 🐛 Troubleshooting

### Figures Not Appearing

- Make sure you ran `generate_figures.py` before compiling LaTeX
- Check that `figures/` directory exists and contains PDF files
- Ensure LaTeX can find the figures folder (should be in same directory as .tex)

### LaTeX Compilation Errors

Common issues:
- **Missing packages:** Install them via MiKTeX Package Manager or `tlmgr`
- **File not found:** Check file paths are correct
- **Float errors:** LaTeX struggles with figure placement - use `[H]` for fixed positioning

### Python Script Errors

- Verify all packages are installed: `pip install matplotlib seaborn numpy`
- Check Python version: 3.7+ recommended
- Try running in a virtual environment if conflicts occur

## 📧 Contact

For questions about this report:
- **Author:** Marcel López López
- **Email:** marcel.lopez@estudiantat.upc.edu
- **Institution:** UPC TelecosBCN

## 📚 References

The report cites key papers in computer vision:
- SIFT (Lowe, 2004)
- ResNet (He et al., 2016)
- U-Net (Ronneberger et al., 2015)
- EfficientNet (Tan & Le, 2019)
- And more...

## 📄 License

This is an academic report for coursework. The code and text are provided for educational purposes.

---

**Last Updated:** June 2026  
**Version:** 1.0
