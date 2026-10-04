-- Script path: ReplicatedStorage.Content.NewEnemies.Decoy.Animator
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: EasySound (val), EmitterManager (val), TimescaleUtilities (val)
    local u6 = EasySound.Create({
        id = "rbxassetid://100708395084912",
        volume = 0.5,
        audioGroup = "Enemies",
        parent = a1.Model.PrimaryPart,
    })
    a1.OnDestroy:Connect(function() -- Line: 18 -- upvalues: a1 (val), u6 (val), EmitterManager (upval), TimescaleUtilities (upval)
        local u5 = a1.Model.Explosion:Clone()
        u5.Parent = workspace.Trash
        u5:ScaleTo(a1.Stats.ExplosionRadius)
        u5:PivotTo(a1.Model.HumanoidRootPart.CFrame)
        u6:Play()
        EmitterManager.manualEmit(u5)
        TimescaleUtilities.Delay(5, function() -- Line: 28 -- upvalues: u5 (val)
            u5:Destroy()
        end)
    end)
end

return v1