;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;==========================================================

[color]

white = #FFFFFF
black = #000000
gray = #5c6370

green = #689d6a
yellow = #ecbe7b
orange = #da8548
red = #cc626a
; blue = #458588
blue = #3b84c0

; bg = #2e3440
; bg = #21242B
; bg = #282828
bg = #1e1e1e
fg = #d8dee9
fg-alt = #abb2bf

; acolor  = #458588
acolor  = #3b84c0
asepcolor = #665C54
sepcolor = #458588
urgent = #cc626a
unfocused = #5c6370
occupied = #fabd2f
focused = #e5e9f0

;== Bars ========================================================

[bar/lodpi]
font-0 = "xos4Terminus:pixelsize=12;2"
font-1 = "Material Icons:size=12;4"
font-2 = "RobotoMono Nerd Font:pixelsize=12;1"

width = 100%
height = 25
offset-x = 0%
offset-y = 0%
bottom = false
fixed-center = false
line-size = 2

background = ${color.bg}
foreground = ${color.fg}

; radius = 5

; border-size = 3
border-bottom-size = 1
border-color = ${color.acolor}

cursor-click = pointer
cursor-scroll = ns-resize

module-margin-left = 2
module-margin-right = 0

[bar/hidpi]
font-0 = "xos4Terminus:pixelsize=20;2"
font-1 = "Material Icons:size=20;4"
font-2 = "RobotoMono Nerd Font:pixelsize=20;1"

width = 100%
height = 45
offset-x = 0%
offset-y = 0%
bottom = false
fixed-center = false
line-size = 2

background = ${color.bg}
foreground = ${color.fg}

; radius = 5

; border-size = 3
border-bottom-size = 1
border-color = ${color.acolor}

cursor-click = pointer
cursor-scroll = ns-resize

module-margin-left = 2
module-margin-right = 0

[bar/main]
monitor = eDP1
inherit = bar/hidpi

modules-left = powermenu i3 xwindow
modules-right = separator cpu memory fs-root fs-home separator vpncheck network separator scratchpad separator-alt backlight separator-alt pulseaudio separator-alt battery separator date

[bar/dp1-1]
monitor = DP1-1
inherit = bar/lodpi

modules-left = powermenu i3 xwindow
modules-right = cpu memory separator-alt fs-root fs-home separator vpncheck network separator scratchpad separator-alt backlight separator-alt pulseaudio separator-alt battery separator date

[bar/dp1]
monitor = DP1
inherit = bar/lodpi

modules-left = powermenu i3 xwindow
modules-right = separator cpu memory separator-alt fs-root fs-home separator vpncheck network separator scratchpad separator-alt backlight separator-alt pulseaudio separator-alt battery separator date

[bar/dp2]
monitor = DP2
inherit = bar/lodpi

modules-left = powermenu i3 xwindow
modules-right = date

[bar/edp1]
monitor = eDP1
inherit = bar/hidpi

modules-left = powermenu i3 xwindow
modules-right = date

;== Modules ========================================================

[module/spacer]
type = custom/text
content = " "
content-background = ${color.bg}
content-foreground = ${color.bg}

[module/separator]
type = custom/text
content = ""
; content = "    "
content-background = ${color.bg}
content-foreground = ${color.sepcolor}

[module/separator-alt]
type = custom/text
content = "•"
content-background = ${color.bg}
content-foreground = ${color.asepcolor}

[module/distro]
type = custom/text
content = 
; content = 
;alt-icon = 
content-padding = 2
content-background = ${color.acolor}
content-foreground = ${color.fg}
click-left = rmenu_g
click-middle = rfull
click-right = rmenu_wi_g

[module/i3]
type = internal/i3
format = <label-mode><label-state>

index-sort = true
strip-wsnumbers = true
enable-click = true
enable-scroll = false

label-mode-padding = 2

; Only show workspaces on the same output as the bar
pin-workspaces = false

label-mode-foreground = ${color.fg}
label-mode-background = ${color.gray}

; focused = Active workspace on focused monitor
label-focused-foreground = ${color.blue}
;label-focused-overline = ${color.acolor}
label-focused-padding = 1
; label-focused-underline = ${color.acolor}

; unfocused = Inactive workspace on any monitor
label-unfocused-foreground = ${color.unfocused}
label-unfocused-padding = 1
; label-unfocused-underline = ${color.occupied}

; urgent = Workspace with urgency hint set
label-urgent-foreground = ${color.urgent}
label-urgent-padding = 1
label-urgent-underline = ${color.urgent}

