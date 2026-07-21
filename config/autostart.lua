-- Start the applications that make up the default working session. The
-- workspace rules apply only to windows created by these launches, so opening
-- another Ghostty or Helium window later still uses the active workspace.
hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- ghostty", { workspace = "1" })
    hl.exec_cmd("uwsm app -- t3code-desktop", { workspace = "2" })
    hl.exec_cmd("uwsm app -- helium", { workspace = "10" }) -- Alt+0
end)
--
-- Deferred for separate packaging later:
--   VibeTyper
