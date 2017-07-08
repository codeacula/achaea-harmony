Harmony.ui.settingsWindow = {}
Harmony.ui.settingsWindow.buttons = {}
Harmony.ui.settingsWindow.container = nil
Harmony.ui.settingsWindow.rows = {}

function Harmony.ui.settingsWindow.addButton(name, display, funcName, row)
    if Harmony.ui.settingsWindow.buttons[name] then return Harmony.ui.settingsWindow.buttons[name] end

    local newButton = Harmony.ui.label({
        name = name.."Button",
        fgColor = "#ffffff"
    }, Harmony.ui.settingsWindow.rows[row].container)

    newButton:echo("<center>"..display, nil, "8")

    newButton:setStyleSheet(Harmony.ui.styles.buttonNormal)

    newButton:setClickCallback(funcName, name)

    newButton:show()

    table.insert(Harmony.ui.settingsWindow.rows[row].buttons, newButton)

    Harmony.ui.settingsWindow.buttons[name] = newButton
    return newButton
end

function Harmony.ui.settingsWindow.clearRow(row)
    for _, button in ipairs(Harmony.ui.settingsWindow.rows[row].buttons) do
        button:hide()
    end

    Harmony.ui.settingsWindow.rows[row].buttons = {}
end

function Harmony.ui.settingsWindow.setUp()
    local name = "Settings"
    local newLabel = Harmony.ui.chats.createLabel(name)

    local newWindow = Harmony.ui.label({
        name = name.."ChatWindow",
        x = 0, y = 0,
        height = "100%", width = "100%"
    }, Harmony.ui.side.right.chatFooter)

    newWindow:hide()

    Harmony.ui.chats[name] = { label = newLabel, name = name, window = newWindow }
    Harmony.ui.settingsWindow.container = Harmony.ui.chats[name]

    for i = 1, Harmony.ui.settings.buttonRows do
        Harmony.ui.settingsWindow.setUpRow(i)
    end
end

function Harmony.ui.settingsWindow.setUpRow(row)
    Harmony.ui.settingsWindow.rows[row] = {}
    Harmony.ui.settingsWindow.rows[row].buttons = {}

    Harmony.ui.settingsWindow.rows[row].container = Harmony.ui.hbox({
        name = "buttonRow"..row,
        x = 0, y = Harmony.ui.settings.buttonHeight * (row - 1),
        width = "100%", height = px(Harmony.ui.settings.buttonHeight)
    }, Harmony.ui.settingsWindow.container.window)
end

Harmony.ui.settingsWindow.setUp()


Harmony.ui.settingsWindow.addButton("toggleBashing", "Bashing", "Harmony.ui.callbacks.toggleBashing", 1)
Harmony.ui.settingsWindow.addButton("togglePickup", "Pickup", "Harmony.ui.callbacks.togglePickup", 1)
Harmony.ui.settingsWindow.addButton("toggleAutoattack", "Auto Attack", "Harmony.hunting.toggleAutoAttack", 1)
Harmony.ui.settingsWindow.addButton("toggleExploring", "Exploring", "Harmony.mapping.toggleExploring", 1)
Harmony.ui.settingsWindow.addButton("toggleAutoexplore", "Autoexploring", "Harmony.mapping.toggleAutoexplore", 1)

Harmony.ui.settingsWindow.addButton("toggleVdefsBasic", "Basic Defs", "Harmony.ui.callbacks.vdefsBasic", 2)
Harmony.ui.settingsWindow.addButton("toggleVdefsCombat", "Combat Defs", "Harmony.ui.callbacks.vdefsCombat", 2)
Harmony.ui.settingsWindow.addButton("toggleVdefsRaid", "Raid Defs", "Harmony.ui.callbacks.vdefsRaid", 2)
Harmony.ui.settingsWindow.addButton("toggleVdefsEmpty", "Empty Defs", "Harmony.ui.callbacks.vdefsEmpty", 2)

Harmony.ui.settingsWindow.addButton("toggleFollowLeader", "Follow Raid", "Harmony.raid.toggleFollowing", 3)
Harmony.ui.settingsWindow.addButton("toggleCallTarget", "Call Raid", "Harmony.raid.toggleLeading", 3)

-- Update the button states
Harmony.ui.callbacks.autoexploringUpdated()
Harmony.ui.callbacks.exploringUpdated()

Harmony.ui.chats.activateTab("Settings")