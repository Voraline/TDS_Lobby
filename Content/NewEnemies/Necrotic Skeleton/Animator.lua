-- Script path: ReplicatedStorage.Content.NewEnemies.Necrotic Skeleton.Animator
-- Decompile time: 2.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local FallenBlood = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("FallenBlood")
local v1 = {}
v1.__index = v1

function v1:_puddles(a2) -- Line: 17 -- upvalues: FallenBlood (val), TimescaleUtilities (val), TweenService (val)
    local v1 = nil
    local v2 = nil
    for i, j in a2, v1, v2 do
        local u24 = FallenBlood[math.random(1, #FallenBlood:GetChildren())]:Clone()
        table.insert(self._currentPuddles, u24)
        u24.CFrame = (CFrame.new(j.position + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0)
        u24.Parent = workspace.Terrain
        for k, n in u24:GetChildren() do
            if n:IsA("ParticleEmitter") then
                n.Enabled = false
                TimescaleUtilities.Delay(0.5, function() -- Line: 31 -- upvalues: n (val)
                    n.Enabled = true
                end)
            end
        end
        local Size = u24.Size
        u24.Size = Vector3.new(0, 0, 0)
        TweenService:Create(u24, TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = Size}):Play()
        TimescaleUtilities.Delay(0.7, function() -- Line: 44 -- upvalues: self (val), TweenService (upval), u24 (val), Size (val)
            local v1 = (self._puddleTimer:Get("EndTime")) - workspace:GetServerTimeNow()
            local v2 = TweenService:Create(u24, TweenInfo.new(v1), {Transparency = 1, Size = Size * 0.5})
            v2:Play()
            v2.Completed:Connect(function() -- Line: 52 -- upvalues: u24 (upval)
                u24:Destroy()
            end)
        end)
    end
end

function v1.Initialize(a1) -- Line: 59
    -- upvalues: Animation (val), TagReplicator (val), EffectsController (val), EmitterManager (val)
    a1._currentPuddles = {}
    local u11 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController.Animator,
    })
    ;(a1.Replicator:GetStateChangedSignal("PuddleTimer")):Connect(function(a1_2) -- Line: 69 -- upvalues: a1 (val), TagReplicator (upval)
        a1._puddleTimer = TagReplicator.getReplicatorEntityFromFolder(a1_2)
    end)
    a1.Executables = {
        RemovePuddles = function() -- Line: 74 -- upvalues: a1 (val)
            for i, j in a1._currentPuddles do
                j:Destroy()
            end
            a1._currentPuddles = {}
        end,
        Puddles = function(a1_2) -- Line: 80 -- upvalues: a1 (val)
            a1:_puddles(a1_2)
        end,
        Death = function(a1_2) -- Line: 83
            -- upvalues: EffectsController (upval), a1 (val), EmitterManager (upval), u11 (val)
            EffectsController.StunRaidus(a1.Model.PrimaryPart.Node.WorldCFrame, a1_2)
            EmitterManager.Emit("EnergyExplosion", CFrame.new(a1.Model.PrimaryPart.Position), 2)
            u11:Play()
        end,
    }
end

return v1