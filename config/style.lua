hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border = {
                colors = { "rgba(89b4faff)", "rgba(cba6f7ff)" },
                angle = 45,
            },
            inactive_border = "rgba(45475aaa)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding = 8,
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        shadow = {
            enabled = true,
        },
        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            noise = 0.015,
            contrast = 1.05,
            brightness = 0.82,
            vibrancy = 0.12,
            vibrancy_darkness = 0.15,
        },
    },

    animations = {
        enabled = false,
    },

    misc = {
        disable_hyprland_logo = true,
        background_color = "rgb(11111b)",
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

hl.curve("easeOut", {
    type = "bezier",
    points = { { 0.16, 1 }, { 0.3, 1 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "easeOut" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "easeOut" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "easeOut", style = "slide" })
