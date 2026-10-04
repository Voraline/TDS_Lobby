-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.ObjectiveList
-- Decompile time: 12.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAdapter = require(ReplicatedStorage.Shared.Data.Quests.ClientAdapter)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local scaledStroke = StudioElements.scaledStroke
local textStroke = StudioElements.textStroke
local u34 = {
    daily = "rbxassetid://77379119157860",
    seasonal = "rbxassetid://128460064413219",
    weekly = "rbxassetid://86361624497791",
}

local function getTaskText(a1, a2, a3, a4) -- Line: 30
    -- upvalues: Comma (val)
    local v1 = string.gsub(
        string.gsub(string.gsub(a1.progressType or a1.description or a1.type or "", "^Make progress on%s+", ""), "^Complete%s+", ""),
        "%.$",
        ""
    )
    local v2 = ("%* / %*"):format(Comma((math.min(a3, a4))), (Comma(a4)))
    if v1 ~= "" and v1 ~= a2 then
        return (("%* %*"):format(v2, v1))
    end
    return v2
end

local function objectiveRow(a1) -- Line: 44
    -- upvalues: getTaskText (val), createElement (val), u34 (val), textStroke (val), scaledStroke (val)
    local Objective = a1.Objective
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.new(1, 0, 0.2, 0),
    }, {
        AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 3.5}),
        Title = createElement("TextLabel", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 1,
            TextScaled = true,
            TextSize = 20,
            TextWrapped = true,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 0, 0.08, 0),
            Size = UDim2.new(0.7609, 0, 0.3, 0),
            Text = a1.TitleText,
            TextColor3 = Color3.fromRGB(65, 65, 65),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
        }, {
            Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0.2, 0), PaddingRight = UDim.new(0.075, 0)}),
            Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
            CategoryIcon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 1,
                ZIndex = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 127),
                Image = u34[a1.GroupName or ""] or "rbxassetid://77379119157860",
                Position = UDim2.new(-0.2, 0, 0.5, 0),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.new(0.3, 0, 1.5, 0),
            }, {
                AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1, DominantAxis = Enum.DominantAxis.Height}),
            }),
        }),
        Task = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 1,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0.45, 0),
            Size = UDim2.new(0.962, 0, 0.4298, 0),
        }, {
            TextLabel = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 1,
                TextScaled = true,
                TextSize = 20,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0),
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.new(0.5, 0, 0.1, 0),
                Size = UDim2.new(1.5, 0, 0.556, 0),
                Text = getTaskText(Objective, a1.TitleText, Objective.current or 0, Objective.amount or 0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
            }, {
                Stroke = textStroke({Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
                Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 32), PaddingRight = UDim.new(0, 32)}),
            }),
            Progress = createElement("Frame", {
                BorderSizePixel = 1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 0, 0, 26),
                Size = UDim2.new(1, 0, 0, 10),
            }, {
                Stroke = scaledStroke({Thickness = 0.01, Transparency = 0, Color = Color3.fromRGB(255, 255, 255)}),
                Gradient = createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.501, Color3.fromRGB(0, 0, 0)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
                    }),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.2),
                        NumberSequenceKeypoint.new(0.5, 0.2),
                        NumberSequenceKeypoint.new(0.501, 0.5),
                        (NumberSequenceKeypoint.new(1, 0.5)),
                    }),
                }),
            }),
            Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 32), PaddingRight = UDim.new(0, 32)}),
        }),
    })
end

local function buildChildren(a1, a2) -- Line: 177
    -- upvalues: createElement (val), objectiveRow (val), ClientAdapter (val)
    local v1
    local v2 = {
        ListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    local v3 = createElement
    local v4 = {
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 8),
    }
    v2.Padding = v3("UIPadding", v4)
    v3 = 0
    if a1 then
        local v5
        v4 = nil
        v1 = nil
        local v6 = a2
        for i, j in a1.quest.objectives, v4, v1 do
            if v6 and v6 <= v3 then
                break
            end
            v3 = v3 + 1
            v5 = ("ObjectiveRow_%*"):format(i)
            v2[v5] = (objectiveRow({
                GroupName = a1.group,
                LayoutOrder = v3,
                Objective = j,
                TitleText = a1.quest.name,
            }))
        end
    end
    if v3 == 0 then
        local v7 = if not a1 then nil else ClientAdapter.getProgress(a1)
        v1 = {LayoutOrder = 1, GroupName = a1 and a1.group or nil}
        v1.Objective = {
            type = "objective",
            description = if not v7 then "No tracked quest" else v7.description,
            current = if not v7 then 0 else v7.current,
            amount = if not v7 then 0 else v7.amount,
        }
        v1.TitleText = if not a1 then "No tracked quest" else a1.quest.name
        v2.Empty = objectiveRow(v1)
    end
    return v2
end

return function(a1) -- Line: 228 -- upvalues: createElement (val), buildChildren (val) -- types: a1: table
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
    }
    local Size = a1.Size or UDim2.new(1, 0, 0.8855, 0)
    v1.Size = Size
    if a1.Scrolling == false then
        return createElement("Frame", v1, (buildChildren(a1.Record, a1.MaxRows)))
    end
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ScrollBarImageTransparency = 0.15,
        ScrollBarThickness = 4,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.fromScale(0, 0),
        ElasticBehavior = Enum.ElasticBehavior.Never,
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollingDirection = Enum.ScrollingDirection.Y,
    }
    local Size_2 = a1.Size or UDim2.new(1, 0, 0.8855, 0)
    v2.Size = Size_2
    return createElement("ScrollingFrame", v2, (buildChildren(a1.Record, a1.MaxRows)))
end