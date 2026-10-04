-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewUnits
-- Decompile time: 2.34 ms

local deepMerge
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Unit = Content("Unit")
local u35 = RunService:IsClient()
local u38 = RunService:IsRunning()
local u39 = {}

function deepMerge(a1, a2) -- Line: 59 -- upvalues: deepMerge (val) -- types: a1: table, a2: table
    for k, v in pairs(a1) do
        if typeof(v) ~= "table" then
            a2[k] = v
        elseif typeof(a2[k]) ~= "table" then
            a2[k] = (deepMerge(v, {}))
        else
            a2[k] = (deepMerge(v, a2[k]))
        end
    end
    return a2
end

local function resolveUnit(a1, a2) -- Line: 75
    -- upvalues: Unit (val), GameState (val), u35 (val), u38 (val), ServerStorage (val), deepMerge (val), Icons (val)
    local v1, v2
    local v3 = Unit:FindFirstChild(a1)
    local Stats = v3 and v3:FindFirstChild("Stats")
    if not Stats then
        return
    end
    if GameState.GameMode == "PVP" then
        v2 = v3 and v3:FindFirstChild("Stats-PVP")
        if v2 then
            Stats = v2
        end
    end
    if a2 then
        v2 = v3 and v3:FindFirstChild((("Stats-%*"):format(a2)))
        if v2 then
            Stats = v2
        end
    end
    v2 = nil
    local v4 = nil
    local v5 = require(Stats)
    local v6 = nil
    assert(v5.Default, "Default stats are required")
    if workspace.Type.Value ~= "Lobby" then
        if u35 then
            v2 = u38 and require(v3:FindFirstChild("Animator")) or {}
        else
            v4 = if not u38 then {} else require((ServerStorage.Animators:WaitForChild("Units")):WaitForChild(a1))
        end
    end
    if not v5.Default.Defaults then
        v1 = a1
    else
        local v7, v8, v9, v10, v11
        v6 = {}
        v1 = a1
        for k, v in pairs(v5) do
            v7 = deepMerge(v.Upgrades or {}, {})
            v8 = deepMerge(v.Defaults or {}, {})
            v9 = #v7
            for i = 1, v9 do
                v10 = deepMerge
                v11 = deepMerge(v7[i], v8)
                v7[i] = (v10(v11, {}))
            end
            v9 = {Defaults = v.Defaults, Upgrades = v7}
            v6[k] = v9
        end
    end
    return {
        Icon = Icons.Units[v1] or "rbxassetid://13333189485",
        Stats = v5,
        NewStats = v6,
        Animator = v2,
        Controller = v4,
    }
end

return function(a1, a2) -- Line: 145 -- upvalues: u39 (val), resolveUnit (val) -- types: a1: string, a2: string?
    local v1 = u39[a1]
    if not v1 then
        u39[a1] = (resolveUnit(a1))
    end
    return v1
end