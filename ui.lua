local uiService = {}

uiService.harmonyMap = nil
uiService.hideMap = false

uiService.mainContainer = Geyser.Container:new({x=0,y=0,width="100%",height="100%",name="main container"})

function uiService.addMapper()
    uiService.harmonyMap = Geyser.Mapper:new({
        name = "harmonyMap",
        x = "71.5%", y = "65%",
        width = "25%", height = "30%"
    }, uiService.mainContainer)
end

function uiService.toggleMap()
    if uiService.hideMap then
        uiService.harmonyMap:show()
        uiService.hideMap = false
    else
        uiService.harmonyMap:hide()
        uiService.hideMap = true
    end
end


if not Harmony.ui then
    Harmony.ui = uiService
    uiService.addMapper()
end