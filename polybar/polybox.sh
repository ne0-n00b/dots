#!/bin/bash

pkill polybar
polybar --config=/home/ne0/.config/polybar/polybox top &
polybar --config=/home/ne0/.config/polybar/polybox bottom &

exit 0
