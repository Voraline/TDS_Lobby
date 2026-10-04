-- Script path: ReplicatedStorage.Content.NewEnemies.Void Cultist.Animator
-- Decompile time: 1.50 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1
local VoidCultist = ReplicatedStorage.Assets.Effects.Mob.VoidCultist

local function cloneAndWeldEffect(a1, a2) -- Line: 13 -- upvalues: VoidCultist (val) -- types: a1: userdata, a2: string
    local PrimaryPart = a1.PrimaryPart
    if not PrimaryPart then
        return nil
    end
    local v1 = VoidCultist:FindFirstChild(a2)
    if v1 and v1:IsA("BasePart") then
        local v2 = v1:Clone()
        v2.Anchored = false
        v2.CanCollide = false
        v2.CanTouch = false
        v2.CanQuery = false
        local v3 = (a1:GetExtentsSize()).Y / 2 - 0.1
        v2.CFrame = CFrame.new(PrimaryPart.Position - Vector3.new(0, 1, 0) * v3)
        v2.Parent = a1
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = PrimaryPart
        WeldConstraint.Part1 = v2
        WeldConstraint.Parent = v2
        return v2
    end
    return nil
end

function v1.Initialize(a1) -- Line: 43
    -- upvalues: Animation (val), EasySound (val), cloneAndWeldEffect (val), EmitterManager (val), Debris (val)
    local u10 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Summon,
        Target = a1.Model.AnimationController.Animator,
    })
    local u20 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController.Animator,
    })
    a1.Executables = {
        Summon = function() -- Line: 56
            -- upvalues: a1 (val), EasySound (upval), u10 (val), cloneAndWeldEffect (upval), EmitterManager (upval)
            -- upvalues: Debris (upval)
            local Summon = a1.Model.PrimaryPart:FindFirstChild("Summon")
            if Summon and Summon:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Enemies",
                    id = Summon.SoundId,
                    parent = a1.Model.PrimaryPart,
                    volume = Summon.Volume,
                })
            end
            u10:Play()
            local v1 = cloneAndWeldEffect(a1.Model, "SpawnAura")
            if v1 then
                EmitterManager.manualEmit(v1)
                Debris:AddItem(v1, 3)
            end
            a1:AdjustWalkSpeed()
        end,
        Death = function() -- Line: 75 -- upvalues: u20 (val)
            u20:Play()
        end,
    }
end

return v1