Harmony.ui.side.left.playerInfoBox = Harmony.ui.label({
    name = "playerInfoBox",
    x = px(0), y = px(0),
    width = "98%", height = "100%"
}, Harmony.ui.side.left.self)

Harmony.ui.side.left.playerInfoBox:setStyleSheet(Harmony.ui.styles.infoBox)

-- Now we start setting up all the other labels for things
local ppinfo = {}
Harmony.ui.side.left.ppinfo = ppinfo

ppinfo.rowHeight = 15

function ppx(rowNum)
    local height = ppinfo.rowHeight * rowNum

    return height.."px"
end

function Harmony.ui.callbacks.updatePlayerInfo()
    if not gmcp.Char or not gmcp.Char.Status or not gmcp.Char.Status.name then
        ppinfo.name:echo("<span style='color: orange'><center>No Name</center></span><br>")
        return
    end

    ppinfo.name:echo("<span style='color: white;'><center>"..gmcp.Char.Status.name.."</center></span><br>")
end
registerAnonymousEventHandler("svo done with prompt", "Harmony.ui.callbacks.updatePlayerInfo") 

ppinfo.name = Harmony.ui.label({name = "ppiName", x = px(0), y = px(0), width = "100%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.headLabel = Harmony.ui.label({name = "ppiHeadLabel", x = px(0), y = ppx(1), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.torsoLabel = Harmony.ui.label({name = "ppiTorsoLabel", x = px(0), y = ppx(2), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.leftArmLabel = Harmony.ui.label({name = "ppiLeftArmLabel", x = px(0), y = ppx(3), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.rightArmLabel = Harmony.ui.label({name = "ppiRightArmLabel", x = px(0), y = ppx(4), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.leftLegLabel = Harmony.ui.label({name = "ppiLeftLegLabel", x = px(0), y = ppx(5), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.rightLegLabel = Harmony.ui.label({name = "ppiRightLegLabel", x = px(0), y = ppx(6), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.name:setStyleSheet([[border-bottom: 1px solid white;background: transparent;]])
ppinfo.headLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.headLabel:echo("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Head")

ppinfo.torsoLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.torsoLabel:echo("&nbsp;&nbsp;&nbsp;&nbsp;Torso")

ppinfo.leftArmLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.leftArmLabel:echo("&nbsp;Left Arm")

ppinfo.rightArmLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.rightArmLabel:echo("Right Arm")

ppinfo.leftLegLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.leftLegLabel:echo("&nbsp;Left Leg")

ppinfo.rightLegLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.rightLegLabel:echo("Right Leg")