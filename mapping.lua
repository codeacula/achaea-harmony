Harmony.mapping = {}

Harmony.mapping.autoExplore = false
Harmony.mapping.byEnvironment = {}
Harmony.mapping.dataname = "harmonyExplored"
Harmony.mapping.exploring = true
Harmony.mapping.rooms = {}
Harmony.mapping.settings = {
    rooms = {}
}
Harmony.mapping.settingsFile = "mapper-settings.json"
Harmony.mapping.walkingTo = nil

-- Clears out the room we're walking to
function Harmony.mapping.arrived()
    if Harmony.mapping.walkingTo then
        Harmony.mapping.walkingTo = nil
        Harmony.say("We're here!")
    end
end
registerAnonymousEventHandler("mmapper arrived", "Harmony.mapping.arrived")

function Harmony.mapping.buildCache()
    local rooms = getRooms()

    for roomNum, roomName in pairs(rooms) do


        coroutine.yield()
    end
end

-- When autoexploring, sets up going to the next location
function Harmony.mapping.exploreNext()
    if Harmony.mapping.autoExplore then
        tempTimer(.5, Harmony.mapping.gotoNextRoom)
    end
end
registerAnonymousEventHandler("mmapper arrived", "Harmony.mapping.exploreNext")

-- Makes a room object for use in the mapper
function Harmony.mapping.getRoom(roomId)
    if roomId == nil then return nil end

    roomId = ""..roomId..""

    if Harmony.mapping.settings.rooms[roomId] then
        return Harmony.mapping.settings.rooms[roomId]
    end

    Harmony.mapping.settings.rooms[roomId] = {

        explored = false,
        id = roomId,
        tags = {}
    }

    return Harmony.mapping.settings.rooms[roomId]
end

function Harmony.mapping.getSettings()
    local saveFile = io.open(Harmony.getPath(Harmony.mapping.settingsFile), "r")

    if not saveFile then
        Harmony.mapping.saveSettings()
        saveFile = assert(io.open(Harmony.getPath(Harmony.mapping.settingsFile), "r"))
    end

    local settingString = saveFile:read("*a")
    saveFile:close()

    Harmony.mapping.settings = yajl.to_value(settingString)
end

-- Takes us to the next room
function Harmony.mapping.gotoNextRoom()
	local areaId = getRoomArea(mmp.currentroom)
	local roomList = getAreaRooms(areaId)

	table.sort(roomList)

	for _, id in pairs(roomList) do
		if not Harmony.mapping.haveExploredRoom(id) and not roomLocked(id) and mmp.getPath(mmp.currentroom, id) then
			Harmony.say(string.format("Going to %s (%s)", getRoomName(id), id))
			Harmony.mapping.walkingTo = id
			mmp.gotoRoom(id)
			return
		end
	end

	Harmony.say("No unexplored rooms the mapper can path to.")
	return
end

-- Checks to see if we explored the provided room ID
function Harmony.mapping.haveExploredRoom(roomId)
    local room = Harmony.mapping.getRoom(roomId)
    return room.explored == true
end

-- Marks a room as locked
function Harmony.mapping.lockRoom(id)
	lockRoom(id, true)
	Harmony.say(string.format("Locked %s (%s)", getRoomName(id) or "(Unknown)", id))
end

function Harmony.mapping.markExplored(roomId)
    local room = Harmony.mapping.getRoom(roomId)
    room.explored = true
    Harmony.mapping.saveSettings()
end

-- Shows us all the unexplored rooms in the area
function Harmony.mapping.printUnexploredRooms()
    local areaId = getRoomArea(mmp.currentroom)
    local roomList = getAreaRooms(areaId)

    local unexploredRooms = {}

	for _, id in pairs(roomList) do
		if not Harmony.mapping.haveExploredRoom(id) then
			table.insert(unexploredRooms, { id = id, name = getRoomName(id)})
		end
	end

    Harmony.say("Unexplored rooms:")
    for _, i in ipairs(unexploredRooms) do
        cecho(string.format("<yellow>%s<reset> - <pink>%s\n", i.id, i.name))
    end
end

-- Locks a room when we are autowalking and the door is locked
function Harmony.mapping.roomLocked()
	if Harmony.mapping.walkingTo then
		Harmony.mapping.lockRoom(Harmony.mapping.walkingTo)
		Harmony.mapping.walkingTo = nil
		return
	end
end

-- Save the current map settings to 
function Harmony.mapping.saveSettings()
    local saveFile = assert(io.open(Harmony.getPath(Harmony.mapping.settingsFile), "w+"))
    saveFile:write(yajl.to_string(Harmony.mapping.settings))
    saveFile:flush()
    saveFile:close()
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

    -- Update the environment
    local currentRoom = Harmony.mapping.getRoom(gmcp.Room.Info.num)

    currentRoom.environment = gmcp.Room.Info.environment or ""

    if Harmony.mapping.exploring and not Harmony.mapping.haveExploredRoom(gmcp.Room.Info.num) then
        Harmony.mapping.markExplored(gmcp.Room.Info.num)
        
        Harmony.say(string.format("Explored %s (%s)", gmcp.Room.Info.name, gmcp.Room.Info.num))
    end
    Harmony.mapping.saveSettings()
end
registerAnonymousEventHandler("gmcp.Room.Info", "Harmony.mapping.updateRoom")

-- Load the settings
Harmony.mapping.getSettings()

local cacheCoroutine = cacheCoroutine or coroutine.create(Harmony.mapping.buildCache)

local continueProcessing = coroutine.resume(cacheCoroutine)

while continueProcessing do
    continueProcessing = coroutine.resume(cacheCoroutine)
end