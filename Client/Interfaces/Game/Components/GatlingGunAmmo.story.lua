-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.GatlingGunAmmo.story
-- Decompile time: 1.94 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local GatlingGunAmmo = require(script.Parent.GatlingGunAmmo)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding
local useEffect = React.useEffect

local function story() -- Line: 21
    -- upvalues: useBinding (val), useState (val), useEffect (val), createElement (val), GatlingGunAmmo (val)
    local u2, u3 = useBinding(15)
    local u6 = useBinding(100)
    local v1 = useState(true)
    local v2, u15 = useBinding(false)
    useEffect(function() -- Line: 27 -- upvalues: u2 (val), u3 (val), u15 (val), u6 (val)
        local u0 = true
        task.spawn(function() -- Line: 30 -- upvalues: u0 (ref), u2 (upval), u3 (upval), u15 (upval), u6 (upval)
            local v1, v2
            while task.wait(0.3) do
                if u0 then
                    v1 = u2:getValue()
                    v2 = v1 - 5
                    if v2 == 0 then
                        u3(0)
                        u15(true)
                        task.wait(3)
                        u3(u6:getValue())
                        u15(false)
                    elseif v1 ~= 0 then
                        u3(v2)
                    else
                        u3(0)
                        u15(true)
                        task.wait(3)
                        u3(u6:getValue())
                        u15(false)
                    end
                end
            end
        end)
        return function() -- Line: 58 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement(GatlingGunAmmo, {
        Size = UDim2.fromOffset(230, 16),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = v1,
        Ammo = u2,
        MaxAmmo = u6,
        Reloading = v2,
    })
end

return function(a1) -- Line: 76 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 80 -- upvalues: u4 (val)
        u4:unmount()
    end
end