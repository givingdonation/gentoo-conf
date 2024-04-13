Config {
  font = "xft:JetbrainsMono 18",
  position = TopH 35,
  commands = [
  --Run Wireless "wlan0" ["-t", "<essid>: <quality>"] 10,
  Run Network "wlan0" ["-t", "🌐: <rx>/<tx>K"] 10,
  Run Memory ["-t" ,"🖥️: <usedratio>%"] 10,
  --Run Volume "default" "Master" [] 10,
  Run Com "/bin/bash" ["/home/carlo/.config/xmonad/get-volume.sh"]  "myvolume" 1,
  Run Com "/bin/bash" ["/home/carlo/.config/xmonad/get-ic.sh"]  "IC" 150,
  --Run Com "" [] "nike" 1,
  Run Date "%a %b %_d %T" "date" 10, -- %_d gives day without right 0
  Run StdinReader],
  sepChar = "%", 
  alignSep = "}{",
  template = "%StdinReader% }{ |%wlan0%|%memory%|🔈: %myvolume%|%date%|%IC%"
}
