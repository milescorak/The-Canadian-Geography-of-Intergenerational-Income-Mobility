# map the quintile transition probability of staying in the bottom given parent in the bottom

CD.data.map  <- merge(CD,CD.data)

qtm(shp = CD.data.map, fill = "p11",fill.title="Probability of staying in the bottom quintile for
men and women having bottom quintile parents",fill.breaks=c(0,0.20,0.25,0.30,0.35,0.40,1))+ 
  tm_layout(legend.position = c("RIGHT", "TOP"), legend.width = 0.35, legend.height = 0.35, legend.text.size = 0.6, legend.title.size = 0.7, aes.palette = "seq")

