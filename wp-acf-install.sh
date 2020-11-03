#!/bin/bash

##
## add your pro license key to the .env file
## then setup an alias and point to this file.
## !! wpcli is required to run this script !!
source '.env'
wp option add acf_pro_license ${ACF_KEY} --autoload=yes
wget -O wp-content/plugins/acf.zip "http://connect.advancedcustomfields.com/index.php?p=pro&a=download&k=${ACF_KEY}"
wp plugin install wp-content/plugins/acf.zip --activate
rm wp-content/plugins/acf.zip
