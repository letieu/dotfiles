function sync_gnome_theme
    if not command -v gsettings >/dev/null
        return
    end

    set scheme (gsettings get org.gnome.desktop.interface color-scheme)

    switch $scheme
        case "'prefer-dark'"
            fish_config theme choose "Rosé Pine"
        case "'prefer-light'"
            fish_config theme choose "Rosé Pine Dawn"
    end
end
