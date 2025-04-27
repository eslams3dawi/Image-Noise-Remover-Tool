# Image Noise Remover Tool

A MATLAB-based tool that applies frequency domain filtering to reduce noise in images and visualize the Fourier Transform process.  
It provides interactive control over the filter radius, enabling users to fine-tune the balance between noise reduction and detail preservation.

---

## 📖 Description

The **Image Noise Remover Tool** leverages Fourier Transform techniques to process images in the frequency domain.  
It allows applying low-pass and high-pass filters to either remove noise or extract fine details from images.  
It also supports visualization of key steps: grayscale conversion, Fourier magnitude computation, frequency shifting, and filtering results.

---

## 🚀 Features

- Convert color images into grayscale for easier processing.
- Visualize the Fourier Transform and shifted spectra.
- Apply custom radius-based **low-pass** and **high-pass** filters.
- Add artificial noise (Salt & Pepper) to test filtering performance.
- Use digital median filtering for additional noise removal.
- Display results step-by-step using organized subplots.
- Interactive user inputs for custom filter radius selection.
- Inverse Fast Fourier Transform (IFFT): To transform the frequency domain into the original image
  
---

## 🛠️ Tools & Technologies

- **MATLAB**: Core programming language.
- **Image Processing Toolbox**: For handling image operations like noise addition and filtering.
- **Fast Fourier Transform (FFT)**: To transform images into the frequency domain.
- **Frequency Filters**: To isolate low or high-frequency components.

---

## 📸 Screenshots & Descriptions

![Image proccessing Input](https://github.com/user-attachments/assets/84abff71-afe4-4021-8525-cc6c4ffed90d)
![Image processing Output](https://github.com/user-attachments/assets/af1b71e4-4071-4c1a-891b-802ff777add1)

**Colorful Image**: The original color image used as the starting input for processing. <br>
**Grayscale Image**: Converted version of the original image into grayscale to simplify frequency processing. <br>
**Fourier Magnitude Image**: Visualization of the Fourier Transform magnitude of the grayscale image, representing frequency components. <br>
**Shifted Fourier Magnitude Image**: Shifted version of the Fourier Transform to center the low frequencies, making filters more intuitive. <br>
**Low-pass Filter**: A frequency filter that allows low-frequency components to pass while blocking high frequencies (noise). <br>
**Low-pass Filtered Image**: Image after applying the low-pass filter, showing noise reduction while preserving general structures. <br>
**High-pass Filter**: A filter that allows high-frequency components (fine details and edges) to pass while blocking the lower frequencies. <br>
**High-pass Filtered Image**: Image after applying the high-pass filter, highlighting edges and fine features. <br>

![Image noise Input](https://github.com/user-attachments/assets/340ad68f-7df1-4fbd-a1c3-a19d46c522f3)
![Image noise remover output](https://github.com/user-attachments/assets/eca207bc-f065-4f04-8f33-689432e07e6a)

---

## 📥 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/eslams3dawi/Image-Noise-Remover-Tool.git
   ```
2. Open the main `.m` file in **MATLAB**.
3. Run the script.
4. Provide inputs when prompted:
   - **Noise level** (for noise addition).
   - **Filter radius** (for frequency filters).
5. Observe the results and adjust parameters as needed.

---
