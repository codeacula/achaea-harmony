function Harmony.ui.checkName(name)
    if not name then
        Harmony.ui.say("No name was given for the container.")
        return false
    end

    if Harmony.ui.windows[name] then
        Harmony.ui.say(("Element with the name of %s already created"):format(name))
        return false
    end

    return true
end

function Harmony.ui.console(params, parent)
    if not Harmony.ui.checkName(params.name) then return end

    return Harmony.ui.registerItem(params.name, Geyser.MiniConsole:new(params, parent))
end

function Harmony.ui.container(params, parent)
    if not Harmony.ui.checkName(params.name) then return end

    return Harmony.ui.registerItem(params.name, Geyser.Container:new(params, parent))
end

function Harmony.ui.hbox(params, parent)
    if not Harmony.ui.checkName(params.name) then return end

    return Harmony.ui.registerItem(params.name, Geyser.HBox:new(params, parent))
end

function Harmony.ui.label(params, parent)
    if not Harmony.ui.checkName(params.name) then return end

    return Harmony.ui.registerItem(params.name, Geyser.Label:new(params, parent))
end

function Harmony.ui.mapper(params, parent)
    if not Harmony.ui.checkName(params.name) then return end

    return Harmony.ui.registerItem(params.name, Geyser.Mapper:new(params, parent))
end

function Harmony.ui.registerItem(name, item)
    Harmony.ui.windows[name] = item
    item:show()

    return item
end

function Harmony.ui.vbox(params, parent)
    if not Harmony.ui.checkName(params.name) then return end

    return Harmony.ui.registerItem(params.name, Geyser.VBox:new(params, parent))
end