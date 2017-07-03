Harmony.keypad = {}

Harmony.keypad.keys = {
	["/"] = {},
	["*"] = {},
	["-"] = {},
	["+"] = {},
	["."] = {},
	["0"] = {},
	["1"] = {},
	["2"] = {},
	["3"] = {},
	["4"] = {},
	["5"] = {},
	["6"] = {},
	["7"] = {},
	["8"] = {},
	["9"] = {},
}

Harmony.keypad.keysToDirections = {
	["/"] = "in",
	["*"] = "out",
	["-"] = "up",
	["+"] = "down",
	["."] = "ih",
	["0"] = "map",
	["1"] = "sw",
	["2"] = "s",
	["3"] = "se",
	["4"] = "w",
	["5"] = "look",
	["6"] = "e",
	["7"] = "nw",
	["8"] = "n",
	["9"] = "ne",
}

Harmony.keypad.processKey = function(key)
	local ks = Harmony.keypad
	if not ks.keys[key] or #ks.keys[key] == 0 then
		send(ks.keysToDirections[key])
		return
	end

	local sendDir = true

	for _, callback in ipairs(ks.keys[key]) do
		local result = callback()

		if result ~= nil and result == false then
			local sendDir = false
		end
	end

	if not sendDir then return end

	send(ks.keysToDirections[key])
end