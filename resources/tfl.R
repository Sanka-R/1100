if(!exists("model")) {
    library(randomForest)
    r <- read.csv("samples/artifacts/1100/resources/tfl.csv",header=TRUE)
    model <- randomForest(as.factor(traffic)~hour+longitude+latitude+day,data=r,importance=TRUE, ntree=100,mtry=3)
}

dat<-array(c(hour,longitude,latitude,day), dim=c(1,4))
colnames(dat) <- c("hour","longitude","latitude","day")
traffic<-predict(model, dat)[[1]]
