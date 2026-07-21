-- Application opacity.
hl.window_rule({
    name = "opacity-90",
    match = { class = [[^(brave-chatgpt\.com__-Default|papra|t3code)$]] },
    opacity = 0.9,
})

hl.window_rule({
    name = "opacity-80",
    match = { class = "^(dev.noctalia.Noctalia.Settings|signal|org.kde.kdeconnect.sms|org.kde.kdeconnect.app|spotify|obsidian)$" },
    opacity = 0.8,
})

hl.window_rule({
    name = "opacity-70-extra",
    match = { class = "^(phreak|spot)$" },
    opacity = 0.7,
})

-- Ratty has an empty WM_CLASS, so match its title.
hl.window_rule({
    name = "opacity-ratty",
    match = { title = "^Ratty$" },
    opacity = 0.8,
})

hl.window_rule({
    name = "opacity-graphite",
    match = { class = "^Graphite-desktop$" },
    opacity = 0.8,
})

-- Floating windows use stronger rounding.
hl.window_rule({
    name = "floating-rounding",
    match = { float = true },
    rounding = 20, -- Current Hyprland maximum; the old config used 25.
})

hl.window_rule({
    name = "force-tiling",
    match = { class = "^Nsxiv$" },
    tile = true,
})

hl.window_rule({
    name = "floating-prompt",
    match = { title = "^(Sign in to Security Device|Autentisering via certifikat|.*Bitwarden Password Manager.*)$" },
    float = true,
    opacity = 0.6,
    border_size = 4,
    stay_focused = true,
    center = true,
})

hl.window_rule({
    name = "smart-card-pin",
    match = { title = "^Unlock Security Device$" },
    float = true,
    center = true,
    stay_focused = true,
})

-- Application workspace assignments.
hl.window_rule({
    name = "zen-browser",
    match = { class = "^zen" },
    workspace = 10,
})

hl.window_rule({
    name = "vdi",
    match = { class = "^Wfica$" },
    workspace = 3,
})

-- GNOME file picker portal. Pickers use an action verb in their title.
hl.window_rule({
    name = "gnome-file-picker",
    match = {
        class = "^org.gnome.Nautilus$",
        title = "^(Save|Open|Select|Choose|Export|Upload|Import).*",
    },
    float = true,
    center = true,
    size = "1100 700",
})

hl.window_rule({
    name = "zen-pip",
    match = {
        class = "^zen$",
        title = "^Picture-in-Picture$",
    },
    float = true,
    pin = true,
    size = "1100 620",
    move = "1100 0",
})

-- Layer-shell rules.
hl.layer_rule({
    name = "vicinae-blur",
    match = { namespace = "^vicinae$" },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "vicinae-no-animation",
    match = { namespace = "^vicinae$" },
    no_anim = true,
})

hl.layer_rule({
    name = "nwg-drawer-blur",
    match = { namespace = "^nwg-drawer$" },
    blur = true,
    ignore_alpha = 0.01,
})

hl.layer_rule({
    name = "nwg-drawer-no-animation",
    match = { namespace = "^nwg-drawer$" },
    no_anim = true,
})

-- Remove decorations from a lone tiled window or a fullscreen workspace.
hl.window_rule({
    name = "solo-tiled-no-border",
    match = {
        float = false,
        workspace = "w[tv1]",
    },
    border_size = 0,
    rounding = 0,
})

hl.window_rule({
    name = "fullscreen-no-border",
    match = {
        float = false,
        workspace = "f[1]",
    },
    border_size = 0,
    rounding = 0,
})
