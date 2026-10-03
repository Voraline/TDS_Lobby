-- Script path: ReplicatedStorage.Shared.Modules.Content
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local u28 = if not RunService:IsRunning() then ServerStorage:WaitForChild("Content") else ReplicatedStorage:WaitForChild("Content")
return function(a1) -- Line: 12 -- upvalues: u28 (ref) -- types: a1: string
    return (u28:WaitForChild(a1))
end