# Computer Vision and Deep Learning: Object Recognition
## Laboratory Report on Image Classification and Semantic Segmentation

**Author:** Marcel López López  
**Course:** Computer Vision with Deep Learning  
**Institution:** Universitat Politècnica de Catalunya  
**Date:** June 2026

---

## Abstract

This report presents a comprehensive study of modern computer vision techniques for object recognition, spanning from classical methods to deep learning approaches. Three laboratory assignments were conducted to explore different aspects of visual recognition: (1) image classification using the Bag of Visual Words (BoVW) model with SIFT features, (2) transfer learning for fine-grained bird species classification using pre-trained deep convolutional networks, and (3) semantic segmentation of pet images using U-Net architecture. The experiments demonstrate the evolution from handcrafted features to learned representations, achieving significant performance improvements. The best results include **81.9% accuracy** on the BoVW task with Dense SIFT, competitive performance on Caltech Birds dataset with transfer learning, and effective segmentation with U-Net achieving **87.1% mIoU**. This work highlights the importance of feature representation quality and the power of transfer learning in computer vision applications.

**Keywords:** Computer Vision, Deep Learning, Bag of Visual Words, SIFT, Transfer Learning, Semantic Segmentation, U-Net, Image Classification

---

## 1. Introduction

Computer vision has experienced remarkable progress in recent years, transitioning from traditional handcrafted feature methods to powerful deep learning architectures. This evolution has enabled machines to achieve human-level performance in various visual recognition tasks, including image classification, object detection, and semantic segmentation.

This report documents a comprehensive exploration of object recognition techniques through three interconnected laboratory assignments:

1. **Lab 1**: Classical computer vision using Bag of Visual Words (BoVW)
2. **Lab 2**: Transfer learning for fine-grained classification
3. **Lab 3**: Semantic segmentation with U-Net

### Objectives

- Understand image representation using local features and visual vocabularies
- Evaluate different classifiers and feature extraction strategies
- Explore transfer learning techniques for fine-grained classification
- Apply deep learning architectures for dense prediction tasks
- Compare and analyze performance of different approaches

---

## 2. Laboratory 1: Bag of Visual Words for Image Classification

### 2.1 Overview and Motivation

The Bag of Visual Words (BoVW) model is a classical computer vision technique inspired by text document analysis. Images are represented as histograms of visual words, where each visual word corresponds to a cluster of similar local features.

### 2.2 Dataset

**Scene Classification Dataset:**
- 8 categories: inside_city, street, tall_building, open_country, highway, forest, coast, mountain
- Split into training and test sets

### 2.3 Methodology

The BoVW pipeline consists of four main stages:

#### 1. Feature Detection and Description
- **SIFT (Scale-Invariant Feature Transform)** for keypoint detection
- Initially 300 keypoints per image
- Later: Dense SIFT with regular grid sampling

#### 2. Visual Vocabulary Creation
- K-means clustering on training descriptors
- MiniBatchKMeans for efficiency
- Tested codebook sizes: k ∈ {32, 64, 128, 256}

#### 3. Image Representation
- Histogram of visual words
- Fixed-length feature vector

#### 4. Classification
Multiple classifiers evaluated:
- k-Nearest Neighbors (k-NN)
- Linear Support Vector Machine (SVM)
- SVM with RBF kernel
- SVM with Histogram Intersection kernel

### 2.4 Experimental Results

#### Task 1: Confusion Matrix and Class Analysis

**Baseline:** SIFT keypoints + k-NN (k=5, codebook=128) → **54.8% accuracy**

**Class Analysis:**
- ✅ **Easiest classes:** inside_city and street (recall ~0.70-0.75)
  - Distinctive visual patterns well captured
- ❌ **Most difficult:** tall_building and open_country (recall ~0.40)
  - Visual similarity with other scenes

#### Task 2: Hyperparameter Optimization

| Codebook Size | k | Distance | Accuracy |
|---------------|---|----------|----------|
| 32 | 5 | Euclidean | 49.85% |
| 64 | 5 | Euclidean | 52.46% |
| **128** | **5** | **Euclidean** | **54.77%** |
| 128 | 7 | Euclidean | 54.77% |
| 256 | 5 | Euclidean | 53.54% |
| 128 | 5 | Manhattan | 53.85% |

**Key Findings:**
- Optimal codebook size: 128 (sweet spot between discriminability and generalization)
- Euclidean distance slightly better than Manhattan
- Number of neighbors (k) minimal impact in tested range

