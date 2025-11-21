#!/bin/bash

echo "Stopping services..."
killall wayvnc websockify

echo "Removing virtual display..."
hyprctl output remove AI-Display

echo "Cleaned up successfully."

