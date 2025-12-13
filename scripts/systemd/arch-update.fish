#!/usr/bin/env fish

function confirm --description 'Ask for yes/no confirmation'
    read -l -P "$argv[1] [y/N]: " response
    switch (string lower $response)
        case y
            return 0
        case '*'
            echo "Skipped."
            return 1
    end
end

echo ""
echo "🌈  Arch Linux Maintenance Script"
echo ----------------------------------

# Step 1: Sync and update system packages
if confirm "➡️  Update system packages with pacman?"
    sudo pacman -Syu --noconfirm
else
    echo "Skipped system update."
end

# Step 2: Update AUR packages (if yay or paru exists)
if type -q yay
    if confirm "➡️  Update AUR packages with yay?"
        yay -Syu
    else
        echo "Skipped AUR update."
    end
else if type -q paru
    if confirm "➡️  Update AUR packages with paru?"
        paru -Syu
    else
        echo "Skipped AUR update."
    end
else
    echo "⚠️  No AUR helper (yay/paru) found. Skipping AUR updates."
end

# Step 3: Clean package cache
if confirm "🧹  Clean package cache (keep 3 latest versions)?"
    sudo paccache -r
else
    echo "Skipped cache cleaning."
end

# Step 4: Remove orphaned packages
if confirm "🧩  Remove orphaned packages?"
    set orphans (pacman -Qdtq)
    if test (count $orphans) -gt 0
        sudo pacman -Rns $orphans
    else
        echo "No orphaned packages found."
    end
else
    echo "Skipped orphan removal."
end

echo ""
echo "✅  All done! System maintenance complete."
echo ------------------------------------------
