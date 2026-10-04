-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerSelectionAmount.story
-- Decompile time: 1.67 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local TowerSelectionAmount = require(script.Parent.TowerSelectionAmount)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement

local function story() -- Line: 17 -- upvalues: React (val), createElement (val), TowerSelectionAmount (val)
    local v1, u4 = React.useState(0)
    React.useEffect(function() -- Line: 20 -- upvalues: u4 (val)
        for i = 1, 5 do
            task.delay(i * 0.5, function() -- Line: 22 -- upvalues: u4 (upval), i (val)
                u4(i)
            end)
        end
    end, {})
    return createElement(TowerSelectionAmount, {
        amount = 5,
        selected = v1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.2, 0.023),
    })
end

return function(a1) -- Line: 36 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 40 -- upvalues: u4 (val)
        u4:unmount()
    end
end