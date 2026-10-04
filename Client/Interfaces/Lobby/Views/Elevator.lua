-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Elevator
-- Decompile time: 10.41 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ElevatorConfig = require(ReplicatedStorage.Shared.Modules.ElevatorConfig)
local React = require(ReplicatedStorage.Shared.UI.React)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local world = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.world)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useAttributes = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttributes)
local Fragment = React.Fragment
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local createElement = React.createElement
local u52 = React.memo(function(a1) -- Line: 35
    -- upvalues: useAttributes (val), ElevatorConfig (val), useMemo (val), useEffect (val), spr (val), ReactRoblox (val)
    -- upvalues: createElement (val), world (val)
    local screen = a1.screen
    local neon = a1.neon
    local railing = a1.railing
    local light = a1.light
    local glow = a1.glow
    local beams = a1.beams
    local v1 = useAttributes(a1.model)
    local Timer = v1.Timer
    local Map = v1.Map
    local Players = v1.Players
    local v2 = v1.CustomIcon or nil
    local v3 = v1.ForcedColor or nil
    local v4 = v1.ForcedDifficulty or nil
    local u20 = v1.DontChangeColor or nil
    local u25 = ElevatorConfig.getGameModeColor(v1.Type, v1.Difficulty)
    local Display = a1.model:FindFirstChild("Display")
    local u34 = useMemo(function() -- Line: 55
        return Instance.new("Color3Value")
    end, {})
    local v5 = {beams, glow, u34}
    useEffect(function() -- Line: 59 -- upvalues: u34 (val), glow (val), beams (val)
        local u5 = u34.Changed:Connect(function(a1) -- Line: 60 -- upvalues: glow (upval), beams (upval)
            if glow then
                glow.Color = a1
            end
            for i, j in beams do
                j.Color = ColorSequence.new(a1)
            end
        end)
        return function() -- Line: 69 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, v5)
    v5 = {light, neon, railing, u34}
    useEffect(function() -- Line: 74 -- upvalues: spr (upval), u34 (val), neon (val), railing (val), light (val)
        return function() -- Line: 75 -- upvalues: spr (upval), u34 (upval), neon (upval), railing (upval), light (upval)
            spr.stop(u34)
            if neon then
                spr.stop(neon)
            end
            if railing then
                spr.stop(railing)
            end
            if light then
                spr.stop(light)
            end
            u34:destroy()
        end
    end, v5)
    v5 = {u25, light, neon, railing, u34, u20}
    useEffect(function() -- Line: 90 -- upvalues: u25 (val), u20 (val), neon (val), spr (upval), railing (val), light (val), u34 (val)
        if not u25 or u20 then
            return
        end
        if neon then
            spr.target(neon, 1, 2, {Color = u25})
        end
        if railing then
            spr.target(railing, 1, 2, {Color = u25})
        end
        if light then
            spr.target(light, 1, 2, {Color = u25})
        end
        spr.target(u34, 1, 2, {Value = u25})
        return function() -- Line: 110 -- upvalues: neon (upval), spr (upval), railing (upval), light (upval)
            if neon then
                spr.stop(neon)
            end
            if railing then
                spr.stop(railing)
            end
            if light then
                spr.stop(light)
            end
        end
    end, v5)
    if not screen then
        return nil
    end
    return ReactRoblox.createPortal(createElement("SurfaceGui", {
        AutoLocalize = false,
        ClipsDescendants = true,
        PixelsPerStud = 20,
        CanvasSize = Vector2.new(600, 432),
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = screen,
    }, {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
        }),
        content = createElement(world, {
            settings = v1,
            timer = Timer,
            map = Map,
            forcedIcon = v2,
            forcedColor = v3,
            forcedDifficulty = v4,
            players = Players,
            has3DPlayerCount = Display,
            onMap = function() end,
        }),
    }), screen)
end)
return function() -- Line: 159
    -- upvalues: useState (val), useEffect (val), CollectionService (val), useMemo (val), createElement (val), u52 (val)
    -- upvalues: Fragment (val)
    local u2, u3 = useState({})
    useEffect(function() -- Line: 162 -- upvalues: u3 (val), CollectionService (upval)
        local function addElevator(a1) -- Line: 163 -- upvalues: u3 (upval) -- types: a1: userdata
            local Screen = if not a1:GetAttribute("NoScreen") then a1:FindFirstChild("Screen") else nil
            local Glow = a1:FindFirstChild("Glow")
            local u69 = nil
            local u60 = nil
            local Neon = a1:FindFirstChild("Neon")
            local Railing = a1:FindFirstChild("Railing", true)
            local u31 = if not Railing then nil else if not Railing:IsA("BasePart") then nil else Railing
            local u32 = {}
            for i, j in a1:GetDescendants() do
                if j:IsA("Beam") then
                    table.insert(u32, j)
                end
            end
            if Screen then
                local SurfaceGui = Screen:FindFirstChild("SurfaceGui")
                if SurfaceGui then
                    SurfaceGui:Destroy()
                end
                u60 = Screen:FindFirstChild("PointLight")
                if u60 then
                    u60.Brightness = 0.95
                end
            end
            if Glow then
                u69 = Glow:FindFirstChild("SurfaceAppearance")
            end
            u3(function(a1_2) -- Line: 199 -- upvalues: a1 (val), u32 (val), u60 (ref), Neon (val), u31 (val), u69 (ref), Screen (val)
                local v1 = table.clone(a1_2)
                v1[a1] = {
                    beams = u32,
                    model = a1,
                    light = u60,
                    neon = Neon,
                    railing = u31,
                    glow = u69,
                    screen = Screen,
                }
                return v1
            end)
        end

        local u9 = (CollectionService:GetInstanceAddedSignal("Elevator")):Connect(addElevator)
        local u18 = (CollectionService:GetInstanceRemovedSignal("Elevator")):Connect(function(a1) -- Line: 219 -- upvalues: u3 (upval)
            u3(function(a1_2) -- Line: 220 -- upvalues: a1 (val)
                if not a1_2[a1] then
                    return a1_2
                end
                local v1 = table.clone(a1_2)
                v1[a1] = nil
                return v1
            end)
        end)
        for i, j in CollectionService:GetTagged("Elevator") do
            addElevator(j)
        end
        return function() -- Line: 235 -- upvalues: u9 (val), u18 (val)
            u9:Disconnect()
            u18:Disconnect()
        end
    end, {})
    return createElement(Fragment, {}, (useMemo(function() -- Line: 241 -- upvalues: u2 (val), createElement (upval), u52 (upval)
        local v1 = {}
        for i, j in u2 do
            v1[j.model] = (createElement(u52, j))
        end
        return v1
    end, {u2})))
end