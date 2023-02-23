library(sf)
library(tmap)
shp1<-st_read("C:/Users/82107/Documents/Github/2023GIScosm/data/chap07/SIG_june2022_01.shp") #시군구 벡터 파일
shp1_seoul = shp1[which(shp1$SIGUNGU_NM %in% c("서초구", "강남구", "송파구")), ]
tm_shape(shp1_seoul)+tm_fill()+tm_borders() #출력
pnt1<-st_read("C:/Users/82107/Documents/Github/2023GIScosm/data/chap07/seoul_subway_lift2.shp", options = "ENCODING=EUC-KR")
install.packages("tidyverse", type="source")
