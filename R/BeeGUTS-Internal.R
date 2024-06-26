# Workaround to get rid of "No visible binding for global variable" notes
# in package check. This notes are caused by uses of dplyr and tidyr.
if(getRversion() >= "2.15.1")  utils::globalVariables(c(
  "conc", "Treatment", "SurvivalTime", "idAll", "NSurv", "simQ50", "simQinf95",
  "simQsup95", "time", "q50", "qinf95", "qsup95", "Nsurv_q50_valid",
  "Nsurv_qinf95_valid", "Nsurv_qsup95_valid", "Conc", "Dataset", "Nsurv",
  "qnorm", "qunif", "na.omit", "value", "q_0.025", "q_0.975", "median", "data",
  "ppcMatching_valid", "SE_id", "id", "hb_value", "approx", "f_rate", "targConc",
  "LDD50_10", "LDD50_27","LDD50_2","ldd50","ldd50_q2p5", "ldd50_q97p5","lddhab"))
