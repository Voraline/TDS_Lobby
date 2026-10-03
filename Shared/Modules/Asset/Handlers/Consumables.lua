-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Consumables
-- Decompile time: 1.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u33 = RunService:IsServer()
local u36 = RunService:IsRunning()
local u37 = {}
local Consumables = Content("Consumables")
local Value = workspace.Type.Value

local function normalizeName(a1) -- Line: 21 -- types: a1: string
    return (a1:lower():gsub("%s", ""))
end

local function resolveConsumable(a1) -- Line: 26 -- upvalues: Consumables (val) -- types: a1: string
    local v1 = Consumables:FindFirstChild(a1)
    if v1 then
        return v1
    end
    local v2 = a1:lower():gsub("%s", "")
    for i, j in Consumables:GetChildren() do
        if j.Name:lower():gsub("%s", "") == v2 then
            return j
        end
    end
    return Consumables:WaitForChild(a1, 5)
end

return function(a1) -- Line: 45
    -- upvalues: u37 (val), resolveConsumable (val), Value (val), u36 (val), u33 (val), ServerStorage (val), table (val)
    local v1 = u37[a1]
    if v1 then
        return v1
    end
    local v2 = nil
    local v3 = nil
    local v4 = resolveConsumable(a1)
    assert(v4, (("Consumable \"%*\" does not exist in the Consumables folder."):format(a1)))
    assert(v4:IsA("Folder"), (("Consumable \"$%*\" is not a folder."):format(a1)))
    local Data = require(v4:WaitForChild("Data"))
    if Value ~= "Lobby" and u36 then
        if not u33 then
            local Animator = v4:FindFirstChild("Animator")
            v2 = Animator and require(Animator)
        else
            local v5 = ((ServerStorage:WaitForChild("Animators")):WaitForChild("Consumables")):FindFirstChild(v4.Name)
            v3 = v5 and require(v5)
        end
    end
    local v6 = table.merge({Name = a1, Controller = v3, Animator = v2}, Data)
    u37[a1] = v6
    return v6
end