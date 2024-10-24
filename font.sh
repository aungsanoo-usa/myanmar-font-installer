#!/bin/bash

# Step 1: Download Noto Sans Myanmar font
echo "Downloading Noto Sans Myanmar font..."
wget https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSansMyanmar/NotoSansMyanmar-Regular.ttf -O /tmp/NotoSansMyanmar-Regular.ttf

# Step 2: Create font directory if it doesn't exist
echo "Creating font directory..."
sudo mkdir -p /usr/local/share/fonts/noto

# Step 3: Move the font to the system fonts directory
echo "Installing Noto Sans Myanmar font..."
sudo mv /tmp/NotoSansMyanmar-Regular.ttf /usr/local/share/fonts/noto/

# Step 4: Update font cache
echo "Updating font cache..."
sudo fc-cache -f -v

# Step 5: Configure the system to use Noto Sans Myanmar as the default font
echo "Configuring system to use Noto Sans Myanmar font..."
sudo tee /etc/fonts/local.conf > /dev/null <<EOL
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <match target="pattern">
        <test name="family" compare="eq">
            <string>sans-serif</string>
        </test>
        <edit name="family" mode="assign" binding="same">
            <string>Noto Sans Myanmar</string>
        </edit>
    </match>
</fontconfig>
EOL

# Step 6: Rebuild font cache after changes
echo "Rebuilding font cache..."
sudo fc-cache -f -v

# Step 7: Modify the X11 keyboard configuration to add Burmese
echo "Configuring Burmese keyboard layout..."
sudo sed -i 's/XKBLAYOUT=\".*/XKBLAYOUT=\"us,mm\"/' /etc/default/keyboard

# Step 8: Set Left Shift + Left Ctrl as the shortcut for switching between layouts
echo "Setting Left Shift + Left Ctrl as keyboard switching shortcut..."
sudo sed -i 's/XKBOPTIONS=\".*/XKBOPTIONS=\"grp:ctrl_shift_toggle\"/' /etc/default/keyboard

# Step 9: Reload the keyboard settings without interactive configuration
echo "Applying new keyboard configuration..."
sudo service keyboard-setup restart
setxkbmap -layout "us,mm" -option "grp:ctrl_shift_toggle"

echo "Noto Sans Myanmar font installed and Burmese keyboard layout configured successfully with Left Shift + Left Ctrl for switching."
