#!/system/bin/sh
# XCharge™
# Author: LOOPER (iamlooper @ github)

wait_until_boot_complete() {
  while [[ "$(getprop sys.boot_completed)" != "1" ]]; do
    sleep 3
  done
}

wait_until_boot_complete

# Sleep some time to make sure init is completed
sleep 30

# Execute XCharge™
xcharge --execute