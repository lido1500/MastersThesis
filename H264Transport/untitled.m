%PSNR Plot
clc; clear;

height = 144;
width = 176;

numTotFrames = 10;

refs = yuv_import('./refDecoder/video/foreman_BAD.yuv', [width, height], numTotFrames,1);