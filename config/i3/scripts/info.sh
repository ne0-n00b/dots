#!/bin/bash

clear

# or use wm array -- add any that need to be recognized
wms=( 2bwm 2wm 9wm aewm afterstep ahwm alopex amiwm antiwm awesome blackbox bspwm catwm clfswm ctwm cwm dminiwm dragonflywm dwm echinus \
  euclid-wm evilpoison evilwm fluxbox flwm fvwm-crystal goomwwm hcwm herbstluftwm i3 icewm jwm karmen larswm lwm matwm2 mcwm monsterwm \
  musca notion nwm olwm openbox oroborus pekwm ratpoison sapphire sawfish sscrotwm sithwm smallwm snapwm spectrwm stumpwm subtle termite tfwm tinywm tritium twm \
  uwm vtwm w9wm weewm wind windowlab wm2 wmaker wmfs wmii wmx xfwm4 xmonad xoat yeahwm )

# define colors for color-echo
red="\e[31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
blu="\e[34m"
prp="\e[35m"
bprp="\e[35;1m"
rst="\e[0m"

color-echo()
{  # print with colors
  echo -e " $red$1: $rst$2"


print-kernel()
{
  color-echo 'KL' "$(uname -smr)"
}

print-uptime()
{
  up=$(</proc/uptime)
  up=${up//.*}                # string before first . is seconds
  days=$((${up}/86400))       # seconds divided by 86400 is days
  hours=$((${up}/3600%24))    # seconds divided by 3600 mod 24 is hours
  mins=$((${up}/60%60))       # seconds divided by 60 mod 60 is mins
  color-echo "UP" $days'd '$hours'h '$mins'm'
}

print-shell() {
  color-echo 'SH' '/usr/bin/fish'
}

print-cpu()
{
  arm=$(grep ARM /proc/cpuinfo)    # ARM procinfo uses different format
  if [[ "$arm" != "" ]]; then
    cpu=$(grep -m1 -i 'Processor' /proc/cpuinfo)
  else
  ?    break
    fi
}

print-distro()
{
  [[ -e /etc/os-release ]] && source /etc/os-release
  if [[ -n "$PRETTY_NAME" ]]; then
    color-echo 'OS' "$PRETTY_NAME"
  else
    color-echo 'OS' "not found"
  fi
{

echo
echo -en "  █▀▀▀▀▀▀▀▀█   |  " && print-distro
echo -en "  █        █   |  " && print-wm
echo -en "  █  █  █  █   |  " && print-uptime
echo -en "  █        █   |  " && print-shell
echo -en "  ▀█▄▄▄▄▄▄█▀   |  " && print-cpu
echo
echo
]}