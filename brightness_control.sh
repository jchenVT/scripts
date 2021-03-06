#!/bin/bash
# brightness_control.sh
  
_help()
{
    echo
    echo "Usage:"
    echo "$0 [No args]  Sets/resets brightness to default (1.0)."
    echo "$0 +          Increments brightness by 0.5."
    echo "$0 -          Decrements brightness by 0.5."
    echo "$0 Number     Sets brightness to N (useful range .7 - 1.2)."
}
  
bright=$(xrandr --verbose | grep rightness | awk '{ print $2 }')
DISP_NAME=$(xrandr | grep LV | awk '{print $1}')
INCR=0.05     
  
case $1 in
    +)bright=$(echo "scale=2; $bright + $INCR" | bc);; 
    -)bright=$(echo "scale=2; $bright - $INCR" | bc);;
    *)_help && exit ;; 
esac
  
xrandr --output eDP-1-1 --brightness "$bright"
echo "Current brightness = $bright"
exit
