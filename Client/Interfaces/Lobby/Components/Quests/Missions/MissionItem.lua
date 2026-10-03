-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.Missions.MissionItem
-- Decompile time: 67.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local CompleteOverlay = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.Missions.CompleteOverlay)
local LockOverlay = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.Missions.LockOverlay)
local MissionBanner = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.Missions.MissionBanner)
local MissionObjective = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.Missions.MissionObjective)
local MissionRewards = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Quests.Missions.MissionRewards)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement

local function isButtonHidden(a1) -- Line: 19
    return a1.Locked or a1.Completed
end

local function isContractCompleted(a1) -- Line: 23
    local v1 = false
    if a1.Count == a1.Goal then
        v1 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
    end
    return v1
end

local function findTowerName(a1) -- Line: 27
    for i, j in a1 do
        if j.Type == "tower" then
            return j.Tower
        end
    end
    return "???"
end

return function(a1) -- Line: 83
    -- upvalues: createElement (val), CompleteOverlay (val), LockOverlay (val), MissionBanner (val)
    -- upvalues: MissionObjective (val), MissionRewards (val), Button (val), Comma (val), React (val)
    local Active_2, BackgroundColor3, CornerRadius, Gradient, Locked, Locked_2, Locked_3, Locked_4, StrokeColor, TimeExpires, Tower, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = a1.CurrentObjectiveIndex or 0
    local v11 = createElement
    local v12 = "Frame"
    local v13 = {
        BackgroundTransparency = 1,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
    }
    local v14 = {
        outline = not a1.DropShadow and a1.Active and createElement("Frame", {
            BackgroundTransparency = 1,
            BorderMode = Enum.BorderMode.Outline,
            Size = UDim2.new(1, 16, 1, 16),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {
            createElement("UICorner", {CornerRadius = UDim.new(0, 18)}),
            (createElement("UIStroke", {
                Thickness = 1,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                LineJoinMode = Enum.LineJoinMode.Round,
                Color = Color3.fromRGB(255, 255, 255),
            })),
        }),
    }
    local BackgroundImage = a1.BackgroundImage
    if BackgroundImage then
        v8 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
        }
        local BackgroundImage_4 = typeof(a1.BackgroundImage) == "number" and ("rbxassetid://%*"):format(a1.BackgroundImage) or a1.BackgroundImage
        v8.Image = BackgroundImage_4
        v8.Position = UDim2.fromScale(0.5, 0.5)
        local BackgroundImageSize = a1.BackgroundImageSize or UDim2.fromScale(1.06, 1.06)
        v8.Size = BackgroundImageSize
        BackgroundImage = createElement("ImageLabel", v8)
    end
    v14.image = BackgroundImage
    local DropShadow = a1.DropShadow and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.6,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 1, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v14.dropShadow = DropShadow
    if not a1.Completed then
        Locked = a1.Locked
        if Locked then
            v8 = {size = UDim2.new(1, 0, 1, 0), position = UDim2.new(0, 0, 0, 0)}
            v1 = nil
            for m, i5 in a1.Rewards, nil, v1 do
                if i5.Type == "tower" then
                    Tower = i5.Tower
                    v8.towerName = Tower
                    v14.overlay = (createElement(LockOverlay, v8))
                    v8 = {Size = UDim2.fromScale(1, 1)}
                    v8.BackgroundTransparency = if not a1.BackgroundImage then if not a1.Gradient then a1.BackgroundTransparency or 0.3 else 0 else 1
                    BackgroundColor3 = if a1.Gradient then Color3.new(1, 1, 1) else if not a1.BackgroundImage then a1.BackgroundColor3 or Color3.fromRGB(0, 0, 0) else Color3.new(1, 1, 1)
                    v8.BackgroundColor3 = BackgroundColor3
                    v8.BorderMode = Enum.BorderMode.Outline
                    v9 = {}
                    Active_2 = not a1.CornerRadius and a1.Active and createElement("UICorner", {CornerRadius = UDim.new(0, 16)})
                    CornerRadius = a1.CornerRadius and createElement("UICorner", {CornerRadius = UDim.new(0, a1.CornerRadius)})
                    Gradient = a1.Gradient and createElement("UIGradient", {Color = a1.Gradient, Rotation = a1.GradientRotation or 90})
                    v1 = createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        Padding = UDim.new(0, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                    })
                    v2 = not a1.Active
                    if v2 then
                        v3 = {Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual}
                        StrokeColor = a1.StrokeColor or Color3.fromRGB(162, 162, 162)
                        v3.Color = StrokeColor
                        v2 = createElement("UIStroke", v3)
                    end
                    v9[1] = Active_2
                    v9[2] = CornerRadius
                    v9[3] = Gradient
                    v9[4] = v1
                    v9[5] = v2
                    v5 = {
                        LayoutOrder = 0,
                        AnchorPoint = Vector2.new(0.5, 0),
                        Size = UDim2.new(1, 0, 0, 100),
                        Title = a1.Title,
                    }
                    TimeExpires = a1.TimeExpires and a1.TimeExpires - workspace:GetServerTimeNow()
                    v5.TimeLeft = TimeExpires
                    v5.HeaderColor = a1.HeaderColor3
                    v5.TitleColor = a1.TitleColor3
                    v5.TitleStroke = a1.TitleStroke
                    v5.TitleStrokeThickness = a1.TitleStrokeThickness
                    v5.TitlePosition = a1.TitlePosition
                    v5.HeaderStroke = a1.HeaderStroke
                    v5.HeaderStrokeThickness = a1.HeaderStrokeThickness
                    v5.HeaderPosition = a1.HeaderPosition
                    v5.HeaderFont = a1.HeaderFont
                    v5.HideGradient = a1.BackgroundImage ~= nil
                    v9.banner = createElement(MissionBanner, v5)
                    v9.objective = createElement(MissionObjective, {
                        LayoutOrder = 1,
                        Size = UDim2.new(1, 0, 0, 155),
                        Description = a1.Description,
                        Count = a1.Count,
                        Goal = a1.Goal,
                        CurrentObjectiveNum = v10,
                        NumOfObjectives = a1.NumOfObjectives,
                        StrokeColor = a1.ObjectiveStrokeColor,
                        StrokeThickness = a1.ObjectiveStrokeThickness,
                    })
                    v3 = not a1.Active and createElement(MissionRewards, {
                        LayoutOrder = 2,
                        Rewards = a1.Rewards,
                        Size = UDim2.new(1, 0, 0, 140),
                        StrokeColor = a1.RewardStrokeColor,
                        StrokeThickness = a1.RewardStrokeThickness,
                    }) or createElement("Frame", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.new(1, 0, 0, 140),
                    })
                    v9.rewards = v3
                    v9[6] = if a1.HideAbandon then nil else createElement("Frame", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 3,
                        Size = UDim2.new(1, -64, 0, 40),
                    }, {
                        createElement("Frame", {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Position = UDim2.fromScale(0.5, 0.4),
                            Size = UDim2.new(1, 0, 0, 2),
                        }, {
                            createElement("UIGradient", {
                                Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 1),
                                    NumberSequenceKeypoint.new(0.5, 0.5),
                                    (NumberSequenceKeypoint.new(1, 1)),
                                }),
                            }),
                        }),
                    })
                    if not a1.Active then
                        Locked_2 = a1.Locked or a1.Completed
                        if not Locked_2 then
                            v3 = createElement(Button, {
                                LayoutOrder = 4,
                                Icon = "rbxassetid://131637335676840",
                                IconScale = 0.75,
                                Size = UDim2.fromOffset(150, 46),
                                Color = Color3.fromRGB(10, 220, 80),
                                Text = Comma(a1.Price),
                                Clicked = function() -- Line: 249 -- upvalues: a1 (val)
                                    if a1.OnStartClicked then
                                        a1.OnStartClicked(a1.QuestId, a1.Title, a1.Price)
                                    end
                                end,
                                TextAutomaticSize = Enum.AutomaticSize.X,
                            })
                            if not v3 then
                                if a1.HideAbandon then
                                    v3 = not a1.HideAbandon
                                    if v3 then
                                        v3 = false
                                        if a1.Count == a1.Goal then
                                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                        end
                                        if v3 then
                                            Locked_4 = a1.Locked or a1.Completed
                                            v3 = not Locked_4 and createElement(Button, {
                                                LayoutOrder = 4,
                                                Text = "Claim reward",
                                                IconScale = 0.75,
                                                Size = UDim2.fromOffset(208, 46),
                                                Color = Color3.fromRGB(10, 220, 80),
                                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                    if a1.OnClaimClicked then
                                                        a1.OnClaimClicked(a1.QuestGuid)
                                                    end
                                                end,
                                                TextAutomaticSize = Enum.AutomaticSize.X,
                                            })
                                        end
                                    end
                                else
                                    v4 = false
                                    if a1.Count == a1.Goal then
                                        v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                    end
                                    if v4 then
                                        v3 = not a1.HideAbandon
                                        if v3 then
                                            v3 = false
                                            if a1.Count == a1.Goal then
                                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                            end
                                            if v3 then
                                                Locked_4 = a1.Locked or a1.Completed
                                                v3 = not Locked_4 and createElement(Button, {
                                                    LayoutOrder = 4,
                                                    Text = "Claim reward",
                                                    IconScale = 0.75,
                                                    Size = UDim2.fromOffset(208, 46),
                                                    Color = Color3.fromRGB(10, 220, 80),
                                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                        if a1.OnClaimClicked then
                                                            a1.OnClaimClicked(a1.QuestGuid)
                                                        end
                                                    end,
                                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                                })
                                            end
                                        end
                                    else
                                        Locked_3 = a1.Locked or a1.Completed
                                        if Locked_3 then
                                            v3 = not a1.HideAbandon
                                            if v3 then
                                                v3 = false
                                                if a1.Count == a1.Goal then
                                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                                end
                                                if v3 then
                                                    Locked_4 = a1.Locked or a1.Completed
                                                    v3 = not Locked_4 and createElement(Button, {
                                                        LayoutOrder = 4,
                                                        Text = "Claim reward",
                                                        IconScale = 0.75,
                                                        Size = UDim2.fromOffset(208, 46),
                                                        Color = Color3.fromRGB(10, 220, 80),
                                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                            if a1.OnClaimClicked then
                                                                a1.OnClaimClicked(a1.QuestGuid)
                                                            end
                                                        end,
                                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                                    })
                                                end
                                            end
                                        else
                                            v3 = createElement(Button, {
                                                LayoutOrder = 4,
                                                TextScaled = true,
                                                Text = "Abandon Contract",
                                                TextStrokeTransparency = 0,
                                                Size = UDim2.fromOffset(208, 46),
                                                Color = Color3.fromRGB(255, 80, 80),
                                                TextSize = UDim2.new(1, 0, 0, 24),
                                                TextPadding = {Right = UDim.new(0, 16), Left = UDim.new(0, 16)},
                                                Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                                    if a1.OnAbandonClicked then
                                                        a1.OnAbandonClicked(a1.QuestGuid, true)
                                                    end
                                                end,
                                            })
                                            if not v3 then
                                                v3 = not a1.HideAbandon
                                                if v3 then
                                                    v3 = false
                                                    if a1.Count == a1.Goal then
                                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                                    end
                                                    if v3 then
                                                        Locked_4 = a1.Locked or a1.Completed
                                                        v3 = not Locked_4 and createElement(Button, {
                                                            LayoutOrder = 4,
                                                            Text = "Claim reward",
                                                            IconScale = 0.75,
                                                            Size = UDim2.fromOffset(208, 46),
                                                            Color = Color3.fromRGB(10, 220, 80),
                                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                                if a1.OnClaimClicked then
                                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                                end
                                                            end,
                                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                                        })
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        elseif a1.HideAbandon then
                            v3 = not a1.HideAbandon
                            if v3 then
                                v3 = false
                                if a1.Count == a1.Goal then
                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                end
                                if v3 then
                                    Locked_4 = a1.Locked or a1.Completed
                                    v3 = not Locked_4 and createElement(Button, {
                                        LayoutOrder = 4,
                                        Text = "Claim reward",
                                        IconScale = 0.75,
                                        Size = UDim2.fromOffset(208, 46),
                                        Color = Color3.fromRGB(10, 220, 80),
                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                            if a1.OnClaimClicked then
                                                a1.OnClaimClicked(a1.QuestGuid)
                                            end
                                        end,
                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                    })
                                end
                            end
                        else
                            v4 = false
                            if a1.Count == a1.Goal then
                                v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                            end
                            if v4 then
                                v3 = not a1.HideAbandon
                                if v3 then
                                    v3 = false
                                    if a1.Count == a1.Goal then
                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                    end
                                    if v3 then
                                        Locked_4 = a1.Locked or a1.Completed
                                        v3 = not Locked_4 and createElement(Button, {
                                            LayoutOrder = 4,
                                            Text = "Claim reward",
                                            IconScale = 0.75,
                                            Size = UDim2.fromOffset(208, 46),
                                            Color = Color3.fromRGB(10, 220, 80),
                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                if a1.OnClaimClicked then
                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                end
                                            end,
                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                        })
                                    end
                                end
                            else
                                Locked_3 = a1.Locked or a1.Completed
                                if Locked_3 then
                                    v3 = not a1.HideAbandon
                                    if v3 then
                                        v3 = false
                                        if a1.Count == a1.Goal then
                                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                        end
                                        if v3 then
                                            Locked_4 = a1.Locked or a1.Completed
                                            v3 = not Locked_4 and createElement(Button, {
                                                LayoutOrder = 4,
                                                Text = "Claim reward",
                                                IconScale = 0.75,
                                                Size = UDim2.fromOffset(208, 46),
                                                Color = Color3.fromRGB(10, 220, 80),
                                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                    if a1.OnClaimClicked then
                                                        a1.OnClaimClicked(a1.QuestGuid)
                                                    end
                                                end,
                                                TextAutomaticSize = Enum.AutomaticSize.X,
                                            })
                                        end
                                    end
                                else
                                    v3 = createElement(Button, {
                                        LayoutOrder = 4,
                                        TextScaled = true,
                                        Text = "Abandon Contract",
                                        TextStrokeTransparency = 0,
                                        Size = UDim2.fromOffset(208, 46),
                                        Color = Color3.fromRGB(255, 80, 80),
                                        TextSize = UDim2.new(1, 0, 0, 24),
                                        TextPadding = {
                                            Right = UDim.new(0, 16),
                                            Left = UDim.new(0, 16),
                                        },
                                        Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                            if a1.OnAbandonClicked then
                                                a1.OnAbandonClicked(a1.QuestGuid, true)
                                            end
                                        end,
                                    })
                                    if not v3 then
                                        v3 = not a1.HideAbandon
                                        if v3 then
                                            v3 = false
                                            if a1.Count == a1.Goal then
                                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                            end
                                            if v3 then
                                                Locked_4 = a1.Locked or a1.Completed
                                                v3 = not Locked_4 and createElement(Button, {
                                                    LayoutOrder = 4,
                                                    Text = "Claim reward",
                                                    IconScale = 0.75,
                                                    Size = UDim2.fromOffset(208, 46),
                                                    Color = Color3.fromRGB(10, 220, 80),
                                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                        if a1.OnClaimClicked then
                                                            a1.OnClaimClicked(a1.QuestGuid)
                                                        end
                                                    end,
                                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                                })
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif a1.HideAbandon then
                        v3 = not a1.HideAbandon
                        if v3 then
                            v3 = false
                            if a1.Count == a1.Goal then
                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                            end
                            if v3 then
                                Locked_4 = a1.Locked or a1.Completed
                                v3 = not Locked_4 and createElement(Button, {
                                    LayoutOrder = 4,
                                    Text = "Claim reward",
                                    IconScale = 0.75,
                                    Size = UDim2.fromOffset(208, 46),
                                    Color = Color3.fromRGB(10, 220, 80),
                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                        if a1.OnClaimClicked then
                                            a1.OnClaimClicked(a1.QuestGuid)
                                        end
                                    end,
                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                })
                            end
                        end
                    else
                        v4 = false
                        if a1.Count == a1.Goal then
                            v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                        end
                        if v4 then
                            v3 = not a1.HideAbandon
                            if v3 then
                                v3 = false
                                if a1.Count == a1.Goal then
                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                end
                                if v3 then
                                    Locked_4 = a1.Locked or a1.Completed
                                    v3 = not Locked_4 and createElement(Button, {
                                        LayoutOrder = 4,
                                        Text = "Claim reward",
                                        IconScale = 0.75,
                                        Size = UDim2.fromOffset(208, 46),
                                        Color = Color3.fromRGB(10, 220, 80),
                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                            if a1.OnClaimClicked then
                                                a1.OnClaimClicked(a1.QuestGuid)
                                            end
                                        end,
                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                    })
                                end
                            end
                        else
                            Locked_3 = a1.Locked or a1.Completed
                            if Locked_3 then
                                v3 = not a1.HideAbandon
                                if v3 then
                                    v3 = false
                                    if a1.Count == a1.Goal then
                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                    end
                                    if v3 then
                                        Locked_4 = a1.Locked or a1.Completed
                                        v3 = not Locked_4 and createElement(Button, {
                                            LayoutOrder = 4,
                                            Text = "Claim reward",
                                            IconScale = 0.75,
                                            Size = UDim2.fromOffset(208, 46),
                                            Color = Color3.fromRGB(10, 220, 80),
                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                if a1.OnClaimClicked then
                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                end
                                            end,
                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                        })
                                    end
                                end
                            else
                                v3 = createElement(Button, {
                                    LayoutOrder = 4,
                                    TextScaled = true,
                                    Text = "Abandon Contract",
                                    TextStrokeTransparency = 0,
                                    Size = UDim2.fromOffset(208, 46),
                                    Color = Color3.fromRGB(255, 80, 80),
                                    TextSize = UDim2.new(1, 0, 0, 24),
                                    TextPadding = {Right = UDim.new(0, 16), Left = UDim.new(0, 16)},
                                    Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                        if a1.OnAbandonClicked then
                                            a1.OnAbandonClicked(a1.QuestGuid, true)
                                        end
                                    end,
                                })
                                if not v3 then
                                    v3 = not a1.HideAbandon
                                    if v3 then
                                        v3 = false
                                        if a1.Count == a1.Goal then
                                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                        end
                                        if v3 then
                                            Locked_4 = a1.Locked or a1.Completed
                                            v3 = not Locked_4 and createElement(Button, {
                                                LayoutOrder = 4,
                                                Text = "Claim reward",
                                                IconScale = 0.75,
                                                Size = UDim2.fromOffset(208, 46),
                                                Color = Color3.fromRGB(10, 220, 80),
                                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                    if a1.OnClaimClicked then
                                                        a1.OnClaimClicked(a1.QuestGuid)
                                                    end
                                                end,
                                                TextAutomaticSize = Enum.AutomaticSize.X,
                                            })
                                        end
                                    end
                                end
                            end
                        end
                    end
                    v9.button = v3
                    v14.content = createElement("Frame", v8, v9)
                    v14.children = createElement(React.Fragment, {}, a1.children)
                    return v11(v12, v13, v14)
                end
            end
            v8.towerName = "???"
            Locked = v6(v7, v8)
        end
    else
        Locked = createElement(CompleteOverlay)
        if not Locked then
            Locked = a1.Locked
            if Locked then
                v8 = {size = UDim2.new(1, 0, 1, 0), position = UDim2.new(0, 0, 0, 0)}
                v1 = nil
                for i6, i7 in a1.Rewards, nil, v1 do
                    if i7.Type == "tower" then
                        Tower = i7.Tower
                        v8.towerName = Tower
                        v14.overlay = (createElement(LockOverlay, v8))
                        v8 = {Size = UDim2.fromScale(1, 1)}
                        v8.BackgroundTransparency = if not a1.BackgroundImage then if not a1.Gradient then a1.BackgroundTransparency or 0.3 else 0 else 1
                        BackgroundColor3 = if a1.Gradient then Color3.new(1, 1, 1) else if not a1.BackgroundImage then a1.BackgroundColor3 or Color3.fromRGB(0, 0, 0) else Color3.new(1, 1, 1)
                        v8.BackgroundColor3 = BackgroundColor3
                        v8.BorderMode = Enum.BorderMode.Outline
                        v9 = {}
                        Active_2 = not a1.CornerRadius and a1.Active and createElement("UICorner", {CornerRadius = UDim.new(0, 16)})
                        CornerRadius = a1.CornerRadius and createElement("UICorner", {CornerRadius = UDim.new(0, a1.CornerRadius)})
                        Gradient = a1.Gradient and createElement("UIGradient", {Color = a1.Gradient, Rotation = a1.GradientRotation or 90})
                        v1 = createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            Padding = UDim.new(0, 0),
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                        })
                        v2 = not a1.Active
                        if v2 then
                            v3 = {
                                Thickness = 1,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            }
                            StrokeColor = a1.StrokeColor or Color3.fromRGB(162, 162, 162)
                            v3.Color = StrokeColor
                            v2 = createElement("UIStroke", v3)
                        end
                        v9[1] = Active_2
                        v9[2] = CornerRadius
                        v9[3] = Gradient
                        v9[4] = v1
                        v9[5] = v2
                        v5 = {
                            LayoutOrder = 0,
                            AnchorPoint = Vector2.new(0.5, 0),
                            Size = UDim2.new(1, 0, 0, 100),
                            Title = a1.Title,
                        }
                        TimeExpires = a1.TimeExpires and a1.TimeExpires - workspace:GetServerTimeNow()
                        v5.TimeLeft = TimeExpires
                        v5.HeaderColor = a1.HeaderColor3
                        v5.TitleColor = a1.TitleColor3
                        v5.TitleStroke = a1.TitleStroke
                        v5.TitleStrokeThickness = a1.TitleStrokeThickness
                        v5.TitlePosition = a1.TitlePosition
                        v5.HeaderStroke = a1.HeaderStroke
                        v5.HeaderStrokeThickness = a1.HeaderStrokeThickness
                        v5.HeaderPosition = a1.HeaderPosition
                        v5.HeaderFont = a1.HeaderFont
                        v5.HideGradient = a1.BackgroundImage ~= nil
                        v9.banner = createElement(MissionBanner, v5)
                        v9.objective = createElement(MissionObjective, {
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 155),
                            Description = a1.Description,
                            Count = a1.Count,
                            Goal = a1.Goal,
                            CurrentObjectiveNum = v10,
                            NumOfObjectives = a1.NumOfObjectives,
                            StrokeColor = a1.ObjectiveStrokeColor,
                            StrokeThickness = a1.ObjectiveStrokeThickness,
                        })
                        v3 = not a1.Active and createElement(MissionRewards, {
                            LayoutOrder = 2,
                            Rewards = a1.Rewards,
                            Size = UDim2.new(1, 0, 0, 140),
                            StrokeColor = a1.RewardStrokeColor,
                            StrokeThickness = a1.RewardStrokeThickness,
                        }) or createElement("Frame", {
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.new(1, 0, 0, 140),
                        })
                        v9.rewards = v3
                        v9[6] = if a1.HideAbandon then nil else createElement("Frame", {
                            BackgroundTransparency = 1,
                            LayoutOrder = 3,
                            Size = UDim2.new(1, -64, 0, 40),
                        }, {
                            createElement("Frame", {
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                Position = UDim2.fromScale(0.5, 0.4),
                                Size = UDim2.new(1, 0, 0, 2),
                            }, {
                                createElement("UIGradient", {
                                    Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
                                    Transparency = NumberSequence.new({
                                        NumberSequenceKeypoint.new(0, 1),
                                        NumberSequenceKeypoint.new(0.5, 0.5),
                                        (NumberSequenceKeypoint.new(1, 1)),
                                    }),
                                }),
                            }),
                        })
                        if not a1.Active then
                            Locked_2 = a1.Locked or a1.Completed
                            if not Locked_2 then
                                v3 = createElement(Button, {
                                    LayoutOrder = 4,
                                    Icon = "rbxassetid://131637335676840",
                                    IconScale = 0.75,
                                    Size = UDim2.fromOffset(150, 46),
                                    Color = Color3.fromRGB(10, 220, 80),
                                    Text = Comma(a1.Price),
                                    Clicked = function() -- Line: 249 -- upvalues: a1 (val)
                                        if a1.OnStartClicked then
                                            a1.OnStartClicked(a1.QuestId, a1.Title, a1.Price)
                                        end
                                    end,
                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                })
                                if not v3 then
                                    if a1.HideAbandon then
                                        v3 = not a1.HideAbandon
                                        if v3 then
                                            v3 = false
                                            if a1.Count == a1.Goal then
                                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                            end
                                            if v3 then
                                                Locked_4 = a1.Locked or a1.Completed
                                                v3 = not Locked_4 and createElement(Button, {
                                                    LayoutOrder = 4,
                                                    Text = "Claim reward",
                                                    IconScale = 0.75,
                                                    Size = UDim2.fromOffset(208, 46),
                                                    Color = Color3.fromRGB(10, 220, 80),
                                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                        if a1.OnClaimClicked then
                                                            a1.OnClaimClicked(a1.QuestGuid)
                                                        end
                                                    end,
                                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                                })
                                            end
                                        end
                                    else
                                        v4 = false
                                        if a1.Count == a1.Goal then
                                            v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                        end
                                        if v4 then
                                            v3 = not a1.HideAbandon
                                            if v3 then
                                                v3 = false
                                                if a1.Count == a1.Goal then
                                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                                end
                                                if v3 then
                                                    Locked_4 = a1.Locked or a1.Completed
                                                    v3 = not Locked_4 and createElement(Button, {
                                                        LayoutOrder = 4,
                                                        Text = "Claim reward",
                                                        IconScale = 0.75,
                                                        Size = UDim2.fromOffset(208, 46),
                                                        Color = Color3.fromRGB(10, 220, 80),
                                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                            if a1.OnClaimClicked then
                                                                a1.OnClaimClicked(a1.QuestGuid)
                                                            end
                                                        end,
                                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                                    })
                                                end
                                            end
                                        else
                                            Locked_3 = a1.Locked or a1.Completed
                                            if Locked_3 then
                                                v3 = not a1.HideAbandon
                                                if v3 then
                                                    v3 = false
                                                    if a1.Count == a1.Goal then
                                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                                    end
                                                    if v3 then
                                                        Locked_4 = a1.Locked or a1.Completed
                                                        v3 = not Locked_4 and createElement(Button, {
                                                            LayoutOrder = 4,
                                                            Text = "Claim reward",
                                                            IconScale = 0.75,
                                                            Size = UDim2.fromOffset(208, 46),
                                                            Color = Color3.fromRGB(10, 220, 80),
                                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                                if a1.OnClaimClicked then
                                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                                end
                                                            end,
                                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                                        })
                                                    end
                                                end
                                            else
                                                v3 = createElement(Button, {
                                                    LayoutOrder = 4,
                                                    TextScaled = true,
                                                    Text = "Abandon Contract",
                                                    TextStrokeTransparency = 0,
                                                    Size = UDim2.fromOffset(208, 46),
                                                    Color = Color3.fromRGB(255, 80, 80),
                                                    TextSize = UDim2.new(1, 0, 0, 24),
                                                    TextPadding = {Right = UDim.new(0, 16), Left = UDim.new(0, 16)},
                                                    Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                                        if a1.OnAbandonClicked then
                                                            a1.OnAbandonClicked(a1.QuestGuid, true)
                                                        end
                                                    end,
                                                })
                                                if not v3 then
                                                    v3 = not a1.HideAbandon
                                                    if v3 then
                                                        v3 = false
                                                        if a1.Count == a1.Goal then
                                                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                                        end
                                                        if v3 then
                                                            Locked_4 = a1.Locked or a1.Completed
                                                            v3 = not Locked_4 and createElement(Button, {
                                                                LayoutOrder = 4,
                                                                Text = "Claim reward",
                                                                IconScale = 0.75,
                                                                Size = UDim2.fromOffset(208, 46),
                                                                Color = Color3.fromRGB(10, 220, 80),
                                                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                                    if a1.OnClaimClicked then
                                                                        a1.OnClaimClicked(a1.QuestGuid)
                                                                    end
                                                                end,
                                                                TextAutomaticSize = Enum.AutomaticSize.X,
                                                            })
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            elseif a1.HideAbandon then
                                v3 = not a1.HideAbandon
                                if v3 then
                                    v3 = false
                                    if a1.Count == a1.Goal then
                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                    end
                                    if v3 then
                                        Locked_4 = a1.Locked or a1.Completed
                                        v3 = not Locked_4 and createElement(Button, {
                                            LayoutOrder = 4,
                                            Text = "Claim reward",
                                            IconScale = 0.75,
                                            Size = UDim2.fromOffset(208, 46),
                                            Color = Color3.fromRGB(10, 220, 80),
                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                if a1.OnClaimClicked then
                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                end
                                            end,
                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                        })
                                    end
                                end
                            else
                                v4 = false
                                if a1.Count == a1.Goal then
                                    v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                end
                                if v4 then
                                    v3 = not a1.HideAbandon
                                    if v3 then
                                        v3 = false
                                        if a1.Count == a1.Goal then
                                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                        end
                                        if v3 then
                                            Locked_4 = a1.Locked or a1.Completed
                                            v3 = not Locked_4 and createElement(Button, {
                                                LayoutOrder = 4,
                                                Text = "Claim reward",
                                                IconScale = 0.75,
                                                Size = UDim2.fromOffset(208, 46),
                                                Color = Color3.fromRGB(10, 220, 80),
                                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                    if a1.OnClaimClicked then
                                                        a1.OnClaimClicked(a1.QuestGuid)
                                                    end
                                                end,
                                                TextAutomaticSize = Enum.AutomaticSize.X,
                                            })
                                        end
                                    end
                                else
                                    Locked_3 = a1.Locked or a1.Completed
                                    if Locked_3 then
                                        v3 = not a1.HideAbandon
                                        if v3 then
                                            v3 = false
                                            if a1.Count == a1.Goal then
                                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                            end
                                            if v3 then
                                                Locked_4 = a1.Locked or a1.Completed
                                                v3 = not Locked_4 and createElement(Button, {
                                                    LayoutOrder = 4,
                                                    Text = "Claim reward",
                                                    IconScale = 0.75,
                                                    Size = UDim2.fromOffset(208, 46),
                                                    Color = Color3.fromRGB(10, 220, 80),
                                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                        if a1.OnClaimClicked then
                                                            a1.OnClaimClicked(a1.QuestGuid)
                                                        end
                                                    end,
                                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                                })
                                            end
                                        end
                                    else
                                        v3 = createElement(Button, {
                                            LayoutOrder = 4,
                                            TextScaled = true,
                                            Text = "Abandon Contract",
                                            TextStrokeTransparency = 0,
                                            Size = UDim2.fromOffset(208, 46),
                                            Color = Color3.fromRGB(255, 80, 80),
                                            TextSize = UDim2.new(1, 0, 0, 24),
                                            TextPadding = {
                                                Right = UDim.new(0, 16),
                                                Left = UDim.new(0, 16),
                                            },
                                            Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                                if a1.OnAbandonClicked then
                                                    a1.OnAbandonClicked(a1.QuestGuid, true)
                                                end
                                            end,
                                        })
                                        if not v3 then
                                            v3 = not a1.HideAbandon
                                            if v3 then
                                                v3 = false
                                                if a1.Count == a1.Goal then
                                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                                end
                                                if v3 then
                                                    Locked_4 = a1.Locked or a1.Completed
                                                    v3 = not Locked_4 and createElement(Button, {
                                                        LayoutOrder = 4,
                                                        Text = "Claim reward",
                                                        IconScale = 0.75,
                                                        Size = UDim2.fromOffset(208, 46),
                                                        Color = Color3.fromRGB(10, 220, 80),
                                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                            if a1.OnClaimClicked then
                                                                a1.OnClaimClicked(a1.QuestGuid)
                                                            end
                                                        end,
                                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                                    })
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        elseif a1.HideAbandon then
                            v3 = not a1.HideAbandon
                            if v3 then
                                v3 = false
                                if a1.Count == a1.Goal then
                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                end
                                if v3 then
                                    Locked_4 = a1.Locked or a1.Completed
                                    v3 = not Locked_4 and createElement(Button, {
                                        LayoutOrder = 4,
                                        Text = "Claim reward",
                                        IconScale = 0.75,
                                        Size = UDim2.fromOffset(208, 46),
                                        Color = Color3.fromRGB(10, 220, 80),
                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                            if a1.OnClaimClicked then
                                                a1.OnClaimClicked(a1.QuestGuid)
                                            end
                                        end,
                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                    })
                                end
                            end
                        else
                            v4 = false
                            if a1.Count == a1.Goal then
                                v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                            end
                            if v4 then
                                v3 = not a1.HideAbandon
                                if v3 then
                                    v3 = false
                                    if a1.Count == a1.Goal then
                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                    end
                                    if v3 then
                                        Locked_4 = a1.Locked or a1.Completed
                                        v3 = not Locked_4 and createElement(Button, {
                                            LayoutOrder = 4,
                                            Text = "Claim reward",
                                            IconScale = 0.75,
                                            Size = UDim2.fromOffset(208, 46),
                                            Color = Color3.fromRGB(10, 220, 80),
                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                if a1.OnClaimClicked then
                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                end
                                            end,
                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                        })
                                    end
                                end
                            else
                                Locked_3 = a1.Locked or a1.Completed
                                if Locked_3 then
                                    v3 = not a1.HideAbandon
                                    if v3 then
                                        v3 = false
                                        if a1.Count == a1.Goal then
                                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                        end
                                        if v3 then
                                            Locked_4 = a1.Locked or a1.Completed
                                            v3 = not Locked_4 and createElement(Button, {
                                                LayoutOrder = 4,
                                                Text = "Claim reward",
                                                IconScale = 0.75,
                                                Size = UDim2.fromOffset(208, 46),
                                                Color = Color3.fromRGB(10, 220, 80),
                                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                    if a1.OnClaimClicked then
                                                        a1.OnClaimClicked(a1.QuestGuid)
                                                    end
                                                end,
                                                TextAutomaticSize = Enum.AutomaticSize.X,
                                            })
                                        end
                                    end
                                else
                                    v3 = createElement(Button, {
                                        LayoutOrder = 4,
                                        TextScaled = true,
                                        Text = "Abandon Contract",
                                        TextStrokeTransparency = 0,
                                        Size = UDim2.fromOffset(208, 46),
                                        Color = Color3.fromRGB(255, 80, 80),
                                        TextSize = UDim2.new(1, 0, 0, 24),
                                        TextPadding = {
                                            Right = UDim.new(0, 16),
                                            Left = UDim.new(0, 16),
                                        },
                                        Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                            if a1.OnAbandonClicked then
                                                a1.OnAbandonClicked(a1.QuestGuid, true)
                                            end
                                        end,
                                    })
                                    if not v3 then
                                        v3 = not a1.HideAbandon
                                        if v3 then
                                            v3 = false
                                            if a1.Count == a1.Goal then
                                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                            end
                                            if v3 then
                                                Locked_4 = a1.Locked or a1.Completed
                                                v3 = not Locked_4 and createElement(Button, {
                                                    LayoutOrder = 4,
                                                    Text = "Claim reward",
                                                    IconScale = 0.75,
                                                    Size = UDim2.fromOffset(208, 46),
                                                    Color = Color3.fromRGB(10, 220, 80),
                                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                        if a1.OnClaimClicked then
                                                            a1.OnClaimClicked(a1.QuestGuid)
                                                        end
                                                    end,
                                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                                })
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        v9.button = v3
                        v14.content = createElement("Frame", v8, v9)
                        v14.children = createElement(React.Fragment, {}, a1.children)
                        return v11(v12, v13, v14)
                    end
                end
                v8.towerName = "???"
                Locked = v6(v7, v8)
            end
        end
    end
    v14.overlay = Locked
    v8 = {}
    v8.Size = UDim2.fromScale(1, 1)
    v8.BackgroundTransparency = if not a1.BackgroundImage then if not a1.Gradient then a1.BackgroundTransparency or 0.3 else 0 else 1
    BackgroundColor3 = if a1.Gradient then Color3.new(1, 1, 1) else if not a1.BackgroundImage then a1.BackgroundColor3 or Color3.fromRGB(0, 0, 0) else Color3.new(1, 1, 1)
    v8.BackgroundColor3 = BackgroundColor3
    v8.BorderMode = Enum.BorderMode.Outline
    v9 = {}
    Active_2 = not a1.CornerRadius and a1.Active and createElement("UICorner", {CornerRadius = UDim.new(0, 16)})
    CornerRadius = a1.CornerRadius and createElement("UICorner", {CornerRadius = UDim.new(0, a1.CornerRadius)})
    Gradient = a1.Gradient and createElement("UIGradient", {Color = a1.Gradient, Rotation = a1.GradientRotation or 90})
    v1 = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    })
    v2 = not a1.Active
    if v2 then
        v3 = {Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual}
        StrokeColor = a1.StrokeColor or Color3.fromRGB(162, 162, 162)
        v3.Color = StrokeColor
        v2 = createElement("UIStroke", v3)
    end
    v9[1] = Active_2
    v9[2] = CornerRadius
    v9[3] = Gradient
    v9[4] = v1
    v9[5] = v2
    v5 = {
        LayoutOrder = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.new(1, 0, 0, 100),
        Title = a1.Title,
    }
    TimeExpires = a1.TimeExpires and a1.TimeExpires - workspace:GetServerTimeNow()
    v5.TimeLeft = TimeExpires
    v5.HeaderColor = a1.HeaderColor3
    v5.TitleColor = a1.TitleColor3
    v5.TitleStroke = a1.TitleStroke
    v5.TitleStrokeThickness = a1.TitleStrokeThickness
    v5.TitlePosition = a1.TitlePosition
    v5.HeaderStroke = a1.HeaderStroke
    v5.HeaderStrokeThickness = a1.HeaderStrokeThickness
    v5.HeaderPosition = a1.HeaderPosition
    v5.HeaderFont = a1.HeaderFont
    v5.HideGradient = a1.BackgroundImage ~= nil
    v9.banner = createElement(MissionBanner, v5)
    v9.objective = createElement(MissionObjective, {
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 155),
        Description = a1.Description,
        Count = a1.Count,
        Goal = a1.Goal,
        CurrentObjectiveNum = v10,
        NumOfObjectives = a1.NumOfObjectives,
        StrokeColor = a1.ObjectiveStrokeColor,
        StrokeThickness = a1.ObjectiveStrokeThickness,
    })
    v3 = not a1.Active and createElement(MissionRewards, {
        LayoutOrder = 2,
        Rewards = a1.Rewards,
        Size = UDim2.new(1, 0, 0, 140),
        StrokeColor = a1.RewardStrokeColor,
        StrokeThickness = a1.RewardStrokeThickness,
    }) or createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 140)})
    v9.rewards = v3
    v9[6] = if a1.HideAbandon then nil else createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 3, Size = UDim2.new(1, -64, 0, 40)}, {
        createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.4),
            Size = UDim2.new(1, 0, 0, 2),
        }, {
            createElement("UIGradient", {
                Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0.5),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    })
    if not a1.Active then
        Locked_2 = a1.Locked or a1.Completed
        if not Locked_2 then
            v3 = createElement(Button, {
                LayoutOrder = 4,
                Icon = "rbxassetid://131637335676840",
                IconScale = 0.75,
                Size = UDim2.fromOffset(150, 46),
                Color = Color3.fromRGB(10, 220, 80),
                Text = Comma(a1.Price),
                Clicked = function() -- Line: 249 -- upvalues: a1 (val)
                    if a1.OnStartClicked then
                        a1.OnStartClicked(a1.QuestId, a1.Title, a1.Price)
                    end
                end,
                TextAutomaticSize = Enum.AutomaticSize.X,
            })
            if not v3 then
                if a1.HideAbandon then
                    v3 = not a1.HideAbandon
                    if v3 then
                        v3 = false
                        if a1.Count == a1.Goal then
                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                        end
                        if v3 then
                            Locked_4 = a1.Locked or a1.Completed
                            v3 = not Locked_4 and createElement(Button, {
                                LayoutOrder = 4,
                                Text = "Claim reward",
                                IconScale = 0.75,
                                Size = UDim2.fromOffset(208, 46),
                                Color = Color3.fromRGB(10, 220, 80),
                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                    if a1.OnClaimClicked then
                                        a1.OnClaimClicked(a1.QuestGuid)
                                    end
                                end,
                                TextAutomaticSize = Enum.AutomaticSize.X,
                            })
                        end
                    end
                else
                    v4 = false
                    if a1.Count == a1.Goal then
                        v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                    end
                    if v4 then
                        v3 = not a1.HideAbandon
                        if v3 then
                            v3 = false
                            if a1.Count == a1.Goal then
                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                            end
                            if v3 then
                                Locked_4 = a1.Locked or a1.Completed
                                v3 = not Locked_4 and createElement(Button, {
                                    LayoutOrder = 4,
                                    Text = "Claim reward",
                                    IconScale = 0.75,
                                    Size = UDim2.fromOffset(208, 46),
                                    Color = Color3.fromRGB(10, 220, 80),
                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                        if a1.OnClaimClicked then
                                            a1.OnClaimClicked(a1.QuestGuid)
                                        end
                                    end,
                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                })
                            end
                        end
                    else
                        Locked_3 = a1.Locked or a1.Completed
                        if Locked_3 then
                            v3 = not a1.HideAbandon
                            if v3 then
                                v3 = false
                                if a1.Count == a1.Goal then
                                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                end
                                if v3 then
                                    Locked_4 = a1.Locked or a1.Completed
                                    v3 = not Locked_4 and createElement(Button, {
                                        LayoutOrder = 4,
                                        Text = "Claim reward",
                                        IconScale = 0.75,
                                        Size = UDim2.fromOffset(208, 46),
                                        Color = Color3.fromRGB(10, 220, 80),
                                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                            if a1.OnClaimClicked then
                                                a1.OnClaimClicked(a1.QuestGuid)
                                            end
                                        end,
                                        TextAutomaticSize = Enum.AutomaticSize.X,
                                    })
                                end
                            end
                        else
                            v3 = createElement(Button, {
                                LayoutOrder = 4,
                                TextScaled = true,
                                Text = "Abandon Contract",
                                TextStrokeTransparency = 0,
                                Size = UDim2.fromOffset(208, 46),
                                Color = Color3.fromRGB(255, 80, 80),
                                TextSize = UDim2.new(1, 0, 0, 24),
                                TextPadding = {Right = UDim.new(0, 16), Left = UDim.new(0, 16)},
                                Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                                    if a1.OnAbandonClicked then
                                        a1.OnAbandonClicked(a1.QuestGuid, true)
                                    end
                                end,
                            })
                            if not v3 then
                                v3 = not a1.HideAbandon
                                if v3 then
                                    v3 = false
                                    if a1.Count == a1.Goal then
                                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                                    end
                                    if v3 then
                                        Locked_4 = a1.Locked or a1.Completed
                                        v3 = not Locked_4 and createElement(Button, {
                                            LayoutOrder = 4,
                                            Text = "Claim reward",
                                            IconScale = 0.75,
                                            Size = UDim2.fromOffset(208, 46),
                                            Color = Color3.fromRGB(10, 220, 80),
                                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                                if a1.OnClaimClicked then
                                                    a1.OnClaimClicked(a1.QuestGuid)
                                                end
                                            end,
                                            TextAutomaticSize = Enum.AutomaticSize.X,
                                        })
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif a1.HideAbandon then
            v3 = not a1.HideAbandon
            if v3 then
                v3 = false
                if a1.Count == a1.Goal then
                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                end
                if v3 then
                    Locked_4 = a1.Locked or a1.Completed
                    v3 = not Locked_4 and createElement(Button, {
                        LayoutOrder = 4,
                        Text = "Claim reward",
                        IconScale = 0.75,
                        Size = UDim2.fromOffset(208, 46),
                        Color = Color3.fromRGB(10, 220, 80),
                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                            if a1.OnClaimClicked then
                                a1.OnClaimClicked(a1.QuestGuid)
                            end
                        end,
                        TextAutomaticSize = Enum.AutomaticSize.X,
                    })
                end
            end
        else
            v4 = false
            if a1.Count == a1.Goal then
                v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
            end
            if v4 then
                v3 = not a1.HideAbandon
                if v3 then
                    v3 = false
                    if a1.Count == a1.Goal then
                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                    end
                    if v3 then
                        Locked_4 = a1.Locked or a1.Completed
                        v3 = not Locked_4 and createElement(Button, {
                            LayoutOrder = 4,
                            Text = "Claim reward",
                            IconScale = 0.75,
                            Size = UDim2.fromOffset(208, 46),
                            Color = Color3.fromRGB(10, 220, 80),
                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                if a1.OnClaimClicked then
                                    a1.OnClaimClicked(a1.QuestGuid)
                                end
                            end,
                            TextAutomaticSize = Enum.AutomaticSize.X,
                        })
                    end
                end
            else
                Locked_3 = a1.Locked or a1.Completed
                if Locked_3 then
                    v3 = not a1.HideAbandon
                    if v3 then
                        v3 = false
                        if a1.Count == a1.Goal then
                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                        end
                        if v3 then
                            Locked_4 = a1.Locked or a1.Completed
                            v3 = not Locked_4 and createElement(Button, {
                                LayoutOrder = 4,
                                Text = "Claim reward",
                                IconScale = 0.75,
                                Size = UDim2.fromOffset(208, 46),
                                Color = Color3.fromRGB(10, 220, 80),
                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                    if a1.OnClaimClicked then
                                        a1.OnClaimClicked(a1.QuestGuid)
                                    end
                                end,
                                TextAutomaticSize = Enum.AutomaticSize.X,
                            })
                        end
                    end
                else
                    v3 = createElement(Button, {
                        LayoutOrder = 4,
                        TextScaled = true,
                        Text = "Abandon Contract",
                        TextStrokeTransparency = 0,
                        Size = UDim2.fromOffset(208, 46),
                        Color = Color3.fromRGB(255, 80, 80),
                        TextSize = UDim2.new(1, 0, 0, 24),
                        TextPadding = {Right = UDim.new(0, 16), Left = UDim.new(0, 16)},
                        Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                            if a1.OnAbandonClicked then
                                a1.OnAbandonClicked(a1.QuestGuid, true)
                            end
                        end,
                    })
                    if not v3 then
                        v3 = not a1.HideAbandon
                        if v3 then
                            v3 = false
                            if a1.Count == a1.Goal then
                                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                            end
                            if v3 then
                                Locked_4 = a1.Locked or a1.Completed
                                v3 = not Locked_4 and createElement(Button, {
                                    LayoutOrder = 4,
                                    Text = "Claim reward",
                                    IconScale = 0.75,
                                    Size = UDim2.fromOffset(208, 46),
                                    Color = Color3.fromRGB(10, 220, 80),
                                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                        if a1.OnClaimClicked then
                                            a1.OnClaimClicked(a1.QuestGuid)
                                        end
                                    end,
                                    TextAutomaticSize = Enum.AutomaticSize.X,
                                })
                            end
                        end
                    end
                end
            end
        end
    elseif a1.HideAbandon then
        v3 = not a1.HideAbandon
        if v3 then
            v3 = false
            if a1.Count == a1.Goal then
                v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
            end
            if v3 then
                Locked_4 = a1.Locked or a1.Completed
                v3 = not Locked_4 and createElement(Button, {
                    LayoutOrder = 4,
                    Text = "Claim reward",
                    IconScale = 0.75,
                    Size = UDim2.fromOffset(208, 46),
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                        if a1.OnClaimClicked then
                            a1.OnClaimClicked(a1.QuestGuid)
                        end
                    end,
                    TextAutomaticSize = Enum.AutomaticSize.X,
                })
            end
        end
    else
        v4 = false
        if a1.Count == a1.Goal then
            v4 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
        end
        if v4 then
            v3 = not a1.HideAbandon
            if v3 then
                v3 = false
                if a1.Count == a1.Goal then
                    v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                end
                if v3 then
                    Locked_4 = a1.Locked or a1.Completed
                    v3 = not Locked_4 and createElement(Button, {
                        LayoutOrder = 4,
                        Text = "Claim reward",
                        IconScale = 0.75,
                        Size = UDim2.fromOffset(208, 46),
                        Color = Color3.fromRGB(10, 220, 80),
                        Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                            if a1.OnClaimClicked then
                                a1.OnClaimClicked(a1.QuestGuid)
                            end
                        end,
                        TextAutomaticSize = Enum.AutomaticSize.X,
                    })
                end
            end
        else
            Locked_3 = a1.Locked or a1.Completed
            if Locked_3 then
                v3 = not a1.HideAbandon
                if v3 then
                    v3 = false
                    if a1.Count == a1.Goal then
                        v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                    end
                    if v3 then
                        Locked_4 = a1.Locked or a1.Completed
                        v3 = not Locked_4 and createElement(Button, {
                            LayoutOrder = 4,
                            Text = "Claim reward",
                            IconScale = 0.75,
                            Size = UDim2.fromOffset(208, 46),
                            Color = Color3.fromRGB(10, 220, 80),
                            Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                if a1.OnClaimClicked then
                                    a1.OnClaimClicked(a1.QuestGuid)
                                end
                            end,
                            TextAutomaticSize = Enum.AutomaticSize.X,
                        })
                    end
                end
            else
                v3 = createElement(Button, {
                    LayoutOrder = 4,
                    TextScaled = true,
                    Text = "Abandon Contract",
                    TextStrokeTransparency = 0,
                    Size = UDim2.fromOffset(208, 46),
                    Color = Color3.fromRGB(255, 80, 80),
                    TextSize = UDim2.new(1, 0, 0, 24),
                    TextPadding = {Right = UDim.new(0, 16), Left = UDim.new(0, 16)},
                    Clicked = function() -- Line: 269 -- upvalues: a1 (val)
                        if a1.OnAbandonClicked then
                            a1.OnAbandonClicked(a1.QuestGuid, true)
                        end
                    end,
                })
                if not v3 then
                    v3 = not a1.HideAbandon
                    if v3 then
                        v3 = false
                        if a1.Count == a1.Goal then
                            v3 = a1.CurrentObjectiveIndex == a1.NumOfObjectives
                        end
                        if v3 then
                            Locked_4 = a1.Locked or a1.Completed
                            v3 = not Locked_4 and createElement(Button, {
                                LayoutOrder = 4,
                                Text = "Claim reward",
                                IconScale = 0.75,
                                Size = UDim2.fromOffset(208, 46),
                                Color = Color3.fromRGB(10, 220, 80),
                                Clicked = function() -- Line: 282 -- upvalues: a1 (val)
                                    if a1.OnClaimClicked then
                                        a1.OnClaimClicked(a1.QuestGuid)
                                    end
                                end,
                                TextAutomaticSize = Enum.AutomaticSize.X,
                            })
                        end
                    end
                end
            end
        end
    end
    v9.button = v3
    v14.content = createElement("Frame", v8, v9)
    v14.children = createElement(React.Fragment, {}, a1.children)
    return v11(v12, v13, v14)
end