
R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> setwd ('C:\\Users\\Michael\\Documents\\College\\Semester 7\\Enterprise Applications Architecture\\EAA CA2')
> perfdata <- read.table('results.dat',header=TRUE)
> print(perfdata)
    C0  N  Idle
1  118  1 59.03
2   42  2 45.14
3   64  3 36.76
4   81  4 30.93
5  102  5 26.83
6  113  6 24.34
7  116  7 20.69
8  129  8 20.73
9  129  9 18.20
10 138 10 14.96
11 145 11 14.57
12 145 12 12.97
13 146 13 11.91
14 148 14 12.69
15 161 15 18.78
16 197 16 13.93
17 200 17 12.95
18 212 18 10.98
19 208 19 13.37
20 211 20 13.65
21 204 21 11.97
22 215 22  5.15
23 223 23  5.42
24 223 24  2.42
25 232 25  3.83
26 219 26  2.82
27 225 27  4.61
28 227 28  2.41
29 238 29  2.52
30 221 30  2.51
31 223 31  1.51
32 231 32  0.80
33 236 33  3.11
34 234 34  0.40
35 219 35  0.61
36 215 36  0.20
37 233 37  0.50
38 225 38  0.20
39 233 39  1.40
40 228 40  0.00
41 184 41  0.31
42 164 42  0.31
43 126 43  0.00
44 145 44  0.20
45 218 45  0.00
46 225 46  0.00
47 153 47  0.00
48 202 48  0.00
49 217 49  0.30
50 217 50  0.10
> 
> Ui <- function(){
+ Usage = (100-perfdata$Idle)
+ Utilization = Usage/100
+ }
> 
> print(Ui())
 [1] 0.4097 0.5486 0.6324 0.6907 0.7317 0.7566 0.7931 0.7927 0.8180 0.8504
[11] 0.8543 0.8703 0.8809 0.8731 0.8122 0.8607 0.8705 0.8902 0.8663 0.8635
[21] 0.8803 0.9485 0.9458 0.9758 0.9617 0.9718 0.9539 0.9759 0.9748 0.9749
[31] 0.9849 0.9920 0.9689 0.9960 0.9939 0.9980 0.9950 0.9980 0.9860 1.0000
[41] 0.9969 0.9969 1.0000 0.9980 1.0000 1.0000 1.0000 1.0000 0.9970 0.9990
> 
> plot(perfdata$N, Ui(), type="b", xlab="N - Number of concurrent users", ylab="Ui - CPU Utilization(%)", main="Ui vs N")
> 
> 
> Di <- function(){
+ T = 10
+ ServiceDemand = (Ui()/T)
+ }
> 
> print(Di())
 [1] 0.04097 0.05486 0.06324 0.06907 0.07317 0.07566 0.07931 0.07927 0.08180
[10] 0.08504 0.08543 0.08703 0.08809 0.08731 0.08122 0.08607 0.08705 0.08902
[19] 0.08663 0.08635 0.08803 0.09485 0.09458 0.09758 0.09617 0.09718 0.09539
[28] 0.09759 0.09748 0.09749 0.09849 0.09920 0.09689 0.09960 0.09939 0.09980
[37] 0.09950 0.09980 0.09860 0.10000 0.09969 0.09969 0.10000 0.09980 0.10000
[46] 0.10000 0.10000 0.10000 0.09970 0.09990
> 
> 
> X0 <- function(){
+ T = 10
+ C = perfdata$C0
+ SystemThroughput = (C/T)
+ }
> 
> print(X0())
 [1] 11.8  4.2  6.4  8.1 10.2 11.3 11.6 12.9 12.9 13.8 14.5 14.5 14.6 14.8 16.1
[16] 19.7 20.0 21.2 20.8 21.1 20.4 21.5 22.3 22.3 23.2 21.9 22.5 22.7 23.8 22.1
[31] 22.3 23.1 23.6 23.4 21.9 21.5 23.3 22.5 23.3 22.8 18.4 16.4 12.6 14.5 21.8
[46] 22.5 15.3 20.2 21.7 21.7
> 
> 
> plot(perfdata$N, X0(), type="b", xlab="N - Number of concurrent users", ylab="X0 - System Throughput(tps)", main="X0 vs N")
> 
> 
> Di <- function(){
+ U = Ui()
+ X = X0()
+ ServiceDemand = (U/X)
+ }
> 
> print(Di())
 [1] 0.03472034 0.13061905 0.09881250 0.08527160 0.07173529 0.06695575
 [7] 0.06837069 0.06144961 0.06341085 0.06162319 0.05891724 0.06002069
[13] 0.06033562 0.05899324 0.05044720 0.04369036 0.04352500 0.04199057
[19] 0.04164904 0.04092417 0.04315196 0.04411628 0.04241256 0.04375785
[25] 0.04145259 0.04437443 0.04239556 0.04299119 0.04095798 0.04411312
[31] 0.04416592 0.04294372 0.04105508 0.04256410 0.04538356 0.04641860
[37] 0.04270386 0.04435556 0.04231760 0.04385965 0.05417935 0.06078659
[43] 0.07936508 0.06882759 0.04587156 0.04444444 0.06535948 0.04950495
[49] 0.04594470 0.04603687
> 
> 
> plot(perfdata$N, Di(), type="b", xlab="N - Number of concurrent users", ylab="Di - Service Demand (Seconds)", main="Di vs N")
> 
> 
> R <- function(){
+ N = perfdata$N
+ X = X0()
+ ResponseTime = (N/X)
+ }
> 
> print(R())
 [1] 0.08474576 0.47619048 0.46875000 0.49382716 0.49019608 0.53097345
 [7] 0.60344828 0.62015504 0.69767442 0.72463768 0.75862069 0.82758621
[13] 0.89041096 0.94594595 0.93167702 0.81218274 0.85000000 0.84905660
[19] 0.91346154 0.94786730 1.02941176 1.02325581 1.03139013 1.07623318
[25] 1.07758621 1.18721461 1.20000000 1.23348018 1.21848739 1.35746606
[31] 1.39013453 1.38528139 1.39830508 1.45299145 1.59817352 1.67441860
[37] 1.58798283 1.68888889 1.67381974 1.75438596 2.22826087 2.56097561
[43] 3.41269841 3.03448276 2.06422018 2.04444444 3.07189542 2.37623762
[49] 2.25806452 2.30414747
> 
> 
> plot(perfdata$N, R(), type="b", xlab="N - Number of concurrent users", ylab="R - Response Time (Seconds)", main="R vs N")
> 
> 
> 
> plot(perfdata$N, Ui(), type="b", xlab="N - Number of concurrent users", ylab="Ui - CPU Utilization(%)", main="Ui vs N")
> plot(perfdata$N, Di(), type="b", xlab="N - Number of concurrent users", ylab="Di - Service Demand (Seconds)", main="Di vs N")
> plot(perfdata$N, X0(), type="b", xlab="N - Number of concurrent users", ylab="X0 - System Throughput(tps)", main="X0 vs N")
> plot(perfdata$N, R(), type="b", xlab="N - Number of concurrent users", ylab="R - Response Time (Seconds)", main="R vs N")
> 
> 
> summary(Ui())
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.4097  0.8614  0.9653  0.9026  0.9967  1.0000 
> summary(Di())
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.03472 0.04296 0.04491 0.05339 0.06067 0.13060 
> summary(X0())
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   4.20   14.50   20.95   18.32   22.30   23.80 
> summary(R())
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.08475 0.83300 1.13200 1.32600 1.67400 3.41300 
> 
