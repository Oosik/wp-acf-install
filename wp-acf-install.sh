#!/bin/bash

##
## add your pro license key to the .env file
## then setup an alias and point to this file.
## !! wpcli is required to run this script !!

##
## Set the paths
DIR_PATH=$(dirname $0)
CURRENT_PATH=$(pwd)

##
## make sure we are in the wp root dir
if [ ! -f "${CURRENT_PATH}/wp-config.php" ]
then
	echo ""
	echo -e "\e[31mCan't find wp-config, you need to run this command from root WordPress directory\e[0m"
	echo ""
	exit
fi

##
## add in env vars
source "${DIR_PATH}/.env"

##
## add key to DB
wp option add acf_pro_license "${ACF_KEY}" --autoload=yes

##
## dowload the plugin
wget -O "${CURRENT_PATH}/wp-content/plugins/acf.zip" "http://connect.advancedcustomfields.com/index.php?p=pro&a=download&k=${ACF_KEY}"

##
## install and activate.
wp plugin install "${CURRENT_PATH}/wp-content/plugins/acf.zip" --activate

##
## clean up
rm "${CURRENT_PATH}/wp-content/plugins/acf.zip"
