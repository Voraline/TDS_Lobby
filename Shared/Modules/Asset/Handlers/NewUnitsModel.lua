-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewUnitsModel
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Towers = game:GetService("SoundService"):WaitForChild("Towers")
local u24 = {}
local u25 = {KingpinBodyGuard = "KingpinHenchman"}

local function resolveUnitFolder(a1, a2) -- Line: 12
    -- upvalues: RunService (val), u25 (val)
    if RunService:IsServer() then
        return a1:FindFirstChild(a2) or u25[a2] and a1:FindFirstChild(u25[a2])
    end
    local v1 = a1:FindFirstChild(a2)
    if v1 then
        return v1
    end
    local v2 = u25[a2]
    if not v2 then
        return a1:WaitForChild(a2)
    end
    return a1:WaitForChild(a2, 0.2) or a1:WaitForChild(v2)
end

local function resolveUnitModel(a1, a2) -- Line: 31
    -- upvalues: RunService (val), ServerStorage (val), ReplicatedStorage (val), resolveUnitFolder (val), Towers (val)
    -- upvalues: u24 (val)
    local u64, v1
    local v2 = resolveUnitFolder(
        if not RunService:IsServer() then (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Units") else ServerStorage.Assets:WaitForChild("Units"),
        a1
    )
    if not v2 then
        return
    end
    if not RunService:IsServer() then
        v1 = v2:WaitForChild("Skins")
        u64 = v1:WaitForChild(a2, 0.2) or v1:WaitForChild("Default")
    else
        v1 = v2:FindFirstChild("Skins")
        u64 = v1:FindFirstChild(a2) or v1:FindFirstChild("Default")
    end
    if not u64 then
        return
    end
    for i, j in u64:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Towers
        end
    end
    u64.Destroying:Connect(function() -- Line: 65 -- upvalues: u24 (upval), a1 (val), a2 (val), u64 (ref)
        if not u24[a1] then
            return
        end
        if u24[a1][a2] then
            local v1 = u24[a1][a2]
            if v1 == u64 then
                v1 = u24[a1]
                v1[a2] = nil
                return
            end
        end
    end)
    return u64
end

return function(a1, a2) -- Line: 80 -- upvalues: u24 (val), resolveUnitModel (val) -- types: a1: string, a2: string?
    local v1 = a2 or "Default"
    if not u24[a1] then
        u24[a1] = {}
    end
    if not u24[a1][v1] then
        local v2 = u24[a1]
        v2[v1] = (resolveUnitModel(a1, v1))
    end
    return u24[a1][v1]
end