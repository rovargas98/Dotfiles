# SDDM Theme Configuration for SilentSDDM Avatars

This document outlines the steps taken to configure user avatars for the SilentSDDM theme.

## Problem
The user reported that custom user icons were not appearing after installing the SilentSDDM theme. The user provided avatar image paths:
- `~/Downloads/icons/devops/devops.jpg`
- `~/Downloads/icons/gamer/gamer.jpg`

## Research and Analysis

1.  **SilentSDDM Avatar Configuration:**
    -   Consulted the SilentSDDM GitHub `README.md` (`https://github.com/uiriansan/SilentSDDM#Customizing`).
    -   Identified that user avatars are configured via the `avatar_path` option in the `[General]` section of the theme's `theme.conf` file.
    -   The `avatar_path` should point to a directory containing avatar images, with each image named after the respective username (e.g., `username.png`).

2.  **Locating Theme Files:**
    -   Initially attempted to find `theme.conf` at `/usr/share/sddm/themes/SilentSDDM/theme.conf`, which failed.
    -   Discovered the actual theme directory was `silent-sddm` (lowercase and hyphenated) by listing `/usr/share/sddm/themes/`.
    -   Found the primary configuration file was `/usr/share/sddm/themes/silent-sddm/configs/default.conf` after inspecting the `silent-sddm` directory contents.

## Actions Taken

1.  **Created Avatar Directory:**
    -   A new directory `/usr/share/sddm/avatars` was created to store custom user avatars.
    -   Command: `sudo mkdir -p /usr/share/sddm/avatars`

2.  **Copied Avatar Images:**
    -   The user's provided avatar images were copied to the newly created directory.
    -   Command: `sudo cp /home/devops/Downloads/icons/devops/devops.jpg /usr/share/sddm/avatars/devops.jpg`
    -   Command: `sudo cp /home/devops/Downloads/icons/gamer/gamer.jpg /usr/share/sddm/avatars/gamer.jpg`

3.  **Modified Theme Configuration:**
    -   The `default.conf` file was updated to include the `avatar_path` setting in the `[General]` section.
    -   The `avatar_path` was set to `/usr/share/sddm/avatars`.
    -   Command: `sudo sed -i '/animated-background-placeholder = ""/a avatar_path=\/usr\/share\/sddm\/avatars' /usr/share/sddm/themes/silent-sddm/configs/default.conf`

## Next Steps for the User

After these changes, your custom avatars should now be displayed by the SilentSDDM theme. You might need to restart SDDM or your system for the changes to take effect.
