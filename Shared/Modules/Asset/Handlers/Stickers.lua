-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Stickers
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sticker = require(ReplicatedStorage.Shared.Modules.Content)("Sticker")
local u18 = {}
return function(a1) -- Line: 19 -- upvalues: u18 (val), Sticker (val), RunService (val) -- types: a1: string
    local v1
    if u18[a1] then
        return u18[a1]
    end
    local v2 = nil
    local v3 = Sticker:WaitForChild(a1)
    if not v3:IsA("ModuleScript") then
        v1 = require(v3.Data)
        if RunService:IsClient() and v3:FindFirstChild("Animator") then
            v2 = require(v3.Animator)
        end
    else
        v1 = require(v3)
    end
    if v1 then
        v1.Animator = v2
    end
    u18[a1] = v1
    return v1
end