#!/sbin/sh
###########################
# MMT - BOURNE SETUP SCRIPT
###########################

export PATH=/sbin:/sbin/su:/su/bin:/su/xbin:/system/bin:/system/xbin

# Config Vars
# Choose if you want to skip mount for your module or not.
SKIPMOUNT=false
# Set true if you want to load system.prop
PROPFILE=false
# Set true if you want to load post-fs-data.sh
POSTFSDATA=false
# Set true if you want to load service.sh
LATESTARTSERVICE=true
# Set true if you want to clean old files in module before injecting new module
CLEANSERVICE=true
# Select true if you want to want to debug
DEBUG=true
# Select this if you want to add cloud support to your scripts
#CLOUDSUPPPORT=true
# Add cloud host path to this variable
#CLOUDHOST=

# Input options which you want to be replaced
REPLACE="
"

# Set what you want to be displayed on header on installation process
mod_info_print(){
awk '{print}' "$MODPATH"/banner
ui_print ""
}

# Default extraction path is to $MODPATH. Change the logic to whatever you want.
install_module(){
# Unzip
unzip -o "$ZIPFILE" 'script/*' -d $MODPATH >&2

# Preparing test and rest settings
ui_print "[*] Preparing..."
sleep 1.5
ui_print "[*] Extracting XCharge files..."
sleep 1.5
ui_print "[*] Installing XCharge..."
sleep 3.5
ui_print "[*] XCharge has been installed successfully."
sleep 1.5
ui_print " --- Additional Notes --- "
ui_print "[*] Reboot is required"
ui_print "[*] Do not use XCharge with other charging optimizer modules."
ui_print "[*] Report issues to @tweak_projects_discuss on Telegram"
ui_print "[*] You can find me at iamlooper @ telegram for direct support"
sleep 4
}

# Set permissions
set_permissions(){
  set_perm_recursive "$MODPATH" 0 0 0755 0644
  set_perm_recursive "$MODPATH/script" 0 0 0755 0755
}