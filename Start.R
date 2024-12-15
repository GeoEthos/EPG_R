# Start.R

# Setting paths to home directory, root scripts, R libraries & custom functions

# Marqueur temporel du debut de l'analyse
ptm<-proc.time()

# Disable scientific notation
options(scipen=999)

# Get time and date
DateAndTime<-paste(as.POSIXct(strptime(Sys.time(), "%Y-%m-%d %H:%M:%S")))
Date<-paste(as.POSIXct(strptime(Sys.time(), "%Y-%m-%d")))

# # Path to root scripts
# 
# # R scripts home directory
RscriptsSystemPath<-file.path("D:/kdrive/EPG_APP_TSP/SCRIPTS/SYSTEM")


# Load paths (data, scripts, global result folders)
source(file.path(RscriptsSystemPath,"System_Paths.R"))
# Path to local R libraries
source(file.path(RscriptsSystemPath,"System_SetRLib.R"))
#Load required R libraries
source(file.path(RscriptsSystemPath,"System_LoadRLib.R"))
ipak(packages)
# Load custom functions
#source(file.path(RscriptsSystemPath,"System_Rfunctions.R"))

# Set as working directory
setwd(DataHomePath)
getwd()


#Calcul du temps du processus
processTimeTotal<-proc.time() - ptm
if (processTimeTotal[3]>60){
  warning(paste("GeoStat",processTimeTotal[3]/60,"minute(s)"))
} else {
  warning(paste("GeoStat demarre en",processTimeTotal[3],"seconde(s)"))
}

# End