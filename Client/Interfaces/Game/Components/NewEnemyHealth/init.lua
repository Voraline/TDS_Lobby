-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewEnemyHealth
-- Decompile time: 14.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local EnemyHealthBar = require(script.EnemyHealthBar)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local u45 = Color3.fromRGB(196, 92, 255)

local function buildGlitchName(a1, a2, a3, a4) -- Line: 32 -- types: a1: userdata, a2: string, a3: string, a4: number
    local v1
    local v2 = math.floor((utf8.len(a3) or #a3) * a4 + 0.5)
    local v3 = {}
    local v4 = 0
    for i, j in utf8.codes(a2) do
        v4 = v4 + 1
        v3[v4] = (utf8.char(j))
    end
    local v5 = {}
    local v6 = 0
    local v7 = a1
    for k, n in utf8.codes(a3) do
        v6 = v6 + 1
        if v6 <= v2 then
            table.insert(v5, (utf8.char(n)))
        elseif not v3[v6] then
            v1 = v7:NextInteger(1, 20)
            table.insert(v5, (string.sub("!@#$%^&*<>/\\|_-+=~01", v1, v1)))
        else
            v1 = v7:NextNumber()
            if not (v1 < 0.5) then
                v1 = v7:NextInteger(1, 20)
                table.insert(v5, (string.sub("!@#$%^&*<>/\\|_-+=~01", v1, v1)))
            else
                table.insert(v5, v3[v6])
            end
        end
    end
    return table.concat(v5)
end

local function formatHealth(a1) -- Line: 65 -- upvalues: Comma (val) -- types: a1: number
    return Comma((math.round(a1)))
end

local function getCenterRevealTransparency(a1, a2) -- Line: 69 -- types: a1: number, a2: number?
    local v1 = math.clamp(a1, 0, 1)
    local v2 = math.clamp(a2 or 0.5, 0, 1)
    if v1 <= 0 then
        return NumberSequence.new(1)
    end
    if v1 >= 1 then
        return NumberSequence.new(0)
    end
    local v3 = v2 - v1 * v2
    local v4 = v2 + v1 * (1 - v2)
    return NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(math.max(v3 - 0, 0), 1),
        NumberSequenceKeypoint.new(v3, 0),
        NumberSequenceKeypoint.new(v4, 0),
        NumberSequenceKeypoint.new(math.min(v4 + 0, 1), 1),
        (NumberSequenceKeypoint.new(1, 1)),
    })
end

