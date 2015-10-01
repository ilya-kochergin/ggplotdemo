require(ggplot2)


# qplot(x, y, data, color, shape, size, facets, geom, stat)

## p 43

data(Orange) ## Load the data
str(Orange)

ggplot(data=Orange, ## Data used
       aes(x=circumference,y=age, color=Tree))+ ## Aesthetic
  geom_point()+ ## Geometry
  stat_smooth(method="lm",se=FALSE) ## Statistics
### Corresponding code with qplot()
qplot(circumference,age,data=Orange, ## Data used
      color=Tree, ## Aesthetic mapping
      geom=c("point","smooth"),method="lm",se=FALSE)


