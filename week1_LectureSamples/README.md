# Week One Collecting Data Example Log

## Tools

downloading_data.R contains a wrapper getFile(url,destfile,dir=".",method="auto") that will check for the existence of dir and create it recursively if not. It provides for a clean download destination directory without worrying about creating it beforehand.

The function readExcel(file,index=1) loads the xlsx library if not already loaded and reads the first spreadsheet tab from the specified file by default, returning a data.table. Passing a value for index determines which tab is returned.

## File Download Collection

### Fri Apr 10 10:40:50 2015

CSV File of static speed cameras from OpenBaltimore data  
https://data.baltimorecity.gov/api/views/dz54-2aru

```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD","staticspeedcameras.csv",dir="./data/OpenBaltimore")
```

### Fri Apr 10 11:17:45 2015

Excel format  
```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xls?accessType=DOWNLOAD","staticspeedcameras.xls",dir="./data/OpenBaltimore")
```

### Fri Apr 10 10:50:26 2015

XML  
```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xml?accessType=DOWNLOAD","staticspeedcameras.xml",dir="./data/OpenBaltimore")
```

### Fri Apr 10 10:50:36 2015

JSON  
```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD","staticspeedcameras.json",dir="./data/OpenBaltimore")
```
