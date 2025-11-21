#!/bin/bash

# 1. Create the virtual monitor
echo "Creating Virtual AI Display..."
hyprctl output create headless "AI-Display"

# 2. Fix the resolution (1920x1080) and scale (1.0) so it's not zoomed in
sleep 1
hyprctl keyword monitor "AI-Display,1920x1080@60,auto,1"

# 3. Start WayVNC on the virtual monitor
echo "Starting WayVNC..."
wayvnc 0.0.0.0 5900 --output=AI-Display --keyboard=us &
WAYVNC_PID=$!

# 4. Find the correct noVNC path (Auto-detect logic)
if [ -d "/usr/share/webapps/novnc" ]; then
    WEB_PATH="/usr/share/webapps/novnc"
elif [ -d "/usr/share/novnc" ]; then
    WEB_PATH="/usr/share/novnc"
else
    echo "Error: Could not find noVNC web files."
    exit 1
fi

# 5. Start the Web Bridge
echo "Starting Web Bridge..."
websockify --web=$WEB_PATH 6080 localhost:5900 &
WEBSOCK_PID=$!

# 6. Print the Connection URL
IP=$(ip -br a | grep UP | grep -v lo | awk '{print $3}' | cut -d/ -f1 | head -n 1)
echo "---------------------------------------------------"
echo "✅ System Ready!"
echo "📱 Open this URL on your Tablet/AI Agent:"
echo "   http://$IP:6080/vnc.html"
echo "---------------------------------------------------"

# Keep script running to hold PIDs
wait $WAYVNC_PID $WEBSOCK_PID
