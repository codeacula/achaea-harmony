Harmony.ui.maps = {}

Harmony.ui.maps.mudletMapContainer = Harmony.ui.container({
    name = "mudletMapContainer",
    x = "0", y = "0%",
    width = "100%", height = "100%"
}, Harmony.ui.side.right.mapFooter)

Harmony.ui.maps.mudletMap = Harmony.ui.mapper({
    name = "mudletMap",
    x = "0", y = "0%",
    width = "100%", height = "100%"
}, Harmony.ui.maps.mudletMapContainer)

Harmony.ui.maps.capturedWilderness = false
Harmony.ui.maps.capturingWilderness = false
Harmony.ui.maps.ignorePrompt = false
Harmony.ui.maps.inWilderness = false

Harmony.ui.maps.wildernessMap = Harmony.ui.console({
    name = "wildernessMap",
    x = "5%", y = "5%",
    height = "90%", width = "90%"
}, Harmony.ui.side.right.mapFooter)
Harmony.ui.maps.wildernessMap:setColor("black")
Harmony.ui.maps.wildernessMap:setFontSize(11)

function Harmony.ui.maps.activateMap(name)
    if name == "Wilderness" then
        Harmony.ui.maps.showWilderness()
        Harmony.ui.maps.inWilderness = true
    else
        Harmony.ui.maps.showMap()
        Harmony.ui.maps.inWilderness = false
    end
end

function Harmony.ui.maps.addTab(name)
    local newLabel = Harmony.ui.label({
        name = name.."MapLabel",
        fgColor = "#ffffff"
    }, Harmony.ui.side.right.mapHeader)

    newLabel:echo("<center>"..name, nil, "10")

    newLabel:setStyleSheet(Harmony.ui.styles.chatNormal)

    newLabel:setClickCallback("Harmony.ui.maps.activateMap", name)
    return newLabel
end

function Harmony.ui.maps.showMap()
    Harmony.ui.maps.mapTab:setStyleSheet(Harmony.ui.styles.chatActive)
    Harmony.ui.maps.wildernessTab:setStyleSheet(Harmony.ui.styles.chatNormal)
    Harmony.ui.maps.wildernessMap:hide()
    Harmony.ui.maps.mudletMapContainer:show()
    Harmony.ui.maps.inWilderness = false
end

function Harmony.ui.maps.showWilderness()
    Harmony.ui.maps.mapTab:setStyleSheet(Harmony.ui.styles.chatNormal)
    Harmony.ui.maps.wildernessTab:setStyleSheet(Harmony.ui.styles.chatActive)
    Harmony.ui.maps.mudletMapContainer:hide()
    Harmony.ui.maps.wildernessMap:show()
    Harmony.ui.maps.inWilderness = true
end

Harmony.ui.maps.mapTab = Harmony.ui.maps.addTab("Mudlet")
Harmony.ui.maps.mapTab:setStyleSheet(Harmony.ui.styles.chatActive)
Harmony.ui.maps.wildernessTab = Harmony.ui.maps.addTab("Wilderness")
Harmony.ui.maps.wildernessTab:setStyleSheet(Harmony.ui.styles.chatNormal)
Harmony.ui.maps.wildernessMap:hide()