import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
 
main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar /home/carlo/.config/xmonad/xmobarrc.hs"
  xmonad $ docks def {
  terminal = "kitty",--"alacritty -o font.size=16",
  modMask = mod4Mask,
  borderWidth = 4,
  workspaces = ["1", "2", "3", "4", "5", "6"],
  focusedBorderColor = "#7919e8",
  normalBorderColor = "#000000",
  manageHook = manageDocks <+> manageHook def,
  layoutHook = avoidStruts $ layoutHook def,
  logHook = dynamicLogWithPP $ xmobarPP
    { ppOutput = hPutStrLn xmproc,
      ppTitle = shorten 50
      }
  } `additionalKeysP` [
    ("M-r", spawn "amixer -q sset Master 2%+"),
    ("M-e", spawn "amixer -q sset Master 2%-"),
    ("M-w", spawn "amixer set Master toggle"),
    ("M-s", spawn "loginctl suspend;slock"),
    ("M-<Print>", spawn "flameshot gui")]

