-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.AbilityAmmo.story
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local AbilityAmmo = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.AbilityAmmo)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useBinding = React.useBinding
local useSpring = ReactFlow.useSpring
local useEffect = React.useEffect

local function render() -- Line: 15
    -- upvalues: useSpring (val), useBinding (val), useEffect (val), RunService (val), createElement (val)
    -- upvalues: AbilityAmmo (val)
    local v1, u3 = useSpring({start = 0, speed = 15, damper = 0.7})
    local v2, u7 = useSpring({start = 0, speed = 20, damping = 0.6})
    local v3, u11 = useSpring({start = 0, speed = 25, damping = 0.7})
    local u14, u15 = useBinding(0)
    local u18, u19 = useBinding(-1)
    local u22, u23 = useBinding(0)
    local u26 = useBinding(4)
    useEffect(function() -- Line: 29
        -- upvalues: RunService (upval), u22 (val), u26 (val), u14 (val), u18 (val), u11 (val), u3 (val), u7 (val)
        -- upvalues: u23 (val), u15 (val), u19 (val)
        local u0 = 0
        local u6 = RunService.RenderStepped:Connect(function(a1) -- Line: 36
            -- upvalues: u22 (upval), u26 (upval), u14 (upval), u18 (upval), u11 (upval), u3 (upval), u0 (ref)
            -- upvalues: u7 (upval), u23 (upval), u15 (upval), u19 (upval)
            local v1 = u22:getValue()
            if u26:getValue() <= v1 then
                return
            end
            v1 = (u14:getValue()) + a1 * 3
            local v2 = (1 - (v1 - 0) / 5 % 1) * 5
            local v3 = math.floor(v2)
            local v4 = 1 - v3 / 5
            if u18:getValue() ~= v3 then
                u11({force = 8})
                u3({target = v4})
                u0 = v4
            end
            if v2 < 0.6 and u0 ~= 0 then
                u7({force = 8})
                u3({target = 0})
                u23(u22:getValue() + 1)
                u0 = 0
            end
            u15(v1)
            u19(v3)
        end)
        return function() -- Line: 71 -- upvalues: u19 (upval), u3 (upval), u6 (val)
            u19(-1)
            u3({target = 0})
            u6:Disconnect()
        end
    end, {})
    return createElement(AbilityAmmo, {
        Icon = 5430597512,
        Ammo = u22,
        MaxAmmo = u26,
        ProgressPercent = v1,
        TimeLeft = u18,
        bounceSpring = v2,
        durationBounceSpring = v3,
    })
end

return function(a1) -- Line: 90 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 95 -- upvalues: u4 (val)
        u4:unmount()
    end
end