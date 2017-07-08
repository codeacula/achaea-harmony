Harmony.tactics = {}

Harmony.tactics.regsiteredTactics = {}

function Harmony.tactics.clearTactic()
    Harmony.keypad.currentTactic = nil

    Harmony.say("<white>Tactics cleared.<reset>")
    raiseEvent("Harmony.tacticSwitched")
end

-- Register a tactic for use later
function Harmony.tactics.register(name, tactics)
    if not name then Harmony.say("You need to provide a name.") end

    if not tactics then Harmony.say("We need some tactics to use.") end

    Harmony.tactics.regsiteredTactics[name] = tactics
    Harmony.say(("Registered the <gold>%s<reset> tactic!"):format(name))
    raiseEvent("Harmony.tacticRegistered", name)
end

function Harmony.tactics.switchTactic(name)
    if not Harmony.tactics.regsiteredTactics[name] then
        Harmony.say("<red>That tactic does not exist.<reset>")
        return
    end

    Harmony.keypad.currentTactic = Harmony.tactics.regsiteredTactics[name]
    Harmony.say(("<gold>Tactics switched to <green>%s<reset>"):format(name))
    raiseEvent("Harmony.tacticSwitched", name)
end

raiseEvent("Harmony.tacticsLoaded")