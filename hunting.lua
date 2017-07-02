Harmony.hunting = Harmony.hunting or {}

-- Do we automatically attack?
Harmony.hunting.attackOnUpdate = Harmony.hunting.attackOnUpdate or false

-- At this many mobs, don't auto-attack
Harmony.hunting.threshold = Harmony.hunting.threshold or 3

-- Check to see if we attack
function Harmony.hunting.checkAttack()
    if not Harmony.hunting.checkBasher() then return end

    if Harmony.hunting.attackOnUpdate
     and keneanung.bashing.attacking == 0
     and #keneanung.bashing.targetList > 0
     and #keneanung.bashing.targetList < Harmony.hunting.threshold
     then
        keneanung.bashing.attackButton()
    end
end
registerAnonymousEventHandler("gmcp.Room.Info", "Harmony.hunting.checkAttack")
registerAnonymousEventHandler("keneanung.bashing.targetList.firstChanged", "Harmony.hunting.checkAttack")

-- Make sure we have the basher
function Harmony.hunting.checkBasher()
    if not keneanung then return false end
    if not keneanung.bashing then return false end
    if not keneanung.bashing then return false end

    return true
end

-- We got a room.info
function Harmony.hunting.movedRooms()
    Harmony.hunting.roomUpdated = true
end
registerAnonymousEventHandler("gmcp.Room.Info", "Harmony.hunting.movedRooms")

-- Feeling bold or weak? Raise or lower the threshold
function Harmony.hunting.setThreshold(val)
    val = tonumber(val)

    if not val then
        Harmony.say("Threshold given wasn't a number")
        return
    end

    Harmony.hunting.threshold = tonumber(val)
    Harmony.say(string.format("Threshold set to %s", val))
end

function Harmony.hunting.toggleAutoAttack()
    if Harmony.hunting.attackOnUpdate then
        Harmony.hunting.attackOnUpdate = false
        Harmony.say("Will no longer automatically attack mobs")
    else
        Harmony.hunting.attackOnUpdate = true
        Harmony.say("Will now automatically attack mobs!")
    end

    raiseEvent("Harmony.hunter.autoAttackChanged", Harmony.hunting.attackOnUpdate)
end

Harmony.hunting = Harmony.hunting