-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.TowerTimeSpans
-- Decompile time: 6.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local useInGameTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useInGameTowers)
local usePrimaryPart = require(ReplicatedStorage.Client.Interfaces.Hooks.usePrimaryPart)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local useEffect = React.useEffect
local useBinding = React.useBinding
local useRef = React.useRef
local memo = React.memo
local joinBindings = React.joinBindings
local u74 = memo(function(a1) -- Line: 27
    -- upvalues: usePrimaryPart (val), useTagReplicatorInstance (val), useBinding (val), useRef (val)
    -- upvalues: joinBindings (val), useEffect (val), Maid (val), usePooledEvent (val), RunService (val)
    -- upvalues: ServerTicks (val), createPortal (val), createElement (val)
    local model = a1.model
    local v1 = usePrimaryPart(model)
    local u9 = useTagReplicatorInstance(model, "TowerReplicator", "Tower")
    local u12, u13 = useBinding(0)
    local u16, u17 = useBinding(0)
    local v2, u21 = useBinding(0)
    local u24 = useRef(0)
    local v3 = joinBindings({v2, u12}):map(function(a1) -- Line: 37
        return UDim2.fromScale(math.clamp(a1[1] / a1[2], 0, 1), 1)
    end)
    local v4 = joinBindings({v2, u12}):map(function(a1) -- Line: 42
        local v1 = false
        if 0 < a1[1] then
            v1 = 0 < a1[2]
        end
        return v1
    end)
    local v5 = {u9}
    useEffect(function() -- Line: 48 -- upvalues: Maid (upval), u9 (val), u13 (val), u17 (val)
        local u2 = Maid.new()
        if u9 then
            u13(u9:Get("MaxLifeTime") or 0)
            u17(u9:Get("LifeTime") or 0)
            u2:Mark(((u9:GetStateChangedSignal("LifeTime")):Connect(function(a1) -- Line: 54 -- upvalues: u17 (upval)
                u17(a1 or 0)
            end)))
            u2:Mark(((u9:GetStateChangedSignal("MaxLifeTime")):Connect(function(a1) -- Line: 58 -- upvalues: u13 (upval)
                u13(a1)
            end)))
        end
        return function() -- Line: 63 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v5)
    usePooledEvent(RunService.Heartbeat, function(a1) -- Line: 68 -- upvalues: u24 (val), u12 (val), u16 (val), u21 (val), ServerTicks (upval)
        local v1 = u24
        v1.current = v1.current + a1
        if u24.current < 0.1 then
            return
        end
        u24.current = 0
        v1 = u12:getValue() or 0
        if v1 <= 0 then
            return
        end
        u21((u16:getValue() or 0) + v1 - ServerTicks.getTime())
    end, {})
    return createPortal({
        lifeSpan = createElement("BillboardGui", {
            Enabled = v4,
            Size = UDim2.fromScale(3, 0.25),
            StudsOffset = Vector3.new(0, model:GetExtentsSize().Y / 2 + 0.2, 0),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            frame = createElement("Frame", {
                BackgroundTransparency = 0.5,
                BorderSizePixel = 2,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(1, 1),
            }, {
                frame1 = createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 151, 33),
                    BorderColor3 = Color3.fromRGB(255, 255, 255),
                    Size = v3,
                }),
            }),
        }),
    }, v1, "lifeSpan")
end)
return function() -- Line: 111 -- upvalues: useInGameTowers (val), table (val), createElement (val), u74 (val), React (val)
    local v1 = useInGameTowers()
    debug.profilebegin("UIFanout_TowerTimeSpans")
    local v2 = table.reduce(v1, function(a1, a2, a3) -- Line: 115 -- upvalues: createElement (upval), u74 (upval) -- types: a3: userdata
        a1[a2.UID] = (createElement(u74, {model = a3}))
        return a1
    end, {})
    debug.profileend()
    return createElement(React.Fragment, {}, {children = createElement(React.Fragment, {}, v2)})
end