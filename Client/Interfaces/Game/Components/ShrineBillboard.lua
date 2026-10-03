-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ShrineBillboard
-- Decompile time: 6.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local Icons_2 = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local u35 = TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u40 = TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local u45 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
local u50 = Color3.fromRGB(170, 85, 255)
local u55 = Color3.fromRGB(48, 48, 48)
local u56 = {Coins = Icons_2.Coins, Experience = Icons.Experience, Gems = Icons_2.Gems}

local function getNumber(a1, a2) -- Line: 31 -- types: a2: number
    if typeof(a1) == "number" then
        return a1
    end
    return a2
end

local function normalizeRewardType(a1) -- Line: 35 -- types: a1: string?
    if typeof(a1) ~= "string" then
        return nil
    end
    local v1 = a1:lower()
    if v1 ~= "coin" and v1 ~= "coins" then
        if v1 ~= "gem" and v1 ~= "gems" then
            if v1 ~= "exp" and v1 ~= "xp" and v1 ~= "experience" then
                return a1
            end
            return "Experience"
        end
        return "Gems"
    end
    return "Coins"
end

local function getRewardIcon(a1, a2) -- Line: 52
    -- upvalues: Icons_2 (val), u56 (val), Icons (val)
    local v1, v2
    if typeof(a1) == "string" then
        v2 = a1:lower()
        v1 = if v2 == "coin" then "Coins" else if v2 ~= "coins" then if v2 == "gem" then "Gems" else if v2 ~= "gems" then if v2 == "exp" then "Experience" else if v2 == "xp" then "Experience" else if v2 ~= "experience" then a1 else "Experience" else "Gems" else "Coins"
    else
        v1 = nil
    end
    if not v1 then
        if typeof(a2) == "string" then
            v2 = a2:lower()
            v1 = if v2 == "coin" then "Coins" else if v2 ~= "coins" then if v2 == "gem" then "Gems" else if v2 ~= "gems" then if v2 == "exp" then "Experience" else if v2 == "xp" then "Experience" else if v2 ~= "experience" then a2 else "Experience" else "Gems" else "Coins"
        else
            v1 = nil
        end
    end
    if not v1 then
        return Icons_2.Gems
    end
    return u56[v1] or Icons[v1] or Icons_2.Gems
end

local function formatRewardAmount(a1) -- Line: 61 -- types: a1: number
    return (("+ %*"):format((math.max(math.floor(a1), 0))))
end

local function textStroke(a1) -- Line: 65 -- upvalues: createElement (val), u55 (val) -- types: a1: number?
    return createElement("UIStroke", {
        Enabled = true,
        Transparency = 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        Color = u55,
        LineJoinMode = Enum.LineJoinMode.Round,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        Thickness = a1 or 0.1,
    })
end

