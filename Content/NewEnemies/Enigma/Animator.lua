-- Script path: ReplicatedStorage.Content.NewEnemies.Enigma.Animator
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: TimescaleUtilities (val)
    local u5 = a1.Model.DeathEffect:Clone()
    a1.Executables = {
        DeathEffect = function() -- Line: 9 -- upvalues: u5 (val), a1 (val), TimescaleUtilities (upval)
            u5:PivotTo(a1.Model.DeathEffect.CFrame)
            u5.Parent = workspace.Trash
            u5.Anchored = true
            for i, j in u5:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    local u44 = j:GetAttribute("EmitCount") or 1
                    task.delay(j:GetAttribute("EmitDelay") or 0, function() -- Line: 17 -- upvalues: j (val), u44 (val)
                        j:Emit(u44)
                    end)
                end
            end
            TimescaleUtilities.CleanUp(u5, 5)
        end,
    }
end

return v1