-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassBanner.story
-- Decompile time: 2.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BattlepassBanner = require(script.Parent.BattlepassBanner)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), BattlepassBanner (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), BattlepassBanner (upval)
        local u3, u4 = React.useState(true)
        local v1 = {u3}
        React.useEffect(function() -- Line: 13 -- upvalues: u3 (val), u4 (val)
            if u3 then
                return
            end
            local u3_2 = task.spawn(function() -- Line: 18 -- upvalues: u4 (upval)
                task.wait(2)
                u4(true)
            end)
            return function() -- Line: 23 -- upvalues: u3_2 (val)
                task.cancel(u3_2)
            end
        end, v1)
        return createElement(BattlepassBanner, {
            name = "Tyler Smells",
            Visible = u3,
            clicked = function() -- Line: 31 -- upvalues: u4 (val), u3 (val)
                u4(not u3)
            end,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 40 -- upvalues: u7 (val)
        u7:unmount()
    end
end