#### Task 3: Linear SVM Classification

| Classifier | Accuracy |
|------------|----------|
| k-NN (k=7, k=128) | 54.77% |
| Linear SVM | **55.62%** |
| RBF SVM | 66.46% |
| Histogram Intersection SVM | 60.00% |

Linear SVM comparable to k-NN, but non-linear kernels significantly better.

#### Task 4: Non-linear SVM Kernels

**RBF Kernel:** 66.46% accuracy
- Significant improvement over linear methods
- Better class separation in higher-dimensional space

**Histogram Intersection Kernel:** 60.0% accuracy
- Designed for histograms
- Underperformed RBF (possibly due to standardization)

#### Task 5: Dense SIFT Features

**BREAKTHROUGH RESULTS:**

| Classifier | Accuracy | Improvement |
|------------|----------|-------------|
| Linear SVM | 78.31% | +22.7 pp |
| Histogram Intersection SVM | 81.54% | +21.5 pp |
| **RBF SVM** | **81.85%** | **+15.4 pp** |

pp = percentage points

### 2.5 Key Findings from Lab 1

1. ✨ **Feature representation quality matters most** - Dense SIFT >> keypoint-based
2. 📈 **Non-linear kernels improve performance** - RBF consistently best
3. 🎯 **Optimal codebook size exists** - Too small lacks discriminability, too large overfits
4. 🌐 **Dense sampling provides better coverage** - Regular grid > sparse keypoints

---

## 3. Laboratory 2: Transfer Learning for Image Classification

### 3.1 Overview

Transfer learning leverages knowledge from large-scale datasets (ImageNet) to solve new tasks with limited data.

### 3.2 Dataset

**Caltech-UCSD Birds (CUB-200-2011):**
- 200 bird species
- ~3,000 training images
- 3,033 test images
- High intra-class variability
- Training split: 80% train / 20% validation

### 3.3 Data Preprocessing

**Transformations:**
- Resize to 224×224 (ImageNet standard)
- Normalization with ImageNet statistics
- Data augmentation:
  - Random resized cropping
  - Random horizontal flipping
  - Random brightness/contrast

### 3.4 Transfer Learning Strategies

**1. Feature Extraction (Fixed CNN)**
- Freeze all convolutional layers
- Train only final classification layer
- Fast but limited adaptation

**2. Fine-Tuning**
- All layers trainable
- Full adaptation to bird species
- More computation but better results

### 3.5 Experimental Setup

**Architecture:** ResNet-18 (pre-trained on ImageNet)
**Optimizer:** SGD (lr=0.001, momentum=0.9)
**Scheduler:** Step decay (×0.1 every 7 epochs)
**Loss:** Cross-Entropy
**Epochs:** 10-25

### 3.6 Results

#### Task 2: Feature Extraction vs Fine-Tuning

| Strategy | Epochs | Val Accuracy | Val F1 | Training Time |
|----------|--------|--------------|--------|---------------|
| Feature Extraction | 10 | 62.1% | 0.598 | Fast |
| **Fine-Tuning** | 10 | **74.3%** | **0.729** | Slow |

**Improvement:** +12.2 percentage points with fine-tuning!

#### Task 3: Hyperparameter Search

| Learning Rate | Batch Size | Strategy | Val Accuracy | Val F1 |
|---------------|------------|----------|--------------|--------|
| 0.001 | 32 | Fixed | 62.1% | 0.598 |
| 0.001 | 32 | Fine-tune | 74.3% | 0.729 |
| **0.0005** | **64** | **Fine-tune** | **75.6%** | **0.741** |

**Best configuration:** lr=0.0005, batch=64, fine-tuning

#### Task 5: Alternative Architecture (MobileNetV3)

| Model | Strategy | Val Accuracy | Parameters |
|-------|----------|--------------|------------|
| ResNet-18 | Fixed | 62.1% | 11.7M |
| **ResNet-18** | **Fine-tune** | **75.6%** | 11.7M |
| MobileNetV3 | Fixed | 59.8% | 5.5M |
| MobileNetV3 | Fine-tune | 72.1% | 5.5M |

MobileNetV3: Competitive accuracy with ~50% fewer parameters!

#### Task 4: Additional Metrics Analysis

**Per-species Performance:**
- 🦩 High recall: Distinctive species (flamingos, penguins)
- 🐦 Low recall: Similar species (different sparrow types)
- Overall F1-score tracks accuracy closely → balanced performance

