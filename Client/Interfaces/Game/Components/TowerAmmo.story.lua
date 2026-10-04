-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerAmmo.story
-- Decompile time: 2.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TowerAmmo = require(script.Parent.TowerAmmo)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect

local function render(a1) -- Line: 10 -- upvalues: React (val), useEffect (val), createElement (val), TowerAmmo (val)
    local u4, u5 = React.useState(100)
    local v1, u10 = React.useState(false)
    useEffect(function() -- Line: 14 -- upvalues: u4 (val), u5 (val), u10 (val)
        local u0 = true
        task.spawn(function() -- Line: 17 -- upvalues: u4 (upval), u0 (ref), u5 (upval), u10 (upval)
            local v1 = u4
            while u0 do
                v1 = math.max(0, v1 - (math.random(1, 20)))
                u5(v1)
                if v1 < 1 then
                    u10(true)
                    return
                end
                task.wait(math.random(0.5, 1))
            end
        end)
        return function() -- Line: 33 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement(TowerAmmo, {
        MaxAmmo = 100,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromOffset(10, 10),
        Size = UDim2.fromOffset(226, 16),
        Ammo = u4,
        Reloading = v1,
    })
end

return function(a1) -- Line: 49 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 53 -- upvalues: u4 (val)
        u4:unmount()
    end
end