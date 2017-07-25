Harmony.ui.side.left.container = Harmony.ui.container({
  name = "leftContainer",
    x = "0px", y = "0px",
    width = px(Harmony.ui.settings.border.left), height = "100%"
});

Harmony.ui.side.left.label = Harmony.ui.label({
  name = "leftLabel",
    x = "0px", y = "0px",
    width = "100%", height = "100%"
}, Harmony.ui.side.left.container)

Harmony.ui.side.left.label:setStyleSheet(Harmony.ui.styles.leftBox)

Harmony.ui.side.left.tactics = Harmony.ui.container({
    name = "tacticsArea",
    x = px(0), y = px(0),
    width = "100%", height = "30%"
}, Harmony.ui.side.left.label)

Harmony.ui.side.left.target = Harmony.ui.container({
    name = "targetArea",
    x = px(0), y = "30%",
    width = "100%", height = "40%"
}, Harmony.ui.side.left.label)

Harmony.ui.side.left.self = Harmony.ui.container({
    name = "selfArea",
    x = px(0), y = "70%",
    width = "100%", height = "30%"
}, Harmony.ui.side.left.label)

Harmony.ui.side.left.tacticButtons = {}