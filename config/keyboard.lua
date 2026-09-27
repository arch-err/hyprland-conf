hl.config({
    input = {
        kb_layout = "se",
        kb_variant = "nodeadkeys",
    },
})

local builtin_keyboard = "at-translated-set-2-keyboard"
local external_keyboard = "/dev/input/by-id/usb-Bastard_Keyboards_Dilemma__3x5+3__Assembled_E46484C0D31F49230000000000000000-event-kbd"
local dell_display = "Dell Inc. DELL U2723QE BQQG8H3"

local function update_builtin_keyboard()
    local dell_connected = false

    for _, monitor in ipairs(hl.get_monitors()) do
        if monitor.description == dell_display then
            dell_connected = true
            break
        end
    end

    local external_connected = os.execute("test -e " .. external_keyboard)
    hl.device({
        name = builtin_keyboard,
        enabled = dell_connected or not external_connected,
    })
end

hl.on("monitor.layout_changed", update_builtin_keyboard)
update_builtin_keyboard()

hl.on("hyprland.start", function()
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/keyboard-hotplug")
end)
