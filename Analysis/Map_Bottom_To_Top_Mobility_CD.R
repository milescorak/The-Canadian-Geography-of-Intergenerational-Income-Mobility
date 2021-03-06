# map the quintile transition probability
# of moving to the top given parent in the bottom
CD.data.map  <- merge(CD,CD.data)
library(tmap)
qtm(shp = CD.data.map, fill = "p15",fill.title="Probability of moving to the top quintile for
men and women having bottom quintile parents")+ 
  tm_layout(legend.position = c("right", "top"), legend.width = 0.55, legend.height = 0.55, legend.text.size = 0.7, legend.title.size = 0.7, aes.palette = "seq")
