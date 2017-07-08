Harmony.combat = {}

function Harmony.combat.give(what, who)
    if Harmony.target.check(who) then
        Harmony.target[what] = true
        raiseEvent("Harmony.target.gained", what, who)
        return
    end
end

function Harmony.combat.take(what, who)
    if Harmony.target.check(who) then
        Harmony.target[what] = false
        raiseEvent("Harmony.target.lost", what, who)
        return
    end
end