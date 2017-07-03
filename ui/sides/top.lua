local barWidth = Harmony.ui.window.width
local xpos = 0

if Harmony.ui.settings.sides.left then
    barWidth = barWidth - Harmony.ui.settings.border.left
    xpos = Harmony.ui.settings.border.left
end

if Harmony.ui.settings.sides.left then
    barWidth = barWidth - Harmony.ui.settings.border.right
end

if barWidth < 0 then barWidth = 0 end

Harmony.ui.side.top.topButtonCount = 0

function Harmony.ui.side.top.addButton(name, display)
    local xpos = Harmony.ui.settings.border.left

    -- For each button, add some space
    xpos = xpos + (Harmony.ui.side.top.topButtonCount * (Harmony.ui.settings.topButtonwidth))

    local ypos = 15

    local newLabel = Harmony.ui.label({
        name = "topLabelParent"..name,
        nestable = true,
        x = px(xpos), y = px(ypos),
        width = px(Harmony.ui.settings.topButtonwidth), height = px(30)
    });

    newLabel:setStyleSheet(Harmony.ui.styles.topButton)

    newLabel:echo("<center>"..display, nil, "10")

    Harmony.ui.side.top.topButtonCount = Harmony.ui.side.top.topButtonCount + 1

    return newLabel
end

function Harmony.ui.side.top.addPlainButton(name, display, callback)
    local xpos = Harmony.ui.settings.border.left

    -- For each button, add some space
    xpos = xpos + (Harmony.ui.side.top.topButtonCount * (Harmony.ui.settings.topButtonwidth))

    local ypos = 2

    local newLabel = Harmony.ui.label({
        name = "topLabelParent"..name,
        x = px(xpos), y = px(ypos),
        width = px(Harmony.ui.settings.topButtonwidth), height = px(30)
    });

    newLabel:setStyleSheet(Harmony.ui.styles.topButton)
    newLabel:setClickCallBack(callback)

    newLabel:echo("<center>"..display, nil, "10")

    Harmony.ui.side.top.topButtonCount = Harmony.ui.side.top.topButtonCount + 1

    return newLabel
end

function Harmony.ui.side.top.addChild(parent, name, display, callbackName, ...)
    local newChild = parent:addChild({
        name = name, flyOut = true,
        width = px(Harmony.ui.settings.topButtonwidth * 2), height = px(30),
        layoutDir="BV"
    })

    newChild:echo("<center>"..display, nil, "10")
    newChild:setStyleSheet(Harmony.ui.styles.topButtonChild)
    newChild:setClickCallback(callbackName, unpack(arg))
    return newChild
end

Harmony.ui.side.top.container = Harmony.ui.container({
    name = "topContainer",
    x = px(xpos), y = "0px",
    width = px(barWidth), height = px(Harmony.ui.settings.border.top)
});

Harmony.ui.side.top.label = Harmony.ui.label({
    name = "topLabel",
    x = px(0), y = px(0),
    width = "100%", height = "100%"
    }, Harmony.ui.side.top.container);

Harmony.ui.side.top.label:setStyleSheet([[
    background: black;
    border-bottom: 1px solid white;
    ]])

Harmony.ui.side.top.label:show()

Harmony.ui.side.top.console = Harmony.ui.console({
    name = "topConsole",
    x = "0%", y = "0%",
    width = "100%", height = "30%"
}, Harmony.ui.side.top.container)