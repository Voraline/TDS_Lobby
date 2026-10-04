-- Script path: ReplicatedStorage.Content.Emote.Scarecrow.Animator
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: spr (val)
    if a1.Preview then
        return
    end
    local ScarecrowHatAccessory = a1.Character.Instance:WaitForChild("ScarecrowHatAccessory")
    ScarecrowHatAccessory:ScaleTo(0.01)
    spr.target(ScarecrowHatAccessory, 0.75, 1, {Scale = 1})
    a1:PlayTrack("rbxassetid://111071957612624")
end

return v1