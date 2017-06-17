local mapperService = {}

mapperService.dataname = "harmonyExplored"
mapperService.exploring = false
mapperService.walkingTo = nil

-- Clears out the room we're walking to
function mapperService.arrived()
	if mapperService.walkingTo then
		mapperService.walkingTo = nil
		Harmony.say("We're here!")
	end
end

-- When autoexploring, sets up going to the next location
function mapperService.exploreNext()
    if mapperService.autoExplore then
        tempTimer(.5, mapperService.gotoNextRoom)
    end
end

-- Takes us to the next room
function mapperService.gotoNextRoom()
	local areaId = getRoomArea(mmp.currentroom)
	local roomList = getAreaRooms(areaId)

	table.sort(roomList)

	for _, id in pairs(roomList) do
		if getRoomUserData(id, mapperService.dataname) == "" and not roomLocked(id) and mmp.getPath(mmp.currentroom, id) then
			Harmony.say(string.format("Going to %s (%s)", getRoomName(id), id))
			mapperService.walkingTo = id
			mmp.gotoRoom(id)
			return
		end
	end

	Harmony.say("No unexplored rooms the mapper can path to.")
	return
end

-- Marks a room as locked
function mapperService.lockRoom(id)
	lockRoom(id, true)
	Harmony.say(string.format("Locked %s (%s)", getRoomName(id), id))
end

-- Shows us all the unexplored rooms in the area
function mapperService.printUnexploredRooms()
	local areaId = getRoomArea(mmp.currentroom)
	local roomList = getAreaRooms(areaId)

	local unexploredRooms = {}

	table.sort(unexploredRooms, function(t1, t2) return tonumber(t1.id) < tonumber(t2.id) end)

	for _, id in pairs(roomList) do
		if getRoomUserData(id, mapperService.dataname) == "" then
			table.insert(unexploredRooms, { id = id, name = getRoomName(id)})
		end
	end

	table.sort(unexploredRooms, function(t1, t2) return tonumber(t1.id) < tonumber(t2.id) end)

	Harmony.say("Unexplored rooms:")
	for _, i in ipairs(unexploredRooms) do
		cecho(string.format("<yellow>%s<reset> - <pink>%s\n", i.id, i.name))
	end
end

-- Locks a room when we are autowalking and the door is locked
function mapperService.roomLocked()
	if mapperService.walkingTo then
		mapperService.lockRoom(mapperService.walkingTo)
		mapperService.walkingTo = nil
		return
	end
end

-- Turns on/off auto-exploration
function mapperService.toggleAutoexplore()
    if mapperService.autoExplore then
        Harmony.say("Will not auto explore rooms.")
        mapperService.autoExplore = false
    else
        Harmony.say("Now auto exploring rooms.")
        mapperService.autoExplore = true
    end
end

-- Turns on/off exploration
function mapperService.toggleExploring()
	if mapperService.exploring then
		Harmony.say("Will not mark explored rooms.")
		mapperService.exploring = false
	else
		Harmony.say("Now marking explored rooms.")
		mapperService.exploring = true
	end
end

-- Updates the room as being visited
function mapperService.updateRoom()
	if not mapperService.exploring then return end

	local explored = getRoomUserData(gmcp.Room.Info.num, mapperService.dataname)

	if explored == "" then
		setRoomUserData(gmcp.Room.Info.num, mapperService.dataname, "1")
		Harmony.say(string.format("Explored %s (%s)", gmcp.Room.Info.name, gmcp.Room.Info.num))
	end
end

if not Harmony.mapping then Harmony.mapping = mapperService end