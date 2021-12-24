# 8-point 2D-DCT

2D Discrete Cosine Transform (DCT) of an 8x8 matrix in Verilog HDL

In this project, we are implementing a 2D DCT module which can be used to calculate 2 dimensional Discrete Cosine Transform of any 8x8 matrix having elements in the range 0 to 255. 2D DCT is a very important and widely used technique in image compression and video compression. 
Discrete Cosine Transform (DCT), among various transforms, is the most popular and effective one in image and video compression. So far, it has been adopted by many international standards like JPEG, MPEG1, MPEG2, MPEG4, and H26x, etc. However, it is difficult to satisfy the requirement for real-time by software owing to its heavy quantity of computing. Therefore, a hardware method is adopted to satisfy the requirement for speed in many practical applications.

With row-column decomposition, the 8 point 1D-DCT is applied to each row of the input 8×8 pixel matrix, and a further 1D-DCT is applied to each column of 8×8 block of semi-transformed values. The final results of 2D-DCT can be achieved by transposing the 8×8 matrix which is obtained by 8 point 1D-DCT twice. The implementation architecture of 2D-DCT is shown in Fig.1. The 2D-DCT module includes a control module, data selection module, serial to parallel module, 1D-DCT module, parallel to serial module, memory matrix RAM module, bit interception module and transposing address generation module.

### 1D-DCT module
Assuming that the input eight points are x0, x1, x2, x3, x4, x5, x6, x7, 1D-DCT computing equation can be simplified as following based on the characteristic of the symmetry and rotation for DCT coefficients.
  
  
  Y0 = [(x0+x7)+(x1+x6)+(x2+x5)+(x3+x4)]*C0 = [s07341625]*C0
  
  Y1 = [x0-x7]*C1+[x1-x6]*C3+[x2-x5]*C5+[x3-x4]*C7 = [s0_7]*C1+[s1_6]*C3+[s2_5]*C5+[s3_4]*C7
  
  Y2 = [(x0+x7)-(x3+x4)]*C2+[(x1+x6)-(x2+x5)]*C6 = [s07_34]*C2+[16_25]*C6
  
  Y3 = [x0-x7]*C3-[x1-x6]*C7-[x2-x5]*C1-[x3-x4]*C5 = [s0_7]*C3+[s1_6]*(-C7)+[s2_5]*(-C1)+[s3_4]*(-C5)
 
  Y4 = [(x0+x7)+(x3+x4)-(x1+x6)-(x2+x5)]*C4 = [s0734_1625]*C4
  
  Y5 = [x0-x7]*C5+[x1-x6]*(-C1)+[x2-x5]*C7+[x3-x4]*C3 = [s0_7]*C5+[s1_6]*(-C1)+[s2_5]*C7+[s3_4]*C3
  
  Y6 = [(x0+x7)-(x3+x4)]*C6-[(x1+x6)-(x2+x5)]*C2 = [s07_34]*C6+[s16_25]*(-C2)
  
  Y7 = [x0-x7]*C7+[x1-x6]*(-C5)+[x2-x5]*C3+[x3-x4]*(-C1) = [s0_7]*C7+[s1_6]*(-C5)+[s2_5]*C3+[s3_4]*(-C1)
 
 
Where 

      C0 = 1/2 * cos(π/4),      C1 = 1/2 * cos(π/16),      C2 = 1/2 * cos(2π/16),      C3 = 1/2 * cos(3π/16),
      C4 = 1/2 * cos(4π/16),    C5 = 1/2 * cos(5π/16),     C6 = 1/2 * cos(6π/16),      C7 = 1/2 * cos(7π/16).
