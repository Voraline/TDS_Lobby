-- Script path: ReplicatedStorage.Content.Enemies.Operator Ducky.Animator
-- Decompile time: 1.05 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage_2.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 13 -- upvalues: TimescaleUtilities (val)
    local u1 = {}
    for k, v in pairs(a1.Model:GetChildren()) do
        if v:IsA("MeshPart") then
            table.insert(u1, {v.Transparency, v})
        end
    end
    a1.Executables = {
        Hide = function(a1_2) -- Line: 23 -- upvalues: a1 (val), u1 (val), TimescaleUtilities (upval)
            local Smoke = a1.Model.Torso:FindFirstChild("Smoke")
            local Poof = a1.Model.Torso:FindFirstChild("Poof")
            local Alert = a1.Model.HumanoidRootPart.Node:FindFirstChild("Alert")
            if Smoke and Poof and Alert then
                Alert:Emit(1)
                local Attribute = Smoke:GetAttribute("EmitCount")
                if Attribute then
                    Smoke:Emit(Attribute)
                    Poof:Play()
                end
            end
            for i, v in ipairs(u1) do
                v[2].Transparency = v[1] + 0.5
            end
            TimescaleUtilities.Delay(a1_2, function() -- Line: 42 -- upvalues: a1 (upval), u1 (upval)
                if not a1.Maid then
                    return
                end
                for i, v in ipairs(u1) do
                    v[2].Transparency = v[1]
                end
            end)
        end,
    }
end

return v1