-- Script path: ReplicatedStorage.Client.Modules.CommunicationTowerModel
-- Decompile time: 0.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Streaming = require(ReplicatedStorage.Shared.Modules.Network).Channel("Streaming")
local u23 = {}

local function waitForChild(a1, a2, a3) -- Line: 12 -- types: a1: userdata?, a2: string, a3: number
    if not a1 then
        return nil
    end
    return a1:FindFirstChild(a2) or a1:WaitForChild(a2, a3)
end

function u23.request(a1, a2) -- Line: 20
    -- upvalues: RunService (val), Streaming (val)
    if not RunService:IsRunning() then
        return
    end
    Streaming:FireServer("SelectTower", a1, a2 or "Default", true)
end

function u23.get(a1, a2, a3) -- Line: 28
    -- upvalues: u23 (val), ReplicatedStorage (val), Asset (val)
    local v1 = a2 or "Default"
    local v2 = a3 or 10
    u23.request(a1, v1)
    local v3 = ReplicatedStorage
    local v4 = if v3 then v3:FindFirstChild("Assets") or v3:WaitForChild("Assets", v2) else nil
    v3 = if v4 then v4:FindFirstChild("Troops") or v4:WaitForChild("Troops", v2) else nil
    local v5 = if v3 then v3:FindFirstChild(a1) or v3:WaitForChild(a1, v2) else nil
    local v6 = if v5 then v5:FindFirstChild("Skins") or v5:WaitForChild("Skins", v2) else nil
    if not (if v6 then v6:FindFirstChild(v1) or v6:WaitForChild(v1, v2) else nil) then
        return nil
    end
    return Asset("TroopsModel", a1, v1)
end

return u23