-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.MissionList
-- Decompile time: 5.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local StoryMissionAvailability = require(ReplicatedStorage.Shared.Modules.StoryMissionAvailability)
local MissionEntry = require(script.Parent.MissionEntry)
local createElement = React.createElement
local useState = React.useState
return function(a1) -- Line: 30
    -- upvalues: useState (val), createElement (val), React (val), StoryMissionAvailability (val), MissionEntry (val)
    local v1, v2, v3, v4, v5, v6
    local progress = a1.progress
    local v7, u5 = useState(0)

    local function isMissionCompleted(a1_2) -- Line: 34 -- upvalues: progress (val), a1 (val) -- types: a1_2: number
        local v1 = progress and progress.Chapters[a1.chapter]
        local v2 = false
        if v1 ~= nil then
            v2 = v1.Missions[a1_2] ~= nil
        end
        return v2
    end

    local v8 = {}
    local v9 = createElement
    local v10 = {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.03, 0),
    }

    v10[React.Change.AbsoluteContentSize] = function(a1) -- Line: 44 -- upvalues: u5 (val) -- types: a1: userdata
        local Parent = a1.Parent
        u5((math.ceil(a1.AbsoluteContentSize.Y + (if not Parent then 0 else Parent.AbsoluteSize.Y * 0.056))))
    end

    v8.UIListLayout = v9("UIListLayout", v10)
    v8.UIPadding = createElement("UIPadding", {
        PaddingTop = UDim.new(0.02, 0),
        PaddingBottom = UDim.new(0.003, 0),
        PaddingLeft = UDim.new(0.033, 0),
        PaddingRight = UDim.new(0.033, 0),
    })
    local missions = a1.missions or {}
    local v11 = #missions
    for i = 1, v11 do
        v1 = missions[i]
        v2 = false
        if a1.chapterDefinition ~= nil then
            v2 = StoryMissionAvailability.isMissionReleased(a1.chapterDefinition, i, a1.nowTimestamp)
        end
        v3 = not v2
        if not v3 then
            v3 = false
            if i > 1 then
                v5 = i - 1
                v6 = progress and progress.Chapters[a1.chapter]
                v4 = false
                if v6 ~= nil then
                    v4 = v6.Missions[v5] ~= nil
                end
                v3 = not v4
            end
        end
        v4 = ("Mission_%*"):format(i)
        v8[v4] = (createElement(MissionEntry, {
            title = v1.Title,
            subtitle = ("Mission %*"):format(i),
            map = v1.Map,
            selected = i == a1.selectedMission,
            locked = v3,
            layoutOrder = i,
            onActivate = function() -- Line: 81 -- upvalues: a1 (val), i (val)
                a1.onSelect(i)
            end,
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.009, 0.019),
        Size = UDim2.fromScale(0.262, 0.823),
    }, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.018, 0)}),
        List = createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            ScrollBarThickness = 5,
            AutomaticCanvasSize = Enum.AutomaticSize.None,
            CanvasSize = UDim2.fromOffset(0, v7),
            ElasticBehavior = Enum.ElasticBehavior.Never,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Size = UDim2.fromScale(1, 1),
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
        }, v8),
    })
end