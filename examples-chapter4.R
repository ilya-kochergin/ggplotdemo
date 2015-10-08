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
  geom_histogram() + scale_fill_grey() 



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
  
  
  #p 132 Add text and reference lines with facets
  
  
  ggplot(dist, aes(x=value, fill=as.factor(group))) +
    geom_histogram(alpha=0.5) +
    geom_vline(data = subset(dist, group
                             =="1"), aes(xintercept=median(value)), color="black",
               linetype="dashed", size=1) +
    geom_text(data = subset(dist, group
                            =="1"),aes(x=median(value),y=350,label=round(median(value),
                                                                         digit=3)),hjust=-0.2) +
    facet_grid(.~group)
  
  myColours <- scales::hue_pal()(4)
myColours  
  
ggplot(dist, aes(x=value, fill=as.factor(group))) +
    geom_histogram(alpha=0.5)+
    ### Facet 1
    geom_vline(data = subset(dist, group ==1),
               aes(xintercept=median(value)), color=myColours[1], linetype="dashed",
               size=1.5)+geom_text(data = subset(dist, group
                                                 ==1),aes(x=median(value),y=350,label=round(median(value),
                                                                                            digit=3)),hjust=-0.2)+
    ### Facet 2
    geom_vline(data = subset(dist, group==2),
               aes(xintercept=median(value)), color=myColours[2], linetype="dashed",
               size=1.5)+
    geom_text(data = subset(dist, group
                            ==2),aes(x=median(value),y=350,label=round(median(value),
                                                                       digit=3)),hjust=-0.2)+
    ### Facet 3
    geom_vline(data = subset(dist, group==3),
               aes(xintercept=median(value)), color=myColours[3], linetype="dashed",
               size=1.5)+geom_text(data = subset(dist, group
                                                 ==3),aes(x=median(value),y=350,label=round(median(value),
                                                                                            digit=3)),hjust=-0.2)+
    ### Facet 4
    geom_vline(data = subset(dist, group==4),
               aes(xintercept=median(value)), color=myColours[4], linetype="dashed",
               size=1.5)+geom_text(data = subset(dist, group
                                                 ==4),aes(x=median(value),y=350,label=round(median(value),
                                                                                            digit=3)),hjust=-0.2)+
     facet_grid(.~group)



ggplot(dist, aes(x=value, fill=as.factor(group))) +
  geom_histogram(alpha=0.5)+
  ### Facet 1
  geom_vline(data = subset(dist, group ==1),
             aes(xintercept=median(value)), color=myColours[1], linetype="dashed",
             size=1.5)+geom_text(data = subset(dist, group
                                               ==1),aes(x=median(value),y=350,label=round(median(value),
                                                                                          digit=3)),hjust=-0.2)+
  ### Facet 2
  geom_vline(data = subset(dist, group==2),
             aes(xintercept=median(value)), color=myColours[2], linetype="dashed",
             size=1.5)+
  geom_text(data = subset(dist, group
                          ==2),aes(x=median(value),y=350,label=round(median(value),
                                                                     digit=3)),hjust=-0.2)+
  ### Facet 3
  geom_vline(data = subset(dist, group==3),
             aes(xintercept=median(value)), color=myColours[3], linetype="dashed",
             size=1.5)+geom_text(data = subset(dist, group
                                               ==3),aes(x=median(value),y=350,label=round(median(value),
                                                                                          digit=3)),hjust=-0.2)+
  ### Facet 4
  geom_vline(data = subset(dist, group==4),
             aes(xintercept=median(value)), color=myColours[4], linetype="dashed",
             size=1.5)+geom_text(data = subset(dist, group
                                               ==4),aes(x=median(value),y=350,label=round(median(value),
                                                                                          digit=3)),hjust=-0.2)+facet_grid(.~group)


  # polar coords
  
  ggplot(data=myMovieData,
         aes(x=factor(1),fill=factor(Type))) +
    geom_bar(width = 1) + coord_polar(theta = "y")
  
ggplot(data=myMovieData, aes(x=factor(1),fill=factor(Type))) +
  geom_bar(width = 1) + coord_polar()


ggplot(data=myMovieData,
       aes(x=Type,fill=factor(Type))) +
  geom_bar(width = 0.8) + coord_polar(theta = "x")


ggplot(x, aes(x=x)) +
  geom_histogram(alpha=0.5) +
  geom_vline(aes(xintercept=median(x)),
             color="red", linetype="dashed", size=1)

