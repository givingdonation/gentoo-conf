import XMonad
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Layout.Spacing
import XMonad.Hooks.WindowSwallowing
import XMonad.Layout.Renamed

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar /home/carlo/.config/xmonad/xmobarrc.hs"
  xmonad $ docks def {
  terminal = "kitty",--"alacritty -o font.size=16",
  modMask = mod4Mask,
  borderWidth = 4,
  workspaces = ["𝋠","𝋡","𝋢","𝋥","𝋦","𝋧"],
  focusedBorderColor = "#550000",--"#0055FF", --"#7919e8",
  normalBorderColor = "#000000",
  manageHook = manageDocks <+> manageHook def,
  handleEventHook = swallowEventHook (className =? "kitty") (return True),
  layoutHook = renamed [CutWordsLeft 1] $ avoidStruts $ smartSpacingWithEdge 15 $ layoutHook def,
  logHook = dynamicLogWithPP $ xmobarPP
    { ppSep = xmobarColor "#7919e8" "" " | ",
      ppTitleSanitize = xmobarStrip,
      ppOutput = hPutStrLn xmproc,
      ppTitle = shorten 50
      --, ppOrder           = \[ws, l, wins] -> [ws, wins]
      }
  } `additionalKeysP` [
    ("M-v", spawn "amixer -q sset Master 2%+"),
    ("M-c", spawn "amixer -q sset Master 2%-"),
    ("M-x", spawn "amixer set Master toggle"),
    ("M-s", spawn "loginctl suspend;slock"),
    ("<Print>", spawn "flameshot gui")]
