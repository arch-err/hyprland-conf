hl.config({
    input = {
        kb_layout = "se",
        kb_variant = "nodeadkeys",
    },
})

-- The external Dilemma keyboard remains enabled on the laptop.
hl.device({
    name = "at-translated-set-2-keyboard",
    enabled = false,
})
