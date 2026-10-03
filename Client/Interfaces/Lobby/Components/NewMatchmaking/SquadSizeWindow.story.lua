-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.SquadSizeWindow.story
-- Decompile time: 3.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local MatchmakingTrialData = require(script.Parent.MatchmakingTrialData)
local SquadSizeWindow = require(script.Parent.SquadSizeWindow)
local createElement = React.createElement
local useState = React.useState
local u39 = {
    "Survival / Easy",
    "Survival / Casual",
    "Survival / Intermediate",
    "Survival / Molten",
    "Survival / Fallen",
    "Survival / Frost",
    "Survival / Hardcore",
    "Survival / Voidcore",
    "Arcade / Trial",
    "Arcade / Pizza Party",
    "Arcade / Badlands II",
    "Arcade / Polluted Wasteland II",
}
local u52 = {
    ["Survival / Easy"] = {modeId = "easy", modeTab = "Survival"},
    ["Survival / Casual"] = {modeId = "casual", modeTab = "Survival"},
    ["Survival / Intermediate"] = {modeId = "intermediate", modeTab = "Survival"},
    ["Survival / Molten"] = {modeId = "molten", modeTab = "Survival"},
    ["Survival / Fallen"] = {modeId = "fallen", modeTab = "Survival"},
    ["Survival / Frost"] = {modeId = "frost", modeTab = "Survival"},
    ["Survival / Hardcore"] = {modeId = "hardcore", modeTab = "Survival"},
    ["Survival / Voidcore"] = {modeId = "voidcore", modeTab = "Survival"},
    ["Arcade / Trial"] = {modeId = "trial", modeTab = "Arcade"},
    ["Arcade / Pizza Party"] = {modeId = "pizza-party", modeTab = "Arcade"},
    ["Arcade / Badlands II"] = {modeId = "badlands-ii", modeTab = "Arcade"},
    ["Arcade / Polluted Wasteland II"] = {modeId = "polluted-wasteland", modeTab = "Arcade"},
}
local v1 = {
    Gamemode = UILabs.Choose(u39),
    MaxPlayers = UILabs.Slider(4, 1, 4, 1),
    CurrentPartySize = UILabs.Slider(1, 1, 4, 1),
    InitialSelection = UILabs.Choose({"None", "Solo", "Duo", "Trio", "Quad"}),
}

local function resolveInitialSelection(a1) -- Line: 113 -- types: a1: string
    if a1 == "Solo" then
        return "solo"
    end
    if a1 == "Duo" then
        return "duo"
    end
    if a1 == "Trio" then
        return "trio"
    end
    if a1 == "Quad" then
        return "quad"
    end
    return nil
end

local function SquadSizePreview(a1) -- Line: 127
    -- upvalues: u52 (val), u39 (val), MatchmakingTrialData (val), MatchmakingModel (val), useState (val)
    -- upvalues: createElement (val), MatchmakingStyle (val), SquadSizeWindow (val)
    local v1 = u52[a1.controls.Gamemode] or u52[u39[1]]
    local v2 = if v1.modeId ~= "trial" then MatchmakingModel.findMode(v1.modeTab, v1.modeId) else MatchmakingTrialData.resolve({mapName = "Forgetten Docks", trialName = "HiddenEnemies"})
    local v3 = math.clamp(math.floor(a1.controls.CurrentPartySize), 1, 4)
    local v4 = math.clamp(math.floor(a1.controls.MaxPlayers), 1, 4)
    local InitialSelection = a1.controls.InitialSelection
    local v5, v6 = useState(if InitialSelection ~= "Solo" then if InitialSelection ~= "Duo" then if InitialSelection ~= "Trio" then if InitialSelection ~= "Quad" then nil else "quad" else "trio" else "duo" else "solo")
    assert(v2, (("Missing squad-size Story mode: %*"):format(a1.controls.Gamemode)))
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = MatchmakingStyle.colors.background,
        Size = UDim2.fromScale(1, 1),
    }, {
        BackgroundGradient = createElement("UIGradient", {
            Rotation = 8,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, MatchmakingStyle.colors.backgroundGradientStart),
                ColorSequenceKeypoint.new(0.48, MatchmakingStyle.colors.background),
                (ColorSequenceKeypoint.new(1, MatchmakingStyle.colors.backgroundGradientEnd)),
            }),
        }),
        Window = createElement(SquadSizeWindow, {
            currentPartySize = v3,
            maxPlayers = v4,
            modeEntry = v2,
            onBack = function() end,
            onClose = function() end,
            onSquadSizeActivated = v6,
            selectedSizeId = v5,
        }),
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v1,
    story = function(a1) -- Line: 167 -- upvalues: createElement (val), SquadSizePreview (val) -- types: a1: table
        local v1 = ("%*:%*:%*:%*"):format(a1.controls.Gamemode, a1.controls.InitialSelection, a1.controls.MaxPlayers, a1.controls.CurrentPartySize)
        local v2 = createElement
        local v3 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
        local v4 = {}
        local v5 = ("Preview_%*"):format(v1)
        v4[v5] = (createElement(SquadSizePreview, a1))
        return v2("Frame", v3, v4)
    end,
}