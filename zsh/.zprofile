if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec start-hyprland # Voir pour remplacer par Hyprland
fi