### 3.7 Key Findings from Lab 2

1. 🎓 **Fine-tuning >> feature extraction** for fine-grained tasks
2. 🚀 **Pre-training on ImageNet** provides strong initialization
3. ⚡ **MobileNetV3** offers excellent accuracy-efficiency trade-off
4. 🔧 **Hyperparameter tuning** yields several percentage points improvement

---

## 4. Laboratory 3: Semantic Segmentation with U-Net

### 4.1 Overview

Semantic segmentation assigns a class label to every pixel, enabling detailed scene understanding.

### 4.2 Dataset

**Oxford-IIIT Pet Dataset:**
- 37 pet breeds (cats and dogs)
- 200 training images
- 50 test images
- Binary segmentation: pet vs. background
- Resolution: 128×128

### 4.3 U-Net Architecture

**Encoder-Decoder with Skip Connections:**
- **Encoder:** Pre-trained ResNet34 or EfficientNet-B0
- **Decoder:** Upsampling path
- **Skip connections:** Preserve fine details
- **Output:** Pixel-wise classification (2 channels)

### 4.4 Loss Functions

1. **Cross-Entropy Loss** - Standard pixel-wise classification
2. **Dice Loss** - Directly optimizes Dice coefficient (F1 for segmentation)

### 4.5 Data Augmentation

Training augmentations:
- Random cropping (160×160 → 128×128)
- Random horizontal flipping
- Random brightness/contrast
- ImageNet normalization

### 4.6 Evaluation Metrics

**Intersection over Union (IoU):**
```
IoU = TP / (TP + FP + FN)
```

**Dice Score:**
```
Dice = 2×TP / (2×TP + FP + FN)
```

Range: [0, 1], higher is better

### 4.7 Experimental Results

#### Baseline: ResNet34 + Cross-Entropy
- Test mIoU: **84.7%**
- Test Dice: **91.2%**

#### Tasks 1-2: EfficientNet-B0 + Dice Loss
- Test mIoU: **86.3%** (+1.6 pp)
- Test Dice: **92.5%** (+1.3 pp)

**Benefits:**
- EfficientNet-B0 architecture better suited
- Dice Loss directly optimizes evaluation metric

#### Tasks 3-4: Enhanced Data Augmentation
- Test mIoU: **87.1%** (+2.4 pp from baseline)
- Test Dice: **93.1%** (+1.9 pp from baseline)

**Impact:** Augmentation improves generalization significantly!

#### Summary Table

| Configuration | Encoder | Loss | Augmentation | mIoU | Dice |
|---------------|---------|------|--------------|------|------|
| Baseline | ResNet34 | CrossEntropy | Basic | 84.7% | 91.2% |
| Improved | EfficientNet-B0 | Dice | Basic | 86.3% | 92.5% |
| **Best** | **EfficientNet-B0** | **Dice** | **Enhanced** | **87.1%** | **93.1%** |

### 4.8 Qualitative Analysis

**Strengths:**
- ✅ Accurate pet segmentation with clear boundaries
- ✅ Handles various breeds, poses, backgrounds

**Challenges:**
- ⚠️ Some errors at fine details (whiskers, fur edges)
- ⚠️ Cluttered backgrounds occasionally problematic

**Edge Quality:** Dice Loss + augmentation = smoother, more accurate boundaries

### 4.9 Key Findings from Lab 3

1. 🏗️ **Pre-trained encoders** highly effective for segmentation
2. 🎯 **Task-specific loss functions** (Dice) improve results
3. 🌈 **Data augmentation** crucial with limited data
4. ⚙️ **Architecture choice matters** - EfficientNet-B0 better than ResNet34

---

## 5. Comparative Analysis and Discussion

### 5.1 Evolution of Computer Vision Methods

| Approach | Method | Features | Performance Limit |
|----------|--------|----------|-------------------|
| **Classical (Lab 1)** | BoVW + SIFT | Handcrafted | ~82% |
| **Transfer Learning (Lab 2)** | ResNet Fine-tune | Learned (ImageNet) | ~76% (200 classes!) |
| **Dense Prediction (Lab 3)** | U-Net | Learned + pixel-level | ~87% mIoU |

### 5.2 Performance Summary

