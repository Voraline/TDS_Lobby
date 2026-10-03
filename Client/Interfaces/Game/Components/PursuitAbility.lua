-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PursuitAbility
-- Decompile time: 1.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CircularRangeRing = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.CircularRangeRing)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useReplicatorBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorBinding)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local memo = React.memo
local Fragment = React.Fragment
local u44 = Color3.new(1, 1, 1)
return memo(function(a1) -- Line: 24
    -- upvalues: useTagReplicatorInstance (val), useReplicatorBinding (val), useRef (val), useEffect (val)
    -- upvalues: createElement (val), Fragment (val), CircularRangeRing (val), u44 (val), ReactRoblox (val)
    local cursorPosition = a1.cursorPosition
    local v1 = useReplicatorBinding(useTagReplicatorInstance(a1.model, "TowerReplicator", "Tower"), "PatrolRange", 16)
    local v2 = useRef()
    local u15 = useRef()
    local v3 = useRef()
    useEffect(function() -- Line: 35 -- upvalues: a1 (val), u15 (val)
        local FlightPos = a1.model:FindFirstChild("FlightPos")
        if FlightPos then
            u15.current = FlightPos.Node
        end
    end)
    return createElement(Fragment, nil, {
        ring = createElement(CircularRangeRing, {alwaysOnTop = true, target = v2.current, radius = v1, color = u44}),
        pursuitAbilityPart = ReactRoblox.createPortal({
            part = createElement("Part", {
                Size = Vector3.new(1, 1, 1),
                Anchored = true,
                CanCollide = false,
                CanTouch = false,
                CanQuery = false,
                Transparency = 1,
                Position = cursorPosition,
                ref = v2,
            }, {
                attachment = createElement("Attachment", {ref = v3}),
                beam = createElement("Beam", {
                    FaceCamera = true,
                    Texture = "rbxassetid://142506854",
                    TextureSpeed = 2,
                    TextureLength = 2.25,
                    Width0 = 3,
                    Width1 = 3,
                    Transparency = NumberSequence.new(0),
                    Color = ColorSequence.new(u44),
                    TextureMode = Enum.TextureMode.Static,
                    Attachment0 = u15,
                    Attachment1 = v3,
                }),
            }),
        }, workspace),
    })
end)