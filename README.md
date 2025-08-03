# Hemagglutination Macro for ImageJ

The intended use of this macro is for screening of lectin activity in raw or cooked dry bean samples and other pulse crops. Interpretation of hemagglutination assay results by eye can be quite subjective with high interobserver variability when attempting to determine positivity based on hemagglutination units (HAU). This macro provides an objective alternative by measuring the area (mm2) of agglutinated red blood cells in a single well, one row of 12 wells at a time, in 96 well round bottom plates. A region of interest (ROI) set consisting of a 12 well overlay is moved in unison by the user from row to row as the macro loops through analysis until all rows have been read. 

**Hemagglutination_Macro_Manual.pdf** is the manual for the hemagglutination macro.

**Hemagglutination.ijm** is the hemagglutination macro for imageJ.

**12_Well_ROIset.zip** contains an example 12 well region of interest (ROI) set that can be used with the following plate image.  
*Note: users will need to create their own 12_Well_ROIset.zip file for their images as image capture conditions will likley be different, e.g. type of camera used and resolution, camera zoom, camera height above the lightbox, etc.*

**Hemagglutination_Composite_Plate.jpg** is an example hemagglutination image file that can be used to demonstrate how the macro works. PHP-P is the phytohemagglutin isoform P positive control, S1-S6 are various bean samples and Neg is the negative control. Positive and negative controls should always be included when running the assay. The negative control is very important as positivity in the provided Excel template is defined as being greater than two standard deviations above the mean area of the negative control.

<img src="https://github.com/mcginleyj/hemagglutination/blob/main/Hemagglutination_Composite_Plate.jpg" width="600">

**Hemagglutination_Macro_Results_Template.xlsx** is an Excel template that can be used for data collection and summary. 

To download the files listed above, click on the green code button in the top right and choose the "download zip" option.

## Companion Videos
The following YouTube video links are provided showing how to perform the hemagglutination assay in a 96 well round bottom plate using defibrinated rabbit red blood cells, creating a 12 well ROI set in ImageJ, swetting the scale and using the ImageJ macro for analyzing hemagglutination plate images.

*Note: to open the videos in a new tab hold the CMD (Mac) or CTRL (Win) key down and click the link.*

[**Lectin Hemagglutination Assay**](https://www.youtube.com/watch?v=FWOMhOlLiug) 

[**Creating a 12 Well ROI Set for Analyzing Hemagglutination Plates in ImageJ**](https://www.youtube.com/watch?v=d4BtTiAVIGo) 

[**An ImageJ Macro for Analyzing 96 Well Hemagglutination Plates**](https://www.youtube.com/watch?v=EF8ssYyJGDY) 

