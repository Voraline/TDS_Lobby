-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Achievements.Achievement.story
-- Decompile time: 2.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Achievement = require(script.Parent.Achievement)
return function(a1) -- Line: 8 -- upvalues: React (val), Achievement (val), ReactRoblox (val)
    local v1 = React.createElement(function() -- Line: 9 -- upvalues: React (upval), Achievement (upval)
        local u4
        _, u4 = React.useState(false)
        local u8, u9 = React.useBinding(0)
        React.useEffect(function() -- Line: 13 -- upvalues: u9 (val), u8 (val), u4 (val)
            local u0 = true
            local u3 = task.spawn(function() -- Line: 15 -- upvalues: u0 (ref), u9 (upval), u8 (upval), u4 (upval)
                while u0 do
                    task.wait(0.1)
                    u9(u8:getValue() + 100)
                    if 10000 <= (u8:getValue()) then
                        u4(true)
                        task.wait(2)
                        u4(false)
                        u9(0)
                    end
                end
            end)
            return function() -- Line: 28 -- upvalues: u0 (ref), u3 (val)
                u0 = false
                if u3 then
                    task.cancel(u3)
                end
            end
        end, {})
        return React.createElement(Achievement, {
            maxProgress = 10000,
            name = "Test Quest",
            claimable = true,
            completed = false,
            size = UDim2.fromScale(0.5, 0.5),
            position = UDim2.fromScale(0.5, 0.5),
            anchorPoint = Vector2.new(0.5, 0.5),
            progress = u8,
            rewards = {{type = "stat", stat = "Experience", amount = 100}},
            onClaim = function(a1) -- Line: 52 -- types: a1: string?
                print("claim", a1)
            end,
        })
    end)
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 61 -- upvalues: u8 (val)
        u8:unmount()
    end
end