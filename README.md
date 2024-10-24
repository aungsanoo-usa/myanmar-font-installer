# Noto Sans Myanmar Font & Burmese Keyboard Setup Script for Kali Linux

This script automates the process of installing the **Noto Sans Myanmar** font, configuring it as the default system-wide font, and adding the Burmese keyboard layout to Kali Linux. Additionally, it sets **Left Shift + Left Ctrl** as the shortcut for switching between English and Burmese keyboard layouts.

## Features

- Downloads and installs the **Noto Sans Myanmar** font.
- Sets **Noto Sans Myanmar** as the default system-wide font.
- Adds Burmese (`mm`) and English (`us`) keyboard layouts.
- Configures the shortcut **Left Shift + Left Ctrl** to switch between English and Burmese layouts.

## Prerequisites

- **Kali Linux** or any other Debian-based distribution.
- **root** or **sudo** access to install fonts and modify system settings.

## Installation and Usage

1. **Clone the Repository** (or simply download the script):

    ```bash
   git clone https://github.com/yourusername/repository-name.git
    ```
    ```bash
   cd repository-name
    ```

      

    ```bash
    chmod +x font.sh
    ```
    ```bash
   sudo ./font.sh
   ```
How the Script Works
Font Installation:

The script downloads the Noto Sans Myanmar font and installs it into the /usr/local/share/fonts/noto/ directory.
It then updates the font cache to make the font available system-wide.
Font Configuration:

The system font is updated to use Noto Sans Myanmar by creating a configuration file at /etc/fonts/local.conf.
Keyboard Layout Configuration:

The script modifies /etc/default/keyboard to add both us (English) and mm (Burmese) layouts.
It sets Left Shift + Left Ctrl as the shortcut to toggle between the two layouts.
Apply Changes:

The script reloads the keyboard settings using service keyboard-setup restart and applies the layout changes using setxkbmap.

***Troubleshooting:***

If the keyboard layout changes aren't applied immediately, try restarting your system or manually applying the settings with:

```bash
setxkbmap -layout "us,mm" -option "grp:ctrl_shift_toggle"
```

If you experience any font rendering issues, ensure the font cache is updated correctly:

```bash
sudo fc-cache -f -v
```
      
