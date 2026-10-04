-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Radio.Radio.story
-- Decompile time: 2.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function RadioStory() -- Line: 7 -- upvalues: React (val), Parent (val)
    local v1, u4 = React.useState(true)
    local v2, u9 = React.useState(nil)
    local u13, u14 = React.useState(true)

    local function u15() -- Line: 12 -- upvalues: u9 (val), u4 (val)
        u9(UDim2.fromScale(0.5, 1.5))
        task.delay(0.5, function() -- Line: 14 -- upvalues: u4 (upval)
            u4(false)
        end)
    end

    if not v1 then
        return nil
    end
    return React.createElement(Parent, {
        Position = v2,
        onClose = function() -- Line: 25 -- upvalues: u9 (val), u4 (val)
            print("Closed")
            u9(UDim2.fromScale(0.5, 1.5))
            task.delay(0.5, function() -- Line: 14 -- upvalues: u4 (upval)
                u4(false)
            end)
        end,
        onSend = function(a1, a2, a3) -- Line: 29 -- upvalues: u13 (val), u14 (val), u15 (val)
            if not u13 then
                return
            end
            if a1 ~= "a" then
                a2()
                return
            end
            print("Sent", a1)
            a3()
            u14(false)
            task.delay(2.9, u15)
        end,
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    story = function() -- Line: 48 -- upvalues: React (val), RadioStory (val)
        return React.createElement(RadioStory)
    end,
}