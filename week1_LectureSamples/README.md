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

read.csv is the standard, seamless way to get to this data.

### Fri Apr 10 11:17:45 2015

Excel format  
```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xls?accessType=DOWNLOAD","staticspeedcameras.xls",dir="./data/OpenBaltimore")
```

read.xlsx is the standard call from the xlsx library to read this format

### Fri Apr 10 10:50:26 2015

XML  
```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xml?accessType=DOWNLOAD","staticspeedcameras.xml",dir="./data/OpenBaltimore")
```

The XML file here is badly constructed. The root level contains a single child, "row", which then contains all of the actual data rows. So, in order to get to a single camera record you must subset as `cameraroot[[1]][[1]]`. Getting a list of the data element names must then use `names(cameraroot[[1]][[1]])` and from there, XPath or similar methods can be used to get to those nodes.

In order to use xpath* functions properly, XML files must be parsed with useInternalNodes=TRUE.

```
> xmlcamera <- readXML("s:/CourseraGettingCleaningData/week1_LectureSamples/data/OpenBaltimore/staticspeedcameras.xml",useInternalNodes=TRUE)
> cameraroot <- xmlRoot(xmlcamera)
> names(cameraroot)
  row 
"row" 
> names(cameraroot[[1]])
  row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row 
"row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" 
  row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row 
"row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" 
  row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row 
"row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" 
  row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row   row 
"row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" "row" 
  row   row   row   row   row   row   row   row 
"row" "row" "row" "row" "row" "row" "row" "row" 
> names(cameraroot[[1]][[1]])
       address      direction         street    crossstreet   intersection     location_1 
     "address"    "direction"       "street"  "crossstreet" "intersection"   "location_1" 
> 
> xpathSApply(cameraroot,"//address",xmlValue)
 [1] "S CATON AVE & BENSON AVE"                       "S CATON AVE & BENSON AVE"                      
 [3] "WILKENS AVE & PINE HEIGHTS AVE"                 "THE ALAMEDA & E 33RD ST"                       
 [5] "E 33RD ST & THE ALAMEDA"                        "ERDMAN AVE & N MACON ST"                       
 [7] "ERDMAN AVE & N MACON ST"                        "N CHARLES ST & E LAKE AVE"                     
 [9] "E MADISON ST & N CAROLINE ST"                   "ORLEANS ST & N LINWOOD AVE"                    
[11] "EASTERN AVE & KANE ST"                          "EDMONDSON AVE & COOKS LN"                      
[13] "W FRANKLIN ST & N PULASKI ST"                   "ORLEANS ST & N GAY ST"                         
[15] "S MARTIN LUTHER KING JR BLVD & WASHINGTON BLVD" "HILLEN RD & ARGONNE DR"                        
[17] "W NORTH AVE & N HOWARD ST"                      "E PATAPSCO AVE & 4TH ST"                       
[19] "REISTERSTOWN RD & FALLSTAFF RD"                 "PARK HEIGHTS AVE & HAYWARD AVE"                
[21] "PARK HEIGHTS AVE & HAYWARD AVE"                 "S MARTIN LUTHER KING JR BLVD & W PRATT ST"     
[23] "W NORTHERN PKWY & GREENSPRING AVE"              "W NORTHERN PKWY & GREENSPRING AVE"             
[25] "EDMONDSON AVE & N ATHOL AVE"                    "EDMONDSON AVE & N ATHOL AVE"                   
[27] "FREDERICK AVE & S CATHERINE ST"                 "PARK HEIGHTS AVE & VIOLET AVE"                 
[29] "SINCLAIR LN & MORAVIA RD"                       "WILKENS AVE & DESOTO RD"                       
[31] "E NORTHERN PKWY & WAVERLY WAY"                  "E COLD SPRING LN & HILLEN RD"                  
[33] "W COLD SPRING LN & ROLAND AVE"                  "E COLD SPRING LN & LOCH RAVEN BLVD"            
[35] "TAMARIND RD & W COLD SPRING LN"                 "HARFORD RD & THE ALAMEDA"                      
[37] "HARFORD RD & ROSALIE AVE"                       "HARFORD RD & CHRISTOPHER AVE"                  
[39] "SINCLAIR LN & SHANNON DR"                       "SINCLAIR LN & SHANNON DR"                      
[41] "LIBERTY HTS & HILLSDALE RD"                     "LIBERTY HTS & HILLSDALE RD"                    
[43] "E NORTHERN PKWY & SPRINGLAKE WAY"               "HARFORD RD & WALTHER AVE"                      
[45] "W NORTHERN PKWY & FALLS RD"                     "EDMONDSON AVE & N HILTON ST"                   
[47] "N PRESIDENT ST & E FAYETTE ST"                  "RUSSELL ST & W HAMBURG ST"                     
[49] "RUSSELL ST & W HAMBURG ST"                      "LIGHT ST & E PRATT ST"                         
[51] "E LOMBARD ST & S GAY ST"                        "HARFORD RD & E NORTH AVE"                      
[53] "FORT SMALLWOOD RD & FORT ARMISTEAD RD"          "GARRISON BLVD & WABASH AVE"                    
[55] "WALTHER AVE & GLENMORE AVE"                     "W FRANKLIN ST & CATHEDRAL ST"                  
[57] "PERRING PKWY & E BELVEDERE AVE"                 "GWYNNS FLS & GARRISON BLVD"                    
[59] "REISTERSTOWN RD & DRUID PARK DR"                "POTEE ST & TALBOTT ST"                         
[61] "YORK RD & GITTINGS AVE"                         "WABASH AVE & W BELVEDERE AVE"                  
[63] "E NORTHERN PKWY & YORK RD"                      "REISTERSTOWN RD & PATTERSON AVE"               
[65] "PULASKI HWY & E MONUMENT ST"                    "W FRANKLIN ST & N FRANKLINTOWN RD"             
[67] "S HANOVER ST & E CROMWELL ST"                   "REISTERSTOWN RD & MENLO DR"                    
[69] "RUSSELL ST & BAYARD ST"                         "LIBERTY HEIGHTS AVE & N DUKELAND ST"           
[71] "S HANOVER & REEDBIRD AVE"                       "W FAYETTE ST & N LIBERTY ST"                   
[73] "GWYNNS FLS & GARRISON BLVD"                     "LOCH RAVEN BLVD & WALKER AVE"                  
[75] "PULASKI HWY & MORAVIA PARK DR"                  "HILLEN ST & FORREST ST"                        
[77] "PULASKI HWY & NORTH POINT RD"                   "N MONROE ST & W LAFAYETTE AVE"                 
[79] "W MOUNT ROYAL AVE & W NORTH AVE"                "MOUNT ROYAL TER & W NORTH AVE"                 
```

