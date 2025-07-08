
# title: 3000 time at baseline and following 13 weeks of either block og traditional periodization
#
#
# purpose:
#
#
#
############################





df <- readxl::read_excel("data/3000m.xlsx") |> 
  mutate(subject = paste("FP", subject, sep="")) |> 
  dplyr::select(subject, group, timepoint, totmin)
  
  
ggplot(df, aes(timepoint, totmin, group = subject, color = subject)) + geom_point()  + geom_line()


m <- lme4::lmer(totmin ~ group * timepoint+ (1|subject), data = df)
summary(m)
