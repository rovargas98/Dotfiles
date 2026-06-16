#!/bin/bash
data=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits)
usage=$(echo $data | awk -F', ' '{print $1}')
temp=$(echo $data | awk -F', ' '{print $2}')

if [ -z "$temp" ]; then temp=50; fi

if [ "$temp" -lt 50 ]; then class="cold"
elif [ "$temp" -lt 70 ]; then class="normal"
elif [ "$temp" -lt 85 ]; then class="warm"
else class="hot"; fi

printf '{"text": "󰢮 %s%%  %s°C", "class": "%s"}\n' "$usage" "$temp" "$class"
