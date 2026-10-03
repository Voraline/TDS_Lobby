-- Script path: ReplicatedStorage.Packages.Fusion.Animation.SpringScheduler
-- Decompile time: 1.53 ms

local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
require(Parent.Types)
local packType = require(Parent.Animation.packType)
local springCoefficients = require(Parent.Animation.springCoefficients)
local updateAll = require(Parent.Dependencies.updateAll)
local v1 = {}
local u24 = {}
local u26 = os.clock()

function v1.add(a1) -- Line: 24 -- upvalues: u26 (ref), u24 (val)
    a1._lastSchedule = u26
    a1._startDisplacements = {}
    a1._startVelocities = {}
    for i, v in ipairs(a1._springGoals) do
        a1._startDisplacements[i] = a1._springPositions[i] - v
        a1._startVelocities[i] = a1._springVelocities[i]
    end
    u24[a1] = true
end

function v1.remove(a1) -- Line: 39 -- upvalues: u24 (val)
    u24[a1] = nil
end

RunService:BindToRenderStep("__FusionSpringScheduler", Enum.RenderPriority.First.Value, function() -- Line: 44 -- upvalues: u26 (ref), u24 (val), springCoefficients (val), packType (val), updateAll (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = {}
    u26 = os.clock()
    for k in pairs(u24) do
        v6, v7, v8, v9 = springCoefficients(u26 - k._lastSchedule, k._currentDamping, k._currentSpeed)
        v1 = false
        for i, v in ipairs(k._springGoals) do
            v2 = k._startDisplacements[i]
            v3 = k._startVelocities[i]
            v4 = v2 * v6 + v3 * v7
            v5 = v2 * v8 + v3 * v9
            if 0.0001 < (math.abs(v4)) or 0.0001 < (math.abs(v5)) then
                v1 = true
            end
            k._springPositions[i] = v4 + v
            k._springVelocities[i] = v5
        end
        if not v1 then
            v10[k] = true
        end
    end
    for k2 in pairs(u24) do
        k2._currentValue = packType(k2._springPositions, k2._currentType)
        updateAll(k2)
    end
    for k3 in pairs(v10) do
        u24[k3] = nil
    end
end)
return v1