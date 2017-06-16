local _sep
if string.char(getMudletHomeDir():byte()) == "/" then 
	_sep = "/" 
else
	_sep = "\\" 
end

-- Loads a harmony file
function loadFile(fileName)
	dofile(getMudletHomeDir() .. _sep .. "harmony" .. _sep ..fileName)
end

if not Harmony then
	Harmony = {}

	function Harmony.say(text)
		cecho("\n <WhiteSmoke>|<DarkGreen>Harmony<WhiteSmoke>| <reset>"..text.."\n")
	end

	Harmony.say("Harmony resetting.")
end

loadFile("keypad.lua")
loadFile("items.lua")
loadFile("hunting.lua")
loadFile("mapping.lua")