import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run(spawnPipe)

main = xmonad =<< xmobar defaults

myModMask = mod1Mask

defaults = defaultConfig {
	modMask = myModMask
	, terminal = "gnome-terminal"
} `additionalKeys`
	[
		((myModMask, xK_p), spawn "dmenu_run -fn 'Terminus' | dmenu -b")
	]

