-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useView
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)

local function updateView(a1) -- Line: 9 -- upvalues: ViewController (val) -- types: a1: string
    ViewController:setView(a1)
end

return function(a1) -- Line: 13 -- upvalues: ReactCharm (val), ViewStateStore (val), updateView (val) -- types: a1: boolean?
    if a1 then
        return (ReactCharm.useSignalBinding(ViewStateStore.getCurrentView)), updateView
    end
    return (ReactCharm.useSignalState(ViewStateStore.getCurrentView)), updateView
end