library(httr)

data <- fread("https://raw.githubusercontent.com/Darachnid/EXAMPLE/master/data.csv")

#index for spliting rows with themes or ranks
themeNA <- which(is.na(data$theme) == TRUE)

#define the split variable
ranks <- data[themeNA,]
themes <- data[-themeNA,]

#melt the 4 columns for rankings into 2
ranks <- melt(ranks, 
             id.vars = c("group", 
                         "participant", 
                         "time", 
                         "scenario", 
                         "subtheme", 
                         "theme"),
             measure.vars = c("swimming",
                              "flooding",
                              "river health",
                              "water quality"))


#plot the ranks
plot <- ggplot(ranks, aes(x = time, 
                         y = value, 
                         color = participant, 
                         group = participant)) +
  geom_step() + 
  facet_wrap(~variable, nrow = 4) +
  theme_minimal()
plot
 