-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestObjectiveList
-- Decompile time: 1.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local QuestObjectiveRow = require(script.Parent.QuestObjectiveRow)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function(a1) -- Line: 29
    -- upvalues: ClientAdapter (val), createElement (val), QuestObjectiveRow (val)
    local v1
    local Record = a1.Record
    local v2 = ClientAdapter.getObjectives(Record)
    local v3 = a1.RowHeight or 58
    local v4 = a1.RowPadding or 8
    local v5 = a1.ListPadding or 14
    local v6 = {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, v4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        Padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v5),
            PaddingLeft = UDim.new(0, v5),
            PaddingRight = UDim.new(0, v5),
            PaddingTop = UDim.new(0, v5),
        }),
    }
    for i, j in v2 do
        v1 = ("Objective_%*"):format(i)
        v6[v1] = (createElement(QuestObjectiveRow, {
            ActiveObjectiveIndex = a1.ActiveObjectiveIndex,
            LayoutOrder = i,
            Objective = j,
            ObjectiveMode = Record.quest.objectiveMode,
            RowHeight = v3,
            ZIndex = a1.ZIndex,
        }))
    end
    local v7 = {
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BottomImage = "",
        ClipsDescendants = true,
        MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
        ScrollBarImageTransparency = 0.15,
        ScrollingEnabled = true,
        TopImage = "",
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        CanvasSize = UDim2.fromOffset(0, v5 * 2 + #v2 * v3 + math.max(#v2 - 1, 0) * v4),
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollBarThickness = a1.ScrollBarThickness or 4,
        ScrollingDirection = Enum.ScrollingDirection.Y,
    }
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v7.Size = Size
    v7.ZIndex = a1.ZIndex
    return createElement("ScrollingFrame", v7, v6)
end