Harmony.ui.callbacks = {}

function Harmony.ui.callbacks.autoAttackUpdated(event, what, setting)
    if Harmony.hunting.attackOnUpdate then
        Harmony.ui.settingsWindow.buttons["toggleAutoattack"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleAutoattack"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.hunter.loaded", "Harmony.ui.callbacks.autoAttackUpdated")
registerAnonymousEventHandler("Harmony.hunter.autoAttackChanged", "Harmony.ui.callbacks.autoAttackUpdated")

function Harmony.ui.callbacks.autoexploringUpdated(event, what, setting)
    if Harmony.mapping.autoExplore then
        Harmony.ui.settingsWindow.buttons["toggleAutoexplore"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleAutoexplore"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.mapper.autoexploringChanged", "Harmony.ui.callbacks.autoexploringUpdated")

function Harmony.ui.callbacks.bashingUpdated(event, what, setting)
    if keneanung.bashing.configuration.enabled then
        Harmony.ui.settingsWindow.buttons["toggleBashing"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleBashing"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end

    if keneanung.bashing.configuration.autopickup then
        Harmony.ui.settingsWindow.buttons["togglePickup"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["togglePickup"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("keneanung.bashing.loaded", "Harmony.mapper.bashingUpdated")
registerAnonymousEventHandler("keneanung.bashing.settings.changed", "Harmony.mapper.bashingUpdated")

function Harmony.ui.callbacks.exploringUpdated(event, what, setting)
    if Harmony.mapping.exploring then
        Harmony.ui.settingsWindow.buttons["toggleExploring"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleExploring"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("gmcp.Comm.Channel.Text", "Harmony.mapper.exploringChanged")

function Harmony.ui.callbacks.toggleBashing()
    keneanung.bashing.toggle("enabled", "Bashing")
end

function Harmony.ui.callbacks.togglePickup()
    keneanung.bashing.toggle("autopickup", "Pickup")
end

function Harmony.ui.callbacks.updateBottomBar()
    clearUserWindow("bottomConsole")

    Harmony.ui.side.bottom.console:setFontSize(10)

    raiseEvent("Harmony.ui.updateBottomBarPre")

    Harmony.ui.side.bottom.console:cecho(paracelsus_affs_customtag2()) 

    raiseEvent("Harmony.ui.updateBottomBarPost")
end

function Harmony.ui.callbacks.updateChat()
    local text = ansi2decho(gmcp.Comm.Channel.Text.text)

    for match, tabName in pairs(Harmony.ui.settings.channels) do
        if Harmony.ui.chats[tabName] and gmcp.Comm.Channel.Text.channel:match(match) then
            local timeStamp = getTime(true, "hh:mm:ss")
            Harmony.ui.chats[tabName].window:cecho("<white>"..timeStamp.." - ")
            Harmony.ui.chats[tabName].window:decho(text.."\n")

            if tabName ~= Harmony.ui.chats.activeChat.name then
                Harmony.ui.chats.flashChat(tabName)
            end
        end
    end
end
registerAnonymousEventHandler("gmcp.Comm.Channel.Text", "Harmony.ui.callbacks.updateChat")

function Harmony.ui.callbacks.updateTopBar()
    clearUserWindow("topConsole")

    raiseEvent("Harmony.ui.updateTopBarPre")

    if not gmcp or not gmcp.Char or not gmcp.Char.Status then return end

    local stats = gmcp.Char.Status
    Harmony.ui.side.top.console:setFontSize(10)
    Harmony.ui.side.top.console:cecho(("<purple>%s "):format(stats.name))
    Harmony.ui.side.top.console:cecho(("<white> XP:<gold>%s "):format(stats.level))
    Harmony.ui.side.top.console:cecho(("<white> Gold:<gold>%s "):format(stats.gold))
    Harmony.ui.side.top.console:cecho(("<white> Unbound:<gold>%s "):format(stats.unboundcredits))
    Harmony.ui.side.top.console:cecho(("<white> Bound:<gold>%s "):format(stats.boundcredits))

    if stats.unread_msgs == "0" then
        Harmony.ui.side.top.console:cecho(("<white> Messages:<green>%s "):format(stats.unread_msgs))
    else
        Harmony.ui.side.top.console:cecho(("<white> Messages:<red>%s "):format(stats.unread_msgs))
    end
    
    raiseEvent("Harmony.ui.updateTopBarPost")
end
registerAnonymousEventHandler("gmcp.Char.Status", "Harmony.ui.callbacks.updateTopBar")

function Harmony.ui.callbacks.vdefsBasic()
    svo.defs.switch("basic", true)
end

function Harmony.ui.callbacks.vdefsCombat()
    svo.defs.switch("combat", true)
end

function Harmony.ui.callbacks.vdefsEmpty()
    svo.defs.switch("empty", true)
end

function Harmony.ui.callbacks.vdefsRaid()
    svo.defs.switch("raid", true)
end