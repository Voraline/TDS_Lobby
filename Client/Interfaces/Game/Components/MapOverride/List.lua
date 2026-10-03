-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride.List
-- Decompile time: 2.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MapItem = require(script.Parent.MapItem)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local u22 = {}
u22[Enum.Difficulty.VeryEasy] = (Color3.fromRGB(79, 239, 65))
u22[Enum.Difficulty.Easy] = (Color3.fromRGB(72, 198, 95))
u22[Enum.Difficulty.Medium] = (Color3.fromRGB(0, 170, 255))
u22[Enum.Difficulty.Normal] = (Color3.fromRGB(0, 170, 255))
u22[Enum.Difficulty.Hard] = (Color3.fromRGB(255, 56, 56))
u22[Enum.Difficulty.Insane] = (Color3.fromRGB(170, 0, 255))
u22[Enum.Difficulty.Event] = (Color3.fromRGB(255, 242, 90))
local u72 = {
    [Enum.Difficulty.VeryEasy] = "Very Easy",
    [Enum.Difficulty.Easy] = "Easy",
    [Enum.Difficulty.Medium] = "Normal",
    [Enum.Difficulty.Normal] = "Normal",
    [Enum.Difficulty.Hard] = "Hard",
    [Enum.Difficulty.Insane] = "Insane",
    [Enum.Difficulty.Event] = "Event",
}
local u94 = {
    [Enum.Difficulty.VeryEasy] = 0,
    [Enum.Difficulty.Easy] = 1,
    [Enum.Difficulty.Medium] = 2,
    [Enum.Difficulty.Normal] = 2,
    [Enum.Difficulty.Hard] = 3,
    [Enum.Difficulty.Insane] = 4,
    [Enum.Difficulty.Event] = 5,
}
return function(a1) -- Line: 40
    -- upvalues: useState (val), u94 (val), createElement (val), MapItem (val), u22 (val), u72 (val), React (val)
    local v1
    local v2 = {}
    local v3, u5 = useState(Enum.AutomaticSize.Y)
    local v4, u12 = useState(UDim2.fromScale(1, 1))
    local v5, u19 = useState(UDim2.fromScale(1, 1))
    for i, j in a1.Items do
        v1 = u94[j.Difficulty] .. i
        v2[v1] = (createElement(MapItem, {
            Icon = "rbxassetid://" .. j.ImageID,
            Title = i,
            DifficultyColor = u22[j.Difficulty],
            Difficulty = u72[j.Difficulty],
            OnClick = function() -- Line: 53 -- upvalues: a1 (val), i (val)
                if a1.OnClick then
                    a1.OnClick(i)
                end
            end,
        }))
    end
    local v6 = createElement
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = a1.Position,
        Size = a1.Size,
    }
    local v8 = {
        background = createElement("Frame", {
            BackgroundTransparency = 0.3,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = v5,
        }, {
            corner = createElement("UICorner"),
            dropShadow = createElement("ImageLabel", {
                Image = "rbxassetid://9239716855",
                ImageTransparency = 0.2,
                BackgroundTransparency = 1,
                ZIndex = -1,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(14, 14, 64, 24),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 14, 1, 14),
            }),
        }),
    }
    local v9 = createElement
    local v10 = {
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
        ScrollBarThickness = 5,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Selectable = false,
        Size = v4,
        SelectionGroup = false,
        AutomaticSize = v3,
    }

    v10[React.Change.AbsoluteCanvasSize] = function(a1_2) -- Line: 100 -- upvalues: a1 (val), u5 (val), u12 (val), u19 (val) -- types: a1_2: userdata
        if a1.MaxSize < a1_2.AbsoluteCanvasSize.Y then
            u5(Enum.AutomaticSize.None)
            u12(UDim2.new(1, 0, 0, a1.MaxSize))
            u19(UDim2.new(1, 0, 0, a1.MaxSize + 5))
            return
        end
        u5(Enum.AutomaticSize.Y)
        u12(UDim2.fromScale(1, 1))
        u19(UDim2.new(1, 0, 0, a1_2.AbsoluteSize.Y + 5))
    end

    v8.content = v9("ScrollingFrame", v10, {
        padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
        }),
        gridLayout = createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(8, 8),
            CellSize = UDim2.fromOffset(98, 98),
            SortOrder = a1.SortOrder,
        }),
        React.createElement(React.Fragment, {}, v2),
    })
    return v6("Frame", v7, v8)
end