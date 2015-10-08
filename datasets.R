require(ggplot2)

d1 <-data.frame(movies[movies$Action==1, c("budget", "Short",
                                           "year")])
d1$Type <- "Animation"
d2 <-data.frame(movies[movies$Animation==1, c("budget", "Short",
                                              "year")])
d2$Type <- "Animation"
d3 <-data.frame(movies[movies$Comedy==1, c("budget", "Short",
                                           "year")])
d3$Type <- "Comedy"
d4 <-data.frame(movies[movies$Drama==1, c("budget", "Short",
                                          "year")])
d4$Type <- "Drama"
d5 <-data.frame(movies[movies$Documentary==1, c("budget", "Short",
                                                "year")])
d5$Type <- "Documentary"
d6 <-data.frame(movies[movies$Romance==1, c("budget", "Short",
                                            "year")])
d6$Type <- "Romance"
myMovieData <- rbind(d1, d2, d3, d4, d5, d6)
names(myMovieData) <- c("Budget", "Short", "Year", "Type" )
myMovieData$roundYear <- signif(myMovieData$Year, digits = 3)
summary(myMovieData)



set.seed(1234)
x <- data.frame(x=rnorm(1000))

# dist <- data.frame(value=rnorm(10000, 1:4), group=1:4)
dist <- data.frame(value=rnorm(10000, 1:4), group=factor(1:4))

# p 118 
cont <-
  data.frame(y=c(1:20,(1:20)^1.5,(1:20)^2),
             x=1:20,group=rep(c(1,2,3),each=20))


sin5func  <-  data.frame(x=seq(from=0,to=5*pi,length.out = 10000))
sin5func$y  <-  sin(5*sin5func$x)

ggplot(data=sin5func,aes(x=x,y=y))+geom_line()+coord_polar()



ggplot(x, aes(x=x)) +
  geom_histogram(alpha=0.5) +
  geom_vline(aes(xintercept=median(x)), color="red", linetype="dashed",
             size=1) +
  geom_hline(aes(yintercept=50), col="black", linetype="solid") +
  geom_text(aes(x=median(x),y=80),label="Median",hjust=1) +
  geom_text(aes(x=median(x),y=80,label=round(median(x),                                
          
                                             
                                             
                                             digit=3)),hjust=-0.5)




ggplot(x, aes(x=x)) +
  geom_histogram(alpha=0.5) +
  geom_vline(aes(xintercept=median(x)), color="red",linetype="dashed",
             size=1) +
  geom_hline(aes(yintercept=50), col="black",linetype="solid") +
  geom_text(aes(x=median(x),y=80),label="Median",hjust=1) + geom_text(aes(x
                                                                          =median(x),y=80,label=round(median(x)
                                                                                                      , digit=3)),hjust=-0.5) +
  annotate("rect", xmin = quantile(x$x, probs = 0.25), xmax = quantile(x$x,
                                                                       probs = 0.75), ymin = 0, ymax = 100,
           alpha = .2, fill="blue")

