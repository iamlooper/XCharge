#!/system/bin/sh
# XCharge Script
# Author: LOOPER (iamlooper @ github)

export PATH=/sbin:/sbin/su:/su/bin:/su/xbin:/system/bin:/system/xbin

lock_write(){
	# Bail out if file does not exist
	[[ ! -f "$1" ]] && return 1

	# Make file read-able and write-able in case it is not already
	chmod +rw "$1" 2>/dev/null

	# Write the new value and bail if there's an error
	if ! echo "$2" > "$1" 2>/dev/null
	then
		echo "[!] Failed: $1 → $2"
		return 1
	fi

    # Lock $1
    chmod 000 "$1"

	# Log the success
	echo "[*] $1 → $2"
}

lock_write "/sys/kernel/fast_charge/force_fast_charge" "1"
lock_write "/sys/class/power_supply/battery/system_temp_level" "1"
lock_write "/sys/kernel/fast_charge/failsafe" "1"
lock_write "/sys/class/power_supply/battery/allow_hvdcp3" "1"
lock_write "/sys/class/power_supply/usb/pd_allowed" "1"
lock_write "/sys/class/power_supply/battery/subsystem/usb/pd_allowed" "1"
lock_write "/sys/class/power_supply/battery/input_current_limited" "0"
lock_write "/sys/class/power_supply/battery/input_current_settled" "1"
lock_write "/sys/class/qcom-battery/restricted_charging" "0"
lock_write "/sys/class/power_supply/bms/temp_cool" "200"
lock_write "/sys/class/power_supply/bms/temp_hot" "480"
lock_write "/sys/class/power_supply/bms/temp_warm" "480"
lock_write "/sys/class/power_supply/usb/current_max" "3500000"
lock_write "/sys/class/power_supply/usb/hw_current_max" "3500000"
lock_write "/sys/class/power_supply/usb/pd_current_max" "3500000"
lock_write "/sys/class/power_supply/usb/ctm_current_max" "3500000"
lock_write "/sys/class/power_supply/usb/sdp_current_max" "3500000"
lock_write "/sys/class/power_supply/main/current_max" "3500000"
lock_write "/sys/class/power_supply/main/constant_charge_current_max" "3500000"
lock_write "/sys/class/power_supply/battery/current_max" "3500000"
lock_write "/sys/class/power_supply/battery/constant_charge_current_max" "3500000"
lock_write "/sys/class/qcom-battery/restricted_current" "4600000"
lock_write "/sys/class/power_supply/pc_port/current_max" "3500000"
lock_write "/sys/class/power_supply/constant_charge_current_max" "3500000"
