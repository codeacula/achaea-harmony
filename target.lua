Harmony.target = {}
Harmony.target.name = nil
Harmony.target.rebounding = false
Harmony.target.shield = false

function Harmony.target.check(name)
    if not Harmony.target.name then return end
    return string.lower(name) == string.lower(Harmony.target.name)
end

function Harmony.target.clear()
    Harmony.target.name = nil
    Harmony.say(("<gold>Target Cleared"):format(target))

    if Harmony.raid.leading then
        Harmony.announce(("Target Cleared"):format(target))
    end

    raiseEvent("Harmony.target.changed")
end

function Harmony.target.getApiData(name)
    local saveto = getMudletHomeDir().."/players/"..name..".json"
    local url = "http://api.achaea.com/characters/"..name..".json"
    downloadFile(saveto, url)
    Harmony.say("Updating data for "..name)
end

function Harmony.target.processApiData(_, filename)
    if not filename:find(".json", 1, true) then return end

    -- read the contents of the webpage in
    local f, s, webpage = io.open(filename)

    if f then json = f:read("*a"); io.close(f) end

    -- delete the file on disk, don't clutter
    os.remove(filename)

    -- Copied from ndb

    local playerData = yajl.to_value(json)

    local name = playerData.name
    local fullname = playerData.fullname
    local level = playerData.level
    local city = playerData.city:gsub("^%l", string.upper)
    local house = playerData.house:gsub("^%l", string.upper)
    local class = playerData.class
    local xp_rank = playerData.xp_rank
    local dragon
    local temp_name_list
    -- sometimes players, unless you're logged in, aren't visible
    if level == nil then
    temp_name_list = {{
        name = name,
        immortal = 1
    }}

    else
        if tonumber(level) > 98 then dragon = 1 else dragon = 0 end
        if tonumber(xp_rank) == 0 then xp_rank = -2 end -- unranked shows up as 0

        temp_name_list = {{
            name = name:gsub("^%l", string.upper),
            class = class:gsub("^%l", string.upper),
            dragon = dragon,
            title = fullname,
            level = level,
            immortal = 0,
            xp_rank = xp_rank and xp_rank or -1,
        }}

        if city ~= "(hidden)" then
            temp_name_list[1].city = (city ~= "(none)" and city or "rogue")
        end
        -- house info isn't shown if you're logged in to the website for some people
        if not(house == "(hidden)" or house == "(none)") then
          temp_name_list[1].guild = house
        end
    end
    db:merge_unique(ndb.db.people, temp_name_list)
    raiseEvent("NameDB finished honors")
end
registerAnonymousEventHandler("sysDownloadDone", "Harmony.target.processApiData")

function Harmony.target.set(name)
    Harmony.target.name = name
    Harmony.say(("New target: <red>%s<reset>"):format(name))

    if Harmony.raid.leading then
        Harmony.announce(("Target changed to %s"):format(name))
    end

    -- For svof and stuff
    target = name

    Harmony.target.getApiData(name)
    raiseEvent("Harmony.target.changed", name)
end