-- Script path: ReplicatedStorage.Content.GlobalModifiers.AprilFools2023
-- Decompile time: 1.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local u20 = {}
local u21 = {}
local u22 = {}
local u23 = {u20, u21}
local u26 = {"AnimationId", "SoundId"}
local u29 = false
local u30 = {"rbxassetid://7676225854", "rbxassetid://7295042642"}

local function cache() -- Line: 15
    -- upvalues: u29 (ref), RunService (val), ServerStorage (val), ReplicatedStorage (val), u20 (val), u21 (val)
    -- upvalues: u22 (val)
    if u29 then
        return
    end
    local Assets = if not RunService:IsServer() then ReplicatedStorage:WaitForChild("Assets") else ServerStorage:WaitForChild("Assets")
    local v1 = if not RunService:IsServer() then {Assets:WaitForChild("NewEnemies"), (Assets:WaitForChild("Troops"))} else {Assets:WaitForChild("Enemies"), (Assets:WaitForChild("Troops"))}
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        for k, n in j:GetDescendants() do
            if n:IsA("Animation") then
                table.insert(u20, n)
            elseif n:IsA("Sound") then
                table.insert(u21, n)
            elseif n:IsA("Decal") then
                table.insert(u22, n)
            end
        end
    end
    u29 = true
end

local u35 = Random.new()

local function randomize(a1, a2, a3) -- Line: 45
    -- upvalues: cache (val), u23 (val), u26 (val), u35 (val), u22 (val), u30 (val)
    local modifyInstance, modifyInstance_2, modifyInstance_3, v1, v2, v3, v4, v5, v6
    cache()
    local v7 = nil
    local v8 = nil
    for i, j in u23, v7, v8 do
        v5 = table.clone(j)
        v6 = u26[i]
        for k, n in v5 do
            v2 = u35:NextInteger(1, #v5)
            v3 = v5[v2]
            modifyInstance_2 = v9.modifyInstance
            v4 = {}
            v4[v6] = v3[v6]
            modifyInstance_2(n, v4)
            modifyInstance_3 = v9.modifyInstance
            v4 = {}
            v4[v6] = n[v6]
            modifyInstance_3(v3, v4)
            table.remove(v5, k)
            table.remove(v5, v2)
        end
    end
    for m, i5 in u22 do
        modifyInstance = v9.modifyInstance
        v1 = {Texture = u30[u35:NextInteger(1, #u30)]}
        modifyInstance(i5, v1)
    end
end

return {
    displayName = "April fools 2022",
    description = "Randomizes everything.",
    icon = 9153315715,
    rewardMultiplier = 0.5,
    onEnableClient = randomize,
    onEnableServer = randomize,
}