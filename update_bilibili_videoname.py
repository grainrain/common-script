#!/usr/bin/env python
# _*_ coding:utf-8 _*_
import glob
import os
import json

filepath = "d:\\360Downloads\\65548392\\*\\*"
# filepath = "d:\\workspace\\*\\*"
for fileName in glob.iglob(filepath, recursive=True):
    global infoFilePath, infoFileName, infoFileFullPath;
    global flvFilePath, flvFileName, flvFileFullPath;
    print("-------------" + fileName)
    if fileName.endswith("info"):
        print("--------------------" + fileName + "-----------------------")
        infoFilePath = fileName.rsplit('\\', 1)[0];
        print(infoFilePath)
        infoFileName = fileName.rsplit('\\', 1)[1];
        print(infoFileName)
        infoFileFullPath = fileName;
        print(infoFileFullPath)
    elif fileName.endswith("flv"):
        print("--------------------" + fileName + "-----------------------")
        flvFilePath = fileName.rsplit('\\', 1)[0];
        print(flvFilePath)
        flvFileName = fileName.rsplit('\\', 1)[1];
        print(flvFileName)
        flvFileFullPath = fileName;
        print(flvFileFullPath)
        jsonData = open(infoFileFullPath, encoding='utf-8')
        fileJson = json.load(jsonData);
        realFileName = fileJson["PartName"]
        os.rename(flvFileFullPath, flvFilePath + "\\" + realFileName + ".flv");