### Fri Apr 10 10:50:36 2015

JSON  
```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD","staticspeedcameras.json",dir="./data/OpenBaltimore")
```

The JSON format used here is useless. The only way you can get to anything is via index subsetting. Metadata and camera data are in two huge arrays. Camera data has no field names.

```
> names(jsoncamera)
[1] "meta" "data"

$data[[80]]
$data[[80]][[1]]
[1] 80

$data[[80]][[2]]
[1] "68D99AD7-B917-41C1-B161-5E73D9BABBD7"

$data[[80]][[3]]
[1] 80

$data[[80]][[4]]
[1] 1331298886

$data[[80]][[5]]
[1] "393202"

$data[[80]][[6]]
[1] 1331298886

$data[[80]][[7]]
[1] "393202"

$data[[80]][[8]]
[1] "{\n}"

$data[[80]][[9]]
[1] "MOUNT ROYAL TER & W NORTH AVE"

$data[[80]][[10]]
[1] "S/B"

$data[[80]][[11]]
[1] "Mt Royal\n"

$data[[80]][[12]]
[1] "North"

$data[[80]][[13]]
[1] "Mt Royal\n & North"

$data[[80]][[14]]
[1] NA               "39.3108706445"  "-76.6251255783" NA               "FALSE"         

```

### Fri Apr 10 12:46:46 2015

W3schools example XML file  
http://www.w3schools.com/xml/simple.xml

```
getFile("http://www.w3schools.com/xml/simple.xml","simple.xml",dir="./data/w3schools")
```

### Fri Apr 10 14:49:56 2015

Github JSON repository listing
https://api.github.com/users/RobAtSGH/repos

```
getFile("https://api.github.com/users/RobAtSGH/repos","repos.json",dir="./data/github")
```
