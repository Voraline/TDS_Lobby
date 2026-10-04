-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews.Components.TVStatic
-- Decompile time: 13.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local NewSpriteSheet = require(script.Parent.NewSpriteSheet)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
Random.new()
return React.memo(function(a1) -- Line: 20
    -- upvalues: useTween (val), React (val), useEffect (val), Maid (val), RunService (val), createElement (val)
    -- upvalues: NewSpriteSheet (val)
    local v1, u10 = useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(a1.windUpTime or 1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
    })
    local v2, u15 = React.useBinding(0)
    useEffect(function() -- Line: 33 -- upvalues: Maid (upval), RunService (upval), u15 (val)
        local u2 = Maid.new()
        local u3 = 0
        u2:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 37 -- upvalues: u3 (ref), u15 (upval)
            u3 = u3 + a1
            u15(math.noise(u3 * 10))
        end)))
        return function() -- Line: 42 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    local v3 = useEffect
    local v4 = {a1.enabled}
    v3(function() -- Line: 47 -- upvalues: a1 (val), u10 (val)
        if a1.enabled then
            u10({
                target = 0,
                info = TweenInfo.new(a1.windUpTime or 1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
            })
            return
        end
        u10({
            target = 1,
            info = TweenInfo.new(a1.windUpTime or 1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
        })
    end, v4)
    return createElement("CanvasGroup", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        mainGradient = createElement("UIGradient", {
            Transparency = v1:map(function(a1) -- Line: 74
                return NumberSequence.new({
                    NumberSequenceKeypoint.new(0, a1 + 0.9),
                    NumberSequenceKeypoint.new(0.5, a1),
                    (NumberSequenceKeypoint.new(1, a1 + 0.9)),
                })
            end),
        }),
        vig = createElement("ImageLabel", {
            Image = "rbxassetid://18720640102",
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            BorderSizePixel = 0,
            ZIndex = -3,
            Size = UDim2.fromScale(1, 1.1),
            Position = v2:map(function(a1) -- Line: 86
                return UDim2.fromScale(0.5, 0.5 + a1 * 0.1)
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Stretch,
            ImageColor3 = Color3.fromRGB(255, 48, 255),
        }, {
            grad = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 23, 174)),
                    ColorSequenceKeypoint.new(0.207612, Color3.fromRGB(168, 28, 255)),
                    ColorSequenceKeypoint.new(0.479239, Color3.fromRGB(255, 21, 255)),
                    ColorSequenceKeypoint.new(0.756055, Color3.fromRGB(123, 29, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 24, 205))),
                }),
            }),
        }),
        staticSprite1 = createElement(NewSpriteSheet, {
            elementType = "ImageLabel",
            looped = true,
            playing = true,
            frameRate = 90,
            native = {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.2, 0.3),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.fromScale(3, 0.5),
                SliceCenter = Rect.new(502, 0, 512, 512),
                ImageColor3 = Color3.fromRGB(0, 0, 0),
            },
            sheets = {
                {
                    id = 102872805379767,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 117134233408015,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 135629595528732,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 94054690057641,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 78369423750572,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 134781260454216,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 78720526491750,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 100161771138251,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 97655489424816,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 89126753949322,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 128449087666172,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 116970094872484,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 139474559282638,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 104470870774390,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 74112111386595,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
            },
        }),
        staticSprite2 = createElement(NewSpriteSheet, {
            elementType = "ImageLabel",
            looped = true,
            playing = true,
            frameRate = 300,
            native = {
                Rotation = 180,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.2, 0.9),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.fromScale(2, 1),
                SliceCenter = Rect.new(500, 0, 500, 512),
                ImageColor3 = Color3.fromRGB(0, 0, 0),
            },
            sheets = {
                {
                    id = 102872805379767,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 117134233408015,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 135629595528732,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 94054690057641,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 78369423750572,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 134781260454216,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 78720526491750,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 100161771138251,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 97655489424816,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 89126753949322,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 128449087666172,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 116970094872484,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 139474559282638,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 104470870774390,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 74112111386595,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
            },
        }),
        staticSprite3 = createElement(NewSpriteSheet, {
            elementType = "ImageLabel",
            looped = true,
            playing = true,
            frameRate = 50,
            native = {
                Rotation = 180,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Stretch,
                Size = UDim2.fromScale(1, 1),
                ImageColor3 = Color3.fromRGB(255, 255, 255),
            },
            sheets = {
                {
                    id = 102872805379767,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 117134233408015,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 135629595528732,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 94054690057641,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 78369423750572,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 134781260454216,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 78720526491750,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 100161771138251,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 97655489424816,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 89126753949322,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 128449087666172,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 116970094872484,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 139474559282638,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 104470870774390,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
                {
                    id = 74112111386595,
                    max = 2,
                    grid = Vector2.new(2, 2),
                    size = Vector2.new(512, 512),
                },
            },
        }),
    })
end)