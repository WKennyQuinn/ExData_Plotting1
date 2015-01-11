---
title: "README"
author: "WKennyQuinn"
date: "Sunday, January 11, 2015"
output: html_document
---
#Overview

This repository contains 4 scripts for the 1st Course Project of Coursera's "Exploratory Data Analysis" course. Each script will create a plot investigating how energy usage varies over a two day period in February, 2007. The plots are created to match 4 reference plots given in the assignment. The four scripts included are:<br>
- <b>Plot1.R</b>: Creates Plot1.png and saves to the working directory<br>
- <b>Plot2.R</b>: Creates Plot2.png and saves to the working directory<br>
- <b>Plot3.R</b>: Creates Plot3.png and saves to the working directory<br>
- <b>Plot4.R</b>: Creates Plot4.png and saves to the working directory<br>

#Data Source and Variables

Data on household electricity usage is taken from the UC Irvine Machine Learning Repository. 
The source link is here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

The data is a .txt file that contains 9 variables, described from the UCI website as:<br>
1.<b>Date</b>: date in fromat dd/mm/yyyy<br>
2.<b>Time</b>: time in format hh:mm:ss<br>
3.<b>Global_active_power</b>: household global minute-averaged active power (in kilowatt)<br>
4.<b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt)<br>
5.<b>Voltage</b>: minute-averaged voltage (in volt)<br>
6.<b>Global_intensity</b>: household global minute-averaged current intensity (in ampere)<br>
7.<b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).<br>
8.<b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.<br>
9.<b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.<br>

#Code Execution

Each script is standalone in that it will check for the presence of the data and, if required, download and unzip the necessary files from the UCI repository. Code execution is performed in the following steps:

##Loading the Data

The script will search for the source .zip file in the active directory. If none is found, the .zip file with be downloaded.

The script will search for the extracted folder in the active directory. If none is found, the script will unzip the data and will place the extracted data into a directory with the same name as the zip file ("exdata-data-household_power_consumption"").

The script will check the filesize of the entire data file. To preserve system resources, only the applicable part of the file will be read into memory. 

The start row is found by searching for the first instance of the date "1/2/2007" (Feb 1, 2007) with <i>grep()</i> and <i>readLines()</i>. The end row is found by finding the first instance of "3/2/2007" (Feb 3, 2007) with the same method. This information is used as "skip" and "nrows" paramters in <i>read.table</i> to save the data as <b>EnergyData</b>

For good measure, the data is checked for missing data, which is encoded as "?". Any missing data is converted to <b>NA</b>.

Finally, the original data contains the date and time as two separate columns, which are read as characters. These are combined using <i>paste0()</i> and converted to POSIXlt format using <i>strptime()</i>. The result is stored in a new column <b>EnergyData$DateTime</b>

##Making Plots

All plots are made with the base plot package. For each, <i>png()</i> is used to set the graphics device directly instead of printing the screen and then saving. All plots feature size of 480x480 pixels and a transparent background to match the assignment reference plots.

<b>Plot 1</b><br>
Histogram using <i>hist()</i>. Title, x/y-labels and color are set through parameters in <i>hist()</i>
<br>
<b>Plot 2</b><br>
Line plot using <i>plot()</i> with type="l". x/y-labels are set through parameters in <i>plot()</i>
<br>
<b>Plot 3</b><br>
Line plot using <i>plot()</i> with type="l" where x/y-labels are set. Additional lines are then added with <i>lines()</i>, with color set. Finally, <i>legend()</i> is used to create a legend, place it in the plot position, and to define the names and line colors used.
<br>
<b>Plot 4</b><br>
After setting the graphics device, <i>par(mfrows)</i> is used to set up a 2x2 plot area. Each plot is then created as above using <i>plot()</i> and <i>lines()</i>.
