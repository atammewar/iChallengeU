# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import json
import csv

def FullName(Name):
    if (Name == 'AP'):
        Name = 'Aditya Ponnaluri';
    elif (Name == 'AT'):
        Name = 'Aditya Tammewar';
    elif(Name == 'Vivek'):
        Name = 'Vivek Voleti';
    elif(Name == 'Laxmi'):
        Name = 'Laxmi Kasaraneni';
    elif(Name == 'Anand'):
        Name = 'Anand Kesavaraju';
    elif(Name == 'Alekhya'):
        Name = 'Alekhya Gorti';
    elif(Name == 'Anusha'):
        Name = 'Anusha Devareddy';
    elif(Name == 'Gautam'):
        Name = 'Gautam Tammewar';
    elif(Name == 'Rohit'):
        Name = 'Rohit Voleti';
    else:
        print 'Unknown Name, bro';
    return Name;

def timeStamp(DateTime):
    Date = DateTime[0];
    Time = DateTime[1];
    
    MDY = Date.split('/');
    Month = int(MDY[0]);
    Day = int(MDY[1]);
    Year = int(MDY[2]);
    
    HMS = Time.split(':');
    Hour = int(HMS[0]);
    Minute = int(HMS[1]);
    Second = int(HMS[2]);

    return [Month, Day, Year, Hour, Minute, Second]

with open('RawGoogleDriveData.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',')
    BikeJSON = '';
    tempBikeCounter = 0 
    tempRunCounter = 0  
    
    # Start with Bike Records
    for row in spamreader:
        if row[1] == 'Bike':
            # Split the Date into Month, Day, Year,
            # Hour, Minute, Second:
            DateTime = row[0].split( );
            [Month, Day, Year, Hour, Minute, Second] = timeStamp(DateTime)
            
            # Check the Names, we want to use Full Names: (?)
            Name = row[2];
            Name = FullName(Name);
            
            # Convert Exercised Time to seconds:
            timeInSec = 0;
            temp = row[3].split(':');
            timeInSec = int(temp[0])*3600 + int(temp[1])*60 + int(temp[2]);
            
            # Convert Distance to float
            Distance = float(row[4]);
            
            # Now, build JSON string:
            tempBikeString = json.dumps({"User": Name, "Time": timeInSec, "Distance": Distance, "Day": Day, "Month": Month, "Year": Year, "Hour": Hour, "Minute": Minute, "Second": Second}, sort_keys=True, indent=4, separators=(',', ': '))
            
            if (tempBikeCounter == 0):
                BikeJSON = tempBikeString;
                tempBikeCounter = 1;
            else:
                BikeJSON = BikeJSON + ', ' + tempBikeString;

        elif row[1] == 'Run':
            ## Run code here

        ## elif row[1] = <other activity>
                
BikeJSON = '[' + BikeJSON + ']';

f = open('BikeJSON.txt', 'w+')
f.write(BikeJSON);