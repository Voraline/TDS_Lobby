-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack.Modal.story
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useServerTick = require(ReplicatedStorage.Client.Interfaces.Hooks.useServerTick)
local Modal = require(script.Parent.Modal).Modal
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement

local function Container() -- Line: 11
    -- upvalues: useReactBinding (val), useServerTick (val), createElement (val), Modal (val)
    local v1 = useReactBinding(true)
    local v2 = useServerTick()
    local u9 = workspace:GetServerTimeNow() + 259200
    return createElement(Modal, {
        Visible = v1,
        Duration = v2:map(function(a1) -- Line: 17 -- upvalues: u9 (val)
            local v1 = math.max(0, u9 - a1)
            return string.format("%02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 / 60 % 60), (math.floor(v1 % 60)))
        end),
        Purchase = function() -- Line: 29
            warn("let us purchase!")
        end,
        LeaveModal = function() -- Line: 32
            print("leave modal!! :D")
        end,
    })
end

return function(a1) -- Line: 38 -- upvalues: createElement (val), Container (val), React (val)
    React.mount(createElement(Container, {}), a1)
    return function() -- Line: 42
        root:unmount()
    end
end