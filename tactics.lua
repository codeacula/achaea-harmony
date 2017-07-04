Harmony.tactics = {}

Harmony.tactics.regsiteredTactics = {}

-- Register a tactic for use later
function Harmony.tactics.register(name, tactics)
    if not name then Harmony.say("You need to provide a name.") end

    if not tactics then Harmony.say("We need some tactics to use.") end

    Harmony.tactics.regsiteredTactics[name] = tactics
    Harmony.say("Registered the <gold>%s<rteset> tactic!")
    raiseEvent("Harmony.tacticRegistered", name)
end

function Harmony.tactics.switchTactic(name)
    if not Harmony.tactics.regsiteredTactics[name] then
        Harmony.say("<red>That tactic does not exist.<reset>")
        return
    end

    Harmony.keypad.currentTactic = Harmony.tactics.regsiteredTactics[name]
    
    raiseEvent("Harmony.tacticSwitched", name)
end