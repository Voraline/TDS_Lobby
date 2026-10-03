-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)

local function updateView(a1) -- Line: 9 -- upvalues: ViewController (val) -- types: a1: string
    ViewController:setView(a1)
end

return function(a1, a2) -- Line: 13
    -- upvalues: ViewStateStore (val), ReactCharm (val), updateView (val)
    local function getEnabled() -- Line: 14 -- upvalues: ViewStateStore (upval), a1 (val)
        return ViewStateStore.getCurrentView() == a1
    end

    if a2 then
        return (ReactCharm.useSignalBinding(getEnabled, {a1})), updateView
    end
    return (ReactCharm.useSignalState(getEnabled, {a1})), updateView
end