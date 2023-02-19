## 05. 일원분산분석

피셔의 분산분석(ANOVA)이란?: 세 개 이상의 모집단에 대한 모평균의 차이에 대한 가설검정입니다. 회귀분석과 마찬가지로 p-값에 따라 가설의 유의수준을 파악합니다. 이어서 잔차가 정규성/등분산성을 만족하는지도 파악합니다. ANOVA 분석의 귀무가설은 ‘모든 집단의 평균이 동일하다’ 입니다. 따라서 p값이 0.05보다 작다면 95% 신뢰구간에서 적어도 한 집단의 모평균이 다른 집단의 모평균과 다르다고 할 수 있습니다.

만약 ANOVA 결과 집단별 모평균에서 차이가 발생했을 경우 정확히 어떤 그룹과 어떤 그룹 사이에서 모평균 차이가 발생했는지 알아 볼 필요가 있습니다. 이를 사후분석(Post hoc)이라고 하는데, FWER(FamilyWise Error Rate, 여러 귀무가설 중 적어도 하나의 귀무가설에서 참이지만 기각하는 오류-1종오류-가 발생할 확률, 즉 차이가 발생했다고 거짓말을 할 확률)를 평가합니다. FWER가 높을수록 p값이 작겠지요?

사후분석은 아래와 같은 코드를 사용합니다.

```r
PostHocTest(anova1, method=)
#사후분석 실행
```

method 별 특징

- 피셔의 LSD(‘lsd’): FWER 높음.
유의수준 보정 없음.

- 봉페로니 교정(‘bonferroni’)
FWER 중간.
모든 집단을 짝지어 평가, p값이 3배.

- 투키의 HSD(‘hsd’)
FWER 중간.

- 셰페의 방법(‘scheffe’)
FWER 낮음. 보수적. 귀무가설이 거짓이어도 수용할 가능성 있음.(2종오류)



R에 포함된 통계데이터를 활용하여 실제 분석을 진행해 보겠습니다.
```r
data('PlantGrowth')
head(PlantGrowth)
```

<img title="" src="./이미지/051.jpg" alt="" width="100">

R에 기본으로 들어있는 PlantGrowth 데이터셋은 식물에 대한 실험에서 통제변인(ctrl)과 두 개의 조작변인(trt1, trt2)을 가한 식물들의 무게와 적용된 변인을 기록한 것입니다.

```r
levels(PlantGrowth$group)     #그룹에 몇 개의 수준이 있는지 확인
#'ctrl', 'trt1', 'trt2'
anova1 = aov(weight ~ group, data = PlantGrowth)
summary(anova1)
```

<img title="" src="./이미지/052.jpg" alt="" width="400">

Pr(>F)가 0.0159라서 약 99% 신뢰수준에서 적어도 한 집단의 모평균이 다른 집단의 모평균과 다르다고 할 수 있습니다.

```r
shapiro.test(PlantGrowth$weight[PlantGrowth$group=='ctrl'])
shapiro.test(PlantGrowth$weight[PlantGrowth$group=='trt1'])
shapiro.test(PlantGrowth$weight[PlantGrowth$group=='trt2'])
```

<img title="" src="./이미지/056.jpg" alt="" width="350">

정규성 검정입니다. 세 그룹 모두 정규성 가정을 위반하지 않는다고 볼 수 있습니다. 따라서 등분산성의 경우 회귀분석때의 예시와는 다르게 location이 mean인 레빈 검정 혹은 바틀렛 검정(bartlett.test)을 실시해야 합니다.

lawstat 패키지 설치 및 로드가 필요합니다.

```r
library(lawstat)
bartlett.test(PlantGrowth$weight, PlantGrowth$group)
#바틀렛 검정
levene.test(PlantGrowth$weight, PlantGrowth$group, location='mean')
#레빈 검정
```

<img title="" src="./이미지/053.jpg" alt="" width="400">

두 검정에서 모두 등분산성 가정이 유지됩니다.
ANOVA 분석 결과 그룹간 모평균 차이가 있었기 때문에, 사후분석을 해봅니다.

DescTools 패키지 설치 및 로드가 필요합니다.
```r
install.packages('DescTools')
library(DescTools)
```

```r
PostHocTest(anova1, method="lsd")
PostHocTest(anova1, method="bonferroni")
PostHocTest(anova1, method="hsd")
PostHocTest(anova1, method="scheffe")
```

<img title="" src="./이미지/054.jpg" alt="" width="300"><img title="" src="./이미지/055.jpg" alt="" width="300">

FWER의 기준을 5%(0.05)로 정했을 때, p값이 0.05보다 작은 trt1-trt2 사이의 모평균 차이만 95% 신뢰구간에서 유의미하다고 할 수 있겠습니다.
