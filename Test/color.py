#! /usr/bin/env python  
#coding=utf-8  
   
import ctypes,sys  
   
STD_INPUT_HANDLE = -10  
STD_OUTPUT_HANDLE = -11  
STD_ERROR_HANDLE = -12  
   
# ������ɫ���� ,�ؼ�������ɫ���룬��2λʮ��������ɣ��ֱ�ȡ0~f��ǰһλָ���Ǳ���ɫ����һλָ��������ɫ  
#���ڸú��������ƣ�Ӧ����ֻ����16�֣�����ǰ��ɫ�뱳��ɫ��ϡ�Ҳ���Լ�����ɫͨ����������ϣ���Ϻ�������16����ɫ��  
   
# Windows CMD������ ������ɫ���� text colors  
FOREGROUND_BLACK = 0x00 # black.  
FOREGROUND_DARKBLUE = 0x01 # dark blue.  
FOREGROUND_DARKGREEN = 0x02 # dark green.  
FOREGROUND_DARKSKYBLUE = 0x03 # dark skyblue.  
FOREGROUND_DARKRED = 0x04 # dark red.  
FOREGROUND_DARKPINK = 0x05 # dark pink.  
FOREGROUND_DARKYELLOW = 0x06 # dark yellow.  
FOREGROUND_DARKWHITE = 0x07 # dark white.  
FOREGROUND_DARKGRAY = 0x08 # dark gray.  
FOREGROUND_BLUE = 0x09 # blue.  
FOREGROUND_GREEN = 0x0a # green.  
FOREGROUND_SKYBLUE = 0x0b # skyblue.  
FOREGROUND_RED = 0x0c # red.  
FOREGROUND_PINK = 0x0d # pink.  
FOREGROUND_YELLOW = 0x0e # yellow.  
FOREGROUND_WHITE = 0x0f # white.  
   
   
# Windows CMD������ ������ɫ���� background colors  
BACKGROUND_BLUE = 0x10 # dark blue.  
BACKGROUND_GREEN = 0x20 # dark green.  
BACKGROUND_DARKSKYBLUE = 0x30 # dark skyblue.  
BACKGROUND_DARKRED = 0x40 # dark red.  
BACKGROUND_DARKPINK = 0x50 # dark pink.  
BACKGROUND_DARKYELLOW = 0x60 # dark yellow.  
BACKGROUND_DARKWHITE = 0x70 # dark white.  
BACKGROUND_DARKGRAY = 0x80 # dark gray.  
BACKGROUND_BLUE = 0x90 # blue.  
BACKGROUND_GREEN = 0xa0 # green.  
BACKGROUND_SKYBLUE = 0xb0 # skyblue.  
BACKGROUND_RED = 0xc0 # red.  
BACKGROUND_PINK = 0xd0 # pink.  
BACKGROUND_YELLOW = 0xe0 # yellow.  
BACKGROUND_WHITE = 0xf0 # white.  
   
   
   
# get handle  
std_out_handle = ctypes.windll.kernel32.GetStdHandle(STD_OUTPUT_HANDLE)  
   
def set_cmd_text_color(color, handle=std_out_handle):  
    Bool = ctypes.windll.kernel32.SetConsoleTextAttribute(handle, color)  
    return Bool  
   
#reset white  
def resetColor():  
    set_cmd_text_color(FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE)  
   
###############################################################  
   
#����ɫ  
#dark blue  
def printDarkBlue(mess):  
    set_cmd_text_color(FOREGROUND_DARKBLUE)  
    sys.stdout.write(mess)  
    resetColor()  
   
#����ɫ  
#dark green  
def printDarkGreen(mess):  
    set_cmd_text_color(FOREGROUND_DARKGREEN)  
    sys.stdout.write(mess)  
    resetColor()  
   
#������ɫ  
#dark sky blue  
def printDarkSkyBlue(mess):  
    set_cmd_text_color(FOREGROUND_DARKSKYBLUE)  
    sys.stdout.write(mess)  
    resetColor()  
   
#����ɫ  
#dark red  
def printDarkRed(mess):  
    set_cmd_text_color(FOREGROUND_DARKRED)  
    sys.stdout.write(mess)  
    resetColor()  
   
