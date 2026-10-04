-- Script path: ReplicatedStorage.Client.Controllers.Shared.RockController
-- Decompile time: 6.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local u20 = {}
local u21 = {}
local u22 = {}
local u23 = {}
local u25 = Random.new()

local function getRockMultiplier(a1) -- Line: 13 -- types: a1: userdata
    local v1 = math.max(0.2, 1 - a1.Size.Magnitude / 60)
    if a1:GetAttribute("Multiplier") then
        v1 = v1 * a1:GetAttribute("Multiplier")
    end
    return v1
end

task.spawn(function() -- Line: 23
    -- upvalues: TagObserver (val), u20 (val), u21 (val), u25 (val), u22 (val), u23 (val), SharedGameConstants (val)
    -- upvalues: RunService (val)
    TagObserver("FLOATING_ROCK", function(a1) -- Line: 24
        -- upvalues: u20 (upval), u21 (upval), u25 (upval), u22 (upval), u23 (upval), SharedGameConstants (upval)
        if not a1:IsA("BasePart") then
            return
        end
        u20[a1] = a1
        u21[a1] = (u25:NextUnitVector())
        u22[a1] = a1.CFrame.Position
        local v1 = u23
        local v2 = math.max(0.2, 1 - a1.Size.Magnitude / 60)
        if a1:GetAttribute("Multiplier") then
            v2 = v2 * a1:GetAttribute("Multiplier")
        end
        v1[a1] = v2
        local u45 = nil
        if not SharedGameConstants.IS_PROD then
            u45 = (a1:GetAttributeChangedSignal("Multiplier")):Connect(function() -- Line: 37 -- upvalues: u23 (upval), a1 (val)
                local v1 = u23
                local v2 = a1
                local v3 = math.max(0.2, 1 - v2.Size.Magnitude / 60)
                if v2:GetAttribute("Multiplier") then
                    v3 = v3 * v2:GetAttribute("Multiplier")
                end
                v1[a1] = v3
            end)
        end
        return function() -- Line: 42 -- upvalues: u45 (ref), u20 (upval), a1 (val), u21 (upval), u22 (upval)
            if u45 and u45.Connected then
                u45:Disconnect()
            end
            u20[a1] = nil
            u21[a1] = nil
            u22[a1] = nil
        end
    end)
    RunService.Stepped:Connect(function(a1, a2) -- Line: 53 -- upvalues: u20 (upval), u21 (upval), u22 (upval), u23 (upval) -- types: a2: number
        local Rotation, v1, v2, v3, v4, v5, v6
        local v7 = {}
        local v8 = {}
        local v9 = tick() * 2
        for i in u20 do
            v1 = u21[i]
            v2 = u22[i]
            Rotation = i.CFrame.Rotation
            v4 = u23[i]
            v5 = v4 * 0.001
            v6 = (math.clamp(v4 ^ 2, 0.4, 0.8)) * 0.1 * 10
            v2 = v2 + Vector3.new(0, math.sin(v1.Y * 100 + v9) * 0.5 * v6, 0)
            v3 = Rotation * (CFrame.Angles(v1.X * v5, v1.Y * v5, v1.Z * v5))
            table.insert(v7, (CFrame.new(v2)) * v3)
            table.insert(v8, i)
        end
        workspace:BulkMoveTo(v8, v7, Enum.BulkMoveMode.FireCFrameChanged)
    end)
end)
return nil