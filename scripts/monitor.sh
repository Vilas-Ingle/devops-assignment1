
#!/bin/bash

LOGFILE="/var/log/system_monitor/system_report.log"

echo "==============================" >>$LOGFILE
echo "System Monitoring Report - $(date)" >> $LOGFILE

echo "CPU and Process Usage:" >> $LOGFILE
top -b -n1 | head -10 >> $LOGFILE



echo "Directory Usage (/var):" >>$LOGFILE
du -sh /var/* >>$LOGFILE

echo "Top CPU Processes:" >>$LOGFILE
ps aux --sort=-%cpu | head -5 >>$LOGFILE

echo "=================================" >>$LOGFILE
