if Harmony then return end

local _sep
if string.char(getMudletHomeDir():byte()) == "/" then 
    _sep = "/" 
else
    _sep = "\\" 
end

Harmony = Harmony or {}

raiseEvent("Harmony.loading")

Harmony.announceChannels = { "pt", "art" }
Harmony.commandGroups = {}
Harmony.commandGroupCache = {}

function Harmony.addCommand(group, comm, desc)
    if not Harmony.commandGroupCache[group] then
        local newGroup = {
            name = group,
            commands = {}
        }

        table.insert(Harmony.commandGroups, newGroup)
        Harmony.commandGroupCache[group] = newGroup
    end

    table.insert(Harmony.commandGroupCache[group].commands, { command = comm, desc = desc })
end

function Harmony.announce(text)
    for _, channel in ipairs(Moon.announceChannels) do
        send(("%s %s"):format(channel, text))
    end
end

function Harmony.getPath(fileName)
    return getMudletHomeDir() .. _sep .. "harmony" .. _sep ..fileName
end

function Harmony.loadFile(fileName)
    dofile(Harmony.getPath(fileName))
end

function Harmony.printCommands()
    table.sort(Harmony.commandGroups, function(t1, t2) return t1.name <= t2.name end)

    Harmony.say("Here's the currently available commands")

    for _, group in ipairs(Harmony.commandGroups) do
        cecho(string.format("<HotPink>Category: <ForestGreen>%s\n", group.name))
        
        table.sort(group.commands, function(t1, t2) return t1.command <= t2.command end)

        for _, command in ipairs(group.commands) do
            cecho(string.format("<yellow>%s<white> - <pink>%s\n", command.command, command.desc))
        end
        cecho("\n")
    end
end

function Harmony.say(text)
    cecho("\n <WhiteSmoke>|<DarkGreen>Harmony<WhiteSmoke>| <reset>"..text.."\n")
end

function Harmony.turnOnChat()
    gmod.enableModule("harmony", "Comm.Channel")
    sendGMCP("Core.Supports.Add [ \"Comm.Channel 1\" ]")
    Harmony.say("Trying to make the chat start.")
end

Harmony.loadFile("keypad.lua")
Harmony.loadFile("tactics.lua")
Harmony.loadFile("hunting.lua")
Harmony.loadFile("mapping.lua")
Harmony.loadFile("refills.lua")
Harmony.loadFile("combat.lua")
Harmony.loadFile("target.lua")
Harmony.loadFile("raid.lua")

-- Load UI
Harmony.loadFile("ui".._sep.."harmony-ui.lua")

Harmony.addCommand("bashing", "har autoattack", "Toggles on/off auto attack")
Harmony.addCommand("bashing", "har threshold <number>", "If you enter a room with this many mobs or more, won't autoattack")
Harmony.addCommand("mapping", "har exp", "Toggles on/off marking rooms as explored when you visit them")
Harmony.addCommand("mapping", "har autoexp", "Toggles on/off auto exploration")
Harmony.addCommand("mapping", "har unexplored", "Shows all known unexplored rooms, even if they're locked")
Harmony.addCommand("mapping", "har locked <roomid>", "Marks the provided room id as locked")
Harmony.addCommand("mapping", "har hide <roomid>", "Puts the provided room id in area -1, effectively hiding it")
Harmony.addCommand("mapping", "har er", "Looks for the first unvisited, unlocked room by id and tells the mapper to go there")
Harmony.addCommand("system", "har", "This. How did you find it??")
Harmony.addCommand("system", "har chat", "Tries to make Mudlet start accepting GMCP chat")
Harmony.addCommand("system", "har reset", "Resets and reruns the harmony scripts")
Harmony.addCommand("ui", "harui border <top|bottom|right|left> <number>", "How big do you want the border on that side?")
Harmony.addCommand("ui", "harui border <top|bottom|right|left> <on|off>", "Turns on or off the border")
Harmony.addCommand("ui", "harui reset", "Resets your Mudlet profile. Only doing this if EVERYTHING has gone bad.")
Harmony.addCommand("ui", "harui save", "Saves the current UI settings")
Harmony.addCommand("ui", "harui unload", "Attempts to unload the UI. Doesn't always work.")

raiseEvent("Harmony.loaded")
Harmony.say("Harmony loaded")

Harmony.ui.load()
gmod.enableModule("harmony", "Comm.Channel")

