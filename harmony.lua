local _sep
if string.char(getMudletHomeDir():byte()) == "/" then 
	_sep = "/" 
else
	_sep = "\\" 
end

if not Harmony then
	Harmony = {}

    function Harmony.getPath(fileName)
        return getMudletHomeDir() .. _sep .. "harmony" .. _sep ..fileName
    end

    function Harmony.loadFile(fileName)
        dofile(Harmony.getPath(fileName))
    end

	function Harmony.say(text)
		cecho("\n <WhiteSmoke>|<DarkGreen>Harmony<WhiteSmoke>| <reset>"..text.."\n")
	end

	Harmony.say("Harmony resetting.")
end

Harmony.loadFile("keypad.lua")
Harmony.loadFile("items.lua")
Harmony.loadFile("hunting.lua")
Harmony.loadFile("mapping.lua")