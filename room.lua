-- Holds all the room data we'll use
Room = {}

Room.__index = Room
Room.__eq = function(t1, t2)
    return t1.id == t2.id
end

Room.__le = function(t1, t2)
    return t1.id <= t2.id
end

Room.__lt = function(t1, t2)
    return t1.id < t2.id
end

function Room.new(id)
    -- Set up the new room
    local newRoom = {}
    setmetatable(newRoom, Room)

    -- Did we explore the room?
    newRoom.explored = false

    -- What's the room's ID?
    newRoom.id = id

    -- Is the room locked?
    newRoom.locked = false

    return newRoom
end

function Room:saveData(saveFile)
	saveFile:write(string.format("[%s]\n", self.id))

	if self.explored then
		saveFile:write("explored\n")
	end

	if self.locked then
		saveFile:write("locked\n")
	end
end