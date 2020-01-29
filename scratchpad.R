data <- read.csv('../../San Diego Police Ripa Stops Merged.csv')

data.traffic <- subset(data, data$Reason.for.Stop.Code == '54657' & !(data$contraband_found == 1 & data$search_conducted == 0))

data.traffic <- subset(data.traffic, data.traffic$race_category == 'Black' | data.traffic$race_category =='White' | data.traffic$race_category =='Latinx',
                       select=c('beat','race_category','stop_id','search_conducted','contraband_found'))

data.traffic.grouped <- data.traffic %>%
  group_by(beat,race_category) %>% 
  summarise(num_stops = n_distinct(stop_id), num_hits = sum(contraband_found),num_searches = sum(search_conducted))




