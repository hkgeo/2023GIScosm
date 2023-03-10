## 01. R 기초 문법

------

### 01-1. R 기본 문법

- R 패키지 설치하기r

```r
install.packages('패키지이름')     #설치하
library(패키지이름)                #불러오기
```

R에서는 다른 사용자가 만든 다양한 추가 패키지를 설치하여 사용할 수 있습니다.

- 산술연산자

```r
1 + 2                 #3(더하기)
2 - 1                 #1(빼기)
2 * 3                 #6(곱하기)
7 / 2                 #3.5(나누기)
2 ^ 3                 #8(제곱)
7 %/% 2               #3(몫)
7 %% 2                #1(나머지)
```

- 논리연산자

```r
4 <= 4                #TRUE(이하)
3 > 4                 #FALSE(초과)
4 >= 4                #TRUE(이상)
3 == 4                #FALSE(같다)
3 != 4                #TRUE(다르다)
!TRUE                 #FALSE(아니다)
(1 < 2) || (3 > 4)    #TRUE(둘 중에 하나만 참이면 참)
(1 < 2) && (3 > 4)    #FALSE(둘 다 참이어야 참)
isTRUE(3 > 4)         #FALSE(참과 거짓 판별)
```

- 기타연산자

```r
x<-1                  #할
x=1                   #할당
y %in% x              #요소 y가 벡터 x 안에 포함되어 있는지?
x$y                   #x 안의 객체 y에 접근자료형벡터(Vector)행렬(Matrix)ㅈ
```

- 자료형

```r
typeof(as.integer(1))    #실수(double)을 강제로 정수형(integer)으로 바꾸고 자료형 확인
typeof(1.5)              #실수형(double)
typeof('a')              #문자형(character)
typeof(1<2)              #논리형(logical)
```

- 조건문, 반복문, 분기문
```r
if(조건) { ... } else if { ... } else { ... }    #if 조건문
for (i in 벡터) { ... }               #벡터에 지정된 값으로 변화하면서 반복
while(조건) { ... }                   #조건을 만족하는동안 반복
repeat                                #break를 만나기 전까지 반복
break                                 #반복문 탈출
```

------

### 01-2. 벡터(Vector)

R에서 벡터는 하나 이상의 값이 들어있는 1차원 배열로 생각할 수 있습니다. 벡터를 생성하고 다루는 방법을 알아보겠습니다.

- 벡터 생성하기

```r
c(1,2,4)                #벡터 원소를 일일이 입력
1:7                     #두 수 사이의 정수들로 이루어진 벡터-1 2 3 4 5 6 7
seq(2, 8, by = 2)       #등차수열-2 4 6 8
rep(2, 8, times = 4)    #반복-2 8 2 8 2 8 2 8
rep(2, 8, each = 4)     #각각 반복-2 2 2 8 8 8
```

- 벡터 정렬하기

```r
my_vector<-c(1, 6, 3, 5, 6)
sort(my_vector)         #원소를 오름차순으로 정렬-1 3 5 6 6
rev(my_vector)          #원소 순서를 반대로-6 5 3 6 1
table(my_vector)        #각 원소가 몇 개 있는지 출력-1→1 3→1 5→1 6→2
unique(my_vector)       #서로 다른 값들이 뭐가 있는지 출력- 1 3 5 6
```

- 벡터 값에 접근하기

```r
my_vector[3]                            #벡터의 3번째 원소
my_vector[-3]                           #벡터의 3번째 원소 빼고 전부
my_vector[2:6]                          #벡터의 2부터 6번 원소까지
my_vector[-(2:6)]                       #벡터의 2부터 6번 원소까지 빼고전부
my_vector[c(2,6)]                       #벡터의 2번과 6번 원소
my_vector[x == 5]                       #값이 5인 원소만
which(my_vector == 5)                   #값이 5인 원소의 위치
my_vector[x < 5]                        #값이 5 미만인 원소만 
my_vector[x %in% my_vector2]            #값이 벡터2 안에 있는 원소만
append(my_vector, 삽입할 자료, after=3)  #3번째 원소 뒤부터 새로운 원소 삽입
```

-----

### 01-3. 행렬(Matrix)

- 행렬 생성

```r
matrix(벡터, ncol=열개수, nrow=행개수, byrow=T/F)    #행렬 만들기
cbind(벡터, 벡터, 벡터...)                           #가로 방향으로 쌓기
rbind(벡터, 벡터, 벡터...)                           #세로 방향으로 쌓기
dim(my_vector)=c(a,b)                              #행과 열의 길이 지정해
```

- 행렬 연산

```r
t(my_matrix)                #전치행렬
solve(my_matrix)            #역행렬
my_matrix1 %*% my_matrix2   #행렬곱
my_matrix[행, 열]           #행렬 원소 추출

apply(my_matrix, 조건, 연산함수)    #행/열단위 연산 실행
apply(my_matrix, 1, mean)          #예)행의 평균값
apply(my_matrix, 2, sum)           #예)열의 합계

sweep(my_matrix, 조건, 활용 데이터, 연산자)    #행/열단위 벡터 연산
sweep(my_matrix, 1, my_vector, "+")          #예)행에 각 벡터 원소를 더해줌
sweep(my_matrix, 2, my_vector, "-")          #예)열에 각 벡터 원소를 빼줌
```
