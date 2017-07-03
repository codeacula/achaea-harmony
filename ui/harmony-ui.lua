function px(amount)
    return amount.."px"
end

Harmony.ui = {}
Harmony.ui.settings = {}
Harmony.ui.side = {
    bottom = {},
    left = {},
    right = {},
    top = {}
}

-- The actual game window
Harmony.ui.window = {}
Harmony.ui.window.width, Harmony.ui.window.height = getMainWindowSize()

-- All the windows by name
Harmony.ui.windows = Harmony.ui.windows or {}

function Harmony.ui.getPath(fileName)
    return getMudletHomeDir().._sep.."harmony".._sep.."ui".._sep..fileName
end

function Harmony.ui.getSettings()
    local saveFile = assert(io.open(Harmony.ui.getPath("settings.json"), "r"))
    local settingString = saveFile:read("*a")
    saveFile:close()

    Harmony.ui.settings = yajl.to_value(settingString)
end

function Harmony.ui.hide()
    Harmony.ui.settings.hide = true
    Harmony.ui.unload()

    setBorderBottom(0)
    setBorderTop(0)
    setBorderLeft(0)
    setBorderRight(0)

    Harmony.ui.saveSettings()
end

function Harmony.ui.load()
    Harmony.ui.getSettings()

    -- Adjust the borders first
    setBorderBottom(Harmony.ui.settings.border.bottom)
    setBorderTop(Harmony.ui.settings.border.top)
    setBorderLeft(Harmony.ui.settings.border.left)
    setBorderRight(Harmony.ui.settings.border.right)

    raiseEvent("Harmony.ui.loadingContainers")
    Harmony.ui.loadFile("containers.lua")
    raiseEvent("Harmony.ui.containersLoaded")


    raiseEvent("Harmony.ui.loadingStyles")
    Harmony.ui.loadFile("styles.lua")
    raiseEvent("Harmony.ui.stylesLoaded")


    Harmony.ui.loadFile("callbacks.lua")

    Harmony.ui.loadFile("sides/top.lua")

    Harmony.ui.loadFile("sides/bottom.lua")

    Harmony.ui.loadFile("sides/left.lua")

    Harmony.ui.loadFile("sides/right.lua")
    Harmony.ui.loadFile("chat.lua")
    Harmony.ui.loadFile("settings.lua")
    Harmony.ui.loadFile("maps.lua")

    if not Harmony.ui.settings.sides.top then
        Harmony.ui.side.top.container:hide()
        setBorderTop(0)
    end

    if not Harmony.ui.settings.sides.bottom then
        Harmony.ui.side.bottom.container:hide()
        setBorderBottom(0)
    end

    if not Harmony.ui.settings.sides.right then
        Harmony.ui.side.right.container:hide()
        Harmony.ui.side.right.mapContainer:hide()
        Harmony.ui.maps.mudletMap:hide()
        setBorderRight(0)
    end

    if not Harmony.ui.settings.sides.left then
        Harmony.ui.side.left.container:hide()
        setBorderLeft(0)
    end

    Harmony.ui.callbacks.updateTopBar()
    
    Harmony.ui.say("UI Loaded")
    raiseEvent("Harmony.ui.loaded")
end

function Harmony.ui.loadFile(fileName)
    dofile(Harmony.ui.getPath(fileName))
end

function Harmony.ui.saveSettings()
    local saveFile = assert(io.open(Harmony.ui.getPath("settings.json"), "w+"))
    saveFile:write(yajl.to_string(Harmony.ui.settings))
    saveFile:flush()
    saveFile:close()
end

function Harmony.ui.say(text)
    cecho("\n <plum>((<DarkGreen>Harmony<plum>)) <reset>"..text.."\n")
end

function Harmony.ui.setBorder(pos, amount)
    if not Harmony.ui.settings.border[pos] then
        Harmony.ui.say(("There's no border position for %s"):format(pos))
    end

    Harmony.ui.settings.border[pos] = tonumber(amount)

    Harmony.ui.say(("%s border set to %spx"):format(pos, amount))
    Harmony.ui.saveSettings()
    Harmony.ui.unload()
    Harmony.ui.load()
end

function Harmony.ui.unload()
    for name, window in ipairs(Harmony.ui.windows) do
        window:hide()

        echo(name)
    end
    
    Harmony.ui.windows = {}
end

Harmony.ui.say("Harmony.ui resetting.")

if not io.exists(Harmony.ui.getPath("settings.json")) then
    Harmony.ui.settings = {
        border = {
            top = 50,
            bottom = 20,
            left = 200,
            right = 600
        },
        buttonHeight = 35,
        buttonRows = 8,
        channels = {
            ["^tell %a+$"] = "Tells",
            armytell = "City",
            ct = "City",
            ["^clt%d+$"] = "Clans",
            hnt = "House",
            ht = "House",
            party = "Party"
        },
        sides = {
            top = true,
            bottom = true,
            left = false,
            right = true
        },
        tabs = {
            "Important",
            "Party",
            "Tells",
            "City",
            "Clans",
            "House"
        },
        topButtonwidth = 20
    }

    Harmony.ui.saveSettings()
else
    Harmony.ui.getSettings()
end

Harmony.ui.load()