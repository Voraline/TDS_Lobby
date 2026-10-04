-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.DPSPanel.story
-- Decompile time: 1.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local DPSPanel = require(script.Parent.DPSPanel)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState

local function story() -- Line: 23
    -- upvalues: useState (val), Icons (val), useEffect (val), createElement (val), DPSPanel (val)
    local v1, u22 = useState({
        {Tooltip = "Default DPS", Value = 43.75, Icon = Icons.Attack},
        {Tooltip = "Burn DPS", Value = 7.5, Icon = Icons.FireImmune},
        {
            Tooltip = "Total DPS",
            Value = 51.25,
            Icon = Icons.ExplosionDamage,
            PulseColor3 = Color3.fromRGB(255, 85, 85),
            TextColor3 = Color3.fromRGB(255, 85, 85),
        },
    })
    useEffect(function() -- Line: 36 -- upvalues: u22 (val)
        local u0 = true
        task.spawn(function() -- Line: 39 -- upvalues: u0 (ref), u22 (upval)
            task.wait(1)
            while u0 do
                u22(function(a1) -- Line: 43
                    local v1 = table.clone(a1)
                    local v2 = math.random(1, #v1)
                    v1[v2] = (table.clone(v1[v2]))
                    local v3 = v1[v2]
                    v3.Value = math.round((math.random(25, 900)) / 10 * 100) / 100
                    return v1
                end)
                task.wait(1)
            end
        end)
        return function() -- Line: 55 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement(DPSPanel, {
        TooltipsEnabled = true,
        Size = UDim2.fromOffset(95, 0),
        Position = UDim2.fromScale(0.5, 0.4),
        AnchorPoint = Vector2.new(0.5, 0),
        Stats = v1,
    })
end

return function(a1) -- Line: 70 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 74 -- upvalues: u4 (val)
        u4:unmount()
    end
end