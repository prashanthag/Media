# -*- coding: utf-8 -*-
"""
Created on Sat Apr  7 22:49:53 2018

@author: ina.gowda
"""
import cv2
import time  
    
def show_webcam(mirror=False):
    cam0 = cv2.VideoCapture(0)
    cam1 = cv2.VideoCapture(1)
    while True:
        ret_val, img1 = cam0.read()
        ret_val, img2 = cam1.read()
        if mirror: 
            img1= cv2.flip(img1, 1)
            img2= cv2.flip(img2, 1)
        for IN in range(0,10):
            fadein = IN/10.0
            dst = cv2.addWeighted( img2, fadein, img2, fadein, 0)#linear $
            #print(dst)
            cv2.imshow('window', dst)
            cv2.imshow('window', dst)

            #cv2.destroyAllWindows()
            #print (fadein)
            time.sleep(0.05)
            if fadein == 1.0: #blendmode mover
                    fadein = 1.0
        #time.sleep(5)
        if cv2.waitKey(1) == 27:
            break
    cv2.destroyAllWindows()


def main():
    show_webcam(mirror=True)


if __name__ == '__main__':
    main()    