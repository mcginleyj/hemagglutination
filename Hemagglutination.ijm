// ********** Configuration Start **********
WellDist = 49;       // Diameter of well bottom measured in pixels. Must be determined by user as camera height, resolution and type of plate will vary.
KnownDist = 6.4;     // Known diameter of the well bottom in mm according to plate manufacturer spec sheet.
RecWidth = 200;      // Initial rectangle width for overlay used to crop image.  
RecHeight = 150;     // Initial rectangle height for overlay used to crop image.
ManThresh = 1;       // Manual threshold adjustment is enabled (1) by default. To disable, set equal to 0.
MaxThresh = 230;     // Max image threshold value using a grayscale range of 0-255.
CodeVer = "v1.0.3";  // Current code version of this macro.
RoiZip = "12_Well_RoiSet.zip";  // Name of zip file containing the 12 ROI image overlays, one for each well in a plate row. 
PartSizeRange = "1-Infinity";   // Particle size range.
PartCircRange = "0.20-1.00";    // Particle circular range.
MeasureOptions = "area centroid redirect=None decimal=3";    // Default well measurements of area and centroid.
// MeasureOptions = "area centroid mean min integrated redirect=None decimal=3";  // Optional measurements of area, mean, min, centroid and integrated density.
// ********** Configuration End **********
// The two values listed above, WellDist and KnownDist are specifically for the following round bottom 96 well plate
// (cat. 12565214, Fisher Scientific, Waltham, MA, USA)
// image captured at a camera height of 75 cm using an iPhone 16 camera with 2X zoom. 
// WellDist is the distance in pixels determined by drawing a horizontal line from the left inner edge of a center 
// well to the right inner edge of the same well. KnownDist is the known value well diameter in mm according to
// the manufacturer spec sheet. 
// Note: These values must be determined by each user as camera height, image resolution and type of 96 well plate used will vary.
// RecWidth and RecHeight are pixel values used to draw a small rectangle in the center of the plate image
// that is resized by the user to the edges of the plate prior to cropping the image. 
// MaxThresh is the maximum image threshold value in a 255 grayscale range with black=0 and white=255. 
// Note: if a well is automatically excluded due to excessive artifact try editing the MaxThresh value.
close("*");
run("Colors...", "foreground=white background=white selection=cyan"); 
print("\\Clear");
print("Hemagglutination Image Analysis Macro " + CodeVer);
print("John N McGinley, Colorado State University" + "\n");
print("Note: this log window will display helpful information throughout");
print("various points in the macro." + "\n");
print("The macro is designed to analyze hemagglutination results in a 96 well");
print("round bottom plate, one row of 12 wells at a time. You will be prompted");
print("to rotate the image first so that the wells are aligned with the gridlines.");
print("In addition, you will be prompted position an overlay box around the outer");
print("edges of the plate prior to cropping the image. You will also need to adjust");
print("the position of a 12 well ROI set of overlay circles directly over the wells");
print("you wish to analyze. Once analyzed, area data is written to the results table");
print("and copied to the clipboard, so that it can be pasted into Excel or text file.");
waitForUser("If needed, please resize the log window so that you can read all of the written content.");
print("\\Clear");
print("Browse and select a 96 well hemagglutination plate image file to open." + "\n");
print("Note: the ROI image overlay file, '12_Well_RoiSet.zip' must be located");
print("in the same directory with the image(s). If it is not, cancel the macro,");
print("move the file to the same directory with the plate image(s) and restart");
print("the macro."); 
MyImage = File.openDialog("Select a File"); 
open(MyImage); 
MyFilePath = getDirectory("image");
// Check if the file exists
if (File.exists(MyFilePath + RoiZip)) {
    // If the file exists, open it
    //open(filePath); 
} else {
    // If the file doesn't exist, print a message
    print("\\Clear");
    print("ROI zip File, " + MyFilePath + RoiZip + " not found!" + "\n");
    print("Cancel the macro, move the file to the same directory");
    print("with the image(s) and restart the macro.");
    waitForUser("Error: file " + RoiZip + " not found in image directory!");
}
// Rotate the image to make sure it is straight
print("\\Clear");
print("Rotate the image so that the wells are properly aligned");
print("with the blue horizontal and vertical grid lines" + "\n");
print("Note: preview must be checked to see gridlines needed for alignment."+ "\n");
print("Use the following settings:");
print("Gridlines: 1");
print("Interpolation: Bilinear");
print("Check - Fill with background color");
print("Uncheck - Enlarge image");
print("Check - Preview");
print("Angle: Drag the slider from side to side to rotate.");
print("Use left/right arrow keys for smaller increments.");
run("Rotate... ");
// Get image width and height
ImageWidth = getWidth();
ImageHeight = getHeight();
// Create a rectangle with preset width and height
// Rectangle center coordinates 
CtrX = ImageWidth / 2;
CtrY = ImageHeight / 2;
// Calculate upper-left corner for makeRectangle
BeginX = CtrX - RecWidth / 2;
BeginY = CtrY - RecHeight / 2;
// Create a rectangle selection overlay to use for cropping the image 
makeRectangle(BeginX, BeginY, RecWidth, RecHeight);
print("\\Clear");
print("Circumscribe the edges of the plate by dragging the upper left corner");
print("of the blue rectangle to the upper left corner (outer edge) of the plate");
print("then drag the bottom right corner of the rectangle to the bottom right");
print("corner (outer edge) of the plate, i.e. all outer edges of the plate");
print("should be within bounds of the rectangle before clicking OK, which");
print("will crop the image to the area inside the rectangle");
waitForUser("Drag the corners of the rectangle in the image center to the outer edges of the plate then click OK to crop.");
run("Crop");
run("Options...", "iterations=1 count=1 do=Nothing");
run("Set Scale...", "distance=WellDist known=KnownDist unit=mm global");
run("Set Measurements...", MeasureOptions);
// Make sure any old temporary files are deleted first before saving new temporary image files
File.delete(MyFilePath + "Original Plate.jpg"); 
File.delete(MyFilePath + "Original Plate BW.jpg");
File.delete(MyFilePath + "Result of Mask.jpg");  
run("Duplicate...", " ");
saveAs("Jpeg", MyFilePath + "Original Plate.jpg");
close;
open(MyFilePath + "Original Plate.jpg");
run("Duplicate...", " ");
// Convert the image from color to 8-bit grayscale
run("8-bit");
saveAs("Jpeg", MyFilePath + "Original Plate BW.jpg");
close;
open(MyFilePath + "Original Plate BW.jpg");
// Open the ROI Manger and load the ROI set zip file containing the 12 ROI well overlays then combine into a single ROI
run("ROI Manager...");
roiManager("Open", MyFilePath + RoiZip);
roiManager("Show All");
roiManager("Select", 0);
roiManager("Select", newArray(0,1,2,3,4,5,6,7,8,9,10,11));
roiManager("Combine");
roiManager("Add");
roiManager("Select", newArray(0,1,2,3,4,5,6,7,8,9,10,11));
roiManager("Delete");
roiManager("Select", 0);
roiManager("Deselect");
roiManager("Select", 0);
// Start of analysis loop
do {
selectWindow("Original Plate BW.jpg");
print("\\Clear");
print("Click and drag any of the 12 region of interest (ROI) overlay circles");
print("to move the entire set and adjust the position so that each circle");
print("is in the center of each well." + "\n");
print("Drag the Action Required prompt window and ROI Manager window");
print("out of the way if needed." + "\n");
waitForUser("Adjust ROI position by dragging any of one of the 12 well overlay circles.");
run("Create Mask");
imageCalculator("Subtract create", "Mask","Original Plate BW.jpg");
selectImage("Result of Mask");
saveAs("Jpeg", MyFilePath + "Result of Mask.jpg");
close;
open(MyFilePath + "Result of Mask.jpg");
setAutoThreshold("Default no-reset");
setThreshold(0, MaxThresh, "raw");
if (ManThresh == 1) {
   print("If needed, you can adjust the threshold manually by leaving the");
   print("top slider in the threshold window set to zero and adjusting");
   print("the bottom slider above or below the default value of " + MaxThresh + ".");
   run("Threshold...");
   waitForUser("Adjust the threshold if necessary and then click OK to continue.");
   close("Threshold");
}
run("Analyze Particles...", "size=" + PartSizeRange + " circularity=" + PartCircRange + " show=Outlines display exclude");
// Check if the "Results" table is empty
if (nResults == 0) {
    print("\\Clear");    
    print("WARNING: the Results table has no well area measurements!");
    waitForUser("No area data! Try analyzing a different row of wells. Click Ok to continue.");
} else {
    print("\\Clear");
    print("Total rows of data = " + nResults);
    Table.sort("X");
    String.copyResults;
   if (nResults < 12) {
      print("\n" + "WARNING: there are < 12 rows of data!");
      print("Rows of data should equal 12." + "\n");
      print("Results have been copied to the clipboard for you to paste ");
      print("elsewhere. However, it is recommended that you slightly ");
      print("readjust the ROI position and try again." + "\n"); 
      print("You can also try adjusting the threshold by keeping the top");
      print("slider set at 0, all the way to left, and move the 2nd slider");
      print("only. Adjust the 2nd slider to a lower value, e.g. 220 and ");
      print("and measure. Remeasure the same row of wells changing the  ");
      print("threshold as many times as needed until all 12 well measurements ");
      print("are obtained.");
      waitForUser("WARNING: < 12 rows of data!");
      //Table.deleteRows(0, 99);
   }   
   if (nResults > 12) {
      print("\n" + "WARNING: there are > 12 rows of data!");
      print("Results have been copied to the clipboard");
      print("for you paste elsewhere. However, it is recommended");
      print("that you adjust the ROI position and try again."); 
      print("\n" + "Rows of data should equal 12.");
      waitForUser("WARNING: > 12 rows of data!");
      //Table.deleteRows(0, 99);
   }       
   if (nResults == 12) {
      print("\n" + "Success!" + "\n");
      print("Note: Objects in the drawing window may not be labeled");
      print("in numerical order from left to right. However, data");
      print("in the results table is sorted by the 'X' centroid");
      print("value, i.e. X position value going from left to right,");
      print("thus matching wells 1-12 in the image.");
      selectWindow("Results");
      waitForUser("Results data copied to clipboard. Paste into Excel or a text file then click OK to continue.");
    //Table.deleteRows(0, 99);
   }
   Table.deleteRows(0, 99);
}
close;
close;
close;
print("\\Clear");  
print("Note: clicking cancel will stop the macro, but not close any windows." + "\n");
print("To stop the macro and close all windows, choose 'No' from the pulldown");
print("option in the Analysis prompt and click OK." + "\n");
print("To analyze a different row of wells or reanalyze the same row of wells");
print("keep option in the prompt selection as 'Yes' and click OK.");
//-- Create and show a dialog box
     Dialog.create("Analysis Prompt");
     Dialog.addChoice("Do you want to analyze a row of 12 wells?", newArray("Yes","No"));
     Dialog.show();
	//-- When OK is clicked, get the status of the dialog
	finished=Dialog.getChoice();
} while (finished=="Yes")
// End of analysis loop
// Housekeeping
roiManager("Deselect");
roiManager("Delete");
close("*");
File.delete(MyFilePath + "Original Plate.jpg"); 
File.delete(MyFilePath + "Original Plate BW.jpg");
File.delete(MyFilePath + "Result of Mask.jpg");  
run("Colors...", "foreground=white background=black selection=yellow");
close("Roi Manager");
close("Results");
close("Log");
