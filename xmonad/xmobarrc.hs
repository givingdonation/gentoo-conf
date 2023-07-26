Config {
  font = "xft:JetbrainsMono 16",
  position = TopH 23,
  commands = [
  --Run Wireless "wlan0" ["-t", "<essid>: <quality>"] 10,
  Run Network "wlan0" ["-t", "W0: <rx>/<tx>K"] 10,
  Run Memory ["-t" ,"RAM: <usedratio>%"] 10,
  --Run Volume "default" "Master" [] 10,
  Run Com "/bin/bash" ["/home/carlo/.config/xmonad/get-volume.sh"]  "myvolume" 1,
  --Run Com "" [] "nike" 1,
  Run Date "%a %b %_d %T" "date" 10, -- %_d gives day without right 0
  Run StdinReader],
  sepChar = "%", 
  alignSep = "}{",
  template = "%StdinReader% }{ |%wlan0%|%memory%|Vol: %myvolume%|%date%"
}
