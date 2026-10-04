-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.WalmartPrompt.story
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local WalmartPrompt = require(script.Parent.WalmartPrompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), WalmartPrompt (val)
    local v1, u4 = React.useBinding(true)
    local v2 = React.useState(false)
    task.delay(1, function() -- Line: 11 -- upvalues: u4 (val)
        u4(true)
    end)
    return React.createElement(WalmartPrompt, {
        Visible = v1,
        onClose = function() -- Line: 17 -- upvalues: u4 (val)
            u4(false)
            task.delay(1, function() -- Line: 20 -- upvalues: u4 (upval)
                u4(true)
            end)
        end,
        onPurchase = function() -- Line: 24
            print("purchased")
        end,
        hasGamepass = v2,
    })
end

return function(a1) -- Line: 31 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 36 -- upvalues: u4 (val)
        u4:unmount()
    end
end