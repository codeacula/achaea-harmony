Harmony.mapping = {}

Harmony.mapping.autoExplore = false
Harmony.mapping.dataname = "harmonyExplored"
Harmony.mapping.exploring = true
Harmony.mapping.walkingTo = nil

-- Clears out the room we're walking to
function Harmony.mapping.arrived()
    if Harmony.mapping.walkingTo then
        Harmony.mapping.walkingTo = nil
        Harmony.say("We're here!")
    end
end
registerAnonymousEventHandler("mmapper arrived", "Harmony.mapping.arrived")

function Harmony.mapping.exploreNext()
    if Harmony.mapping.autoExplore then
        tempTimer(.5, Harmony.mapping.gotoNextRoom)
    end
end
registerAnonymousEventHandler("mmapper arrived", "Harmony.mapping.exploreNext")

-- When autoexploring, sets up going to the next location
function Harmony.mapping.exploreNext()
    if Harmony.mapping.autoExplore then
        tempTimer(.5, Harmony.mapping.gotoNextRoom)
    end
end

-- Takes us to the next room
function Harmony.mapping.gotoNextRoom()
	local areaId = getRoomArea(mmp.currentroom)
	local roomList = getAreaRooms(areaId)

	table.sort(roomList)

	for _, id in pairs(roomList) do
		if getRoomUserData(id, Harmony.mapping.dataname) == "" and not roomLocked(id) and mmp.getPath(mmp.currentroom, id) then
			Harmony.say(string.format("Going to %s (%s)", getRoomName(id), id))
			Harmony.mapping.walkingTo = id
			mmp.gotoRoom(id)
			return
		end
	end

	Harmony.say("No unexplored rooms the mapper can path to.")
	return
end

-- Marks a room as locked
function Harmony.mapping.lockRoom(id)
	lockRoom(id, true)
	Harmony.say(string.format("Locked %s (%s)", getRoomName(id), id))
end

-- Marks the room we're currently in
function Harmony.mapping.markCurrentRoom(mark)
    -- Apparently the mapper keeps all the marks in a single room
    -- So, I copied this code from the alias

    local tmp = getRoomUserData(1, "gotoMapping")
    local maptable = {}

    if tmp ~= "" then
      maptable = yajl.to_value(tmp)
    end

    local location, markname = mmp.currentroom, mark

    -- can't allow mark name to ne a number - yajl then generates a giant table of null's
    if tonumber(markname) then
      mmp.echo("The mark name can't be a number.") return
    end

    maptable[markname] = location
    local tmp2 = yajl.to_string(maptable)

    if not mmp.roomexists(1) then
      addRoom(1)
    end

    setRoomUserData(1, "gotoMapping", tmp2)
    mmp.echo(string.format("Room mark for '%s' set to room %s.", markname, location))
end

-- Shows us all the unexplored rooms in the area
function Harmony.mapping.printUnexploredRooms()
    local areaId = getRoomArea(mmp.currentroom)
    local roomList = getAreaRooms(areaId)

    local unexploredRooms = {}

	for _, id in pairs(roomList) do
		if getRoomUserData(id, Harmony.mapping.dataname) == "" then
			table.insert(unexploredRooms, { id = id, name = getRoomName(id)})
		end
	end

    Harmony.say("Unexplored rooms:")
    for _, i in ipairs(unexploredRooms) do
        cecho(string.format("<yellow>%s<reset> - <pink>%s\n", i.id, i.name))
    end

    Harmony.mapping.saveData()
end

-- Locks a room when we are autowalking and the door is locked
function Harmony.mapping.roomLocked()
	if Harmony.mapping.walkingTo then
		Harmony.mapping.lockRoom(Harmony.mapping.walkingTo)
		Harmony.mapping.walkingTo = nil
		return
	end
end

-- Turns on/off auto-exploration
function Harmony.mapping.toggleAutoexplore()
    if Harmony.mapping.autoExplore then
        Harmony.say("Will not auto explore rooms.")
        Harmony.mapping.autoExplore = false
    else
        Harmony.say("Now auto exploring rooms.")
        Harmony.mapping.autoExplore = true
    end
    raiseEvent("Harmony.mapper.autoexploringChanged", Harmony.mapping.exploring)
end

-- Turns on/off exploration
function Harmony.mapping.toggleExploring()
    if Harmony.mapping.exploring then
        Harmony.say("Will not mark explored rooms.")
        Harmony.mapping.exploring = false
    else
        Harmony.say("Now marking explored rooms.")
        Harmony.mapping.exploring = true
    end

    raiseEvent("Harmony.mapper.exploringChanged", Harmony.mapping.exploring)
end

-- Updates the room as being visited
function Harmony.mapping.updateRoom()
    if not Harmony.mapping.exploring then return end

    if getRoomUserData(gmcp.Room.Info.num, Harmony.mapping.dataname) ~= "" then return end

    setRoomUserData(gmcp.Room.Info.num, Harmony.mapping.dataname, "1")
    Harmony.say(string.format("Explored %s (%s)", gmcp.Room.Info.name, gmcp.Room.Info.num))
end
registerAnonymousEventHandler("gmcp.Room.Info", "Harmony.mapping.updateRoom")