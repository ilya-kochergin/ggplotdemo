# Chapter 5 Controlling Plot Details


###### Using labs()
plot <- ggplot(data=x, aes(x=x, fill=..count..)) + geom_histogram() +
  labs(title="This is my histogram", x="Random variable", y="Number
of times")
#### Using the individual functions
ggplot(data=x, aes(x=x, fill=..count..)) + geom_histogram() +
  ggtitle("This is my histogram") + xlab("Random variable") +
  ylab("Number of times")


plot+labs(title="This is \n my histogram", x="Random
variable", y="Number of times")


myBoxplot <- ggplot(dist, aes(x=group, y=value, fill=group)) +
  geom_boxplot()

myBoxplot 
myBoxplot + scale_x_discrete(limits=c("1","3","2","4"))

myBoxplot+scale_fill_grey() 

myBoxplot+scale_fill_brewer() 

myBoxplot+scale_fill_hue() 



# p 147 
myScatter <- ggplot(data=cont, aes(x=x, y=y,
                                   col=factor(group))) + geom_point()
myScatter + scale_y_log10()
myScatter + coord_trans(y="log10")



myBoxplot2 <- ggplot(subset(dist,group=="1"),
                     aes(x=group, y=value, fill=group)) + geom_boxplot()
myBoxplot2 + scale_x_discrete(breaks=NULL) +
  xlab("Distribution of variable 1")