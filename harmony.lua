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

function Harmony.getPath(fileName)
    return getMudletHomeDir() .. _sep .. "harmony" .. _sep ..fileName
end

function Harmony.loadFile(fileName)
    dofile(Harmony.getPath(fileName))
end

function Harmony.printCommands()

end

function Harmony.say(text)
    cecho("\n <WhiteSmoke>|<DarkGreen>Harmony<WhiteSmoke>| <reset>"..text.."\n")
end

Harmony.loadFile("hunting.lua")
Harmony.loadFile("mapping.lua")
Harmony.loadFile("refills.lua")

raiseEvent("Harmony.loaded")