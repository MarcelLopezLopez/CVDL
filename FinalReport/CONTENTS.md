# Final Report - Table of Contents & Key Results

## 📑 Document Structure

### Cover Page
- Title: Computer Vision and Deep Learning: Object Recognition
- Author: Marcel López López
- Institution: UPC TelecosBCN
- Date: June 2026

### Abstract (Page 1)
- 150-word summary
- Keywords: Computer Vision, Deep Learning, BoVW, SIFT, Transfer Learning, U-Net

---

## 📖 Main Sections

### 1. Introduction (Pages 1-2)
**Content:**
- Evolution of computer vision methods
- Laboratory overview
- Objectives and goals
- Report structure

### 2. Laboratory 1: Bag of Visual Words (Pages 2-6)
**Topics Covered:**
- 2.1 Overview and Motivation
- 2.2 Dataset (8 scene categories)
- 2.3 Methodology (SIFT, K-means, Classification)
- 2.4 Experimental Results
  - Task 1: Confusion Matrix & Class Analysis
  - Task 2: Hyperparameter Optimization
  - Task 3: Linear SVM
  - Task 4: Non-linear Kernels (RBF, Histogram Intersection)
  - Task 5: Dense SIFT Features
- 2.5 Key Findings

**Key Results:**
| Method | Accuracy |
|--------|----------|
| Baseline (SIFT + k-NN) | 54.77% |
| SIFT + RBF SVM | 66.46% |
| **Dense SIFT + RBF SVM** | **81.85%** ⭐ |

**Figures Referenced:**
- Figure 1: Confusion matrix
- Figure 2: Classifier comparison
- Figure 3: Codebook size effect

**Tables Included:**
- Table I: k-NN hyperparameter results
- Table II: Classifier performance (keypoints)
- Table III: Dense SIFT results

### 3. Laboratory 2: Transfer Learning (Pages 6-10)
**Topics Covered:**
- 3.1 Overview
- 3.2 Dataset (Caltech Birds - 200 species)
- 3.3 Data Preprocessing
- 3.4 Transfer Learning Strategies
- 3.5 Experimental Setup
- 3.6 Results
  - Task 2: Feature Extraction vs Fine-Tuning
  - Task 3: Hyperparameter Search
  - Task 5: MobileNetV3 Comparison
  - Task 4: Additional Metrics
- 3.7 Key Findings

**Key Results:**
| Method | Val Accuracy |
|--------|--------------|
| ResNet-18 Fixed | 62.1% |
| ResNet-18 Fine-tune | 74.3% |
| **ResNet-18 Fine-tune (optimized)** | **75.6%** ⭐ |
| MobileNetV3 Fine-tune | 72.1% |

**Figures Referenced:**
- Figure 4: Transfer learning strategies
- Figure 5: Training curves

**Tables Included:**
- Table IV: Feature extraction vs fine-tuning
- Table V: Hyperparameter search results
- Table VI: Architecture comparison

### 4. Laboratory 3: Semantic Segmentation (Pages 10-13)
**Topics Covered:**
- 4.1 Overview
- 4.2 Dataset (Oxford-IIIT Pet)
- 4.3 U-Net Architecture
- 4.4 Loss Functions
- 4.5 Data Augmentation
- 4.6 Evaluation Metrics (IoU, Dice)
- 4.7 Experimental Results
  - Baseline: ResNet34 + CrossEntropy
  - Tasks 1-2: EfficientNet-B0 + Dice Loss
  - Tasks 3-4: Enhanced Augmentation
- 4.8 Qualitative Analysis
- 4.9 Key Findings

**Key Results:**
| Configuration | mIoU | Dice Score |
|---------------|------|------------|
| ResNet34 + CrossEntropy | 84.7% | 91.2% |
| EfficientNet-B0 + Dice | 86.3% | 92.5% |
| **EfficientNet-B0 + Dice + Aug** | **87.1%** | **93.1%** ⭐ |

**Figures Referenced:**
- Figure 6: Metrics comparison

**Tables Included:**
- Table VII: Segmentation results summary

### 5. Comparative Analysis (Pages 13-15)
**Topics Covered:**
- 5.1 Evolution of CV Methods
- 5.2 Performance Comparison
- 5.3 Lessons Learned
  - Feature representation quality
  - Transfer learning power
  - Task-specific design
  - Data augmentation
  - Hyperparameter tuning
- 5.4 Practical Implications

**Figures Referenced:**
- Figure 7: Overall comparison across labs
- Figure 8: Feature evolution timeline

**Tables Included:**
- Table VIII: Cross-laboratory performance summary

### 6. Conclusion (Page 15-16)
**Content:**
- Key achievements summary
- Main insights
- Future directions
- Final thoughts

### References (Page 16)
**10 Key Papers:**
1. Sivic & Zisserman (2003) - Video Google
2. Lowe (2004) - SIFT
3. He et al. (2016) - ResNet
4. Ronneberger et al. (2015) - U-Net
5. Tan & Le (2019) - EfficientNet
6. Wah et al. (2011) - Caltech Birds Dataset
7. Parkhi et al. (2012) - Pet Dataset
8. Deng et al. (2009) - ImageNet
9. Milletari et al. (2016) - Dice Loss
10. Howard et al. (2019) - MobileNetV3

