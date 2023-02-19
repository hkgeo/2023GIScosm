## 06. R 그래프

```r
install.packages('ggplot2')
library(ggplot2)
```

<img title="" src="./이미지/06layer.png" alt="" width="350">

```r
df1 <- read.csv("./데이터/06-인구비율.csv", encoding="UTF-8")
```

#### 06-1. 산점도

```r
ggplot(df1, aes(유소년인구, 노년인구)) +
    geom_point(color='red') +
    geom_smooth(method="lm")
```

```r
ggplot(df1, aes(유소년인구, 노년인구)) +
    geom_point(cex=0.75) +
    geom_smooth(method="lm")
```

```r
ggplot(df1, aes(유소년인구, 노년인구)) +
    geom_point(pch='square') +
    geom_smooth(method="lm")
```

```r
ggplot(df1, aes(유소년인구, 노년인구)) +
    stat_binhex() +
    geom_smooth(method="lm")
```

```r
ggplot(df1, aes(유소년인구, 노년인구)) +
    stat_density_2d_filled(geom="raster", aes(fill=after_stat(density), alpha=after_stat(density)), contour=FALSE)+
    geom_smooth(method="lm")
```

```r
data('quakes')
coplot(lat ~ long | depth, data=quakes)
```

```r
coplot(lat ~ long | depth*mag, data=quakes)
```

#### 06-2. 막대 그래프

#### 06-3. 꺾은선 그래프

#### 06-4. 상자그림

#### 06-5. 인터랙티브 그래프

#### 06-6. 인터랙티브 시계열 그래프