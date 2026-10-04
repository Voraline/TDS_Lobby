-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryModeWindow.story
-- Decompile time: 5.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingStoryFixtures = require(script.Parent.MatchmakingStoryFixtures)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local StoryModeData = require(script.Parent.StoryModeData)
local StoryModeWindow = require(script.Parent.StoryModeWindow)
local createElement = React.createElement
local useState = React.useState
local u54 = MatchmakingStoryFixtures.withMockStoryRewards(StoryModeData.getSections({Chapters = {{Missions = {{Stars = 2}}}}}))
local v1 = {
    SectionCount = UILabs.Slider(#u54, 0, #u54, 1),
    MaxStars = UILabs.Slider(3, 0, 5, 1),
    RevealCycle = UILabs.Slider(0, 0, 10, 1),
    Compact = UILabs.Boolean(false),
    IsPartyLeader = UILabs.Boolean(true),
}

local function getSections_2(a1) -- Line: 48 -- upvalues: u54 (val) -- types: a1: number
    local v1 = math.clamp(math.floor(a1), 0, #u54)
    local v2 = table.create(v1)
    for i = 1, v1 do
        v2[i] = u54[i]
    end
    return v2
end

local function render(a1) -- Line: 59
    -- upvalues: u54 (val), useState (val), MatchmakingModel (val), createElement (val), MatchmakingStyle (val)
    -- upvalues: StoryModeWindow (val)
    local props = a1.props
    local v1 = math.clamp(math.floor(props.controls.SectionCount), 0, #u54)
    local u15 = table.create(v1)
    for i = 1, v1 do
        u15[i] = u54[i]
    end
    local v2, u32 = useState(nil)
    local v3, u36 = useState(nil)
    local v4, v5 = MatchmakingModel.resolveStoryEntrySelection(u15, v2, v3)
    local v6 = {
        BorderSizePixel = 0,
        BackgroundColor3 = MatchmakingStyle.colors.background,
        Size = UDim2.fromScale(1, 1),
    }
    local v7 = {}
    local v8 = {BackgroundTransparency = 1}
    local v9 = if not props.controls.Compact then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, 560)
    v8.Size = v9
    v7.Window = createElement("Frame", v8, {
        Content = createElement(StoryModeWindow, {
            compact = props.controls.Compact,
            isPartyLeader = props.controls.IsPartyLeader,
            maxStars = props.controls.MaxStars,
            onCutsceneActivated = function(a1, a2, a3) -- Line: 83
                print((("Play story cutscene %*/%*"):format(a1, a2)))
                a3()
            end,
            onEntryActivated = function(a1) -- Line: 87 -- upvalues: u36 (val)
                u36(a1)
            end,
            onPlayActivated = function() end,
            getSuggestedTowerActionColor = function(a1) -- Line: 91
                return Color3.fromRGB(80, 255, 86)
            end,
            getSuggestedTowerActionText = function(a1) -- Line: 94
                return "Purchase"
            end,
            isSuggestedTowerActionDisabled = function(a1) -- Line: 97
                return false
            end,
            onSectionActivated = function(a1) -- Line: 100 -- upvalues: MatchmakingModel (upval), u15 (val), u32 (val), u36 (val)
                local v1
                _, v1 = MatchmakingModel.resolveStoryEntrySelection(u15, a1, nil)
                u32(a1)
                u36(if not v1 then nil else v1.id)
            end,
            onSuggestedTowerView = function(a1) -- Line: 107
                print((("View suggested tower %*"):format(a1)))
            end,
            revealCycle = props.controls.RevealCycle,
            sections = u15,
            selectedEntryId = if not v5 then nil else v5.id,
            selectedSectionId = if not v4 then nil else v4.id,
        }),
    })
    return createElement("Frame", v6, v7)
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v1,
    story = function(a1) -- Line: 119 -- upvalues: createElement (val), render (val) -- types: a1: table
        return createElement(render, {props = a1})
    end,
}