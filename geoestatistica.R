library(geodata)
library(terra)
library(sf)
library(tmap)
library(CAST)

data(splotdata)
head(splotdata)

wc <- worldclim_global(var="bio",res = 10,path=tempdir())
elev <- elevation_global(res = 10, path=tempdir())
predictors_sp <- crop(c(wc,elev),st_bbox(splotdata))
names(predictors_sp) <- c(paste0("bio_",1:19),"elev")
