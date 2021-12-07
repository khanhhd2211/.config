#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
polybar --reload top 2>&1 | tee -a /tmp/polybar1.log & disown &
if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar --reload top_external 2>&1 | tee -a /tmp/polybar2.log & disown &
fi
echo "Bar launched..."
