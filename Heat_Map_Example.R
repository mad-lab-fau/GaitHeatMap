# This example code generate heatmap according to the given input numbers.
# The input numbers were taken from the result table.
#
# This example code is related to the publication Timotius et.al, 
# "Systematic data analysis and data mining in CatWalk gait analysis by heat
# mapping exemplified in rodent models for neurodegenerative diseases", 2019.
#
# Ivanna K. Timotius (2019)

#install.packages("gplots")
#installed.packages()
library(gplots)
library(readxl)

#Reading data
x <- read_excel("Result_Example.xlsx", sheet = 1)

y1 <- x[c(1:40),c(3:7)]
y <- data.matrix(y1)

#For heat map details:
no <-rep("",40)
no[1] <- "1"
no[10] <- "10"
no[20] <- "20"
no[30] <- "30"
no[40] <- "40"

#Heat Map based on signed f-values, with a threshold of 4.5
yb <- colorRampPalette(c("blue","white","red")) #(n=200)
col_breaks = c(seq(-25,-4.5,length=100),         # for blue
               seq(-4.49,4.49,length=3),     # for white
               seq(4.5,25,length=100))       # for red

#Make the figure
png(file="heatmap_example.png",width=2000,height=2000,units="px",pointsize = 40)
heatmap.2(y,
          col=yb,
          breaks=col_breaks,
          Rowv = FALSE, Colv = FALSE,
          main = "Heat Map",
          trace = "none",
          dendrogram = "none",
          density.info = "none",
          key.xlab = "signed f-value",
          cexCol = 1.2,cexRow=1.2,
          labRow=no,
          margin=c(5,15))
dev.off()