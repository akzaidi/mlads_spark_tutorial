amlToken=$1

###########################################################################
## Download scripts and code files into directories
###########################################################################
cd /home/remoteuser
if [[ -f github_installs.R ]]; then sudo rm -Rf github_installs*; fi;
# if [[ -f downloadRun.sh ]]; then sudo rm -Rf downloadRun*; fi;
if [[ -d Code ]]; then sudo rm -Rf Code; fi;
mkdir Code
mkdir Code/sparklyr

# wget http://cdspsparksamples.blob.core.windows.net/hdiscripts/MLADS_Fall2016/downloadRun.sh
wget https://raw.githubusercontent.com/akzaidi/mlads_spark_tutorial/master/github_installs.R
# chmod +x downloadRun.sh

cd  /home/remoteuser/Code/sparklyr
# We need to copy code files for sparklyr exercise from Ali's GitHub repo in this folder
wget https://raw.githubusercontent.com/akzaidi/spark_nyc_taxi/master/raw_urls.txt
mkdir data/
cat raw_urls.txt | xargs -n 1 -P 6 wget -c -P data/
hadoop fs -mkdir /user/RevoShare/remoteuser/nyctaxi
hadoop fs -copyFromLocal data/ /user/RevoShare/remoteuser/nyctaxi/

rm -r data/
 
wget https://raw.githubusercontent.com/akzaidi/mlads_spark_tutorial/master/1-taxi-eda.Rmd
wget https://raw.githubusercontent.com/akzaidi/mlads_spark_tutorial/master/2-spark-ml.Rmd


mkdir /home/remoteuser/Code/MRS
cd /home/remoteuser/Code/MRS
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/1-Clean-Join-Subset.r
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/2-Train-Test-Subset.r
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/3-Deploy-Score-Subset.r
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/Installation.r
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/SetComputeContext.r
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/azureml-settings.json
wget https://raw.githubusercontent.com/Azure/Azure-MachineLearning-DataScience/master/Misc/KDDCup2016/Code/MRS/dTreeModelSubset.RData

mkdir data/
cd data/

mkdir AirlineSubsetCsv
cd AirlineSubsetCsv
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00000
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00001
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00002
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00003
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00004
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00005
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00006
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00007
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00008
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00009
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00010
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00011
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00012
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00013
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00014
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/AirlineSubsetCsv/part-00015
cd ..
mkdir WeatherSubsetCsv
cd WeatherSubsetCsv
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00000
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00001
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00002
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00003
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00004
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00005
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00006
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00007
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00008
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00009
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00010
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00011
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00012
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00013
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00014
wget http://cdspsparksamples.blob.core.windows.net/data/Airline/WeatherSubsetCsv/part-00015

cd /home/remoteuser/Code/MRS/

hadoop fs -mkdir /HdiSamples/HdiSamples/FlightDelay
hadoop fs -copyFromLocal data/* /HdiSamples/HdiSamples/FlightDelay/

rm -r data/

cd /home/remoteuser

###########################################################################
## Store the AML token in azureml-settings.json
###########################################################################

sudo sed -i.bak "s/replaceWithToken/$amlToken/" /home/remoteuser/Code/MRS/azureml-settings.json

###########################################################################
## Reduce spark logging, because it slows down RStudio
###########################################################################

sudo sed -i.bak 's/INFO/WARN/' /etc/spark/conf/log4j.properties

###########################################################################
## Install packages, remove older version of packages prior to installation
###########################################################################
cd /home/remoteuser

# The tibble package now requires /bin/gtar
sudo ln -s /bin/tar /bin/gtar

sudo apt-get -y -qq install libcurl4-openssl-dev
sudo apt-get -y -qq install libcurl4-gnutls-dev
sudo apt-get -y -qq install libssl-dev
sudo apt-get -y -qq install libxml2-dev

cd /usr/lib64/microsoft-r/8.0/lib64/R/library
if [[ -d sparklyr ]]; then sudo rm -Rf sparklyr; fi;
if [[ -d sparkapi ]]; then sudo rm -Rf sparkapi; fi;
if [[ -d rprojroot ]]; then sudo rm -Rf rprojroot; fi;
if [[ -d dplyr ]]; then sudo rm -Rf dplyr; fi;
if [[ -d Rcpp ]]; then sudo rm -Rf Rcpp; fi;
if [[ -d DBI ]]; then sudo rm -Rf DBI; fi;
if [[ -d config ]]; then sudo rm -Rf config; fi;
if [[ -d tibble ]]; then sudo rm -Rf tibble; fi;
if [[ -d devtools ]]; then sudo rm -Rf devtools; fi;
if [[ -d rmarkdown ]]; then sudo rm -Rf rmarkdown; fi;
if [[ -d knitr ]]; then sudo rm -Rf knitr; fi;
if [[ -d AzureML ]]; then sudo rm -Rf AzureML; fi;
if [[ -d RCurl ]]; then sudo rm -Rf RCurl; fi;
if [[ -d rjson ]]; then sudo rm -Rf rjson; fi;
if [[ -d hts ]]; then sudo rm -Rf hts; fi;
if [[ -d fpp ]]; then sudo rm -Rf fpp; fi;
if [[ -d randomForest ]]; then sudo rm -Rf randomForest; fi;
if [[ -d readr ]]; then sudo rm -Rf readr; fi;

cd /home/remoteuser/R/x86_64-pc-linux-gnu-library/3.2
if [[ -d rmarkdown ]]; then sudo rm -Rf rmarkdown; fi;

###########################################################################
## Call R file to install packages
###########################################################################
cd /home/remoteuser
sudo R --vanilla --quiet  <  /home/remoteuser/github_installs.R

###########################################################################
## Install Rstudio
###########################################################################
sudo cd /home/remoteuser
sudo wget https://raw.githubusercontent.com/akzaidi/mlads_spark_tutorial/master/InstallRStudio.sh
sudo chmod 755 InstallRStudio.sh
sudo ./InstallRStudio.sh

###########################################################################
## Change permission of Code directory
###########################################################################
sudo chmod -R 777 /home/remoteuser/Code

###########################################################################
## Set final working directory
###########################################################################
cd /home/remoteuser/Code

wget https://raw.githubusercontent.com/akzaidi/mlads_spark_tutorial/master/verification.sh