Harmony.ui.callbacks = {}

function Harmony.ui.callbacks.autoAttackUpdated(event, what, setting)
    if Harmony.hunting.attackOnUpdate then
        Harmony.ui.settingsWindow.buttons["toggleAutoattack"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleAutoattack"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.hunter.autoAttackChanged", "Harmony.ui.callbacks.autoAttackUpdated")
registerAnonymousEventHandler("Harmony.ui.loaded", "Harmony.ui.callbacks.autoAttackUpdated")

function Harmony.ui.callbacks.autoexploringUpdated(event, what, setting)
    if Harmony.mapping.autoExplore then
        Harmony.ui.settingsWindow.buttons["toggleAutoexplore"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleAutoexplore"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.mapper.autoexploringChanged", "Harmony.ui.callbacks.autoexploringUpdated")
registerAnonymousEventHandler("Harmony.ui.loaded", "Harmony.ui.callbacks.autoexploringUpdated")

function Harmony.ui.callbacks.bashingUpdated(event, what, setting)
    if not keneanung or not keneanung.bashing then return end

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
registerAnonymousEventHandler("keneanung.bashing.loaded", "Harmony.ui.callbacks.bashingUpdated")
registerAnonymousEventHandler("keneanung.bashing.settings.changed", "Harmony.ui.callbacks.bashingUpdated")
registerAnonymousEventHandler("Harmony.ui.loaded", "Harmony.ui.callbacks.bashingUpdated")

function Harmony.ui.callbacks.exploringUpdated(event, what, setting)
    if Harmony.mapping.exploring then
        Harmony.ui.settingsWindow.buttons["toggleExploring"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleExploring"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.mapper.exploringChanged", "Harmony.ui.callbacks.exploringUpdated")

function Harmony.ui.callbacks.printTarget()
    if not Harmony.target.name then return end

    Harmony.ui.side.bottom.console:cecho(("Target: <red>%s<reset> "):format(Harmony.target.name))
end
registerAnonymousEventHandler("Harmony.ui.updateBottomBarPre", "Harmony.ui.callbacks.printTarget")

function Harmony.ui.callbacks.raidFollowUpdated()
    if Harmony.raid.following then
        Harmony.ui.settingsWindow.buttons["toggleFollowLeader"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleFollowLeader"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.raid.followingUpdated", "Harmony.ui.callbacks.raidFollowUpdated")

function Harmony.ui.callbacks.raidLeadUpdated()
    if Harmony.raid.leading then
        Harmony.ui.settingsWindow.buttons["toggleCallTarget"]:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons["toggleCallTarget"]:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.raid.leadingUpdated", "Harmony.ui.callbacks.raidLeadUpdated")

function Harmony.ui.callbacks.setupTacticButtons()
    local row = 0
    local column = 0

    local height = 30

    for _, tacticGroup in ipairs(Harmony.tactics.regsiteredTactics) do
        local xpos = 33 * column
        local ypos = height * row

        local tacticButton = Harmony.ui.label({
            name = "tacticButton"..tacticGroup.name,
            x = xpos.."%", y = px(ypos),
            width = "33%", height = px(height),
            fgColor = "#ffffff"
        }, Harmony.ui.side.left.tactics)

        tacticButton:setStyleSheet(Harmony.ui.styles.tacticInactive)
        tacticButton:echo("<center>"..tacticGroup.name, nil, "8")

        tacticButton:setClickCallback("Harmony.tactics.switchTactic", tacticGroup.name)

        Harmony.ui.side.left.tacticButtons[tacticGroup.name] = tacticButton

        if not Harmony.ui.side.left.currentTacticButton then
            Harmony.tactics.switchTactic(tacticGroup.name)
        end

        column = column + 1
        
        if column == 3 then
            row = row + 1
            column = 0
        end
    end
end
registerAnonymousEventHandler("Harmony.ui.loaded", "Harmony.ui.callbacks.setupTacticButtons")

