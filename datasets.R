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

dist <- data.frame(value=rnorm(10000, 1:4), group=1:4)

# p 118 
cont <-
  data.frame(y=c(1:20,(1:20)^1.5,(1:20)^2),
             x=1:20,group=rep(c(1,2,3),each=20))



