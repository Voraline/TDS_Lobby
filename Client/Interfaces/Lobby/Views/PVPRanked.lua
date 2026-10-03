-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.PVPRanked
-- Decompile time: 2.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local PVPRankedNew = require(Components.PVPRankedNew)
local useCache = require(Hooks.useCache)
local useFFlag = require(Hooks.useFFlag)
local usePersist = require(Hooks.usePersist)
local useScale = require(Hooks.useScale)
local useView = require(Hooks.useView)
local useViewEnabled = require(Hooks.useViewEnabled)
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
local createElement = React.createElement
local useTween = ReactFlow.useTween
return function() -- Line: 30
    -- upvalues: useViewEnabled (val), useFFlag (val), useScale (val), useState (val), useView (val), useCache (val)
    -- upvalues: usePersist (val), useTween (val), useEffect (val), createElement (val), PVPRankedNew (val)
    -- upvalues: useCallback (val)
    local u24
    local PVPRanked = useViewEnabled("PVPRanked")
    local v1 = useFFlag("pvp.ranked-enabled", false, {enabled = PVPRanked})
    local v2 = math.max(1, (useScale(1.4, nil, nil, true)))
    local v3, u20 = useState(false)
    _, u24 = useView(true)
    local v4 = useCache("RankedPVPRating.Ranks", {})
    local v5 = useCache("RankedPVPRating.Period", {})
    local u41, u42 = usePersist({"pvp-xp"}, (useCache("RankedPVPRating.Rating.Rating", 0)))
    local u49, u50 = useTween({info = TweenInfo.new(0, Enum.EasingStyle.Sine), start = u41, target = u41})
    local v6 = {PVPRanked}
    useEffect(function() -- Line: 51 -- upvalues: PVPRanked (val), u42 (val)
        if PVPRanked then
            u42()
        end
    end, v6)
    v6 = {u41, PVPRanked}
    useEffect(function() -- Line: 57 -- upvalues: u41 (val), u49 (val), PVPRanked (val), u50 (val), u20 (val)
        local v1 = u41
        local v2 = u49:getValue()
        if not PVPRanked then
            return
        end
        if v1 < v2 then
            u50({target = v1, info = TweenInfo.new(0)})
            return
        end
        if v1 == v2 then
            return
        end
        local u21 = math.min(2, (math.max(0.2, (math.abs(v1 - v2)) * 0.005)))
        u50({target = v1, info = TweenInfo.new(u21, Enum.EasingStyle.Sine)})
        u20(true)
        local u32 = nil
        u32 = task.spawn(function() -- Line: 82 -- upvalues: u21 (val), u20 (upval), u32 (ref)
            task.wait(u21)
            u20(false)
            u32 = nil
        end)
        return function() -- Line: 88 -- upvalues: u32 (ref), u50 (upval), u49 (upval), u20 (upval)
            if u32 then
                task.cancel(u32)
            end
            u50({target = u49:getValue(), info = TweenInfo.new(0)})
            u20(false)
        end
    end, v6)
    local v7 = createElement("Frame", {
        BackgroundTransparency = 1,
        Active = false,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        scaled = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(v2, v2),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {
            pvpRanked = createElement(PVPRankedNew, {
                Visible = PVPRanked,
                completedRanks = v4,
                rank = u49,
                period = v5,
                emitter = v3,
                close = useCallback(function() -- Line: 126 -- upvalues: u24 (val)
                    u24("Hotbar")
                end, {}),
            }),
        }),
    })
    if v1 then
        return v7
    end
    if not PVPRanked then
        return
    end
    u24("Hotbar")
end