label-visible-padding = 1

[module/workspaces]
type = internal/xworkspaces
pin-workspaces = false
enable-click = true
enable-scroll = true
format-padding = 0

icon-0 = 1;
icon-1 = 2;
icon-2 = 3;
icon-3 = 4;
icon-4 = 5;
icon-5 = 6;
icon-6 = 7;7
icon-7 = 8;8
icon-8 = 9;9
icon-default =

format = <label-state>
label-active = %icon%
label-occupied = %icon%
label-urgent = %icon%
label-empty = %icon%

label-occupied-padding = 2
label-empty-padding = 2
label-urgent-padding = 2
label-active-padding = 2

label-active-foreground = ${color.acolor}
label-urgent-foreground = ${color.urgent}
label-empty-foreground = ${color.fg}
label-occupied-foreground = ${color.occupied}

label-active-underline = ${color.acolor}
label-urgent-underline = ${color.urgent}
label-occupied-underline = ${color.occupied}

[module/xwindow]
type = internal/xwindow
label = "• %title:0:65:...%"
label-xwindow-width = 100

[module/term]
type = custom/text
content = 
content-foreground = ${color.fg-alt}
click-left = gnome-terminal &
; click-middle = alacritty &
click-right = alacritty &

[module/files]
type = custom/text
content = 
content-padding = 1
content-foreground = ${color.fg-alt}
click-left = gnome-terminal -- ranger &
click-right = nemo &

[module/browser]
type = custom/text
content = 
content-padding = 1
content-foreground = ${color.fg-alt}
click-left = firefox &
click-right = chromium &

[module/settings]
type = custom/text
content = 
content-padding = 1
content-foreground = ${color.fg-alt}
click-left = cinnamon-settings &
click-right = lxappearance &

;==========================================================

[module/music]
type = internal/mpd
;format-online = <toggle> <label-song>
format-online =  <label-song> <toggle>

icon-play = 
icon-pause = 

label-song-maxlen = 50
label-song-ellipsis = true

;==========================================================

[module/updates]
type = custom/script
interval = 900
; format-prefix = "   "
format-prefix = "   "
format-prefix-foreground = ${color.fg}
exec = ~/scripts/updates-arch-combined.sh
click-left = pamac-manager --updates

[module/scratchpad]
type = custom/script
interval = 0
tail = true

format-prefix = " "
format-prefix-foreground = ${color.fg}
exec = python -u ~/scripts/i3-scratchpad-count.py

[module/fs-root]
type = internal/fs
interval = 60

mount-0 = /

label-mounted = " %free%"
label-unmounted = " not mounted"
label-unmounted-foreground = ${color.fg-alt}

[module/fs-home]
type = internal/fs
interval = 60

mount-0 = /home

label-mounted = " %free%"
label-unmounted = " not mounted"
label-unmounted-foreground = ${color.fg-alt}

[module/pulseaudio]
type = internal/pulseaudio
; sink = alsa_output.pci-0000_00_1f.3.analog-stereo
interval = 5

format-volume = <ramp-volume> <label-volume>
label-volume = %percentage%%
format-muted-prefix = " "
label-muted = MUTE
label-muted-foreground = ${color.urgent}

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-3 = 
ramp-volume-4 = 
ramp-volume-5 = 
ramp-volume-6 = 

[module/alsa]
type = internal/alsa
;speaker-mixer = Speaker
;headphone-mixer = Headphone
;headphone-id = 16
;mapped = true
format-volume = <ramp-volume> <label-volume>
label-volume = %percentage%%
format-muted-prefix = " "
label-muted = MUTE
label-muted-foreground = ${color.urgent}

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-3 = 
ramp-volume-4 = 
ramp-volume-5 = 
ramp-volume-6 = 

[module/backlight]
type = internal/backlight
card = intel_backlight
format = <label>
label =  %percentage%%
ramp-0 = 🌕
ramp-1 = 🌔
ramp-2 = 🌓
ramp-3 = 🌒
ramp-4 = 🌑

[module/network]
type = internal/network
interface = wlp60s0

interval = 2.0

; format-connected = <ramp-signal> <label-connected>
format-connected = <label-connected>
;format-disconnected-underline = ${color.acolor}

label-connected = "%{A:networkmanager_dmenu:}%essid%%{A}"
label-disconnected = "%{A:networkmanager_dmenu:}OFFLINE%{A}"
label-connected-foreground = ${color.fg}
label-disconnected-foreground = ${color.urgent}

ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 
ramp-signal-foreground = ${color.fg}

