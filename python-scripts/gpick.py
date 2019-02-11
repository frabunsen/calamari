"""
Created on Mon Nov 12 14:43:47 2018
@author: francesco.sensi
"""

# TODO [**   ]   Replace RGB triplet with proper colored output ("https://pypi.org/project/Colr/")

import win32api
import time
import pyautogui
ox = 0
oy = 0
try:
    while True:
        
            if (win32api.GetAsyncKeyState(0x01)): # triggered when left-click
                
                x, y = pyautogui.position()
                positionStr = 'X: ' + str(x).rjust(4) + ' Y: ' + str(y).rjust(4)

                pixelColor = pyautogui.screenshot().getpixel((x, y))
                positionStr += ' RGB: (' + str(pixelColor[0]).rjust(3)
                positionStr += ', ' + str(pixelColor[1]).rjust(3)
                positionStr += ', ' + str(pixelColor[2]).rjust(3) + ')'
        
                if (x != ox) or (y != oy):
                    print positionStr
            
                ox = x # mainly useful without the left-click part
                oy = y # ..
                
                time.sleep(0.05)
        
except KeyboardInterrupt: # let exit with CTRL+C
    print('Done.')