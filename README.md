# Hemagglutination Macro for ImageJ
## TL;DR
All of the files in this repo can be downloaded in a single zip file. Click on the **green code button** at the top of this page and choose the **"Download ZIP"** option at the bottom of the list. This will download a single zip file named **"hemagglutination-main"**. Unzip the file and all files contained in this repo should be listed under the file folder labeled **hemagglutination-main**. Do not unzip the file **12_Well_RoiSet.zip**, leave it in its compressed zip file format as ImageJ macro expects the ROI set to be a single zip file and not individual .roi files. 

![Alt text](https://github.com/mcginleyj/hemagglutination/blob/main/Code_Options.png "Code Options Screenshot")

**IMPORTANT**  
Read the **Hemagglutination_Macro_Manual.pdf** prior to using the macro!  

The file, **12_Well_RoiSet.zip** in this repo is paired with the plate image file, **Hemagglutination_Composite_Plate.jpg**.  You will need to create your own **12_Well_RoiSet.zip** file using plate images that you have captured as conditions will likely vary for each user. Likewise, the scale will also need to be set according to the images that you have captured. Step-by-step tutorials for both can be found in the manual under appendix A & B, respectively. The companion video, [**Creating a 12 Well ROI Set for Analyzing Hemagglutination Plates in ImageJ**](https://www.youtube.com/watch?v=d4BtTiAVIGo), covers both of these topics. Other useful videos are listed below.   

Make sure the **12_Well_RoiSet.zip** file that you have created is in the same folder with your plate images. 

## Introduction
The intended use of this macro is for screening of lectin activity in raw or cooked dry bean samples and other pulse crops. Interpretation of hemagglutination assay results by eye can be quite subjective with high interobserver variability when attempting to determine positivity based on hemagglutination units (HAU). This macro provides an objective alternative by measuring the area (mm2) of agglutinated red blood cells in a single well, one row of 12 wells at a time, in 96 well round bottom plates. A region of interest (ROI) set consisting of a 12 well overlay is moved in unison by the user from row to row as the macro loops through analysis until all rows have been read. 

## Files

**Hemagglutination_Macro_Manual.pdf** is the manual for the hemagglutination macro.

**Hemagglutination.ijm** is the hemagglutination macro for imageJ.

**12_Well_ROIset.zip** contains an example 12 well region of interest (ROI) set that can be used with the following plate image.  
*Note: users will need to create their own 12_Well_ROIset.zip file for their images as image capture conditions will likely be different, e.g. type of camera used and resolution, camera zoom, camera height above the lightbox, etc.*

**Hemagglutination_Composite_Plate.jpg** is an example hemagglutination image file that can be used to demonstrate how the macro works. PHA-P is the phytohemagglutinin isoform P positive control, S1-S6 are various bean samples and Neg is the negative control. Positive and negative controls should always be included when running the assay. The negative control is very important as positivity in the provided Excel template is defined as being greater than two standard deviations above the mean area of the negative control.

<img src="https://github.com/mcginleyj/hemagglutination/blob/main/Hemagglutination_Composite_Plate.jpg" width="600">

**Hemagglutination_Macro_Results_Template.xlsx** is an Excel template that can be used for data collection and summary. 

Other Files

**Code_Options.png** a screenshot of the avaialble downloding options for this repo. 

**.gitignore** contains a listing of files to be ignored by git, i.e. files not uploaded to this repo.

**README.MD** the readme markdown file that you are reading right now. 

All of the files in this repo can be downloaded in a single zip file. Click on the **green code button** at the top of this page and choose the **"Download ZIP"** option at the bottom of the list. This will download a single zip file named **"hemagglutination-main"**. Unzip the file and all files contained in this repo should be listed under the file folder labeled **hemagglutination-main**. Do not unzip the file **12_Well_RoiSet.zip**, leave it in its compressed zip file format as ImageJ macro expects the ROI set to be a single zip file and not individual .roi files.

## Companion Videos
The following YouTube video links are provided showing how to perform the hemagglutination assay in a 96 well round bottom plate using defibrinated rabbit red blood cells, creating a 12 well ROI set in ImageJ, setting the scale and using the ImageJ macro for analyzing hemagglutination plate images.

*Note: to open the videos in a new tab hold the CMD (Mac) or CTRL (Win) key down and click the link. Pro Tip: you can speed up playback of the videos by clicking on settings (gear icon) in YouTube for each video and change the playback speed from normal to 1.5 or higher.*

[**Lectin Hemagglutination Assay**](https://www.youtube.com/watch?v=FWOMhOlLiug) 

[**Creating a 12 Well ROI Set for Analyzing Hemagglutination Plates in ImageJ**](https://www.youtube.com/watch?v=d4BtTiAVIGo) 

[**An ImageJ Macro for Analyzing 96 Well Hemagglutination Plates**](https://www.youtube.com/watch?v=EF8ssYyJGDY) 

## ImageJ
ImageJ is freely available image analysis software for Mac, Linux and Windows.  
[**Download ImageJ**](https://imagej.net/ij/download.html)
*Note: For those using Macs with Apple Silicon (ARM) Mx chips, if the macro is not functioning as expected according to the manual, quit the ImageJ app, start ImageJ again and reload the macro.*  

## Changelog
### 1.0.0 
Initial release.
### 1.0.1 
Added image rotation.  
Added image crop.
### 1.0.2 
Added manual threshold.  
Fixed ROI set not selected.
