#!/bin/bash
kquitapp5 kglobalaccel && sleep 2s && kglobalaccel5 &
killall -9 latte-dock
latte-dock --replace
