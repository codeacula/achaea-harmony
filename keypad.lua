Harmony.keypad = {}

Harmony.keypad.currentTactic = nil

Harmony.keypad.combatMode = false

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

function Harmony.keypad.toggleKeypad()
	if Harmony.keypad.combatMode then
		Harmony.say("<yellow>Combat Keypad<reset> turned <red>off.")
	else
		Harmony.say("<yellow>Combat Keypad<reset> turned <green>on.")
	end
	Harmony.keypad.combatMode = not Harmony.keypad.combatMode
	raiseEvent("Harmony.keypadChanged")
end

function Harmony.keypad.processKey(key)
    local ks = Harmony.keypad

    if not Harmony.keypad.combatMode then
        Harmony.keypad.sendDirection(key)
        return
    end

    if not ks.currentTactic then
        Harmony.say(("No tactic set! Sending direction."):format(key))
        Harmony.keypad.sendDirection(key)
        return
    end

    if not ks.currentTactic[key] then
        Harmony.say(("Nothing bound to %s for combat, sending direction."):format(key))
        Harmony.keypad.sendDirection(key)
        return
    end

    if not Harmony.target.name then
        Harmony.say(("No target set! Sending direction."):format(key))
        Harmony.keypad.sendDirection(key)
        return
    end

    if type(ks.currentTactic[key]) == "string" then
        local command = ks.currentTactic[key]:gsub("&tar", Harmony.target.name)
        send(command)
        return
    elseif type(ks.currentTactic[key]) == "function" then
        local result = ks.currentTactic[key](Harmony.target.name)

        if result then send(result) end
        return
    elseif type(ks.currentTactic[key]) == "table" then
    	for _, string in ipairs(ks.currentTactic[key]) do
	        local command = string:gsub("&tar", Harmony.target.name)
        	send(command)
    	end
        return
    end
end

function Harmony.keypad.sendDirection(dir)
    if dir == "." and keneanung then
        keneanung.bashing.checkingIH = true
    end

    send(Harmony.keypad.keysToDirections[dir])
end