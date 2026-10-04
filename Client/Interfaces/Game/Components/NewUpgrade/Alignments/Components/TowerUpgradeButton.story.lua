-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerUpgradeButton.story
-- Decompile time: 2.15 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local TowerUpgradeButton = require(script.Parent.TowerUpgradeButton)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useBinding = React.useBinding

local function story() -- Line: 21
    -- upvalues: useState (val), createElement (val), TowerUpgradeButton (val), useBinding (val)
    local u2, u3 = useState(12000)
    local v1 = useState("Tactical Blowback")
    local v2 = useState(5587698246)
    local u14, u15 = useState(1)
    return (createElement(TowerUpgradeButton, {
        MaxLevel = 5,
        Size = UDim2.fromOffset(300, 96),
        Position = UDim2.fromScale(0.5, 0.5),
        CanAfford = useState(true),
        IsLocked = useState(false),
        Level = u14,
        Cost = u2,
        Name = v1,
        Icon = v2,
        Transparency = useBinding(0),
        OnUpgrade = function(a1) -- Line: 48 -- upvalues: u14 (ref), u2 (ref), u15 (val), u3 (val)
            if not a1 then
                return
            end
            if u14 == 5 then
                u14 = 0
                u2 = 12000
            end
            u15(u14 + 1)
            u3(u2 + 1000)
        end,
    }))
end

return function(a1) -- Line: 64 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 68 -- upvalues: u4 (val)
        u4:unmount()
    end
end