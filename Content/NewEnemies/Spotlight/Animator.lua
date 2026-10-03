-- Script path: ReplicatedStorage.Content.NewEnemies.Spotlight.Animator
-- Decompile time: 3.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local BoneUtil = require(ReplicatedStorage.Shared.Modules.BoneUtil)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10
    -- upvalues: Animation (val), ReplicatedStorage (val), BoneUtil (val), TweenService (val)
    local u13 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController.Animator,
        Animation = a1.Model.Animations.Death,
    })
    local u22 = ReplicatedStorage.Assets.Effects.Mob.Spotlight.Effect:Clone()
    u22.Parent = workspace.Trash
    local u33 = ReplicatedStorage.Assets.Effects.Mob.Spotlight.Start:Clone()
    u33.Parent = workspace.Trash
    u33.Start.Moonlight.Attachment1 = u22.PrimaryPart.Attachment
    a1.Maid:Mark(u22)
    a1.Maid:Mark(u33)
    a1:SetYHeight(8)
    local CFrame = a1.Model.HeadObject.Value.CFrame
    local LowerTorso = a1.Model.PrimaryPart.Root.LowerTorso
    local CFrame_2 = LowerTorso.CFrame
    a1:BindToStep("UpdateModelAndEffects", function(a1_2) -- Line: 38
        -- upvalues: a1 (val), u22 (val), u33 (val), BoneUtil (upval), LowerTorso (val), CFrame (val), CFrame_2 (val)
        local v1
        local v2 = a1.Replicator:Get("PathPosition") or nil
        local v3 = a1_2
        for i, j in u22:GetDescendants() do
            if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
                v1 = v2 ~= nil
                j.Enabled = v1
            end
        end
        for k, n in u33:GetDescendants() do
            if n:IsA("ParticleEmitter") or n:IsA("Trail") or n:IsA("Beam") then
                v1 = v2 ~= nil
                n.Enabled = v1
            end
        end
        u22:ScaleTo(a1.Stats.SpotlightRadius)
        if not v2 then
            a1.Model.HeadObject.Value.CFrame = a1.Model.HeadObject.Value.CFrame:Lerp(CFrame, v3 * 2)
            LowerTorso.CFrame = LowerTorso.CFrame:Lerp(CFrame_2, v3 * 2)
            return
        end
        u22.PrimaryPart.Position = v2 + Vector3.new(0, 0.029999999329447746, 0)
        u33.Position = a1.Model.StartAttachment.Value.WorldPosition
        local v4 = BoneUtil.faceWorldPositionLocal(a1.Model.HeadObject.Value, v2, nil, CFrame.Angles(0, 3.141592653589793, 0))
        a1.Model.HeadObject.Value.CFrame = a1.Model.HeadObject.Value.CFrame:Lerp(v4, v3 * 2)
        LowerTorso.CFrame = LowerTorso.CFrame:Lerp(
            BoneUtil.faceWorldPositionLockAxis(LowerTorso, v2, Vector3.new(0, 1, 0), CFrame.Angles(0, 3.141592653589793, 0)),
            v3 * 2
        )
    end)
    a1.Executables = {
        Death = function() -- Line: 83 -- upvalues: TweenService (upval), a1 (val), u13 (val), u22 (val), u33 (val)
            TweenService:Create(a1.Model.PrimaryPart, TweenInfo.new(0.65, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Position = a1.Model.PrimaryPart.Position - Vector3.new(0, 8.5, 0),
            }):Play()
            u13:Play()
            u22:Destroy()
            u33:Destroy()
        end,
    }
end

return v1