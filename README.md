# Pothole-Detection

The aim of this project is to detect Potholes on roads.

This is just the source code of the project. The project has hardware equipment as well.
We have used:
1) Webcam
2) Line Laser
3) A toy vehicle
4) A cardboard prototype of roads and potholes.

Principle behind the project: The line laser deforms when it falls on a pothole. The webcam captures the deformity and sends it to the system.
The system calculates the maximum depth and informs if it has exceeded the threshold depth.

Initially, the snapshot taken is an RBG image. It is then converted to a grayscale image. 
The grayscale image is then converted to a binary image.

The depth is calculated in the binary image in pixels. This depth is then converted to centimeters.

This conversion process is based on the resolution of the camera, angle of elevation of the line laser and distance of the pothole from the car.

A beep is produced if the maximum depth of the pothole exceeds a threshold value. 

This project is just a prototype and cannot be implemented in realtime due to its constraints.
The constraints in real time are:
1) The intensity of the surroudings can dominate the intensity of the line laser.
2) The intensity of the line laser decreases so it is difficult to detect the potholes.