#���ۺ�ɫ  
#dark pink  
def printDarkPink(mess):  
    set_cmd_text_color(FOREGROUND_DARKPINK)  
    sys.stdout.write(mess)  
    resetColor()  
   
#����ɫ  
#dark yellow  
def printDarkYellow(mess):  
    set_cmd_text_color(FOREGROUND_DARKYELLOW)  
    sys.stdout.write(mess)  
    resetColor()  
   
#����ɫ  
#dark white  
def printDarkWhite(mess):  
    set_cmd_text_color(FOREGROUND_DARKWHITE)  
    sys.stdout.write(mess)  
    resetColor()  
   
#����ɫ  
#dark gray  
def printDarkGray(mess):  
    set_cmd_text_color(FOREGROUND_DARKGRAY)  
    sys.stdout.write(mess)  
    resetColor()  
   
#��ɫ  
#blue  
def printBlue(mess):  
    set_cmd_text_color(FOREGROUND_BLUE)  
    sys.stdout.write(mess)  
    resetColor()  
   
#��ɫ  
#green  
def printGreen(mess):  
    set_cmd_text_color(FOREGROUND_GREEN)  
    sys.stdout.write(mess)  
    resetColor()  
   
#����ɫ  
#sky blue  
def printSkyBlue(mess):  
    set_cmd_text_color(FOREGROUND_SKYBLUE)  
    sys.stdout.write(mess)  
    resetColor()  
   
#��ɫ  
#red  
def printRed(mess):  
    set_cmd_text_color(FOREGROUND_RED)  
    sys.stdout.write(mess)  
    resetColor()  
   
#�ۺ�ɫ  
#pink  
def printPink(mess):  
    set_cmd_text_color(FOREGROUND_PINK)  
    sys.stdout.write(mess)  
    resetColor()  
   
#��ɫ  
#yellow  
def printYellow(mess):  
    set_cmd_text_color(FOREGROUND_YELLOW)  
    sys.stdout.write(mess)  
    resetColor()  
   
#��ɫ  
#white  
def printWhite(mess):  
    set_cmd_text_color(FOREGROUND_WHITE)  
    sys.stdout.write(mess)  
    resetColor()  
   
##################################################  
   
#�׵׺���  
#white bkground and black text  
def printWhiteBlack(mess):  
    set_cmd_text_color(FOREGROUND_BLACK | BACKGROUND_WHITE)  
    sys.stdout.write(mess)  
    resetColor()  
   
#�׵׺���  
#white bkground and black text  
def printWhiteBlack_2(mess):  
    set_cmd_text_color(0xf0)  
    sys.stdout.write(mess)  
    resetColor()  
   
   
#�Ƶ�����  
#white bkground and black text  
def printYellowRed(mess):  
    set_cmd_text_color(BACKGROUND_YELLOW | FOREGROUND_RED)  
    sys.stdout.write(mess)  
    resetColor()  
   
   
##############################################################  
   
if __name__ == '__main__':  
       
    print
    printDarkBlue('printDarkBlue:����ɫ����\n')  
    printDarkGreen('printDarkGreen:����ɫ����\n')  
    printDarkSkyBlue('printDarkSkyBlue:������ɫ����\n')  
    printDarkRed('printDarkRed:����ɫ����\n')  
    printDarkPink('printDarkPink:���ۺ�ɫ����\n')  
    printDarkYellow('printDarkYellow:����ɫ����\n')  
    printDarkWhite('printDarkWhite:����ɫ����\n')  
    printDarkGray('printDarkGray:����ɫ����\n')  
    printBlue('printBlue:��ɫ����\n')  
    printGreen('printGreen:��ɫ����\n')  
    printSkyBlue('printSkyBlue:����ɫ����\n')  
    printRed('printRed:��ɫ����\n')  
    printPink('printPink:�ۺ�ɫ����\n')  
    printYellow('printYellow:��ɫ����\n')  
    printWhite('printWhite:��ɫ����\n')  
    printWhiteBlack('printWhiteBlack:�׵׺������\n')  
    printWhiteBlack_2('printWhiteBlack_2:�׵׺��������ֱ�Ӵ���16���Ʋ�����\n')  
    printYellowRed('printYellowRed:�Ƶ׺������\n')  