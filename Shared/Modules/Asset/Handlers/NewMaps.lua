-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps
-- Decompile time: 0.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Maps = require(ReplicatedStorage.Shared.Modules.Content)("Maps")
local u23 = {}
return function(a1, a2) -- Line: 27 -- upvalues: u23 (val), Maps (val), RunService (val), ServerStorage (val)
    local v1
    if u23[a1] then
        if a2 and not u23[a1].Gamemodes[a2] then
            return
        end
        return u23[a1]
    end
    if not Maps:FindFirstChild(a1) then
        return
    end
    local v2 = nil
    local v3 = nil
    if not Maps[a1]:IsA("ModuleScript") then
        local v4 = Maps[a1]
        v1 = require(v4.Data)
        if RunService:IsServer() then
            local v5 = ServerStorage.Animators.Maps:FindFirstChild(a1)
            if v5 then
                v2 = require(v5)
            end
        elseif v4:FindFirstChild("Animator") then
            v3 = require(v4.Animator)
        end
    else
        v1 = require(Maps[a1])
    end
    if v1 then
        v1.Animator = v3
        v1.Controller = v2
    end
    if a2 and not v1.Gamemodes[a2] then
        return
    end
    u23[a1] = v1
    return v1
end