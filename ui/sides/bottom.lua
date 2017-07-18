local barWidth = Harmony.ui.window.width
local xpos = 0

if Harmony.ui.settings.sides.left then
    barWidth = barWidth - Harmony.ui.settings.border.left
    xpos = Harmony.ui.settings.border.left
end

if Harmony.ui.settings.sides.right then
    barWidth = barWidth - Harmony.ui.settings.border.right
end

if barWidth < 0 then barWidth = 0 end

Harmony.ui.side.bottom.container = Harmony.ui.container({
    name = "bottomContainer",
        x = px(xpos), y = px(Harmony.ui.window.height - Harmony.ui.settings.border.bottom - 3),
        width = px(barWidth), height = px(Harmony.ui.settings.border.bottom)
});

Harmony.ui.side.bottom.label = Harmony.ui.label({
    name = "bottomLabel",
    x = px(0), y = px(0),
    width = "100%", height = "100%"
}, Harmony.ui.side.bottom.container);

Harmony.ui.side.bottom.label:setStyleSheet([[
    border-top: 1px solid white;
]])
Harmony.ui.side.bottom.label:show()

Harmony.ui.side.bottom.healthBarFull = { 125, 95, 100 }
Harmony.ui.side.bottom.healthBarEmpty = { 1, 100, 70 }

Harmony.ui.side.bottom.manaBarFull = { 234, 98, 100 }
Harmony.ui.side.bottom.manaBarEmpty = { 1, 100, 70 }

Harmony.ui.side.bottom.healthBar = Harmony.ui.gauge({
    name = "healthBar",
    x = "1%", y = "20%",
    width = "45%", height = "70%"
}, Harmony.ui.side.bottom.label)

Harmony.ui.side.bottom.healthBar.back:setStyleSheet(Harmony.ui.styles.healthBack)

Harmony.ui.side.bottom.healthBar:setValue(50, 100)

Harmony.ui.side.bottom.manaBar = Harmony.ui.gauge({
    name = "manaBar",
    x = "48%", y = "20%",
    width = "45%", height = "70%"
}, Harmony.ui.side.bottom.label)

Harmony.ui.side.bottom.manaBar.back:setStyleSheet(Harmony.ui.styles.manaBack)

Harmony.ui.side.bottom.manaBar:setValue(50, 100)