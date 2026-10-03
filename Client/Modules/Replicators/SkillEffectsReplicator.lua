-- Script path: ReplicatedStorage.Client.Modules.Replicators.SkillEffectsReplicator
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SkillEffects = require(ReplicatedStorage.Shared.Modules.NewNetwork).Channel("SkillEffects")
local u18 = {}

function u18.Emit(a1, a2) -- Line: 10 -- upvalues: EmitterManager (val) -- types: a1: string, a2: vector
    if a1 and a2 then
        if type(a1) == "string" and typeof(a2) == "Vector3" then
            EmitterManager.Emit(a1, CFrame.new(a2))
            return
        end
        warn("Invalid argument types for SkillEffectsReplicator.Emit. Expected (string, Vector3), got:", type(a1), (typeof(a2)))
        return
    end
    warn("Invalid arguments for SkillEffectsReplicator.Emit:", a1, a2)
end

SkillEffects:onUnreliableEvent("Emit", function(...) -- Line: 31 -- upvalues: u18 (val)
    u18.Emit(...)
end)
return u18