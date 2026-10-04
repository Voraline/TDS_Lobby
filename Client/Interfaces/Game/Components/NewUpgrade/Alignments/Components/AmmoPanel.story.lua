-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.AmmoPanel.story
-- Decompile time: 1.77 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local AmmoPanel = require(script.Parent.AmmoPanel)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding
local useEffect = React.useEffect

local function story() -- Line: 21
    -- upvalues: useBinding (val), useState (val), useEffect (val), createElement (val), AmmoPanel (val)
    local u2, u3 = useBinding(80)
    local u6 = useBinding(100)
    local v1, u11 = useState(true)
    useEffect(function() -- Line: 27 -- upvalues: u2 (val), u6 (val), u3 (val), u11 (val)
        local u0 = true
        task.spawn(function() -- Line: 30 -- upvalues: u0 (ref), u2 (upval), u6 (upval), u3 (upval), u11 (upval)
            local v1, v2, v3
            while task.wait(1) do
                if u0 then
                    v1 = u2:getValue()
                    v2 = u6:getValue()
                    v3 = if v1 ~= v2 then math.min(v1 + math.random(1, 20), v2) else 0
                    u3(v3)
                    u11(1 < (math.random(1, 4)))
                end
            end
        end)
        return function() -- Line: 49 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement(AmmoPanel, {
        Size = UDim2.fromOffset(230, 16),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = v1,
        Ammo = u2,
        MaxAmmo = u6,
    })
end

return function(a1) -- Line: 66 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 70 -- upvalues: u4 (val)
        u4:unmount()
    end
end