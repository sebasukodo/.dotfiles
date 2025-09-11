#!/bin/sh

# Script for reloading waybar (e.g. after changes)
# If my hyperland .dotfiles are being used, press SUPER + Shift + B to execute this script
#killall -SIGUSR2 waybar
killall waybar
waybar
