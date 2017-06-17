local mapperService = {}

Harmony.loadFile("room.lua")

mapperService.dataname = "harmonyExplored"
mapperService.exploring = false
mapperService.locked = "harmonyLocked"
mapperService.rooms = {}
mapperService.walkingTo = nil

function mapperService.arrived()
    if mapperService.walkingTo then
        mapperService.walkingTo = nil
        Harmony.say("We're here!")
    end
end
registerAnonymousEventHandler("mmapper arrived", "mapperService.arrived")

function mapperService.createRoom(id)
    id = tonumber(id)

    if not id then return end

    local newRoom = Room.new(id)

    mapperService.rooms[id] = newRoom

    mapperService.saveData()

    return newRoom
end

function mapperService.getRoom(id)

    id = tonumber(id)

    if not id then return end

    return mapperService.rooms[id]
end

function mapperService.gotoNextRoom()
    local areaId = getRoomArea(mmp.currentroom)
    local roomList = getAreaRooms(areaId)

    table.sort(roomList)

    for _, id in pairs(roomList) do
        local theRoom = mapperService.getRoom(id) or mapperService.createRoom(id)
        
        if theRoom and not theRoom.explored and not theRoom.locked and mmp.getPath(mmp.currentroom, id) then
            Harmony.say(string.format("Going to %s (%s)", getRoomName(id), id))
            mapperService.walkingTo = id
            mmp.gotoRoom(id)
            return
        end
    end

    Harmony.say("No unexplored rooms the mapper can path to.")
    return
end

function mapperService.loadData()
    mapperService.rooms = {}

    local currentRoom = nil
    for line in io.lines(Harmony.getPath("map_data.txt")) do
        if line:match("^%[(.*)%]$") then
            local match = line:match("^%[(.*)%]$")

            currentRoom = mapperService.createRoom(match)
        elseif line == "explored" and currentRoom then
            currentRoom.explored = true
        elseif line == "locked" and currentRoom then
            currentRoom.locked = true
        end
        
    end

    Harmony.say("Map data loaded.")
    return false
end

function mapperService.lockRoom(roomNum)
    local theRoom = mapperService.getRoom(roomNum) or mapperService.createRoom(roomNum)

    if not theRoom then
        Harmony.say("No room found to lock? What!?")
        return
    end

    if not theRoom.locked then
        theRoom.locked = true
        Harmony.say(string.format("Locked %s (%s)", getRoomName(roomNum), roomNum))
    else
        theRoom.locked = false
        Harmony.say(string.format("Unlocked %s (%s)", getRoomName(roomNum), roomNum))
    end

    mapperService.saveData()
end

function mapperService.printUnexploredRooms()
    local areaId = getRoomArea(mmp.currentroom)
    local roomList = getAreaRooms(areaId)

    local unexploredRooms = {}

    for _, id in pairs(roomList) do
        local theRoom = mapperService.getRoom(id) or mapperService.createRoom(id)

        if theRoom and not theRoom.explored and not theRoom.locked then
            table.insert(unexploredRooms, { id = id, name = getRoomName(id)})
        end
    end

    table.sort(unexploredRooms, function(t1, t2) return tonumber(t1.id) < tonumber(t2.id) end)

    Harmony.say("Unexplored rooms:")
    for _, i in ipairs(unexploredRooms) do
        cecho(string.format("<yellow>%s<reset> - <pink>%s\n", i.id, i.name))
    end

    mapperService.saveData()
end

function mapperService.roomLocked()
    if not mapperService.walkingTo then return end

    local theRoom = mapperService.getRoom(mapperService.walkingTo) or mapperService.createRoom(mapperService.walkingTo)

    mapperService.walkingTo = nil

    if not theRoom then return true end

    theRoom.locked = true
    Harmony.say(string.format("Locked %s (%s)", getRoomName(mapperService.walkingTo), mapperService.walkingTo))
    mapperService.saveData()
end

function mapperService.saveData()
    local saveFile = assert(io.open(Harmony.getPath("map_data.txt"), "w+"))

    for id, roomData in pairs(mapperService.rooms) do
        roomData:saveData(saveFile)
    end
    
    saveFile:flush()
    saveFile:close()
    return false
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

    -- Try to get the room
    local theRoom = mapperService.getRoom(gmcp.Room.Info.num) or mapperService.createRoom(gmcp.Room.Info.num)

    if theRoom.explored then return end

    theRoom.explored = true
    mapperService.saveData()
    Harmony.say(string.format("Explored %s (%s)", gmcp.Room.Info.name, gmcp.Room.Info.num))
end

if not Harmony.mapping then 
    Harmony.mapping = mapperService
    mapperService.loadData()
end