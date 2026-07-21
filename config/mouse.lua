hl.config({
    input = {
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
            -- disable_while_typing = false,
        },
    },
})

local mod = "ALT"
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Disable both interfaces exposed by the built-in Synaptics trackpad. The
-- touchpad integrated into the external Dilemma keyboard remains enabled.
for _, name in ipairs({
    "syna32bf:00-06cb:ceb0-touchpad",
    "syna32bf:00-06cb:ceb0-mouse",
}) do
    hl.device({
        name = name,
        enabled = false,
    })
end
