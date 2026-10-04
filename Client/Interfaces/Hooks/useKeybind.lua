-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useKeybind
-- Decompile time: 1.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)

local function isBind(a1, a2) -- Line: 9 -- types: a1: userdata
    local v1 = true
    if a1.KeyCode ~= a2 then
        v1 = a1.UserInputType == a2
    end
    return v1
end

return function(a1) -- Line: 13 -- upvalues: React (val), Maid (val), UserInputService (val) -- types: a1: table
    local v1, u5 = React.useBinding(false)
    React.useEffect(function() -- Line: 16 -- upvalues: Maid (upval), UserInputService (upval), a1 (val), u5 (val)
        local u2 = Maid.new()
        u2:Mark((UserInputService.InputBegan:Connect(function(a1_2) -- Line: 19 -- upvalues: a1 (upval), u5 (upval)
            local Key = a1.Key
            local v1 = true
            if a1_2.KeyCode ~= Key then
                v1 = a1_2.UserInputType == Key
            end
            if v1 then
                u5(true)
            end
        end)))
        u2:Mark((UserInputService.InputEnded:Connect(function(a1_2) -- Line: 24 -- upvalues: a1 (upval), u5 (upval)
            local Key = a1.Key
            local v1 = true
            if a1_2.KeyCode ~= Key then
                v1 = a1_2.UserInputType == Key
            end
            if v1 then
                u5(false)
            end
        end)))
        return function() -- Line: 30 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    return v1
end