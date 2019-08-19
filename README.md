# vision_algorithms

- Processing Images
  * Estimating Fundenmental Matrix
    + Related Files 
      - estimateFundamental.m  Implementation for calculating fundamental matrix
  * Calculate the Albedo
    + Related Files 
      - render.m  Render the image based on albedo files

- Corner Detection 
  * Sobel 
    + Related Files
       - corner_detect.m  Sobel Corner detection
       - sparse_stereo.m  Normalized Sum of Squared Difference matching.
       - nssd.m Normalized  Sum of Squared Difference. Black and White
       - nssd_color.m  Normalized Sum of Squared Difference. RGB color
       - p_tilda.m  Normalized image patch
       - gauss_gradient.m  Applying 2D Gauss Derivative filters 
       - gauss_kernel.m  Creating a Gauss Kernel
       - find_maximas.m  Find Local Maxima of a 2d heightmap

- Image Thresholding
  * Otsu Method - otsu.m
    + Related Files
      - otsu.m

- Image matching
  * Principal Component Analysis
    + Related Files
      - Gaussen Kernel  -  Generate Guass kernel based on the size of sigma
      - eigenTrain.m  -  PCA training implementation.
      - decode_train -  Undoing PCA.
      - eigenTest.m  - PCA testing implementation.
      - fisherTest.m -  Testing accuracy using PCA, LCA and nearest neighbors
      - k_nn.m  - nearest neighbors
      
      
## Papers
* Otsu
  - https://engineering.purdue.edu/kak/computervision/ECE661.08/OTSU_paper.pdf
* Edge Detection
  - http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.301.927&rep=rep1&type=pdf
  - Canny Edge Detection http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.420.3300&rep=rep1&type=pdf
  - Sobel Edge Detection https://ieeexplore.ieee.org/document/996/metrics#metrics
* Principal Component Analysis
  - http://cda.psych.uiuc.edu/statistical_learning_course/Jolliffe%20I.%20Principal%20Component%20Analysis%20(2ed.,%20Springer,%202002)(518s)_MVsa_.pdf
  - https://www.cs.cmu.edu/~elaw/papers/pca.pdf
