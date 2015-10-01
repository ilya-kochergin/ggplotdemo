# p 108
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + stat_smooth() + facet_grid(.~supp)
# 2 group smoothers
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + stat_smooth()
# 1 global smoothers and 2 group smoother
ggplot() +
  geom_point(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  stat_smooth(data=ToothGrowth, aes(x=dose, y=len))
# common smoother and 2 group smoothers
ggplot() +
  geom_point(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  stat_smooth(data=ToothGrowth, aes(x=dose, y=len)) +
  stat_smooth(data=ToothGrowth, aes(x=dose, y=len,col=supp))
## p 128
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_smooth(method="loess",level=.80)  + geom_point()

## p 113
## Regression with confidence interval
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point()+stat_smooth(method="lm")
## Regression without confidence interval
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point()+stat_smooth(method="lm", se=FALSE)

ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + stat_smooth() + facet_grid(.~supp)
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + stat_smooth() + facet_grid(.~supp,margins=TRUE)
# P 116
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + stat_smooth(data = subset(ToothGrowth, supp
                                           =="OJ")) +
  stat_smooth(data = subset(ToothGrowth, supp =="VC"),method="lm") +
  facet_grid(.~supp)  
## Advanced aes-mapping 
# p 118 
cont <-
  data.frame(y=c(1:20,(1:20)^1.5,(1:20)^2),
             x=1:20,group=rep(c(1,2,3),each=20))
#### Data represented as points
ggplot(data=cont, aes(x=x, y=y, col=factor(group))) + geom_point()
ggplot(data=cont, aes(x=x, y=y,
                      col=factor(group),size=factor(group))) +
  geom_point()
ggplot(data=cont, aes(x=x, y=y,
                      col=factor(group),shape=factor(group))) +
  geom_point()
#### Data represented as lines
ggplot(data=cont, aes(x=x, y=y, col=factor(group))) + geom_line()
ggplot(data=cont, aes(x=x, y=y,
                      col=factor(group),size=factor(group))) +
  geom_line()
ggplot(data=cont, aes(x=x, y=y,
                      col=factor(group),linetype=factor(group))) +
  geom_line()   
# p 121 new stat variables
set.seed(1234)
x <-data.frame(x=rnorm(1000))
ggplot(data=x, aes(x=x, fill=..count..)) + geom_histogram()

ggplot(data=x, aes(x=x)) +
  geom_histogram(aes(y=..density..,fill=..density..))
ggplot(data=x, aes(x=x)) +
  geom_histogram(aes(y=..density..,fill=..density..)) +
  geom_density()


ggplot(data=x, aes(x=x)) + geom_histogram(aes(alpha=..count..))

ggplot(data=x, aes(x=x)) +
  geom_histogram(aes(alpha=..count..,fill=..count..))

ggplot(data=iris,
       aes(x=Petal.Length,col=Species,fill=Species,alpha=..count..)) +
  geom_histogram()


dist <- data.frame(value=rnorm(10000, 1:4), group=1:4)

ggplot(dist, aes(x=group, y=value,
                 color=group)) +
  geom_jitter(alpha=0.5)

# grouping variable as a factor:
  ggplot(dist, aes(x=group, y=value,
                   color=as.factor(group))) +
  geom_jitter(alpha=0.5)
 ## p 128 Adding text and reference lines to plots
  
  x <- data.frame(x=rnorm(1000))
  
  ggplot(x, aes(x=x)) +
    geom_histogram(alpha=0.5) +
    geom_vline(aes(xintercept=median(x)),
               color="red", linetype="dashed", size=1)
  
  ggplot(x, aes(x=x)) +
    geom_histogram(alpha=0.5) +
    geom_vline(aes(xintercept=median(x)), color="red", linetype="dashed",
               size=1) +
    geom_hline(aes(yintercept=50), col="black", linetype="solid")
  ggplot(x, aes(x=x)) +
    geom_histogram(alpha=0.5) +
    geom_vline(aes(xintercept=median(x)), color="red", linetype="dashed",
               size=1) +
    geom_hline(aes(yintercept=50), col="black", linetype="solid") +
    geom_text(aes(x=median(x),y=80),label="Median",hjust=1) +
    geom_text(aes(x=median(x),y=80,label=round(median(x),
                                               digit=3)),hjust=-0.5)
  