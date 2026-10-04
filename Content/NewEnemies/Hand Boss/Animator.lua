-- Script path: ReplicatedStorage.Content.NewEnemies.Hand Boss.Animator
-- Decompile time: 6.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local HandBoss = ReplicatedStorage.Assets.Effects.Mob:WaitForChild("HandBoss")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 20
    -- upvalues: Animation (val), TweenService (val), HandBoss (val), ItemDrop (val), EmitterManager (val), Shaker (val)
    -- upvalues: SoundService (val), ReplicatedStorage (val), RunService (val)
    local Model = a1.Model
    local ParticleRef = Model:WaitForChild("ParticleRef")
    local HumanoidRootPart = Model.HumanoidRootPart
    local CFrame = HumanoidRootPart.CFrame
    local MeshPart = Model:FindFirstChildWhichIsA("MeshPart")
    local Bone = (MeshPart:FindFirstChildWhichIsA("Bone")):FindFirstChildWhichIsA("Bone")
    local u28 = Animation.new({
        Track = a1.Model.Animations.Summon,
        Target = a1.Model.AnimationController,
    })
    local u37 = Animation.new({
        Track = a1.Model.Animations.Shoot,
        Target = a1.Model.AnimationController,
    })

    function a1.FacePos(a1_2, a2) -- Line: 43
        -- upvalues: HumanoidRootPart (val), CFrame (ref), TweenService (upval), a1 (val)
        local identity = CFrame.identity
        local v1 = if not a1_2 then CFrame - CFrame.Position + HumanoidRootPart.Position else CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
        local v2 = TweenService
        local HumanoidRootPart_2 = a1.Model.HumanoidRootPart
        v2:Create(
            HumanoidRootPart_2,
            TweenInfo.new(not (a2 == nil) and a2 or 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
            {CFrame = v1}
        ):Play()
    end

    a1.Executables = {
        Shoot = function(a1_2, a2, a3, a4, a5, a6) -- Line: 68
            -- upvalues: CFrame (ref), HumanoidRootPart (val), u37 (val), a1 (val), ParticleRef (val), HandBoss (upval)
            -- upvalues: ItemDrop (upval), EmitterManager (upval), Shaker (upval)
            local v1
            if a5 == 1 then
                CFrame = HumanoidRootPart.CFrame
            end
            u37:Play()
            a1.FacePos(a1_2, 0.65)
            a1:Delay(0.73)
            for k, v in pairs(ParticleRef.MuzzleFlash.Value:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v1 = v:GetAttribute("EmitCount") or 1
                    if v1 then
                        v:Emit(v1)
                    end
                end
            end
            local u47 = HandBoss:WaitForChild("Bullet"):Clone()
            u47.Parent = workspace.CurrentCamera
            ;(ItemDrop.Drop(ParticleRef.MuzzleFlash.Value.WorldCFrame.Position, a1_2, u47, 3, -0.9, 3.7, function(a1, a2, a3) -- Line: 96
                local v1 = (CFrame.lookAt(a3, a2)) * CFrame.Angles(0, 1.5707963267948966, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 100 -- upvalues: u47 (val), EmitterManager (upval), a1_2 (val), a6 (val), Shaker (upval)
                u47:Destroy()
                EmitterManager.Emit("ImpactExplosion", CFrame.new(a1_2), a6)
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            end)
        end,
        Summon = function(a1_2) -- Line: 107 -- upvalues: u28 (val), HumanoidRootPart (val), SoundService (upval), a1 (val)
            u28:Play()
            HumanoidRootPart.Sparkles.Enabled = true
            SoundService:PlayLocalSound(HumanoidRootPart.Summon)
            a1:Delay(a1_2)
            u28:Stop()
            HumanoidRootPart.Sparkles.Enabled = false
        end,
        Slam = function(a1_2, a2, a3) -- Line: 118
            -- upvalues: Animation (upval), a1 (val), ReplicatedStorage (upval), SoundService (upval)
            -- upvalues: HumanoidRootPart (val), TweenService (upval), Shaker (upval), EmitterManager (upval)
            Animation.new({
                Track = a1.Model.Animations.Slam,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.6)
            local v1 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            v1.CFrame = CFrame.new(a1_2)
            v1.Orientation = Vector3.new(90, -90, 0)
            SoundService:PlayLocalSound(HumanoidRootPart.Stomp)
            v1.Parent = workspace.CurrentCamera
            local v2 = Vector3.new(a3 * a2, a3 * a2, 0.1)
            TweenService:Create(v1, TweenInfo.new(a2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = v2}):Play()
            TweenService:Create(v1, TweenInfo.new(a2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
            game.Debris:AddItem(v1, a2)
            Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            EmitterManager.Emit("WindExplosion", CFrame.new(a1_2), a3 * a2 / 4)
        end,
        Face = function(a1_2, a2) -- Line: 156 -- upvalues: a1 (val)
            a1.FacePos(a1_2, a2)
        end,
        GoTo = function(a1_2, a2) -- Line: 160 -- upvalues: CFrame (ref), HumanoidRootPart (val), TweenService (upval), a1 (val)
            CFrame = HumanoidRootPart.CFrame
            local v1 = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
            local v2 = (v1 - v1.Position + a1_2) * CFrame.new(0, 4, 2.5)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v2}
            ):Play()
        end,
        Stun = function(a1_2) -- Line: 181
            -- upvalues: Animation (upval), a1 (val), MeshPart (val), EmitterManager (upval), HumanoidRootPart (val)
            local v1 = Animation.new({
                Track = a1.Model.Animations.Stun,
                Target = a1.Model.AnimationController,
            })
            for k, v in pairs(MeshPart:GetChildren()) do
                if v:IsA("ParticleEmitter") and v.Name == "BurnEffect" then
                    v.Enabled = true
                end
            end
            EmitterManager.Emit("ImpactExplosion", HumanoidRootPart.CFrame)
            v1:Play()
            a1:Delay(a1_2)
            v1:Stop()
            for k2, i in pairs(MeshPart:GetChildren()) do
                if i:IsA("ParticleEmitter") and i.Name == "BurnEffect" then
                    i.Enabled = false
                end
            end
            Animation.new({
                Track = a1.Model.Animations.StunEnd,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        Rush = function() -- Line: 211 -- upvalues: a1 (val)
            a1.PathDistance = 0
            a1.PathName = "BossPath"
            a1:RefreshPath()
        end,
        Kill = function(a1_2) -- Line: 217
            -- upvalues: Animation (upval), a1 (val), Bone (val), RunService (upval), EmitterManager (upval)
            Animation.new({
                Track = a1.Model.Animations.Kill,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.5)
            local u20 = nil
            local TransformedWorldCFrame = Bone.TransformedWorldCFrame
            local v1 = RunService.Stepped:Connect(function(a1) -- Line: 225
                -- upvalues: a1_2 (val), EmitterManager (upval), TransformedWorldCFrame (ref), u20 (ref), Bone (upval)
                if a1_2 and a1_2.Parent then
                    a1_2:PivotTo(Bone.TransformedWorldCFrame * ((CFrame.new(0, 0, 1)) * (CFrame.Angles(1.5707963267948966, 0, 0))))
                    if a1_2.PrimaryPart then
                        TransformedWorldCFrame = a1_2.PrimaryPart.CFrame
                    end
                    return
                end
                EmitterManager.Emit("HandKill", TransformedWorldCFrame, nil, nil, nil, nil, {priority = "GameplayCritical"})
                u20:Disconnect()
            end)
        end,
        Return = function(a1_2) -- Line: 244 -- upvalues: TweenService (upval), a1 (val), CFrame (ref)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = CFrame}
            ):Play()
        end,
        Death = function() -- Line: 259
            -- upvalues: Animation (upval), a1 (val), Shaker (upval), HumanoidRootPart (val), EmitterManager (upval)
            -- upvalues: RunService (upval), Model (val)
            local v1 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            v1:Play()
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            local Controller = v1.Controller
            local u26 = false
            local CFrame = HumanoidRootPart.CFrame
            ;(Controller:GetMarkerReachedSignal("Shrink")):Connect(function() -- Line: 272 -- upvalues: EmitterManager (upval), CFrame (val), RunService (upval), Model (upval), u26 (ref)
                local u0 = 0
                EmitterManager.Emit("HandKill", CFrame, 2, nil, nil, nil, {priority = "GameplayCritical"})
                local u11 = nil
                local v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 281 -- upvalues: u0 (ref), Model (upval), u11 (ref), u26 (upval)
                    u0 = u0 + a1
                    local v1 = u0 / 1
                    Model:ScaleTo((math.clamp(1 - v1, 0.0001, 1)))
                    if u0 >= 1 then
                        u11:Disconnect()
                        u26 = true
                    end
                end)
            end)
            while not u26 do
                a1:Delay(0)
            end
            EmitterManager.Emit("HandDie", CFrame, 2, nil, nil, nil, {priority = "GameplayCritical"})
        end,
    }
end

return v1