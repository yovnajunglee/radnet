library("xts")
library("ggplot2")


# Analysis of radioactivity data in Carlsbad, New Mexico


radnet2022 <- read.csv("Data/NM_CARLSBAD_2022.csv")

# Data collected approximately every hour

radnet2022$SAMPLE.COLLECTION.TIME

# Histograms of Gamma particles

hist(radnet2022$DOSE.EQUIVALENT.RATE..nSv.h.)
hist(radnet2022$GAMMA.COUNT.RATE.R02..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R03..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R04..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R05..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R06..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R07..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R08..CPM.)
hist(radnet2022$GAMMA.COUNT.RATE.R09..CPM.)

head(radnet2022$SAMPLE.COLLECTION.TIME)

radnet2022$SAMPLE.COLLECTION.TIME <- (as.POSIXct(strptime(radnet2022$SAMPLE.COLLECTION.TIME, "%m/%d/%Y %H:%M:%S"), 
           tryFormats = "%m/%d/%Y %H:%M:%S", tz = "UTC"))


ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R02..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R03..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R04..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R05..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R06..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R07..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R08..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = GAMMA.COUNT.RATE.R09..CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet2022 , aes(x=SAMPLE.COLLECTION.TIME, y = DOSE.EQUIVALENT.RATE..nSv.h.)) +
  geom_path(col = 'darkblue', alpha=.5)
