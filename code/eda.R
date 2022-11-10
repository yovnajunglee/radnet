library("xts")
library("ggplot2")
library("tidyverse")
rm(list=ls())


setwd("./Data/")

# Analysis of radioactivity data in Carlsbad, New Mexico

radnet <-
  list.files( pattern = "*.csv") %>% 
  map_df(~read_csv(.), col_types = cols(.default = "c"))


colnames(radnet) <- gsub(" ", "_", colnames(radnet))
colnames(radnet) <- gsub("[()]", ".", colnames(radnet))
colnames(radnet) <- gsub("/", ".", colnames(radnet))

colnames(radnet)

# Data collected approximately every hour

radnet$SAMPLE_COLLECTION_TIME <- (as.POSIXct(strptime(radnet$SAMPLE_COLLECTION_TIME, "%m/%d/%Y %H:%M:%S"), 
                                               tryFormats = "%m/%d/%Y %H:%M:%S", tz = "UTC"))


# === Dose equivalent rate (~ exposure rate)

# Amount of radiation energy absorbed by the body, which is calculated to account
# for the different types of radiation (such as alpha and beta) and
# how sensitive different organs are to radiation (for example, bone compared to lungs).

# https://www.epa.gov/radnet/about-exposure-and-dose-rates


ggplot(data = radnet , aes(x= SAMPLE_COLLECTION_TIME, y = DOSE_EQUIVALENT_RATE_.nSv.h. )) +
  geom_path(col = 'darkblue', alpha=.5)



# === Gamma count rate

# RadNet stationary air monitors measure gamma radiation 
# emitted from airborne radioactive particles as they
# collect on the monitor's filter. EPA uses
# RadNet monitors to track fluctuations in gamma radiation emitted 
# from airborne radioactive particles at each of our sites. 

# https://www.epa.gov/radnet/what-do-different-gamma-channel-ranges-illustrate-what-does-each-range-represent

ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R02_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R03_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R04_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R05_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R06_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R07_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R08_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)
ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = GAMMA_COUNT_RATE_R09_.CPM.)) +
  geom_path(col = 'darkblue', alpha=.5)



ggplot(data = radnet , aes(x=SAMPLE_COLLECTION_TIME, y = rowSums(radnet[,4:11]))) +
  geom_path(col = 'darkblue', alpha=.5)
