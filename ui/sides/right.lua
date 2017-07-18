Harmony.ui.side.right.container = Harmony.ui.container({
    name = "rightContainer",
    x = "-"..px(Harmony.ui.settings.border.right), y = "0px",
    width = px(Harmony.ui.settings.border.right), height = "100%"
})

Harmony.ui.side.right.chatContainer = Harmony.ui.container({
    name="chatContainer",
    x = px(0), y = px(0),
    width = "100%", height = "35%"
}, Harmony.ui.side.right.container)

Harmony.ui.side.right.chatHeader = Harmony.ui.hbox({
    name = "chatHeader",
    x = 0, y = 0,
    width = "100%", height = "10%"
}, Harmony.ui.side.right.chatContainer)

Harmony.ui.side.right.chatFooter = Harmony.ui.label({
  name = "chatFooter",
  x = 0, y = "10%",
  width = "100%",
  height = "90%",
}, Harmony.ui.side.right.chatContainer)

Harmony.ui.side.right.chatFooter:setStyleSheet([[
    background-color: #050F2B;
]])

Harmony.ui.side.right.mapContainer = Harmony.ui.container({
    name="mapContainer",
    x = px(0), y = "35%",
    width = px(Harmony.ui.settings.border.right), height = "65%"
}, Harmony.ui.side.right.container)

Harmony.ui.side.right.mapHeader = Harmony.ui.hbox({
    name = "mapHeader",
    x = 0, y = 0,
    width = "100%", height = "7%"
}, Harmony.ui.side.right.mapContainer)

Harmony.ui.side.right.mapFooter = Harmony.ui.container({
  name = "mapFooter",
  x = 0, y = "7%",
  width = "100%",
  height = "93%",
}, Harmony.ui.side.right.mapContainer)