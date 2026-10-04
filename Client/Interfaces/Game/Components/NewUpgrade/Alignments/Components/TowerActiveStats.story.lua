-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerActiveStats.story
-- Decompile time: 2.25 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local TowerActiveStats = require(script.Parent.TowerActiveStats)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect

local function story() -- Line: 20
    -- upvalues: useBinding (val), useEffect (val), createElement (val), TowerActiveStats (val)
    local u2, u3 = useBinding({Level = 2, TotalCost = 0, TotalDamage = 0})
    useEffect(function() -- Line: 27 -- upvalues: u2 (val), u3 (val)
        local u0 = true
        task.spawn(function() -- Line: 30 -- upvalues: u0 (ref), u2 (upval), u3 (upval)
            local v1
            task.wait(1)
            while u0 do
                v1 = table.clone(u2:getValue())
                if math.random(1, 3) == 1 then
                    v1.Level = v1.Level + 1
                    v1.TotalCost = v1.TotalCost + math.random(1, 500)
                end
                v1.TotalDamage = v1.TotalDamage + math.random(1, 100)
                u3(v1)
                task.wait(0.5)
            end
        end)
        return function() -- Line: 48 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement(TowerActiveStats, {
        CornerRadius = 8,
        Size = UDim2.fromOffset(258, 52),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Stats = u2,
    })
end

return function(a1) -- Line: 64 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 68 -- upvalues: u4 (val)
        u4:unmount()
    end
end