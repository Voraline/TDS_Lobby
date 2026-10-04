-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassGift.story
-- Decompile time: 2.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BattlepassGift = require(script.Parent.BattlepassGift)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), BattlepassGift (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), BattlepassGift (upval)
        local v1, u4 = React.useState(true)
        local v2, u9 = React.useState({})
        React.useEffect(function() -- Line: 14 -- upvalues: u9 (val)
            local u2 = task.spawn(function() -- Line: 15 -- upvalues: u9 (upval)
                while true do
                    task.wait(2)
                    for i = 1, 20 do
                        u9(function(a1) -- Line: 20 -- upvalues: i (val)
                            table.insert(a1, {UserId = 19004289 - i + 1, Name = "Player " .. i})
                            return table.clone(a1)
                        end)
                        task.wait(0.25)
                    end
                    task.wait(4)
                    for j = 1, 20 do
                        u9(function(a1) -- Line: 35
                            table.remove(a1, 1)
                            return table.clone(a1)
                        end)
                        task.wait(0.25)
                    end
                end
            end)
            return function() -- Line: 45 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(BattlepassGift, {
            Size = UDim2.fromScale(0.2759, 0.475),
            Visible = v1,
            players = v2,
            closed = function() -- Line: 55 -- upvalues: u4 (val)
                u4(false)
                task.wait(2)
                u4(true)
            end,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 66 -- upvalues: u7 (val)
        u7:unmount()
    end
end