local mapperService = {}

mapperService.dataname = "harmonyExplored"
mapperService.exploring = false
mapperService.locked = "harmonyLocked"
mapperService.walkingTo = nil

function mapperService.gotoNextRoom()
	local areaId = getRoomArea(mmp.currentroom)
	local roomList = getAreaRooms(areaId)

	table.sort(roomList)

	for _, id in pairs(roomList) do
		if getRoomUserData(id, mapperService.dataname) == "" and getRoomUserData(id, mapperService.locked) == "" and mmp.getPath(mmp.currentroom, id) then
			Harmony.say(string.format("Going to %s (%s)", getRoomName(id), id))
			mapperService.walkingTo = id
			mmp.gotoRoom(id)
			return
		end
	end

	Mapper.say("No unexplored rooms the mapper can path to.")
	return
end

function mapperService.lockRoom(roomNum)
	if getRoomUserData(roomNum, mapperService.locked) == "" then
		setRoomUserData(roomNum, mapperService.locked, "1")
		Harmony.say(string.format("Locked %s (%s)", getRoomName(roomNum), roomNum))
	else
		setRoomUserData(roomNum, mapperService.locked, "")
		Harmony.say(string.format("Unlocked %s (%s)", getRoomName(roomNum), roomNum))
	end
end

function mapperService.printUnexploredRooms()
	local areaId = getRoomArea(mmp.currentroom)
	local roomList = getAreaRooms(areaId)

	local unexploredRooms = {}

	table.sort(unexploredRooms, function(t1, t2) return tonumber(t1.id) < tonumber(t2.id) end)

	for _, id in pairs(roomList) do
		if getRoomUserData(id, mapperService.dataname) == "" and getRoomUserData(id, mapperService.locked) == "" then
			table.insert(unexploredRooms, { id = id, name = getRoomName(id)})
		end
	end

	table.sort(unexploredRooms, function(t1, t2) return tonumber(t1.id) < tonumber(t2.id) end)

	Harmony.say("Unexplored rooms:")
	for _, i in ipairs(unexploredRooms) do
		cecho(string.format("<yellow>%s<reset> - <pink>%s\n", i.id, i.name))
	end
end

function mapperService.roomLocked()
	if mapperService.walkingTo then
		setRoomUserData(mapperService.walkingTo, mapperService.locked, "1")
		Harmony.say(string.format("Locked %s (%s)", getRoomName(mapperService.walkingTo), mapperService.walkingTo))
		mapperService.walkingTo = nil
		return
	end
end

function mapperService.toggleExploring()
	if mapperService.exploring then
		Harmony.say("Will not mark explored rooms.")
		mapperService.exploring = false
	else
		Harmony.say("Now marking explored rooms.")
		mapperService.exploring = true
	end
end

function mapperService.updateRoom()
	if not mapperService.exploring then return end

	local explored = getRoomUserData(gmcp.Room.Info.num, mapperService.dataname)

	if explored == "" then
		setRoomUserData(gmcp.Room.Info.num, mapperService.dataname, "1")
		Harmony.say(string.format("Explored %s (%s)", gmcp.Room.Info.name, gmcp.Room.Info.num))
	end
end

if not Harmony.mapping then Harmony.mapping = mapperService end