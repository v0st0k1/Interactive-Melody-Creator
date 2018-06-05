clear all, close all;

amp=10;
fs=20500;  % sampling frequency
duration=1;

values=0:1/fs:duration;
a=amp*sin(2*pi* 440*values);
b=amp*sin(2*pi* 0*values);
c=amp*sin(2*pi* 1760*values);
sound([a b c],fs)