---

## 📊 All Figures Summary

**Total: 9 Figures**

1. **lab1_confusion_matrix** - Baseline confusion matrix
2. **lab1_classifier_comparison** - Keypoints vs Dense SIFT
3. **lab1_codebook_size** - Vocabulary size impact
4. **lab2_transfer_strategies** - Fixed vs Fine-tuning
5. **lab2_training_curves** - Loss and accuracy over epochs
6. **lab3_metrics_comparison** - IoU and Dice scores
7. **overall_comparison** - Best results across all labs
8. **feature_evolution** - Timeline of CV methods

---

## 📈 All Tables Summary

**Total: 8 Tables**

| Table | Content | Location |
|-------|---------|----------|
| I | k-NN Hyperparameters | Lab 1 |
| II | Classifier Performance (Keypoints) | Lab 1 |
| III | Dense SIFT Results | Lab 1 |
| IV | Transfer Learning Strategies | Lab 2 |
| V | Hyperparameter Search | Lab 2 |
| VI | Architecture Comparison | Lab 2 |
| VII | Segmentation Results | Lab 3 |
| VIII | Overall Performance Summary | Analysis |

---

## 🎯 Quick Results Reference

### Best Results by Lab

**Lab 1: Scene Classification**
- Method: Dense SIFT + RBF SVM
- Accuracy: **81.85%**
- Dataset: 8 scene categories
- Key insight: Dense sampling > keypoint detection

**Lab 2: Bird Classification**
- Method: ResNet-18 Fine-tuning
- Accuracy: **75.6%** (200 classes!)
- Dataset: Caltech-UCSD Birds
- Key insight: Fine-tuning > feature extraction

**Lab 3: Pet Segmentation**
- Method: EfficientNet-B0 + Dice Loss
- mIoU: **87.1%**
- Dataset: Oxford-IIIT Pet
- Key insight: Task-specific loss functions help

### Performance Improvements Achieved

| Lab | Baseline | Best | Improvement |
|-----|----------|------|-------------|
| Lab 1 | 54.77% | 81.85% | **+27.08 pp** |
| Lab 2 | 62.1% | 75.6% | **+13.5 pp** |
| Lab 3 | 84.7% | 87.1% | **+2.4 pp** |

(pp = percentage points)

---

## 💡 Key Takeaways (For Quick Reference)

### Top 5 Insights

1. **Feature quality matters most** - Dense SIFT dramatically outperformed sparse keypoints
2. **Transfer learning is powerful** - Pre-trained models work with limited data
3. **Fine-tuning beats feature extraction** - For fine-grained tasks, adapt all layers
4. **Data augmentation is crucial** - Especially with small datasets
5. **Task-specific design helps** - Custom loss functions, kernels improve results

### What Works Best

| Task Type | Best Approach | Why |
|-----------|---------------|-----|
| Scene Classification | Dense SIFT + RBF SVM | Complete spatial coverage |
| Fine-grained Classification | ResNet Fine-tuning | Adaptation to subtle differences |
| Semantic Segmentation | U-Net + Dice Loss | Direct metric optimization |

### Practical Recommendations

✅ **DO:**
- Start with transfer learning
- Use data augmentation
- Fine-tune for fine-grained tasks
- Choose task-specific loss functions
- Systematically tune hyperparameters

❌ **DON'T:**
- Train from scratch with limited data
- Use only sparse keypoints for BoVW
- Ignore data augmentation
- Stop at feature extraction for complex tasks
- Use default hyperparameters without testing

---

## 📄 Document Statistics

- **Total Pages:** ~15-20
- **Word Count:** ~6,000-7,000
- **Figures:** 9 (all in 300 DPI PDF/PNG)
- **Tables:** 8
- **References:** 10 academic papers
- **Equations:** 2 (IoU, Dice)
- **Code Snippets:** Minimal (focus on results)

---

## 🎨 Visual Elements

### Color Scheme
- Results: Green highlights for best results
- Warnings: Yellow for important notes
- Structure: Blue for section headers
- Emphasis: Red for critical points

### Figure Quality
- Format: PDF (vector) + PNG (raster)
- Resolution: 300 DPI
- Style: Professional, consistent
- Labels: Clear, readable fonts

---

## ✅ Self-Review Checklist

Before submission, verify:

- [ ] All 9 figures present and referenced
- [ ] All 8 tables properly formatted
- [ ] 10 references cited correctly
- [ ] No compilation errors
- [ ] Author name/email correct
- [ ] Page numbers present
- [ ] Abstract under 200 words
- [ ] Conclusion summarizes all labs
- [ ] File size reasonable (<10 MB)
- [ ] PDF readable on different devices

---

**Document Version:** 1.0  
**Last Updated:** June 2026  
**Format:** IEEE Conference Paper Style  
**Length:** 15-20 pages  

---

*For detailed instructions, see README.md*  
*For quick start, see QUICKSTART.md*
