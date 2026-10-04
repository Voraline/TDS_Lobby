-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerInformation
-- Decompile time: 16.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local OtherOptionsTowerInformation = require(script.OtherOptionsTowerInformation)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local TowerInformationStatsPanel = require(script.TowerInformationStatsPanel)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local joinBindings = React.joinBindings
local memo = React.memo
local useEffect = React.useEffect
local useLayoutEffect = React.useLayoutEffect
local useBinding = React.useBinding
local useRef = React.useRef
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween

local function toAssetId(a1) -- Line: 43
    if typeof(a1) == "number" and a1 ~= 0 then
        return (("rbxassetid://%*"):format(a1))
    end
    if typeof(a1) == "string" and a1 ~= "" then
        return a1
    end
    return "rbxassetid://70910607127530"
end

return memo(function(a1) -- Line: 55
    -- upvalues: useRef (val), useBinding (val), useSound (val), useSpring (val), useTween (val), useReactBindings (val)
    -- upvalues: useEffect (val), useLayoutEffect (val), Maid (val), createElement (val), joinBindings (val)
    -- upvalues: TextMarquee (val), IconButton (val), TowerInformationStatsPanel (val)
    -- upvalues: OtherOptionsTowerInformation (val)
    local u3 = useRef(nil)
    local u6 = useRef(false)
    local u9 = useRef(false)
    local u12 = useRef(a1.towerModel)
    local v1, u16 = useBinding(1)
    local towerIcon = a1.towerIcon
    local v2 = if typeof(towerIcon) ~= "number" then if typeof(towerIcon) ~= "string" then "rbxassetid://70910607127530" else if towerIcon == "" then "rbxassetid://70910607127530" else towerIcon else if towerIcon == 0 then if typeof(towerIcon) ~= "string" then "rbxassetid://70910607127530" else if towerIcon == "" then "rbxassetid://70910607127530" else towerIcon else ("rbxassetid://%*"):format(towerIcon)
    local u36 = useSound("New Upgrade Open", true)
    local v3, u40 = useSpring({start = 0, target = 0, damper = 0.68, speed = 18})
    local v4, u44 = useSpring({start = 0, target = 0, damper = 0.7, speed = 20})
    local v5, u61 = useTween({
        start = Color3.new(1, 1, 1),
        target = Color3.new(1, 1, 1),
        info = TweenInfo.new(0),
    })
    local v6, u68 = useTween({start = 0.35, target = 0.35, info = TweenInfo.new(0)})
    local v7 = useReactBindings
    local v8 = {a1.towerInformationEnabled}
    local v9 = {u36}
    v7(function(a1) -- Line: 86 -- upvalues: u40 (val), u6 (val), u36 (val)
        if not a1 then
            u40({start = 0, target = 0})
        else
            u40({target = 1})
            if not u6.current then
                u36()
            end
        end
        u6.current = a1
    end, v8, v9)
    v7 = useEffect
    v8 = {
        a1.towerModel,
        a1.level,
        a1.path,
        a1.towerStats,
        a1.statusEffects,
        a1.plotData,
    }
    v7(function() -- Line: 100 -- upvalues: u9 (val), u12 (val), a1 (val), u44 (val), u61 (val), u68 (val), u6 (val)
        local v1 = not u9.current
        local v2 = u12.current ~= a1.towerModel
        u9.current = true
        u12.current = a1.towerModel
        if not v1 and not v2 then
            if not u6.current then
                return
            end
            u44({force = -10})
            u61({target = Color3.fromRGB(23, 255, 128), info = TweenInfo.new(0)})
            u68({target = 0, info = TweenInfo.new(0)})
            local u41 = task.delay(0.2, function() -- Line: 134 -- upvalues: u61 (upval), u68 (upval)
                u61({
                    target = Color3.new(1, 1, 1),
                    info = TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                })
                u68({
                    target = 0.35,
                    info = TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                })
            end)
            return function() -- Line: 145 -- upvalues: u41 (val)
                task.cancel(u41)
            end
        end
        u44({start = 0, target = 0})
        u61({target = Color3.new(1, 1, 1), info = TweenInfo.new(0)})
        u68({target = 0.35, info = TweenInfo.new(0)})
    end, v8)
    v8 = {u3}
    useLayoutEffect(function() -- Line: 157 -- upvalues: Maid (upval), u3 (val), u16 (val)
        local u2 = Maid.new()
        local current = u3.current
        if not current then
            return function() -- Line: 161 -- upvalues: u2 (val)
                u2:Sweep()
            end
        end
        local AbsoluteSize = current.AbsoluteSize
        u16(AbsoluteSize.Y / 578)
        u2:Mark(((current:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 166 -- upvalues: current (val), u16 (upval)
            local AbsoluteSize = current.AbsoluteSize
            u16(AbsoluteSize.Y / 578)
        end)))
        return function() -- Line: 174 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v8)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderColor3 = Color3.new(),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.5),
        Visible = a1.towerInformationEnabled,
        ref = u3,
    }, {
        main = createElement("Frame", {
            BackgroundTransparency = 0.15,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(),
            Position = joinBindings({v3, v4}):map(function(a1) -- Line: 194
                return UDim2.fromScale(0.5, 0.5 + (1 - a1[1]) * 0.14 + a1[2] * 0.05)
            end),
            Size = UDim2.fromOffset(940, 578),
        }, {
            towerName = createElement("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(30, 30),
                Size = UDim2.fromOffset(271, 100),
            }, {
                towerIconShadow = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.7,
                    Rotation = -1,
                    ZIndex = 3,
                    Image = v2,
                    ImageColor3 = Color3.new(),
                    Position = UDim2.new(-0.22, 2, -0.5, 6),
                    ScaleType = Enum.ScaleType.Fit,
                    Size = UDim2.fromOffset(240, 240),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = 90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.401439, 0.175),
                            NumberSequenceKeypoint.new(0.646043, 0.95),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
                towerIcon = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Rotation = -1,
                    ZIndex = 4,
                    Image = v2,
                    Position = UDim2.fromScale(-0.22, -0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    Size = UDim2.fromOffset(240, 240),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = 90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.401439, 0.175),
                            NumberSequenceKeypoint.new(0.646043, 0.95),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
                title = createElement(TextMarquee, {
                    BackgroundTransparency = 1,
                    alwaysMarquee = true,
                    TextSize = 55,
                    ZIndex = 12,
                    padding = UDim.new(0, 10),
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0.380074, 0.08),
                    Size = UDim2.fromOffset(285, 50),
                    Text = a1.towerName or "Tower",
                    TextColor3 = Color3.new(1, 1, 1),
                    TextXAlignment = Enum.TextXAlignment.Left,
                }, {
                    uIStroke = createElement("UIStroke", {
                        Thickness = 4,
                        Transparency = 0.1,
                        LineJoinMode = Enum.LineJoinMode.Miter,
                    }),
                }),
                role = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextSize = 30,
                    ZIndex = 12,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
                    Text = a1.towerRole or "",
                    Position = UDim2.fromScale(0.380074, 0.53),
                    Size = UDim2.fromOffset(338, 32),
                    TextColor3 = Color3.fromRGB(229, 229, 229),
                    TextXAlignment = Enum.TextXAlignment.Left,
                }, {
                    uIStroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 1,
                        LineJoinMode = Enum.LineJoinMode.Miter,
                    }),
                }),
            }),
            filter = createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(56, 56, 56),
                Position = UDim2.fromScale(0.5, -0.025),
                Size = UDim2.new(1, 30, 0.11, 0),
            }, {
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 10)}),
                uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(33, 33, 33)}),
                uIGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
                    }),
                }),
                informationLabel = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = "Tower Information",
                    TextScaled = true,
                    AnchorPoint = Vector2.new(0, 0.5),
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                    Position = UDim2.new(0, 20, 0.5, 0),
                    Size = UDim2.fromScale(1, 0.54),
                    TextColor3 = Color3.new(1, 1, 1),
                    TextXAlignment = Enum.TextXAlignment.Left,
                }, {uIStroke = createElement("UIStroke", {Thickness = 5, Transparency = 0.31})}),
                closeButton = createElement(IconButton, {
                    Size = UDim2.fromOffset(50, 50),
                    Color = Color3.fromRGB(255, 60, 60),
                    Position = UDim2.fromScale(0.93, 0.5),
                    Clicked = a1.onClose,
                }),
            }),
            uICorner = createElement("UICorner"),
            uIStroke = createElement("UIStroke", {
                Enabled = true,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = v5,
                Thickness = v4:map(function(a1) -- Line: 350
                    return math.min(math.abs(a1), 1) * 4 + 3
                end),
                Transparency = v6,
            }),
            shadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://9239716855",
                ZIndex = -3,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.new(1, 14, 1, 13),
                SliceCenter = Rect.new(14, 14, 64, 24),
            }),
            statInformation = createElement(TowerInformationStatsPanel, {statusEffects = a1.statusEffects, towerStats = a1.towerStats}),
            otherOptions = createElement(OtherOptionsTowerInformation, {
                plotData = a1.plotData,
                towerAsset = a1.towerAsset,
                towerSkin = a1.towerSkin,
                towerStats = a1.towerStats,
                upgradeOptions = a1.upgradeOptions,
            }),
            uIScale = createElement("UIScale", {Scale = v1}),
        }),
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.77943}),
    })
end)