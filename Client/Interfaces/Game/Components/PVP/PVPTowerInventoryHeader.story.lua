-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHeader.story
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPTowerInventoryHeader = require(script.Parent.PVPTowerInventoryHeader)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 12
    -- upvalues: createElement (val), useBinding (val), useState (val), useEffect (val), PVPTowerInventoryHeader (val)
    -- upvalues: ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13
        -- upvalues: useBinding (upval), useState (upval), useEffect (upval), createElement (upval)
        -- upvalues: PVPTowerInventoryHeader (upval)
        local u2, u3 = useBinding(7)
        local v1, u7 = useState("BAN YOUR TOWERS!")
        useEffect(function() -- Line: 17 -- upvalues: u2 (val), u3 (val), u7 (val)
            local u0 = true
            local u1 = nil
            u1 = task.spawn(function() -- Line: 20 -- upvalues: u2 (upval), u0 (ref), u3 (upval), u7 (upval), u1 (ref)
                local v1 = 0
                local v2 = u2:getValue()
                while u0 do
                    v1 = v1 + task.wait()
                    u3((math.max(0, v2 - v1)))
                    if v2 - v1 <= 0 then
                        break
                    end
                end
                u7("WAIT TO BAN TOWERS!")
                u0 = false
                u1 = nil
            end)
            return function() -- Line: 39 -- upvalues: u0 (ref), u1 (ref)
                u0 = false
                if u1 then
                    task.cancel(u1)
                end
            end
        end, {})
        return createElement(PVPTowerInventoryHeader, {
            Size = UDim2.fromOffset(1054, 80),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            timer = u2,
            title = v1,
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 61 -- upvalues: u7 (val)
        u7:unmount()
    end
end