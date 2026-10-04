-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassProgress.story
-- Decompile time: 3.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BattlepassProgress = require(script.Parent.BattlepassProgress)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local u21 = Random.new()
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 14
    -- upvalues: createElement (val), useState (val), useBinding (val), useEffect (val), u21 (val)
    -- upvalues: BattlepassProgress (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 15
        -- upvalues: useState (upval), useBinding (upval), useEffect (upval), u21 (upval), createElement (upval)
        -- upvalues: BattlepassProgress (upval)
        local v1, u3 = useState(1)
        local u6, u7 = useBinding(200)
        local u8 = v1 * 10
        local v2 = {u6, u8}
        useEffect(function() -- Line: 21 -- upvalues: u21 (upval), u7 (val), u6 (val), u8 (val), u3 (val)
            local u0 = true
            local u3_2 = task.spawn(function() -- Line: 24 -- upvalues: u0 (ref), u21 (upval), u7 (upval), u6 (upval), u8 (upval), u3 (upval)
                while u0 do
                    task.wait(u21:NextNumber(0.5, 1.5))
                    if not ((u21:NextNumber()) < 0.2) then
                        u7((math.min(u8, (u21:NextInteger(0, u8)))))
                    else
                        u7((math.min(u6, u8)))
                    end
                    if (u21:NextNumber()) < 0.5 then
                        u3(u21:NextInteger(1, 100))
                    end
                end
            end)
            return function() -- Line: 40 -- upvalues: u0 (ref), u3_2 (val)
                u0 = false
                task.cancel(u3_2)
            end
        end, v2)
        return createElement(BattlepassProgress, {Size = UDim2.fromOffset(868, 62), level = v1, maxProgress = u8, progress = u6})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 58 -- upvalues: u7 (val)
        u7:unmount()
    end
end