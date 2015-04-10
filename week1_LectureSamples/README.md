# Week One Collecting Data Example Log

## Tools

downloading_data.R contains a wrapper getFile(url,destfile,dir=".",method="auto") that will check for the existence of dir and create it recursively if not. It provides for a clean download destination directory without worrying about creating it beforehand.

## File Download Collection

### Fri Apr 10 10:16:59 2015

CSV File of static speed cameras from OpenBaltimore data
https://data.baltimorecity.gov/api/views/dz54-2aru

```
getFile("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD","staticspeedcamera.csv",dir="./data/OpenBaltimore")
```
