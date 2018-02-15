Harmony.ui.targetWindow = {}

Harmony.ui.targetWindow.background = Harmony.ui.label({
    name = "targetWindowBackground",
    x = px(0), y = px(0),
    width = "98%", height = "99.9%"
}, Harmony.ui.side.left.target)

Harmony.ui.targetWindow.background:setStyleSheet(Harmony.ui.styles.infoBox)

