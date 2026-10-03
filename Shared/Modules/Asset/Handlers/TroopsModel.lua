-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.TroopsModel
-- Decompile time: 1.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Troops = require(ReplicatedStorage.Shared.Modules.ContentAssets)("Troops")
local Towers = SoundService:WaitForChild("Towers")
local u22 = {}

local function resolveTroopModel(a1, a2) -- Line: 14
    -- upvalues: Troops (val), Towers (val), u22 (val)
    local v1 = Troops:FindFirstChild(a1) or Troops:WaitForChild(a1, 30)
    if not v1 then
        return
    end
    local Skins = v1:FindFirstChild("Skins") or v1:WaitForChild("Skins", 5)
    if not Skins then
        return
    end
    local u34 = Skins:FindFirstChild(a2)
    if not u34 then
        u34 = Skins:WaitForChild(a2, 5)
    end
    if not u34 then
        return
    end
    for i, j in u34:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Towers
        end
    end
    u34.Destroying:Connect(function() -- Line: 41 -- upvalues: u22 (upval), a1 (val), a2 (val), u34 (val)
        if not u22[a1] then
            return
        end
        if u22[a1][a2] then
            local v1 = u22[a1][a2]
            if v1 == u34 then
                v1 = u22[a1]
                v1[a2] = nil
                return
            end
        end
    end)
    return u34
end

return function(a1, a2) -- Line: 56 -- upvalues: u22 (val), resolveTroopModel (val) -- types: a1: string, a2: string?
    local v1 = a2 or "Default"
    if not u22[a1] then
        u22[a1] = {}
    end
    if not u22[a1][v1] then
        local v2 = u22[a1]
        v2[v1] = (resolveTroopModel(a1, v1))
    end
    return u22[a1][v1]
end