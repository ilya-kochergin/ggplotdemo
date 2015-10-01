## 
require(ggplot2)
myPlot <-ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp))
summary(myPlot)

myPlot+geom_point()
newMyPlot<- myPlot+geom_point()
summary(newMyPlot)
newMyPlot+geom_point(aes(col=NULL))
newMyPlot+geom_point(aes(col=NULL))+theme(legend.position="none")
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + coord_flip()
ggplot(data=ToothGrowth, aes(x=dose, y=len, col=supp)) +
  geom_point() + coord_fixed(ratio=0.1)
### Faceting with orientation by rows
ggplot(data=myMovieData,aes(Budget)) + geom_histogram(binwidth=1) +
  facet_grid(Type~.) + scale_x_log10()
### Faceting with orientation by columns
ggplot(data=myMovieData,aes(Budget)) + geom_histogram(binwidth=1) +
  facet_grid(.~Type)+ scale_x_log10()
ggsave(filename = "ggplot.pdf")

ggplot(data=myMovieData,aes(Budget)) + geom_histogram(binwith=1) +
  facet_grid(roundYear~Type) + scale_x_log10()

ggplot(data=subset(myMovieData, roundYear>1980),
       aes(Budget)) +
  geom_histogram(binwith=1) +
  facet_grid(.~Type+roundYear) + scale_x_log10()

ggplot(data=subset(myMovieData,Year>1999),
       aes(Budget)) +
  geom_histogram() + facet_wrap(~Year, nrow=2) +
  scale_x_log10()

apropos("geom")
?stat_

ggplot(data=myMovieData, aes(x=Type,fill=factor(Short)))
+ geom_bar(position="stack")
ggplot(data=myMovieData, aes(x=Type,fill=factor(Short)))
+ geom_bar(position="dodge")
ggplot(data=myMovieData, aes(x=Type,fill=factor(Short)))
+ geom_bar(position="fill")

ggplot(data=myMovieData, aes(x=Type,fill=factor(Short))) +
  geom_bar(position=position_dodge(width = 0.5))
#### Example with the qplot() function
qplot(Petal.Length, data=iris, geom="histogram", color=Species,
      fill=Species, alpha=I(0.5))
qplot(Petal.Length, data=iris, geom="density", color=Species,
      fill=Species, alpha=I(0.5))
#### Example with the ggplot() function
ggplot(data=iris, aes(x=Petal.Length,color=Species,fill=Species)) +
  geom_histogram(alpha=I(0.5))
ggplot(data=iris, aes(x=Petal.Length,color=Species,fill=Species)) +
  geom_density(alpha=I(0.5))
ggplot(data=myMovieData, aes(x=Type,fill=factor(Short))) + geom_bar()
ggplot(data=myMovieData,
       aes(Type,Budget)) +
  geom_jitter() + geom_boxplot(alpha=I(0.6)) +
  scale_y_log10()
ggplot(data=ToothGrowth, aes(x=dose,
                             y=len)) + geom_point() +
  stat_smooth(method = "loess") + facet_grid(.~supp)
warnings()
