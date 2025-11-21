# Hypr-AI-Sidekick 🤖

A lightweight tool to create a virtual "Sidekick Display" on Arch Linux (Hyprland). This allows external devices (Tablets, AI Agents, Phones) to view and control a secondary workspace on your machine via a web browser.

## Use Case
- **AI Automation:** Give an AI agent (like Comet) its own screen to "see" and control your PC.
- **Tablet Monitor:** Turn an iPad/Android tablet into a wireless second monitor with touch support.

## Requirements
- Arch Linux
- Hyprland
- `wayvnc`
- `novnc`
- `python-websockify`

## Installation
Run this command to install the required tools:



## Usage
1. **Start the Display:**

*This will print a URL (e.g., `http://192.168.1.5:6080/vnc.html`). Open this on your tablet or AI agent.*

2. **Stop the Display:**


## Troubleshooting
- If the screen is black, ensure you have a workspace active on the virtual monitor (e.g., move a window to it).
- If the touch input doesn't work, check the "View Only" setting in the noVNC sidebar.