function Harmony.ui.callbacks.tacticSwitched(event, name)

    if Harmony.ui.side.left.currentTacticButton then
        Harmony.ui.side.left.currentTacticButton:setStyleSheet(Harmony.ui.styles.tacticInactive)
    end

    Harmony.ui.side.left.currentTacticButton = Harmony.ui.side.left.tacticButtons[name]
    Harmony.ui.side.left.currentTacticButton:setStyleSheet(Harmony.ui.styles.tacticActive)
end
registerAnonymousEventHandler("Harmony.tacticSwitched", "Harmony.ui.callbacks.tacticSwitched")

function Harmony.ui.callbacks.toggleBashing()
    keneanung.bashing.toggle("enabled", "Bashing")
end

function Harmony.ui.callbacks.togglePickup()
    keneanung.bashing.toggle("autopickup", "Pickup")
end

--[[function Harmony.ui.callbacks.updateBottomBar()
    clearUserWindow("bottomConsole")

    Harmony.ui.side.bottom.console:setFontSize(10)

    raiseEvent("Harmony.ui.updateBottomBarPre")

    Harmony.ui.side.bottom.console:cecho(paracelsus_affs_customtag2()) 

    raiseEvent("Harmony.ui.updateBottomBarPost")
end]]--

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

function Harmony.ui.callbacks.updateFollowing()
    if Harmony.raid.following then
        Harmony.ui.settingsWindow.buttons.toggleFollowLeader:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons.toggleFollowLeader:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.ui.loaded", "Harmony.ui.callbacks.updateFollowing")
registerAnonymousEventHandler("Harmony.raid.followingUpdated", "Harmony.ui.callbacks.updateFollowing")

function Harmony.ui.callbacks.updateGauges()
    Harmony.ui.callbacks.updateHealthBar(svo.stats.currenthealth, svo.stats.maxhealth)
    Harmony.ui.callbacks.updateManaBar(svo.stats.currentmana, svo.stats.maxmana)
end
registerAnonymousEventHandler("svo done with prompt", "Harmony.ui.callbacks.updateGauges")

function Harmony.ui.callbacks.updateHealthBar(current, max)
    if not svo.stats.hp then return end
     
    if svo.stats.hp > 70 then
        Harmony.ui.side.bottom.healthBar.front:setStyleSheet(Harmony.ui.styles.calculateBackground(Harmony.ui.side.bottom.healthBarFull, Harmony.ui.side.bottom.barWarning, current, max, max * .7))
    else
        Harmony.ui.side.bottom.healthBar.front:setStyleSheet(Harmony.ui.styles.calculateBackground(Harmony.ui.side.bottom.barWarning, Harmony.ui.side.bottom.barEmpty, current, max * .7, 1))
    end

    Harmony.ui.side.bottom.healthBar:setValue(current, max, "<b><center>"..current.."H</center></b>")
end

function Harmony.ui.callbacks.updateLeading()
    if Harmony.raid.leading then
        Harmony.ui.settingsWindow.buttons.toggleCallTarget:setStyleSheet(Harmony.ui.styles.buttonActive)
    else
        Harmony.ui.settingsWindow.buttons.toggleCallTarget:setStyleSheet(Harmony.ui.styles.buttonInactive)
    end
end
registerAnonymousEventHandler("Harmony.ui.loaded", "Harmony.ui.callbacks.updateLeading")
registerAnonymousEventHandler("Harmony.raid.leadingUpdated", "Harmony.ui.callbacks.updateLeading")

function Harmony.ui.callbacks.updateManaBar(current, max)
    if not svo.stats.mp then return end

    if svo.stats.mp > 70 then
        Harmony.ui.side.bottom.manaBar.front:setStyleSheet(Harmony.ui.styles.calculateBackground(Harmony.ui.side.bottom.manaBarFull, Harmony.ui.side.bottom.barWarning, current, max, max * .7))
    else
        Harmony.ui.side.bottom.manaBar.front:setStyleSheet(Harmony.ui.styles.calculateBackground(Harmony.ui.side.bottom.barWarning, Harmony.ui.side.bottom.barEmpty, current, max * .7, 0))
    end

    Harmony.ui.side.bottom.manaBar:setValue(current, max, "<b><center><DarkGreen:white>"..current.."M<reset>")
end

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