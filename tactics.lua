Harmony.tactics = {}

Harmony.tactics.regsiteredTactics = {}

function Harmony.tactics.clearTactic()
    Harmony.keypad.currentTactic = nil

    Harmony.say("<white>Tactics cleared.<reset>")
    raiseEvent("Harmony.tacticSwitched")
end

function Harmony.tactics.get(name)
    for _, tacticsGroup in ipairs(Harmony.tactics.regsiteredTactics) do
        if tacticsGroup.name == name then
            return tacticsGroup.tactics
        end
    end

    return nil
end

-- Register a tactic for use later
function Harmony.tactics.register(name, tactics)
    if not name then Harmony.say("You need to provide a name.") return end

    if not tactics then Harmony.say("We need some tactics to use.") return end

    if Harmony.tactics.get(name) then Harmony.say("That tactic is already registered") return end

    table.insert(Harmony.tactics.regsiteredTactics, { name = name, tactics = tactics })
    
    raiseEvent("Harmony.tacticRegistered", name)
end

function Harmony.tactics.switchTactic(name)
    local tactic = Harmony.tactics.get(name)
    if not tactic then
        Harmony.say("<red>That tactic does not exist.<reset>")
        return
    end

    Harmony.keypad.currentTactic = tactic
    Harmony.say(("<gold>Tactics switched to <green>%s<reset>"):format(name))
    raiseEvent("Harmony.tacticSwitched", name)
end

raiseEvent("Harmony.tacticsLoaded")