local itemService = {}

itemService.pickingUp = false

itemService.pickupItems = {
	["a chipped tangerine shard"] = true,
	["a jagged crimson shard"] = true,
	["a smooth sable shard"] = true,
	["some gold sovereigns"] = true

}

function itemService.checkPickup()
	if not Harmony.items.pickingUp then return end

	if gmcp.Char.Items.List.location ~= "room" then return end

	for _, item in ipairs(gmcp.Char.Items.List.items) do
		if itemService.pickupItems[item.name] then
			send(string.format("get %s", item.id))
		end
	end
end

function itemService.togglePickup()
	if Harmony.items.pickingUp then
		Harmony.say("Will no longer auto-pickup shards and gold.")
		Harmony.items.pickingUp = false
	else
		Harmony.say("Will now auto-pickup shards and gold.")
		Harmony.items.pickingUp = true
	end
end

if not Harmony.items then Harmony.items = itemService end
