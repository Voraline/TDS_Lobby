-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Level.Level.story
-- Decompile time: 1.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Experience = require(ReplicatedStorage.Shared.Modules.Experience)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local createElement = React.createElement
local useEffect = React.useEffect
return function(a1) -- Line: 12
    -- upvalues: createElement (val), React (val), Experience (val), useEffect (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13
        -- upvalues: React (upval), Experience (upval), useEffect (upval), createElement (upval), Parent (upval)
        local u3, u4 = React.useState(1)
        local u8, u9 = React.useState(0)
        local u15, u16 = React.useState(Experience(u3))
        useEffect(function() -- Line: 18 -- upvalues: u9 (val)
            local u0 = true
            local u3 = task.spawn(function() -- Line: 21 -- upvalues: u0 (ref), u9 (upval)
                while u0 do
                    task.wait(1)
                    u9(function(a1) -- Line: 24
                        return a1 + 10
                    end)
                end
            end)
            return function() -- Line: 30 -- upvalues: u0 (ref), u3 (val)
                u0 = false
                task.cancel(u3)
            end
        end, {})
        local v1 = {u3}
        useEffect(function() -- Line: 37 -- upvalues: u16 (val), Experience (upval), u3 (val)
            u16(Experience(u3))
        end, v1)
        v1 = {u8, u15}
        useEffect(function() -- Line: 41 -- upvalues: u8 (val), u15 (val), u4 (val), u9 (val)
            if u15 <= u8 then
                u4(function(a1) -- Line: 43
                    return a1 + 1
                end)
                u9(function(a1) -- Line: 46 -- upvalues: u8 (upval), u15 (upval)
                    return u8 - u15
                end)
            end
        end, v1)
        return (createElement(Parent, {
            size = UDim2.fromScale(0.787, 0.333),
            position = UDim2.fromScale(0.5, 0.917),
            exp = u8,
            maxExp = u15,
            level = u3,
        }))
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 66 -- upvalues: u7 (val)
        u7:unmount()
    end
end