[module/kube-context]
type = custom/script
exec = sh ~/scripts/kube-context.sh
format-foreground = ${color.fg}
interval = 5
click-left = ~/scripts/rofi-kube-context.sh

[module/kube-ns]
type = custom/script
exec = sh ~/scripts/kube-namespace.sh
format-foreground = ${color.fg}
interval = 5
click-left = ~/scripts/rofi-kube-namespace.sh

[module/vpncheck]
type = custom/script
exec = sh ~/scripts/vpncheck.sh
format-foreground = ${color.fg}
interval = 5
click-left = networkmanager_dmenu

[module/network-alt]
type = custom/script
exec = check-network
click-left = networkmanager_dmenu &
click-right = networkmanager_dmenu &
tail = true

[module/date]
type = internal/date
interval = 30
label =  %time%
time = " %H:%M  "
time-alt = " %a %d.%m.%Y  "
; format-background = ${color.acolor}
; format-foreground = ${color.fg}

[module/cpu]
type = internal/cpu
interval = 5

label = CPU %percentage%%
format = %{A1:termite -e htop:}<label> <bar-load>%{A}
bar-load-indicator =
bar-load-width = 10
bar-load-foreground-0 = ${color.green}
bar-load-foreground-1 = ${color.green}
bar-load-foreground-2 = ${color.yellow}
bar-load-foreground-3 = ${color.red}
bar-load-fill = ●
bar-load-empty = ●
bar-load-empty-foreground = #444444
label-foreground = ${color.fg}

[module/memory]
type = internal/memory
interval = 5

label = MEM %percentage_used%%
format = %{A1:termite -e htop:}<label> <bar-used>%{A}
bar-used-indicator =
bar-used-width = 10
bar-used-foreground-0 = ${color.green}
bar-used-foreground-1 = ${color.green}
bar-used-foreground-2 = ${color.yellow}
bar-used-foreground-3 = ${color.red}
bar-used-fill = ●
bar-used-empty = ●
bar-used-empty-foreground = #444444
label-foreground = ${color.fg}

[module/battery]
type = internal/battery

battery = BAT0
adapter = ADP1

format-discharging = <ramp-capacity> <label-discharging>
format-charging = <animation-charging> <label-charging>

; Only applies if <ramp-capacity> is used
; ramp-capacity-0 = 
; ramp-capacity-1 = 
; ramp-capacity-2 = 
; ramp-capacity-3 = 
; ramp-capacity-4 = 
ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

ramp-capacity-0-foreground = ${color.red}
ramp-capacity-1-foreground = ${color.red}
ramp-capacity-2-foreground = ${color.orange}
ramp-capacity-3-foreground = ${color.orange}
ramp-capacity-4-foreground = ${color.green}
animation-charging-0-foreground = ${color.red}
animation-charging-1-foreground = ${color.red}
animation-charging-2-foreground = ${color.orange}
animation-charging-3-foreground = ${color.orange}
animation-charging-4-foreground = ${color.green}
label-discharging-foreground = ${color.fg}

; Only applies if <bar-capacity> is used
bar-capacity-width = 10

; Only applies if <animation-charging> is used
; animation-charging-0 = 
; animation-charging-1 = 
; animation-charging-2 = 
; animation-charging-3 = 
; animation-charging-4 = 
animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 

; Framerate in milliseconds
animation-charging-framerate = 750


[module/powermenu]
type = custom/menu

format-spacing = 1

label-open = 
label-open-padding = 2
label-open-background = ${color.acolor}
label-open-foreground = ${color.fg}
label-close = "   cancel  "
label-close-background = ${color.urgent}
label-close-foreground = ${color.fg}
label-separator = " "
label-separator-foreground = ${color.fg-alt}

menu-0-0 = logout
menu-0-0-exec = i3-msg exit
menu-0-1 = reboot
menu-0-1-exec = systemctl reboot
menu-0-2 = "power off   "
menu-0-2-exec = systemctl poweroff

menu-1-0 = cancel
menu-1-0-exec = menu-open-0
menu-1-1 = "logout   "
menu-1-1-exec = i3-msg exit

menu-2-0 = cancel
menu-2-0-exec = menu-open-0
menu-2-1 = "reboot   "
menu-2-1-exec = systemctl reboot

menu-3-0 = cancel
menu-3-0-exec = menu-open-0
menu-3-1 = "power off   "
menu-3-1-exec = systemctl poweroff

; vim:ft=dosini
