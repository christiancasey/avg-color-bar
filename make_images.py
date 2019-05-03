import os
import cv2
from tqdm import tqdm
import shutil

try:
	shutil.rmtree('images')
except:
	print('images not found')

finally:
	os.mkdir('images')

video = cv2.VideoCapture('../NEW_avg-color-bar/videos/s08e03.mkv')
success,image = video.read()
fSecondSkip = 5;

# Find OpenCV version
(iMajorVersion, iMinorVersion, iSubMinorVersion) = (cv2.__version__).split('.')

# Get framerate and total number of frames
if int(iMajorVersion)  < 3 :
	fFramerate = video.get(cv2.cv.CV_CAP_PROP_FPS)
	iNumFrames = int(video.get(cv2.cv.CV_CAP_PROP_FRAME_COUNT))
else :
	fFramerate = video.get(cv2.CAP_PROP_FPS)
	iNumFrames = int(video.get(cv2.CAP_PROP_FRAME_COUNT))

iCount = 1
for i in tqdm( range(iNumFrames) ):
	if i % (fSecondSkip*fFrameRate) == 0:
		cv2.imwrite('images/' + "{:0>7d}".format(iCount) + '.jpg', image)
		iCount += 1
	success,image = video.read()