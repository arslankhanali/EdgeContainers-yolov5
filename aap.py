import torch
import cv2

# Model
model = torch.hub.load('ultralytics/yolov5', 'yolov5s')  # or yolov5n - yolov5x6, custom

# Images
img = 'https://upload.wikimedia.org/wikipedia/commons/c/c6/Lex_Av_E_92_St_06.jpg'  # or file, Path, PIL, OpenCV, numpy, list
#img = 'https://upload.wikimedia.org/wikipedia/commons/4/4c/St.JamesSt.-Montreal_-1910.jpg'
#img = cv2.imread('../x-ray.png')

# Inference
results = model(img)

# Results
results.print()  # or .show(), .save(), .crop(), .pandas(), etc.