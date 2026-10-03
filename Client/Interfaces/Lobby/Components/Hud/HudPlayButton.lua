-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudPlayButton
-- Decompile time: 4.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Controllers = ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local MatchmakingStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ViewController = require(Controllers.ViewController)
local useAtom = require(Hooks.useAtom)
local useFFlag = require(Hooks.useFFlag)
local useMediaQuery = require(Hooks.useMediaQuery)
local useScale = require(Hooks.useScale)
local useSound = require(Hooks.useSound)
local useSpring = require(Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef

local function useMatchmakingState() -- Line: 39 -- upvalues: RunService (val), useAtom (val), MatchmakingStore (val)
    if not RunService:IsRunning() then
        return true
    end
    return useAtom(MatchmakingStore.getCanStartMatchmaking)
end

return React.memo(function(a1) -- Line: 47
    -- upvalues: RunService (val), useAtom (val), MatchmakingStore (val), useFFlag (val), useSound (val)
    -- upvalues: useSpring (val), ReactFlow (val), useBinding (val), useRef (val), useScale (val), useEffect (val)
    -- upvalues: createElement (val), useMediaQuery (val), React (val), ViewController (val)
    local u3 = a1.Visible ~= false
    local v1 = if RunService:IsRunning() then useAtom(MatchmakingStore.getCanStartMatchmaking) else true
    local v2 = RunService:IsStudio() or useFFlag("matchmaking.play-button-disabled", false) ~= true
    local u26 = v2 and v1
    local Click = useSound("Click")
    local v3, u36 = useSpring(1, 0.6, 40, true)
    local v4, u43 = useSpring(0, 0.8, 20, true)
    local v5 = v4:map(function(a1) -- Line: 60
        return 1 - a1
    end)
    local v6, u52 = ReactFlow.useSpring({speed = 2, damper = 0.5, start = 2, target = 6})
    local u55, u56 = useBinding(false)
    local u60 = useRef(tick())
    local u63 = useScale(1)
    local v7 = {u3}
    useEffect(function() -- Line: 75 -- upvalues: u3 (val), RunService (upval), u60 (val), u52 (val)
        if not u3 then
            return
        end
        local u6 = RunService.RenderStepped:Connect(function() -- Line: 80 -- upvalues: u60 (upval), u52 (upval)
            if 4 < tick() - u60.current then
                u60.current = tick()
                u52({force = 5})
            end
        end)
        return function() -- Line: 88 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, v7)
    v7 = {u3, u26}
    useEffect(function() -- Line: 93 -- upvalues: u3 (val), u26 (val), u43 (val)
        u43(if not u3 or not u26 then 0 else 1)
    end, v7)
    v7 = {BackgroundTransparency = 1, LayoutOrder = a1.LayoutOrder}
    local Size = a1.Size or UDim2.fromOffset(200, 10)
    v7.Size = Size
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 1)
    v7.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 1, -140 * (if not useMediaQuery("large") then 0.75 else 1))
    v7.Position = Position
    v7.Visible = v4:map(function(a1) -- Line: 105
        return a1 > 0.01
    end)
    local v8 = {}
    local v9 = false
    if a1.disableAspectRatio ~= true then
        v9 = createElement("UIAspectRatioConstraint", {AspectRatio = 4, AspectType = Enum.AspectType.ScaleWithParentSize})
    end
    v8.aspectRatio = v9
    v9 = createElement
    local v10 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(80, 255, 86),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        ImageColor3 = Color3.fromRGB(89, 255, 186),
        ScaleType = Enum.ScaleType.Tile,
        Selectable = true,
        TileSize = UDim2.fromOffset(45, 45),
        BackgroundTransparency = v5,
        Size = UDim2.fromScale(1, 1),
        Position = v5:map(function(a1) -- Line: 126
            return (UDim2.new(0.5, 0, 0.5, 0)) + UDim2.new(0, 0, 0, 40 * a1)
        end),
    }

    v10[React.Event.MouseButton1Down] = function() -- Line: 130 -- upvalues: u36 (val), u63 (val)
        u36(1 - 0.1 * u63)
    end

    v10[React.Event.MouseButton1Up] = function() -- Line: 134
        -- upvalues: u36 (val), u55 (val), u63 (val), Click (val), RunService (upval), ViewController (upval)
        u36(u55:getValue() and 1 + 0.1 * u63 or 1)
        Click()
        if not RunService:IsRunning() then
            return
        end
        ViewController:setView("PromptMatchmaking")
    end

    v10[React.Event.MouseEnter] = function() -- Line: 145 -- upvalues: u36 (val), u63 (val), u56 (val)
        u36(1 + 0.1 * u63)
        u56(true)
    end

    v10[React.Event.MouseLeave] = function() -- Line: 149 -- upvalues: u36 (val), u56 (val)
        u36(1)
        u56(false)
    end

    v8.content = v9("ImageButton", v10, {
        scale = createElement("UIScale", {
            Scale = v3:map(function(a1_2) -- Line: 155 -- upvalues: a1 (val)
                return a1_2 * (if a1.phone then 0.7 else 1)
            end),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://18610113607",
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageColor3 = Color3.fromRGB(85, 255, 82),
            ImageTransparency = v5,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 16, 1, 16),
            SliceCenter = Rect.new(8, 8, 54, 54),
            Visible = u55:map(function(a1) -- Line: 176
                return a1
            end),
        }),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
        uIStroke1 = createElement("UIStroke", {
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = v5,
            Thickness = React.joinBindings({v4, v6}):map(function(a1) -- Line: 194
                return a1[2] * a1[1] * 2
            end),
        }),
        textLabel1 = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "PLAY",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v5,
        }, {
            uIStroke2 = createElement("UIStroke", {
                Thickness = 3,
                Color = Color3.fromRGB(40, 68, 17),
                LineJoinMode = Enum.LineJoinMode.Bevel,
                Transparency = v5,
            }),
        }),
    })
    return createElement("Frame", v7, v8)
end)