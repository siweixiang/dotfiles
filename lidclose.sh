#!/bin/bash
# /etc/acpi/lidclose.sh
# Add the following line in /etc/sudoers and make sure to replace user with username
#user ALL=NOPASSWD: /sbin/reboot, /sbin/poweroff, /usr/sbin/pm-suspend
DISPLAY=:0.0 su user -c "killall /usr/bin/blurlock; /usr/bin/blurlock; sudo /usr/sbin/pm-suspend;";


