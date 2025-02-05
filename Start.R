# Start.R

# Setting paths to home directory, root scripts, R libraries & custom functions

# Marqueur temporel du debut de l'analyse  ------------------------
ptm<-proc.time()
# Disable scientific notation  ------------------------
options(scipen=999)
# Get time and date  ------------------------
DateAndTime<-paste(as.POSIXct(strptime(Sys.time(), "%Y-%m-%d %H:%M:%S")))
Date<-paste(as.POSIXct(strptime(Sys.time(), "%Y-%m-%d")))
#### Root folder in Parametres_OEJS.R ------------------------
#### R scripts home folder  ------------------------
RScriptFld<-file.path(RootFld,"SCRIPTS")
#### R system scripts folder  ------------------------
RscriptsSystemPath<-file.path(RScriptFld,"SYSTEM")
#### R Libraries folder  ------------------------
# LibFld<-file.path(RscriptsSystemPath,"LIB")
# dir.create(LibFld)
# path2lib="N:\\GeoStat\\Rlib"
#### Set default directory for user installed packages  ------------------------
# .libPaths(c(LibFld, .libPaths()))


#################### Population data ----------------------
# Home directory of pop data ------------------------
# old PopDataPath
PopDataFld<-file.path(RootFld,"POPDATA")
# LAGAPEO folder ------------------------
# old LagapeoPath
LGOPFld<-file.path(PopDataFld,"LGPO")
# OFPOP folder ------------------------
# old CHPath
CHFld<-file.path(PopDataFld,"OFPOP")
# dir.create(CHPath)
#################### Geodata ----------------------
# old GeoDataPath
GeoDataFld<-file.path(RootFld,"GEODATA")
## RegBL (adresses)   ------------------------
RegBLPath<-file.path(GeoDataFld,"RegBL")
# dir.create(RegBLPath)
## Zones de transport scolaire  ------------------------
ZonesPath<-file.path(GeoDataFld,"ZonesTransport")
# dir.create(ZonesPath)
#################### Result folders ----------------------
#### Results paths ----------------------
# Home directory of results
ResultsFld<-file.path(RootFld,"RESULTATS")
# old ResultsPath
# dir.create(ResultsPath)

#################### Paths list ----------------------

RootFld
RScriptFld
RscriptsSystemPath
PopDataFld
LGOPFld
CHFld
GeoDataFld
RegBLPath
ZonesPath
c
# LibFld

#Load required R libraries ----------------------

# list of required R packages
packages <- c("eeptools",
              "gsubfn",
              "sf",
              "stringr")

# Load packages and install them if missing
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
ipak(packages)

# Set as working directory
setwd(ResultsFld)
getwd()

#Calcul du temps du processus
processTimeTotal<-proc.time() - ptm
if (processTimeTotal[3]>60){
  warning(paste("Exécuté en ",processTimeTotal[3]/60,"minute(s)"))
} else {
  warning(paste("Exécuté en ",processTimeTotal[3],"seconde(s)"))
}

# End