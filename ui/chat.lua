if Harmony.ui and Harmony.ui.chats then return end

Harmony.ui.chats = {}
Harmony.ui.chats.activeChat = nil
Harmony.ui.chats.divisor = 8

function Harmony.ui.chats.activateTab(name)
    if not Harmony.ui.chats[name] then return end

    Harmony.ui.chats.hideChat(Harmony.ui.chats.activeChat.name)

    Harmony.ui.chats.activeChat = Harmony.ui.chats[name]

    Harmony.ui.chats.showChat(Harmony.ui.chats.activeChat.name)
end

function Harmony.ui.chats.addChat(name)
    local newLabel = Harmony.ui.chats.createLabel(name)

    local newWindow = Harmony.ui.console({
        name = name.."ChatWindow",
        x = 0, y = 0,
        height = "100%", width = "100%"
    }, Harmony.ui.side.right.chatFooter)

    newWindow:setFontSize(10)
    newWindow:setWrap(math.floor(Harmony.ui.settings.border.right / Harmony.ui.chats.divisor))
    newWindow:setColor("black") 

    newWindow:hide()

    Harmony.ui.chats[name] = { label = newLabel, name = name, window = newWindow }

    return Harmony.ui.chats[name]
end

function Harmony.ui.chats.createLabel(name)
    local newLabel = Harmony.ui.label({
        name = name.."ChatLabel",
        fgColor = "#ffffff"
    }, Harmony.ui.side.right.chatHeader)

    newLabel:echo("<center>"..name, nil, "10")

    newLabel:setStyleSheet(Harmony.ui.styles.chatNormal)

    newLabel:setClickCallback("Harmony.ui.chats.activateTab", name)
    return newLabel
end

function Harmony.ui.chats.flashChat(name)
    if Harmony.ui.chats.activeChat.name == name then return end

    Harmony.ui.chats[name].label:setStyleSheet(Harmony.ui.styles.chatAlert)
end

function Harmony.ui.chats.hideChat(name)
    if not Harmony.ui.chats[name] then return end

    Harmony.ui.chats[name].window:hide()
    Harmony.ui.chats[name].label:setStyleSheet(Harmony.ui.styles.chatNormal)
end

function Harmony.ui.chats.showChat(name)
    Harmony.ui.chats[name].window:show()
    Harmony.ui.chats[name].label:setStyleSheet(Harmony.ui.styles.chatActive)
end

for _, tab in ipairs(Harmony.ui.settings.tabs) do
    Harmony.ui.chats.addChat(tab)

    if not Harmony.ui.chats.activeChat then
        Harmony.ui.chats.activeChat = Harmony.ui.chats[tab]
        Harmony.ui.chats.showChat(tab)
    end
end