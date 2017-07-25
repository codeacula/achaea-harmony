Harmony.ui.styles = {}

-- Eleusis: ForestGreen
-- Cyrene: dodger_blue
-- Mhaldor: firebrick
-- Ashtan: blue_violet
-- Hashan: a_darkmagenta
-- Targossas: gold

Harmony.ui.styles.blackConsole = [[
    background-color: #000000;
]]

Harmony.ui.styles.buttonActive = [[
    background-color: #00654b;
    border-left: 1px solid rgba(0,0,0,0.7);
    border-bottom: 1px solid rgba(0,0,0,0.7);
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

Harmony.ui.styles.buttonInactive = [[
    background-color: rgba(242,99,73,0.29);
    border-left: 1px solid rgba(0,0,0,0.7);
    border-bottom: 1px solid rgba(0,0,0,0.7);
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

Harmony.ui.styles.buttonNormal = [[
    background-color: rgba(51,51,51,0.4);
    border-left: 1px solid rgba(0,0,0,0.7);
    border-bottom: 1px solid rgba(0,0,0,0.7);
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

function Harmony.ui.styles.calculateBackground(from, to, current, max, min)
    local gaugeStyle = Harmony.ui.styles.gaugeFront

    -- What we'll divide by to get the %
    local base = max - min
    local div = current - min

    local r = 0
    local g = 0
    local b = 0

    -- Gives us the change
    local difference = 1 - (div / base)

    -- Calculate current values
    r = from[1] - math.floor((from[1] - to[1]) * difference)
    g = from[2] - math.floor((from[2] - to[2]) * difference)
    b = from[3] - math.floor((from[3] - to[3]) * difference)

    gaugeStyle = gaugeStyle..("background-color: rgba(%s, %s, %s, 1);"):format(r, g, b)
    return gaugeStyle
end

Harmony.ui.styles.chatActive = [[
    background-color: #043605;
    border-left: 1px solid black;
    border-bottom: 2px solid #259237;
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

Harmony.ui.styles.chatAlert = [[
    background-color: #043605;
    border-left: 1px solid black;
    border-bottom: 2px solid #f25118;
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

Harmony.ui.styles.chatNormal = [[
    background-color: #043605;
    border-left: 1px solid black;
    border-bottom: 2px solid #FFFFFF;
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

Harmony.ui.styles.cityAshtan = [[
    QLabel{
        background-color: rgba(138, 43, 226, .8);
        border: 1px solid #3c076d;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(138, 43, 226, .8);
        border: 1px solid #a443ff;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.cityCyrene = [[
    QLabel{
        background-color: rgba(30, 144, 255, .8);
        border: 1px solid #0461b7;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(30, 144, 255, .8);
        border: 1px solid #6db9ff;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.cityDelos = [[
    QLabel{
        background-color: rgba(105, 105, 105, .8);
        border: 1px solid #3f3f3f;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(105, 105, 105, .8);
        border: 1px solid #b7b7b7;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.cityEleusis = [[
    QLabel{
        background-color: rgba(34, 139, 34, .8);
        border: 1px solid #080c2f;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(34, 139, 34, .8);
        border: 1px solid #68ba68;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.cityHashan = [[
    QLabel{
        background-color: rgba(128, 0, 128, .8);
        border: 1px solid #360035;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(128, 0, 128, .8);
        border: 1px solid #b700b5;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.cityMhaldor = [[
    QLabel{
        background-color: rgba(178, 34, 34, .8);
        border: 1px solid #080c2f;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(178, 34, 34, .8);
        border: 1px solid #68ba68;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.cityTargossas = [[
    QLabel{
        background-color: rgba(255, 215, 0, .8);
        border: 1px solid #ae9300;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(255, 215, 0, .8);
        border: 1px solid #ffd800;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.gaugeFront = [[
    border-radius: 5px;
    font-family: "Consolas", "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
]]

Harmony.ui.styles.healthBack = [[
    background: #001c07;
    border: 2px solid black;
    border-radius: 9px;
]]

Harmony.ui.styles.huntingButton = [[
    QLabel{
        background-color: rgba(6, 70, 0, .7);
        border: 1px solid rgba(6, 70, 0, .9);
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    QLabel::hover {
        background-color: rgba(6, 104, 0, .7);
        border: 1px solid rgba(6, 104, 0, .9);
        color: black;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
]]

Harmony.ui.styles.infoBox = [[
    QLabel{
        background-color: rgba(0, 0, 0, .7);
        border: 1px solid rgba(0, 0, 0, .8);
        font-family: "Consolas", "Courier New", monospace;
        font-size: 14px;
    }
]]

Harmony.ui.styles.infoBoxHeader = [[
    background-color: transparent;
    border-right: 1px solid white;
    font-family: "Consolas", "Courier New", monospace;
]]

Harmony.ui.styles.leftBox = [[
    background-color: rgba(0, 0, 0, 0);
    border-right: 1px solid #FFFFFF;
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin-right: 5px;
]]

Harmony.ui.styles.manaBack = [[
    background: #00075c;
    border: 2px solid black;
    border-radius: 9px;
]]

Harmony.ui.styles.tacticActive = [[
    QLabel{
        background-color: rgba(11, 146, 34, .7);
        border-bottom: 1px solid rgba(0, 0, 0, .8);
        border-right: 1px solid rgba(0, 0, 0, .8);
        font-family: "Consolas", "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    QLabel::hover {
        background-color: rgba(255, 237, 152, .3);
        border: 1px solid rgba(255, 237, 152, .5);
    }
]]

Harmony.ui.styles.tacticInactive = [[
    QLabel{
        background-color: rgba(0, 0, 0, .5);
        border-bottom: 1px solid rgba(0, 0, 0, .8);
        border-right: 1px solid rgba(0, 0, 0, .8);
        font-family: "Consolas", "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    QLabel::hover {
        background-color: rgba(255, 237, 152, .3);
        border: 1px solid rgba(255, 237, 152, .5);
        color: black;
    }
]]

Harmony.ui.styles.topButton = [[
    QLabel{
        background-color: #043605;
        border: 1px solid #135815;
        border-radius: 3px;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-right: 5px;
        cursor: pointer;
    }
    QLabel::hover {
        border: 1px solid #66b368;
    }
]]

Harmony.ui.styles.topButtonChild = [[
    QLabel {
        background-color: rgba(0, 0, 0, .8);
        border: 1px solid #080c2f;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
    QLabel::hover {
        background-color: rgba(0, 0, 0, .8);
        border: 1px solid #4ab0ce;
        font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin-left: 2px;
        cursor: pointer;
    }
]]

Harmony.ui.styles.transparent = [[
    QLabel{
        background-color: rgba(0, 0, 0, 0);
    }
]]