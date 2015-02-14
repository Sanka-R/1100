if(!exists("model")) {
    library(randomForest)
    library(caret)
    library(pmml)
    r <- read.csv("samples/artifacts/1100/resources/tfl.csv",header=TRUE)
    model <- randomForest(as.factor(traffic)~hour+longitude+latitude,data=r,importance=TRUE, ntree=100,mtry=3)
}

dat<-array(c(hour,longitude,latitude), dim=c(1,3))
colnames(dat) <- c("hour","longitude","latitude")
traffic<-predict(model, dat)
