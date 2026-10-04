-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.FakeKickMessage
-- Decompile time: 1.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FakeKickMessage = require(ReplicatedStorage.Client.Interfaces.Components.FakeKickMessage)
local FakeKickStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.FakeKickStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local createElement = React.createElement

local function render() -- Line: 10
    -- upvalues: ReactCharm (val), FakeKickStore (val), createElement (val), FakeKickMessage (val)
    local v1 = ReactCharm.useSignalState(FakeKickStore.getState)
    if not v1.enabled then
        return nil
    end
    return createElement(FakeKickMessage, {kickMessage = v1.text})
end

return function(a1) -- Line: 22 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(999999999)
    a1.setIgnoreGuiInset(true)
    return createElement(render)
end