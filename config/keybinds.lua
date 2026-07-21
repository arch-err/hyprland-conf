local mod = "ALT"

-- Applications and session controls.
hl.bind(mod .. " + I", hl.dsp.exec_cmd("uwsm app -- ghostty"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"))

-- Focus and move windows.
for _, direction in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mod .. " + " .. direction, hl.dsp.focus({ direction = direction }))
    hl.bind(mod .. " + SHIFT + " .. direction, hl.dsp.window.move({ direction = direction }))
end

-- Workspaces 1–10, with 0 representing workspace 10.
for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Hardware controls work while the session is locked and repeat while held.
local repeatable = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), repeatable)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), repeatable)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), repeatable)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), repeatable)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), repeatable)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), repeatable)

-- Old-config candidates -----------------------------------------------------
-- These were converted from ~/reference/hypr/keybinds.conf but left disabled
-- because most depend on programs or scripts that are not installed yet.
-- Remove the leading `--` only from bindings you want to keep.
local function exec(keys, command, options)
    hl.bind(keys, hl.dsp.exec_cmd(command), options)
end

-- Vicinae shortcuts.
-- exec("SUPER + S", "vicinae deeplink vicinae://extensions/bgiovand/homepage/services")
-- exec("SUPER + C", "vicinae deeplink vicinae://extensions/bgiovand/homepage/bookmarks")
-- exec("SUPER + SHIFT + C", "vicinae deeplink vicinae://extensions/tofrankie/atlassian-data-center/confluence-search-content")
-- exec("ALT + N", "~/.config/hypr/scripts/pop-daily-note")
-- exec("SUPER + E", "vicinae deeplink vicinae://extensions/vicinae/core/search-emojis")
-- exec("SUPER + I", "vicinae deeplink vicinae://launch/@xmok/store.raycast.immich/explore")
-- exec("ALT + CONTROL + 1", "vicinae deeplink vicinae://extensions/arch-err/focus-slots/focus-workspace")


-- Volume helper used by the old installation.
-- exec("XF86AudioRaiseVolume", "volume +3", repeatable)
-- exec("XF86AudioLowerVolume", "volume -3", repeatable)
-- exec("SHIFT + F7", "volume +10", repeatable)
-- exec("SHIFT + F6", "volume -10", repeatable)
-- exec("XF86AudioMute", "volume mute-toggle", repeatable)

-- Alternate brightness bindings.
-- exec("F3", "brightnessctl set +5%", repeatable)
-- exec("F2", "brightnessctl set 5%-", repeatable)
-- exec("SHIFT + F2", "brightnessctl set 1%", repeatable)
-- exec("SHIFT + F3", "brightnessctl set 100%", repeatable)

-- Playback; requires playerctl.
-- exec("XF86AudioPrev", "playerctl previous", repeatable)
-- exec("XF86AudioPlay", "playerctl play-pause", repeatable)
-- exec("XF86AudioNext", "playerctl next", repeatable)

-- Screenshots and utility scripts.
-- exec("SHIFT + Print", "uwsm app -- grimblast --cursor copysave active screenshot_window.png")
-- exec("ALT + P", "toggle-pip")
-- exec("SUPER + T", "$XDG_CONFIG_HOME/hypr/scripts/helium-profile switch")

-- Alternate window controls from the old config.
-- hl.bind("ALT + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind("ALT + aring", hl.dsp.window.pin())
-- hl.bind("ALT + B", hl.dsp.layout("togglesplit"))

-- Vim-style focus and window movement.
for key, direction in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = direction }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

-- Vim-style resizing in 50-pixel increments.
local resize = { repeating = true }
hl.bind(mod .. " + CONTROL + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), resize)
hl.bind(mod .. " + CONTROL + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), resize)
hl.bind(mod .. " + CONTROL + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), resize)
hl.bind(mod .. " + CONTROL + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), resize)

-- Old specialized workspace scripts.
-- exec("ALT + 1", "~/.config/hypr/scripts/focus-go.sh")
-- exec("ALT + SHIFT + 1", "~/.config/hypr/scripts/focus-move.sh")

-- Citrix X11-to-Wayland clipboard synchronization.
-- local clipboard_sync = "bash -c 'content=$(xclip -selection clipboard -o 2>/dev/null) && [ -n \"$content\" ] && echo -n \"$content\" | wl-copy'"
-- exec("CONTROL + SHIFT + V", clipboard_sync, { non_consuming = true })
-- exec("SHIFT + P", clipboard_sync, { non_consuming = true })
