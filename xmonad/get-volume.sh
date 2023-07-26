amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off") { print $5 } else { print $2 }}'|head -n 1
