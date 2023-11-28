clc
clear
close all

win = chebwin(512, 30)';
win2 = win./sqrt(win.^2);