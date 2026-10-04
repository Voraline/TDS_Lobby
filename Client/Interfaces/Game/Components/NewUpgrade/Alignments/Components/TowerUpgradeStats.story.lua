-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerUpgradeStats.story
-- Decompile time: 4.81 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local TowerUpgradeStats = require(script.Parent.TowerUpgradeStats)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding
local useEffect = React.useEffect

local function story() -- Line: 21
    -- upvalues: useState (val), useEffect (val), createElement (val), TowerUpgradeStats (val), useBinding (val)
    local u0 = {
        {Text = "10 → 11", Icon = 5577896365},
        {Text = "Hidden Detection", Icon = 12270723919},
        {Text = "Another Upgrade", Expand = {"First Effect", "Second Effect"}},
        {Text = "Upgraded Bombs", Expand = {"Acid Bombs", "30% Damage Buff", "0.5 Tick"}},
    }
    local u12 = {
        {Text = "20 → 40", Icon = 5577895610},
        {Text = "Lead Detection", Icon = 12270724694},
        {Text = "Call to Arms (22.5% Firerate Buff)"},
        {Text = "Another Upgrade", Expand = {"Little Different"}},
    }
    local v1, u22 = useState(u0)
    useEffect(function() -- Line: 56 -- upvalues: u22 (val), u0 (val), u12 (val)
        local u0_2 = true
        task.spawn(function() -- Line: 59 -- upvalues: u0_2 (ref), u22 (upval), u0 (upval), u12 (upval)
            task.wait(1)
            while u0_2 do
                u22(u0)
                task.wait(1.5)
                if not u0_2 then
                    break
                end
                u22(u12)
                task.wait(1.5)
            end
        end)
        return function() -- Line: 75 -- upvalues: u0_2 (ref)
            u0_2 = false
        end
    end, {})
    return createElement(TowerUpgradeStats, {
        CornerRadius = 8,
        Size = UDim2.fromOffset(316, 170),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = useBinding(true),
        UpgradeStats = v1,
    })
end

return function(a1) -- Line: 92 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 96 -- upvalues: u4 (val)
        u4:unmount()
    end
end