sys.setenv(SPARK_HOME = "C:\spark\spark-2.3.2-bin-hadoop2.7")
.libPaths(c(file.path(Sys.getenv("SPARK_HOME"),"R","lib"),.libPaths()))
library(sparklyr)
csvPath = "C:/Users/fullerm/OneDrive - Toledo Metropolitan Area Council of Governments/Postgres/CMP/Data/passenger/passenger_here_2012to2016_10min_nonull.csv"
sparkR.session()
passengerdf <- read.df(csvPath,"csv", header = "true", inferSchema = "true", na.strings = "NA")

lottr <- dbGetQuery(sc,
                    "select distinct(tmc_code) 
                    from npmrds2012to2016passenger10min"
                    )

#percentile_disc(0.8) within group (order by travel_time_seconds) as tt_amp80pct