import cv2
from tqdm import tqdm

vidcap = cv2.VideoCapture('videos/s08e03.mkv')
success,image = vidcap.read()
count = 0
while success:
	# cv2.imwrite('images/got-s01e01_' + "{:0>4d}".format(count) + '.jpg', image)
	cv2.imwrite('images/' + "{:0>7d}".format(count) + '.jpg', image)
	# print('Saved: images/' + "{:0>4d}".format(count) + '.jpg')
	success,image = vidcap.read()
	count += 1