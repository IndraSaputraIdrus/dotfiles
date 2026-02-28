#!/bin/dash
cpu() {
    read a _ < /proc/loadavg
    printf "Cpu %s" "$a"
}

brightness() {
    b=/sys/class/backlight/intel_backlight
    read cur < "$b/brightness"
    read max < "$b/max_brightness"

    percent=$(( cur * 100 / max ))
    printf "  %s%%" "$percent"
}

mem() {
    while read -r key val unit; do
      case $key in
        MemTotal:) total=$val ;;
        MemAvailable:) avail=$val ;;
      esac
    done < /proc/meminfo

    used=$(( (total - avail) / 1024 ))
    printf "Mem: %sM" "$used"
}

wlan() {
  for i in /sys/class/net/wl*; do
    [ -e "$i" ] || continue
    read state < "$i/operstate"

    case $state in
      up)
        printf "Wifi: Connected"
        ;;
      down)
        printf "Wifi: Disconnected"
        ;;
    esac
    return
  done
}

battery() {
  for bat in /sys/class/power_supply/BAT*; do
    [ -e "$bat/capacity" ] || continue
    read val < "$bat/capacity"

    if [ $val -le 20 ]; then
      printf "Bat: %s%% WARNING" $val
    else
      printf "Bat: %s%%" $val
    fi

    return
  done
}

clock() {
  printf "Now: $(date '+%H:%M')"
}

while true; do
  sleep 1 && xsetroot -name "$(cpu) | $(battery) | $(brightness) | $(mem) | $(wlan) | $(clock)"
done