local u49 = {}
u49.rage = Color3.fromRGB(255, 0, 85)
return memo(function(a1) -- Line: 112
    -- upvalues: useTween (val), useSpring (val), useTransparencyModifier (val), useState (val), useRef (val)
    -- upvalues: useEffect (val), buildGlitchName (val), u45 (val), Maid (val), getCenterRevealTransparency (val)
    -- upvalues: React (val), createElement (val), u49 (val), EnemyHealthBar (val), Comma (val)
    local v1, u9 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v2, u13 = useSpring({start = 0, target = 0, damper = 0.6, speed = 10})
    local v3, u22 = useTween({
        start = 3,
        target = 3,
        info = TweenInfo.new(0.95, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
    })
    local v4, u26 = useSpring({start = 0, target = 0, damper = 0.7, speed = 12})
    local v5, u30 = useSpring({start = 0, target = 0, damper = 0.4, speed = 6})
    local v6, u39 = useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
    })
    local v7 = useTransparencyModifier(v6)
    local v8, u51 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v9, u60 = useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
    })
    local v10, u69 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local u72 = useTransparencyModifier(v9)
    local v11, u76 = useState(nil)
    local u79 = useRef(a1.enemyName)
    local v12 = useEffect
    local v13 = {a1.nameGlitchKey}
    v12(function() -- Line: 176 -- upvalues: a1 (val), u79 (val), u76 (val), buildGlitchName (upval), u45 (upval)
        if a1.nameGlitchKey and a1.nameGlitchKey ~= 0 then
            local current = u79.current
            if not current then
                current = a1.enemyName
                if not current then
                    current = "???"
                end
            end
            local u11 = a1.enemyName or "???"
            u79.current = u11
            local u14 = Random.new()
            local u16 = os.clock()
            local u20 = task.spawn(function() -- Line: 189
                -- upvalues: u16 (val), u76 (upval), buildGlitchName (upval), u14 (val), current (val), u11 (val)
                -- upvalues: u45 (upval)
                local v1
                while true do
                    v1 = math.clamp(((os.clock()) - u16) / 1, 0, 1)
                    u76({
                        text = buildGlitchName(u14, current, u11, v1),
                        color = if not ((u14:NextNumber()) < 0.6) then Color3.new(1, 1, 1) else u45,
                    })
                    if v1 >= 1 then
                        break
                    end
                    task.wait(0.045)
                end
                u76(nil)
            end)
            return function() -- Line: 211 -- upvalues: u20 (val)
                if coroutine.status(u20) ~= "dead" then
                    task.cancel(u20)
                end
            end
        end
        u79.current = a1.enemyName
    end, v13)
    useEffect(function() -- Line: 218
        -- upvalues: Maid (upval), u13 (val), u22 (val), u39 (val), u69 (val), u51 (val), u60 (val), u26 (val)
        -- upvalues: u30 (val), u9 (val)
        local u2 = Maid.new()
        u13({start = -180, target = 0})
        u22({start = 3.75, target = 2.2})
        u39({target = 0})
        u69({start = 1, target = 0})
        u2:Mark((task.delay(0.1, function() -- Line: 239
            -- upvalues: u51 (upval), u60 (upval), u26 (upval), u30 (upval), u13 (upval), u9 (upval), u22 (upval)
            task.delay(0.5, function() -- Line: 240 -- upvalues: u51 (upval), u60 (upval), u26 (upval)
                u51({start = -0.5, target = 0})
                u60({target = 0})
                u26({target = -50})
            end)
            task.delay(0.6, function() -- Line: 253 -- upvalues: u30 (upval), u13 (upval), u9 (upval)
                u30({force = 30})
                u13({damper = 0.3, force = 420, speed = 8})
                u9({target = 1})
            end)
            u22({target = 1.2})
        end)))
        return function() -- Line: 271 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    v12 = v1:map(function(a1_2) -- Line: 276 -- upvalues: getCenterRevealTransparency (upval), a1 (val)
        return getCenterRevealTransparency(a1_2, a1.revealAnchorPoint)
    end)
    local v14, u101 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    })
    local v15, u110 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
    })
    local useMemo = React.useMemo
    local v16 = {a1.markers}
    local v17 = useMemo(function() -- Line: 292 -- upvalues: a1 (val), createElement (upval), u72 (val), React (upval), u49 (upval)
        local color, createElement_3, v1, v2, v3, v4
        local v5 = {}
        local markers = a1.markers or {}
        local v6 = nil
        local v7 = nil
        for i, j in markers, v6, v7 do
            v2 = createElement
            v3 = {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.new(),
                BackgroundTransparency = u72(0.1),
                BorderColor3 = Color3.new(),
                Position = UDim2.fromScale(j.value, 0.5),
                Size = UDim2.fromScale(0.00520833, 2),
            }
            v4 = {
                uIGradient = React.createElement("UIGradient", {
                    Rotation = 90,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.391504, 0.0875),
                        NumberSequenceKeypoint.new(0.717566, 0),
                        (NumberSequenceKeypoint.new(1, 0)),
                    }),
                }),
            }
            createElement_3 = React.createElement
            v1 = {BorderSizePixel = 0, Rotation = 45, AnchorPoint = Vector2.new(0.5, 0.5)}
            color = u49[i] or j.color or Color3.fromRGB(255, 255, 255)
            v1.BackgroundColor3 = color
            v1.BorderColor3 = Color3.new()
            v1.Position = UDim2.fromScale(0.5, 1)
            v1.Size = UDim2.fromScale(2, 2)
            v1.BackgroundTransparency = u72(0)
            v4.frame = createElement_3("Frame", v1, {
                iStroke = React.createElement("UIStroke", {
                    Thickness = 0.5,
                    StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                    Transparency = u72(0.4),
                }),
                uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint"),
            })
            v4.frame2 = React.createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.new(1, 1, 1),
                BackgroundTransparency = u72(0.5),
                BorderColor3 = Color3.new(),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(8, 0.5),
            }, {
                uIGradient = React.createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.49786, 0.64375),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            })
            v5[i] = (v2("Frame", v3, v4))
        end
        return v5
    end, v16)
    local v18 = useEffect
    local v19 = {a1.remove}
    v18(function() -- Line: 359 -- upvalues: a1 (val), u101 (val), u110 (val)
        if a1.remove then
            task.delay(0.3, function() -- Line: 361 -- upvalues: u101 (upval)
                u101({target = 1})
            end)
            u110({target = 1})
            task.delay(1, function() -- Line: 369 -- upvalues: a1 (upval)
                if a1.destroy then
                    a1.destroy()
                end
            end)
        end
        return function() end
    end, v19)
    v18 = createElement
    v19 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.293915, 0.0555556),
    }
    local v20 = {}
    local v21 = createElement
    local v22 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1.2, 4),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v15:map(function(a1) -- Line: 388
            return UDim2.fromScale(0.5, 0.5 + a1)
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        GroupTransparency = v14,
    }
    local v23 = {}
    local v24 = createElement
    local v25 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v10:map(function(a1) -- Line: 399
            return UDim2.fromScale(0.5, 0.2 + a1)
        end),
        Size = UDim2.fromScale(0.55, 0.22),
    }
    local v26 = {}
    local v27 = createElement
    local v28 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(),
        Position = v5:map(function(a1) -- Line: 409
            return UDim2.fromScale(0.5 + a1 / 100, 0.8125)
        end),
        Size = UDim2.fromScale(1, 0.375),
    }
    local v29 = {
        markers = createElement(
            "Frame",
            {BackgroundTransparency = 1, ZIndex = 999, Size = UDim2.fromScale(1, 1)},
            {Markers = createElement(React.Fragment, nil, v17)}
        ),
    }
    local v30 = createElement
    local v31 = {
        BackgroundTransparency = 0.2,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v32 = {
        Health = createElement(EnemyHealthBar, {
            health = a1.health,
            maxHealth = a1.maxHealth,
            delayBarColor1 = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 221)),
                (ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0.866667))),
            }),
        }),
    }
    local shieldHealth = a1.shieldHealth and createElement(EnemyHealthBar, {
        reversed = true,
        health = a1.shieldHealth or 0,
        maxHealth = a1.maxHealth,
        color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 225, 0)),
            ColorSequenceKeypoint.new(0.429066, Color3.fromRGB(255, 200, 0)),
            ColorSequenceKeypoint.new(0.467128, Color3.fromRGB(255, 243, 78)),
            ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
            (ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))),
        }),
        delayBarColor1 = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 187, 0)),
            (ColorSequenceKeypoint.new(1, Color3.new(1, 0.6, 0))),
        }),
    })
    v32.Shield = shieldHealth
    v32.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.3, 0)})
    v32.uIStroke = createElement("UIStroke", {
        Thickness = 0.025,
        Color = Color3.new(1, 1, 1),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }, {uIGradient = createElement("UIGradient", {Transparency = v12})})
    v32.uIGradient = createElement("UIGradient", {Transparency = v12})
    v29.Canvas = v30("CanvasGroup", v31, v32)
    v29.amount = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 1000,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -32, 0.85, 0),
        Text = ("%*/ %*"):format(Comma((math.round(a1.health + (a1.shieldHealth or 0)))), (Comma((math.round(a1.maxHealth))))),
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Right,
    }, {
        uIStroke = createElement("UIStroke", {
            Thickness = 0.15,
            Transparency = 0.12,
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v29.dropShadow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=9239716855",
        ImageTransparency = 0.4,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.fromScale(1.03, 1.67),
        SliceCenter = Rect.new(14, 14, 64, 24),
    }, {uIGradient = createElement("UIGradient", {Transparency = v12})})
    v29.iconHolder = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 12,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = React.joinBindings({v4, v5}):map(function(a1) -- Line: 518
            local v1, v2 = unpack(a1)
            return UDim2.fromScale(0.5 + v1 / 100 - v2 / 50, 0.5)
        end),
        Size = UDim2.fromScale(0.0416667, 1.33333),
        Rotation = v2,
    }, {
        uIScale = createElement("UIScale", {Scale = v3}),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://101759304675153",
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.875, 0.875),
            ImageTransparency = v7(0),
        }),
        second = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://73249921010150",
            Visible = false,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(28, 28),
            ImageTransparency = v7(0),
        }),
        other = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://118315539005216",
            Visible = false,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(28, 28),
            ImageTransparency = v7(0),
        }),
        shape = createElement("Frame", {
            Rotation = 45,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(71, 71, 71),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = v7(0),
        }, {
            iStroke1 = createElement("UIStroke", {Color = Color3.new(1, 1, 1), Transparency = v7(0)}),
        }),
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
    })
    v26.hPBar = v27("Frame", v28, v29)
    v26.dropshadow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://81763585875720",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = Color3.new(),
        Position = UDim2.fromScale(0.5, 0.56),
        Size = UDim2.fromScale(0.75, 2.25),
        ImageTransparency = u72(0.5),
    }, {
        iGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.12744, 0.8125),
                NumberSequenceKeypoint.new(0.233065, 0),
                NumberSequenceKeypoint.new(0.63031, 0.23125),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v27 = createElement
    v28 = {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = v8:map(function(a1) -- Line: 614
            return UDim2.fromScale(0.5, 0.3 + a1)
        end),
        Size = UDim2.fromScale(1, 0.45),
    }
    local text = v11 and v11.text or a1.enemyName or "???"
    v28.Text = text
    local color = v11 and v11.color or Color3.new(1, 1, 1)
    v28.TextColor3 = color
    v28.TextTransparency = u72(0)
    v26.enemyName = v27("TextLabel", v28, {
        iStroke = createElement("UIStroke", {
            Thickness = 0.1,
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            Transparency = u72(0.5),
        }),
    })
    v23.container = v24("Frame", v25, v26)
    v20.MainContainer = v21("CanvasGroup", v22, v23)
    return v18("Frame", v19, v20)
end)