-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Achievements.Achievement
-- Decompile time: 10.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Components_2 = Interfaces.Lobby.Components
local Components = Interfaces.Components
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local BattlepassButton = require(Components_2.Battlepass.BattlepassButton)
local BattlepassPreview = require(Components_2.Battlepass.BattlepassPreview)
local ImageLabel = require(Components.ImageLabel)
local createElement = React.createElement

local function withBindingOrState(a1, a2) -- Line: 41 -- types: a2: function
    if typeof(a1) == "table" and a1.map then
        return a1:map(a2)
    end
    return (a2(a1))
end

local function shouldShowReward(a1) -- Line: 49
    local type = a1 and a1.type
    local v1 = true
    if typeof(type) == "string" then
        v1 = string.lower(type) ~= "badge"
    end
    return v1
end

return (React.memo(function(a1) -- Line: 55
    -- upvalues: createElement (val), BattlepassButton (val), ImageLabel (val), Comma (val), table (val)
    -- upvalues: BattlepassPreview (val)
    local rewards = a1.rewards or {}
    local v1 = createElement
    local v2 = {BorderSizePixel = 0, BackgroundTransparency = 0.5}
    local size = a1.size or UDim2.fromScale(1, 1)
    v2.Size = size
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v2.Position = position
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = anchorPoint
    v2.LayoutOrder = a1.layoutOrder or 1
    v2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local v3 = {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 11})}
    v3.corner = createElement("UICorner", {CornerRadius = UDim.new(0, 10)})
    local v4 = createElement
    local v5 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0.02, 0, 0.35, 0),
        Size = UDim2.fromScale(0.2, 0.23),
    }
    local v6 = {
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    }
    local v7 = createElement
    local v8 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.title or "??????",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.02, 0, 0.35, 0),
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
    }
    v6.title = v7("TextLabel", v8)
    local completed = a1.completed and createElement(BattlepassButton, {
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.45, 1.2),
        text = if not a1.equipped then "Equip" else "Unequip",
        clicked = a1.onEquip,
    })
    v6.equip = completed
    v3.titleContainer = v4("Frame", v5, v6)
    v4 = createElement
    v5 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        Text = a1.description or "womp womp wompppp",
        TextColor3 = Color3.fromRGB(147, 147, 147),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.02, 0, 0.65, 0),
        Size = UDim2.fromScale(0.5, 0.19),
    }
    v3.subTitle = v4("TextLabel", v5, {})
    local claimable = a1.claimable and createElement(BattlepassButton, {
        text = "Claim",
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.15, 0.45),
        clicked = function() -- Line: 147 -- upvalues: a1 (val)
            if a1.onClaim then
                a1.onClaim(a1.name or a1.title)
            end
        end,
    })
    v3.claim = claimable
    local completed_2 = a1.completed and createElement(ImageLabel, {
        Image = "rbxassetid://12289762618",
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.4, 0.4),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    })
    v3.check = completed_2
    local progress = a1.progress
    if progress then
        progress = a1.maxProgress
        if progress then
            progress = not a1.completed
            if progress then
                progress = not a1.claimable
                if progress then
                    v4 = createElement
                    v5 = {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.3, 1),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                    }
                    v6 = {
                        list = createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            Padding = UDim.new(0, 10),
                        }),
                    }
                    v7 = createElement
                    v8 = {
                        TextScaled = true,
                        TextSize = 14,
                        TextWrapped = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 0,
                        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    }
                    local progress_2 = a1.progress
                    if progress_2 then
                        local progress_3 = a1.progress
                        if typeof(progress_3) ~= "table" or not progress_3.map then
                            local maxProgress = if not (1 < a1.maxProgress) then a1.maxProgress else Comma(a1.maxProgress)
                            local v9 = math.clamp(progress_3, 0, a1.maxProgress)
                            if v9 > 1 then
                                v9 = Comma(v9)
                            end
                            progress_2 = ("%* / %*"):format(v9, maxProgress)
                        else
                            progress_2 = progress_3:map(function(a1_2) -- Line: 189 -- upvalues: a1 (val), Comma (upval)
                                local maxProgress = if not (1 < a1.maxProgress) then a1.maxProgress else Comma(a1.maxProgress)
                                local v1 = math.clamp(a1_2, 0, a1.maxProgress)
                                if v1 > 1 then
                                    v1 = Comma(v1)
                                end
                                return (("%* / %*"):format(v1, maxProgress))
                            end)
                        end
                    end
                    v8.Text = progress_2
                    v8.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v8.AnchorPoint = Vector2.new(0, 0.5)
                    v8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v8.Position = UDim2.new(0.02, 0, 0.35, 0)
                    v8.Size = UDim2.fromScale(1, 0.23)
                    v6.progress = v7("TextLabel", v8, {})
                    v7 = createElement
                    v8 = {
                        BackgroundTransparency = 0.9,
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Position = UDim2.fromScale(0.534, 0.523),
                        Size = UDim2.fromScale(1, 0.08),
                    }
                    local v10 = {uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
                    local v11 = createElement
                    local v12 = {
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Position = UDim2.fromScale(0, 0.5),
                    }
                    local progress_4 = a1.progress
                    v12.Size = if typeof(progress_4) ~= "table" or not progress_4.map then UDim2.fromScale(math.clamp(if a1.maxProgress ~= 0 then progress_4 / a1.maxProgress else 0, 0, 1), 1) else progress_4:map(function(a1_2) -- Line: 235 -- upvalues: a1 (val)
                        return UDim2.fromScale(math.clamp(if a1.maxProgress ~= 0 then a1_2 / a1.maxProgress else 0, 0, 1), 1)
                    end)
                    v10.bar = v11("Frame", v12, {
                        uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                        uIGradient = createElement("UIGradient", {
                            Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 122, 0)),
                                ColorSequenceKeypoint.new(0.827, Color3.fromRGB(255, 208, 22)),
                                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                            }),
                        }),
                        emitterFrame = createElement("Frame", {
                            BackgroundTransparency = 1,
                            AnchorPoint = Vector2.new(1, 0.5),
                            Position = UDim2.fromScale(1, 0.5),
                            Size = UDim2.new(0, 1, 1, 0),
                        }, {}),
                    })
                    v6.bar = v7("Frame", v8, v10)
                    progress = v4("Frame", v5, v6)
                end
            end
        end
    end
    v3.progress = progress
    v3.items = createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -20, 0.8, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    }, table.reduce(rewards, function(a1_2, a2) -- Line: 282 -- upvalues: table (upval), createElement (upval), BattlepassPreview (upval), a1 (val)
        local type = a2 and a2.type
        local v1 = true
        if typeof(type) == "string" then
            v1 = string.lower(type) ~= "badge"
        end
        if not v1 then
            return a1_2
        end
        table.insert(a1_2, createElement(BattlepassPreview, {
            locked = false,
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            item = a2,
            color = Color3.fromRGB(58, 58, 58),
            completed = a1.completed,
        }))
        return a1_2
    end, {}))
    return v1("Frame", v2, v3)
end))