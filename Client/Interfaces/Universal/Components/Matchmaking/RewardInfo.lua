-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.RewardInfo
-- Decompile time: 7.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
require(ReplicatedStorage.Shared.Data.GameModeData)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local Change = React.Change
local Event = React.Event
local memo = React.memo
local useSpring = ReactFlow.useSpring

local function convertMinutesToMS(a1) -- Line: 17 -- types: a1: number
    local v1 = math.floor(a1 * 60 + 0.5)
    return string.format("%d:%02d", math.floor(v1 / 60), v1 % 60)
end

return memo(function(a1) -- Line: 24
    -- upvalues: useBinding (val), useRef (val), useSpring (val), useEffect (val), createElement (val), Comma (val)
    -- upvalues: React (val), Icons (val), Change (val), Event (val)
    local Default, Default_2, v1, v2, v3, v4
    local v5 = {}
    local RewardHolderSize = a1.rewardInfo.RewardHolderSize or UDim2.fromScale(1, 0.6)
    local RewardItemSize = a1.rewardInfo.RewardItemSize or UDim2.fromScale(0.8, 0.23)
    local v6, u633 = useBinding(0)
    local u636 = useRef(nil)
    local v7, u642 = useSpring({target = 1, start = 1, damper = 0.8, speed = 29})
    local v8, u648 = useSpring({target = 1, start = 1, damper = 0.4, speed = 12})
    local v9 = {u636}
    useEffect(function() -- Line: 47 -- upvalues: u636 (val), u633 (val)
        if u636.current then
            u633(u636.current.AbsoluteSize.Y)
        end
    end, v9)
    local v10 = nil
    v9 = nil
    local v11 = a1
    for i, j in a1.rewardInfo.Rewards, v10, v9 do
        v1 = {
            UIScale = createElement("UIScale", {Scale = 0.8}),
            UILayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }
        v2 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 5,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        }
        v3 = if j.Max ~= j.Min then ("%* - %*"):format(Comma(j.Min), (Comma(j.Max))) else ("%*"):format((Comma(j.Min)))
        v2.Text = v3
        v2.TextColor3 = Color3.fromRGB(255, 255, 255)
        v2.TextSize = v6:map(function(a1) -- Line: 80
            return a1 / 10
        end)
        v2.AutomaticSize = Enum.AutomaticSize.X
        v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v2.Size = UDim2.fromOffset(0, 50)
        v1.Amount = createElement("TextLabel", v2, {uIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.77})})
        v2 = {BackgroundTransparency = 1, LayoutOrder = -1, Size = UDim2.fromScale(0.2, 1)}
        v3 = {}
        v4 = {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
        }
        Default = Icons[i] or Icons.Default
        v4.Image = Default
        v3.Icon = createElement("ImageLabel", v4)
        v4 = {
            BackgroundTransparency = 1,
            ImageTransparency = 0.45,
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
        }
        Default_2 = Icons[i] or Icons.Default
        v4.Image = Default_2
        v4.ImageColor3 = Color3.fromRGB(0, 0, 0)
        v4.Position = UDim2.fromOffset(2, 2)
        v3.IconShadow = createElement("ImageLabel", v4)
        v1.IconHolder = createElement("Frame", v2, v3)
        v5[i] = (createElement("Frame", {BackgroundTransparency = 1, Size = RewardItemSize}, v1))
    end
    v5.Boss = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = -99, Size = RewardItemSize}, {
        UILayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        IconHolder = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = -1, Size = UDim2.fromScale(0.2, 1)}, {
            Icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
                Image = Icons.Boss,
            }),
            IconShadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ImageTransparency = 0.45,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
                Image = Icons.Boss,
                ImageColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromOffset(2, 2),
            }),
        }),
        Title = createElement("TextLabel", {
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
            Text = ("<font weight=\"Heavy\">%*</font>"):format(v11.rewardInfo.Boss),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v6:map(function(a1) -- Line: 167
                return a1 / 10
            end),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(0, 50),
            AutomaticSize = Enum.AutomaticSize.X,
        }, {uIStroke = React.createElement("UIStroke", {Transparency = 0.76})}),
    })
    local v12 = createElement
    local v13 = {
        UIScale = createElement("UIScale", {Scale = 0.8}),
        UILayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        IconHolder = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = -1, Size = UDim2.fromScale(0.2, 1)}, {
            Icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
                Image = Icons.Cooldown,
            }),
            IconShadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ImageTransparency = 0.45,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
                Image = Icons.Cooldown,
                ImageColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromOffset(2, 2),
            }),
        }),
    }
    local v14 = createElement
    local v15 = {
        RichText = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
    }
    v2 = math.floor(v11.rewardInfo.EstimatedTime * 60 + 0.5)
    v15.Text = ("%*"):format((string.format("%d:%02d", math.floor(v2 / 60), v2 % 60)))
    v15.TextColor3 = Color3.fromRGB(255, 255, 255)
    v15.TextSize = v6:map(function(a1) -- Line: 236
        return a1 / 10
    end)
    v15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v15.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v15.Position = UDim2.fromScale(0.5, 0.5)
    v15.AnchorPoint = Vector2.new(0.5, 0.5)
    v15.Size = UDim2.fromOffset(0, 50)
    v15.AutomaticSize = Enum.AutomaticSize.X
    v13.Title = v14("TextLabel", v15, {uIStroke = React.createElement("UIStroke", {Transparency = 0.76})})
    v5.EstTime = v12("Frame", {BackgroundTransparency = 1, LayoutOrder = 10, Size = RewardItemSize}, v13)
    v9 = {AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.fromScale(0.5, 1)}
    local size = v11.size or UDim2.fromScale(1, 0.5)
    v9.Size = size
    v9.BackgroundTransparency = 0.18
    v9.BorderSizePixel = 0
    v9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v9.ref = u636

    v9[Change.AbsoluteSize] = function(a1) -- Line: 262 -- upvalues: u633 (val) -- types: a1: userdata
        u633(a1.AbsoluteSize.Y)
    end

    v9.ZIndex = 999
    v13 = {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 7)}),
        UIGradient = createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()),
                (ColorSequenceKeypoint.new(1, Color3.new())),
            }),
            Offset = v7:map(function(a1) -- Line: 283
                return Vector2.new(0, a1)
            end),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.6, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    }
    v14 = {}
    local v16 = createElement
    local v17 = {
        Size = UDim2.fromScale(1, 2),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }

    v17[Event.MouseEnter] = function() -- Line: 298 -- upvalues: u642 (val), u648 (val)
        u642({target = 0})
        u648({target = 0})
    end

    v17[Event.MouseLeave] = function() -- Line: 306 -- upvalues: u642 (val), u648 (val)
        u642({target = 1})
        u648({target = 1})
    end

    v14.hover = v16("Frame", v17)
    v14.holder = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = RewardHolderSize,
    }, {
        UIScale = createElement("UIScale", {
            Scale = v8:map(function(a1) -- Line: 324
                return 1 - a1 * 0.2
            end),
        }),
        holderFrame = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = v7:map(function(a1) -- Line: 329
                return UDim2.fromScale(0.5, 0.5 + a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            UILayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }, v5),
    })
    return createElement("Frame", v9, v13, v14)
end)