local function RewardView(a1) -- Line: 77
    -- upvalues: createElement (val), u45 (val), textStroke (val), Icons_2 (val), u56 (val), Icons (val)
    local v1, v2
    local RewardAmount = a1.RewardAmount
    local RewardCurrencyType = a1.RewardCurrencyType
    local RewardLabel = a1.RewardLabel
    local v3 = {
        Name = "Reward",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v4 = {
        title = createElement("TextLabel", {
            Name = "TextLabel",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Reward",
            TextScaled = true,
            TextStrokeTransparency = 1,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = u45,
            Position = UDim2.fromScale(0.5, 0.45),
            Size = UDim2.fromScale(0.5, 0.125),
            TextColor3 = Color3.fromRGB(212, 212, 212),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        }, {stroke = textStroke()}),
    }
    local v5 = {
        Name = "Reward",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.6),
        Size = UDim2.fromScale(0.7, 0.125),
    }
    local v6 = {
        layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 0),
            SortOrder = Enum.SortOrder.Name,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v7 = {Name = "ImageLabel", BackgroundTransparency = 1, BorderSizePixel = 0}
    if typeof(RewardCurrencyType) == "string" then
        v2 = RewardCurrencyType:lower()
        v1 = if v2 == "coin" then "Coins" else if v2 ~= "coins" then if v2 == "gem" then "Gems" else if v2 ~= "gems" then if v2 == "exp" then "Experience" else if v2 == "xp" then "Experience" else if v2 ~= "experience" then RewardCurrencyType else "Experience" else "Gems" else "Coins"
    else
        v1 = nil
    end
    if not v1 then
        if typeof(RewardLabel) == "string" then
            v2 = RewardLabel:lower()
            v1 = if v2 == "coin" then "Coins" else if v2 ~= "coins" then if v2 == "gem" then "Gems" else if v2 ~= "gems" then if v2 == "exp" then "Experience" else if v2 == "xp" then "Experience" else if v2 ~= "experience" then RewardLabel else "Experience" else "Gems" else "Coins"
        else
            v1 = nil
        end
    end
    local Gems = if v1 then u56[v1] or Icons[v1] or Icons_2.Gems else Icons_2.Gems
    v7.Image = Gems
    v7.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v7.ScaleType = Enum.ScaleType.Stretch
    v7.Size = UDim2.fromScale(0.2, 1)
    v6.image = createElement("ImageLabel", v7, {
        aspectRatio = createElement("UIAspectRatioConstraint", {
            AspectRatio = 1,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    })
    v6.amount = createElement("TextLabel", {
        Name = "TextLabel",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextStrokeTransparency = 1,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = u45,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 1),
        Text = ("+ %*"):format((math.max(math.floor(if typeof(RewardAmount) ~= "number" then 0 else RewardAmount), 0))),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
    }, {stroke = textStroke()})
    v4.reward = createElement("Frame", v5, v6)
    return createElement("Frame", v3, v4)
end

local function ProgressView(a1) -- Line: 161 -- upvalues: createElement (val), u45 (val), textStroke (val), u50 (val)
    local DurationWaves = a1.DurationWaves
    local v1 = math.max(math.floor(if typeof(DurationWaves) ~= "number" then 1 else DurationWaves), 1)
    local CompletedWaves = a1.CompletedWaves
    local v2 = math.clamp(math.floor(if typeof(CompletedWaves) ~= "number" then 0 else CompletedWaves), 0, v1)
    return createElement("Frame", {
        Name = "Progress",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        label = createElement("TextLabel", {
            Name = "TextLabel",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextStrokeTransparency = 1,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = u45,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.5, 0.15),
            Text = ("%*/%* Waves"):format(v2, v1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        }, {stroke = textStroke()}),
        progressBar = createElement("Frame", {
            Name = "ProgressBar",
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            ClipsDescendants = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.65),
            Size = UDim2.fromScale(0.8, 0.05),
        }, {
            stroke = createElement("UIStroke", {
                Enabled = true,
                Thickness = 0.2,
                Transparency = 0,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                BorderOffset = UDim.new(0.15, 0),
                BorderStrokePosition = Enum.BorderStrokePosition.Outer,
                Color = u50,
                LineJoinMode = Enum.LineJoinMode.Bevel,
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
            fill = createElement("Frame", {
                Name = "Fill",
                BorderSizePixel = 0,
                BackgroundColor3 = u50,
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(v2 / v1, 1),
            }),
        }),
    })
end

return React.memo(function(a1) -- Line: 226
    -- upvalues: useState (val), useBinding (val), useRef (val), useEffect (val), TweenService (val), u35 (val)
    -- upvalues: u40 (val), createElement (val), ProgressView (val), RewardView (val)
    local u3 = a1.Visible == true
    local v1, u8 = useState(u3)
    local v2, u15 = useBinding(if not u3 then 0 else 1)
    local u22 = useRef(if not u3 then 0 else 1)
    local v3 = useEffect
    local v4 = {u3, a1.AnimationKey}
    v3(function() -- Line: 232
        -- upvalues: u3 (val), u22 (val), u15 (val), u8 (val), TweenService (upval), u35 (upval), u40 (upval)
        local u40_2
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = if not u3 then u22.current else 0
        u22.current = NumberValue.Value
        u15(NumberValue.Value)
        local u18 = NumberValue.Changed:Connect(function(a1) -- Line: 238 -- upvalues: u22 (upval), u15 (upval)
            u22.current = a1
            u15(a1)
        end)
        local u46 = nil
        if not u3 then
            u40_2 = TweenService:Create(NumberValue, u40, {Value = 0})
            u46 = u40_2.Completed:Connect(function(a1) -- Line: 256 -- upvalues: u8 (upval)
                if a1 == Enum.PlaybackState.Completed then
                    u8(false)
                end
            end)
        else
            u8(true)
            u40_2 = TweenService:Create(NumberValue, u35, {Value = 1})
        end
        u40_2:Play()
        return function() -- Line: 265 -- upvalues: u46 (ref), u18 (val), u40_2 (ref), NumberValue (val)
            if u46 then
                u46:Disconnect()
            end
            u18:Disconnect()
            u40_2:Cancel()
            NumberValue:Destroy()
        end
    end, v4)
    v4 = {
        Name = "Content",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v1,
    }
    local v5 = {scale = createElement("UIScale", {Scale = v2})}
    local v6 = if a1.Mode ~= "Progress" then createElement(RewardView, {
        RewardAmount = a1.RewardAmount,
        RewardCurrencyType = a1.RewardCurrencyType,
        RewardLabel = a1.RewardLabel,
    }) else createElement(ProgressView, {CompletedWaves = a1.CompletedWaves, DurationWaves = a1.DurationWaves})
    v5.view = v6
    return createElement("Frame", v4, v5)
end)