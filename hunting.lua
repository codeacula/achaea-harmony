if Harmony and Harmony.hunting then return end

local hunterService = {}

-- Do we automatically attack?
hunterService.attackOnUpdate = false

-- At this many mobs, don't auto-attack
hunterService.threshold = 3

-- Check to see if we attack
function hunterService.checkAttack()
    if not hunterService.checkBasher() then return end

    if hunterService.attackOnUpdate
     and keneanung.bashing.attacking == 0
     and #keneanung.bashing.targetList > 0
     and #keneanung.bashing.targetList < hunterService.threshold
     then
        keneanung.bashing.attackButton()
    end
end

-- Make sure we have the basher
function hunterService.checkBasher()
    if not keneanung then return false end
    if not keneanung.bashing then return false end
    if not keneanung.bashing then return false end

    return true
end

-- We got a room.info
function hunterService.movedRooms()
    hunterService.roomUpdated = true
end

-- Feeling bold or weak? Raise or lower the threshold
function hunterService.setThreshold(val)
    val = tonumber(val)

    if not val then
        Harmony.say("Threshold given wasn't a number")
        return
    end

    hunterService.threshold = tonumber(val)
    Harmony.say(string.format("Threshold set to %s", val))
end

function hunterService.toggleAutoAttack()
    if hunterService.attackOnUpdate then
        hunterService.attackOnUpdate = false
        Harmony.say("Will no longer automatically attack mobs")
    else
        hunterService.attackOnUpdate = true
        Harmony.say("Will now automatically attack mobs!")
    end

    raiseEvent("Harmony.hunter.autoAttackChanged", hunterService.attackOnUpdate)
end

Harmony.hunting = hunterService