| Laboratory | Task | Best Method | Best Performance |
|------------|------|-------------|------------------|
| Lab 1 | Scene Classification | Dense SIFT + RBF SVM | 81.85% accuracy |
| Lab 2 | Bird Classification (200 classes) | ResNet-18 Fine-tuning | 75.60% accuracy |
| Lab 3 | Pet Segmentation | EfficientNet-B0 + Dice | 87.10% mIoU |

*Note: Direct comparison not meaningful due to different tasks/datasets*

### 5.3 Lessons Learned

#### 1. Feature Representation is Critical
- Lab 1: Dense SIFT > classifier choice
- Labs 2-3: Pre-trained features dramatically improve results

#### 2. Transfer Learning is Powerful
- Good results with only 200 samples per class (Lab 2)
- High-quality segmentation with 200 images (Lab 3)

#### 3. Task-Specific Design Matters
- Histogram intersection kernel underperformed general RBF (Lab 1)
- Dice Loss directly optimized evaluation metric (Lab 3)

#### 4. Data Augmentation Improves Generalization
- Significant benefits in Labs 2 and 3
- Essential with limited training data

#### 5. Hyperparameter Tuning is Essential
- Small changes yield noticeable improvements
- Systematic experimentation valuable

### 5.4 Practical Implications

**For New Projects:**
- ✅ Start with transfer learning, not from scratch
- ✅ Use aggressive augmentation with limited data
- ✅ Fine-tune for fine-grained tasks
- ✅ Use U-Net-style architectures for dense predictions
- ✅ Consider task-specific loss functions

---

## 6. Conclusion

This comprehensive study explored three fundamental aspects of computer vision: classical feature-based classification, transfer learning for fine-grained recognition, and semantic segmentation with deep learning.

### Key Achievements

1. 🏆 **81.85% accuracy** on scene classification with classical methods
2. 🐦 **75.6% accuracy** on fine-grained bird classification (200 species)
3. 🐱 **87.1% mIoU** on pet segmentation

### Main Insights

- **Feature representation quality** has the largest impact on performance
- **Transfer learning** enables strong results with limited labeled data
- **Data augmentation** is crucial for generalization
- **Task-specific choices** (architecture, loss) significantly improve results

### Future Directions

- 🔮 Explore Vision Transformers (ViT), ConvNeXt
- 🎓 Investigate self-supervised pre-training
- 🌍 Apply to challenging real-world datasets
- 🔗 Extend to multi-task learning (classification + segmentation)

### Final Thoughts

This laboratory series provided hands-on experience with the evolution of computer vision methods. The experiments clearly demonstrate why deep learning has become dominant:

1. **Learned representations outperform handcrafted features**
2. **Transfer learning enables data-efficient learning**
3. **End-to-end optimization produces superior results**

The journey from SIFT to U-Net illustrates the remarkable progress in computer vision, and hands-on implementation deepens understanding of both the capabilities and limitations of modern methods.

---

## References

1. Sivic, J. & Zisserman, A. (2003). "Video Google: A text retrieval approach to object matching in videos." *IEEE ICCV*.

2. Lowe, D.G. (2004). "Distinctive Image Features from Scale-Invariant Keypoints." *International Journal of Computer Vision*, 60(2), 91-110.

3. He, K., Zhang, X., Ren, S., & Sun, J. (2016). "Deep Residual Learning for Image Recognition." *IEEE CVPR*.

4. Ronneberger, O., Fischer, P., & Brox, T. (2015). "U-Net: Convolutional Networks for Biomedical Image Segmentation." *MICCAI*.

5. Tan, M. & Le, Q. (2019). "EfficientNet: Rethinking Model Scaling for Convolutional Neural Networks." *ICML*.

6. Wah, C., Branson, S., Welinder, P., Perona, P., & Belongie, S. (2011). "The Caltech-UCSD Birds-200-2011 Dataset." *Technical Report*.

7. Parkhi, O.M. et al. (2012). "Cats and Dogs." *IEEE CVPR*.

8. Deng, J. et al. (2009). "ImageNet: A Large-Scale Hierarchical Image Database." *IEEE CVPR*.

9. Milletari, F., Navab, N., & Ahmadi, S.-A. (2016). "V-Net: Fully Convolutional Neural Networks for Volumetric Medical Image Segmentation." *3DV*.

10. Howard, A. et al. (2019). "Searching for MobileNetV3." *IEEE ICCV*.

---

**Report prepared by:** Marcel López López  
**Institution:** Universitat Politècnica de Catalunya  
**Course:** Computer Vision with Deep Learning  
**Date:** June 2026
