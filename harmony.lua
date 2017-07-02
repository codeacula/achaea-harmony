local _sep
if string.char(getMudletHomeDir():byte()) == "/" then 
    _sep = "/" 
else
    _sep = "\\" 
end

gmod.disableModule("harmony", "Comm.Channel")
gmod.enableModule("harmony", "Comm.Channel")

Harmony = Harmony or {}

raiseEvent("Harmony.loading")

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

Harmony.loadFile("keypad.lua")
Harmony.loadFile("hunting.lua")
Harmony.loadFile("mapping.lua")
Harmony.loadFile("refills.lua")

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
Harmony.addCommand("system", "har reset", "Resets and reruns the harmony scripts")

raiseEvent("Harmony.loaded")
Harmony.say("Harmony loaded")