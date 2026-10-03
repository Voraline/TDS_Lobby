-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.HealthTooltip.story
-- Decompile time: 1.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HealthTooltip = require(script.Parent.HealthTooltip)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useState = React.useState
local useEffect = React.useEffect
local createElement = React.createElement

local function Tooltip(a1) -- Line: 10
    -- upvalues: useState (val), useEffect (val), createElement (val), HealthTooltip (val)
    local u3, u4 = useState(1000)
    useEffect(function() -- Line: 14 -- upvalues: u3 (val), u4 (val)
        task.spawn(function() -- Line: 17 -- upvalues: u3 (upval), u4 (upval)
            local v1
            local v2 = u3
            while true do
                v1 = v2 - math.random(50, 150)
                if v1 < 0 then
                    break
                end
                u4(v1)
                task.wait(math.random(0.5, 1))
            end
            u4(0)
        end)
        return function() end
    end, {})
    return createElement(HealthTooltip, {
        Name = "Amalgamation",
        MaxHealth = 1000,
        TimeLeft = 30,
        MaxTimeLeft = 30,
        Shield = 0,
        Extras = {
            {Name = "Lead", Icon = 12270724694},
            {Name = "Hidden", Icon = 12270723919},
            {Name = "Flying", Icon = 12270724272},
        },
        Health = u3,
    })
end

return function(a1) -- Line: 53 -- upvalues: createElement (val), Tooltip (val), ReactRoblox (val)
    local v1 = createElement(Tooltip)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 58 -- upvalues: u7 (val)
        u7:unmount()
    end
end