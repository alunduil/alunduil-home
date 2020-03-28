module Main
  ( main
  )
where

import           XMonad
import           XMonad.Util.EZConfig           ( additionalKeys )

main =
  xmonad
    $                def { terminal = "alacritty" }
    `additionalKeys` [ ((0, 0x1008ff12), spawn "amixer set Master toggle")
                     , ((0, 0x1008ff11), spawn "amixer -q sset Master 2%-")
                     , ((0, 0x1008ff13), spawn "amixer -q sset Master 2%+")
                     ]
