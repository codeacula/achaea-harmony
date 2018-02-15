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
    ppinfo.headAmount:echo("<span style='color: #00FF00'><center>0%</center></span>")
    ppinfo.torsoAmount:echo("<span style='color: #00FF00'><center>0%</center></span>")
    ppinfo.leftArmAmount:echo("<span style='color: #00FF00'><center>0%</center></span>")
    ppinfo.rightArmAmount:echo("<span style='color: #00FF00'><center>0%</center></span>")
    ppinfo.leftLegAmount:echo("<span style='color: #00FF00'><center>0%</center></span>")
    ppinfo.rightLegAmount:echo("<span style='color: #00FF00'><center>0%</center></span>")
end
registerAnonymousEventHandler("svo done with prompt", "Harmony.ui.callbacks.updatePlayerInfo")

ppinfo.name = Harmony.ui.label({name = "ppiName", x = px(0), y = px(0), width = "100%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.headLabel = Harmony.ui.label({name = "ppiHeadLabel", x = px(0), y = ppx(1), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.headAmount = Harmony.ui.label({name = "ppiHeadAmount", x = "34%", y = ppx(1), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.headParry = Harmony.ui.label({name = "ppiHeadParry", x = "67%", y = ppx(1), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.torsoLabel = Harmony.ui.label({name = "ppiTorsoLabel", x = px(0), y = ppx(2), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.torsoAmount = Harmony.ui.label({name = "ppiTorsoAmount", x = "34%", y = ppx(2), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.torsoParry = Harmony.ui.label({name = "ppiTorsoParry", x = "67%", y = ppx(2), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.leftArmLabel = Harmony.ui.label({name = "ppiLeftArmLabel", x = px(0), y = ppx(3), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.leftArmAmount = Harmony.ui.label({name = "ppiLeftArmAmount", x = "34%", y = ppx(3), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.leftArmParry = Harmony.ui.label({name = "ppiLeftArmParry", x = "67%", y = ppx(3), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.rightArmLabel = Harmony.ui.label({name = "ppiRightArmLabel", x = px(0), y = ppx(4), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.rightArmAmount = Harmony.ui.label({name = "ppiRightArmAmount", x = "34%", y = ppx(4), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.rightArmParry = Harmony.ui.label({name = "ppiRightArmParry", x = "67%", y = ppx(4), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.leftLegLabel = Harmony.ui.label({name = "ppiLeftLegLabel", x = px(0), y = ppx(5), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.leftLegAmount = Harmony.ui.label({name = "ppiLeftLegAmount", x = "34%", y = ppx(5), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.leftLegParry = Harmony.ui.label({name = "ppiLeftLegParry", x = "67%", y = ppx(5), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.rightLegLabel = Harmony.ui.label({name = "ppiRightLegLabel", x = px(0), y = ppx(6), width = "34%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.rightLegAmount = Harmony.ui.label({name = "ppiRightLegAmount", x = "34%", y = ppx(6), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)
ppinfo.rightLegParry = Harmony.ui.label({name = "ppiRightLegParry", x = "67%", y = ppx(6), width = "33%", height = ppinfo.rowHeight}, Harmony.ui.side.left.playerInfoBox)

ppinfo.name:setStyleSheet([[border-bottom: 1px solid white;background: transparent;]])
ppinfo.headLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.headLabel:echo("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Head")
ppinfo.headAmount:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.headParry:setStyleSheet(Harmony.ui.styles.infoBoxHeader)

ppinfo.torsoLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.torsoLabel:echo("&nbsp;&nbsp;&nbsp;&nbsp;Torso")
ppinfo.torsoAmount:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.torsoParry:setStyleSheet(Harmony.ui.styles.infoBoxHeader)

ppinfo.leftArmLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.leftArmLabel:echo("&nbsp;Left Arm")
ppinfo.leftArmAmount:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.leftArmParry:setStyleSheet(Harmony.ui.styles.infoBoxHeader)

ppinfo.rightArmLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.rightArmLabel:echo("Right Arm")
ppinfo.rightArmAmount:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.rightArmParry:setStyleSheet(Harmony.ui.styles.infoBoxHeader)

ppinfo.leftLegLabel:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.leftLegLabel:echo("&nbsp;Left Leg")
ppinfo.leftLegAmount:setStyleSheet(Harmony.ui.styles.infoBoxHeader)
ppinfo.leftLegParry:setStyleSheet(Harmony.ui.styles.infoBoxHeader)

ppinfo.rightLegLabel:setStyleSheet(Harmony.ui.styles.infoBoxFooter)
ppinfo.rightLegLabel:echo("Right Leg")
ppinfo.rightLegAmount:setStyleSheet(Harmony.ui.styles.infoBoxFooter)
ppinfo.rightLegParry:setStyleSheet(Harmony.ui.styles.infoBoxFooter)