"""
Created on Mon Nov 12 16:18:05 2018
@author: francesco.sensi
"""

import win32api
import time
import pyautogui
def recordMouse():
    print("Recording..")
    ox, oy, coo = (0,0,[])
    try:
        while True:
            x, y = pyautogui.position()
            if (win32api.GetAsyncKeyState(0x01)):
                coo.append(['lc'])
                time.sleep(0.05)
            if (win32api.GetAsyncKeyState(0x02)):
                coo.append(['rc'])
                time.sleep(0.05)
            if (x != ox) or (y != oy):
                ox, oy = (x,y)
                coo.append([x,y])
                time.sleep(0.05)
    except KeyboardInterrupt:
            print("Done.")
            return coo


if __name__ == "__main__":
    path = recordMouse()
    print path
    for ii in path:
        if isinstance(ii[0],int):
            pyautogui.moveTo(ii, duration=0.25)
        else:
            if (ii[0] == 'lc'):
                pyautogui.click()
            elif (ii[0] == 'rc'):
                pyautogui.rightClick()