-- Script path: ReplicatedStorage.Shared.UI.Components.AnimationCache
-- Decompile time: 0.44 ms

local v1 = game:GetService("RunService"):IsServer()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Promise = if not v1 then require(ReplicatedStorage.Shared.Modules.Promise) else require(ServerStorage.Server.Modules.Session.DataStore2.Promise)

local function waitForAnimation(a1) -- Line: 12 -- upvalues: Promise (val) -- types: a1: userdata
    return Promise(function(a1_2, a2) -- Line: 13 -- upvalues: a1 (val)
        while not (0 < a1.Length) do
            task.wait()
        end
        a1_2()
    end)
end

return function(a1) end