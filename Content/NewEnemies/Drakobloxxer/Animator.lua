-- Script path: ReplicatedStorage.Content.NewEnemies.Drakobloxxer.Animator
-- Decompile time: 14.16 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Drakobloxxer = ReplicatedStorage.Assets.Effects.Mob.Drakobloxxer
local Death2 = ReplicatedStorage.Assets.Effects.Mob.FallenKing.Death2
local v1 = {}
v1.__index = v1
local u84 = RaycastParams.new()
u84.FilterType = Enum.RaycastFilterType.Exclude
u84.RespectCanCollide = true

function v1:_setUp() -- Line: 26 -- upvalues: Animation (val)
    for i, j in self.Model.Animations:GetChildren() do
        if not string.find(j.Name, "Walk") then
            self._animations[j.Name] = (Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Preload = true,
                Track = j,
                Target = self.Model.AnimationController.Animator,
                Animation = j,
            }))
        end
    end
end

function v1:_teleportExplosion() -- Line: 41 -- upvalues: Drakobloxxer (val), TimescaleUtilities (val)
    local v1 = Drakobloxxer.TeleportExplosion:Clone()
    v1:PivotTo(self.Model.HumanoidRootPart.CFrame)
    v1.Parent = workspace.Trash
    for i, j in v1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            TimescaleUtilities.Delay(j:GetAttribute("EmitDelay") or 0, function() -- Line: 49 -- upvalues: j (val)
                j:Emit((j:GetAttribute("EmitCount")))
            end)
        end
    end
    TimescaleUtilities.CleanUp(v1, 5)
end

function v1._flash(a1) -- Line: 57 -- upvalues: Lighting (val), TweenService (val), TimescaleUtilities (val)
    local ExposureCompensation = Lighting.ExposureCompensation
    TweenService:Create(Lighting, TweenInfo.new(0.06), {ExposureCompensation = 2}):Play()
    TimescaleUtilities.Delay(0.06, function() -- Line: 61 -- upvalues: TweenService (upval), Lighting (upval), ExposureCompensation (val)
        TweenService:Create(
            Lighting,
            TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {ExposureCompensation = ExposureCompensation}
        ):Play()
    end)
end

function v1._createBeam(a1, a2, a3) -- Line: 70 -- upvalues: Death2 (val)
    local v1 = Death2:Clone()
    v1.Cylinder.Size = Vector3.new(a3, 400, a3)
    v1.Cylinder.Transparency = 0.5
    v1.flip.Transparency = 0.8
    v1.flip.Size = Vector3.new(a3 + 5, 400, a3 + 5)
    v1:PivotTo(a2 * (v1:GetPivot()).Rotation)
    return v1
end

function v1._animateVignette(a1, a2) -- Line: 83 -- upvalues: VignetteStore (val)
    VignetteStore.setAnimationData({transparency = a2.transparency, tweenInfo = a2.tweenInfo, color = a2.color})
end

function v1:_changeSkin() -- Line: 91
    self._savedTexture = {}
    for i, j in self.Model:GetDescendants() do
        if j:IsA("BasePart") and j:GetAttribute("Phase2") then
            self._savedTexture[j] = j.TextureID
            j.TextureID = j:GetAttribute("Phase2")
        end
    end
end

function v1:_stopSound(a2) -- Line: 101 -- types: self: table, a2: string
    if self.Model.HumanoidRootPart:FindFirstChild(a2) then
        self.Model.HumanoidRootPart[a2]:Stop()
        return
    end
    warn((("sound %* not found"):format(a2)))
end

function v1:_playSound(a2) -- Line: 109 -- types: self: table, a2: string
    if self.Model.HumanoidRootPart:FindFirstChild(a2) then
        self.Model.HumanoidRootPart[a2]:Play()
        return
    end
    warn((("sound %* not found"):format(a2)))
end

function v1:_updateWalkSound() -- Line: 117 -- upvalues: Shaker (val)
    self.__currentWalkSound = (self.WalkTrack:GetMarkerReachedSignal("Stomp")):Connect(function() -- Line: 119 -- upvalues: self (val), Shaker (upval)
        self.Model.HumanoidRootPart.FootStep.PlaybackSpeed = Random.new():NextNumber(0.4, 0.6)
        self.Model.HumanoidRootPart.FootStep:Play()
        Shaker:Shake({0.1, 12, 0.1, 1}, 0.2, 1)
    end)
end

function v1.Initialize(a1) -- Line: 126
    -- upvalues: StateManager (val), SoundService (val), TweenService (val), Drakobloxxer (val)
    -- upvalues: TimescaleUtilities (val), Shaker (val), EmitterManager (val), spr (val), RunService (val)
    -- upvalues: EffectsController (val), GameState (val), u84 (val)
    a1._stateManager = StateManager.new()
    a1._attackFunctions = {}
    a1._animations = {}
    if a1.Replicator:Get("Phase") == 2 then
        a1:_changeSkin()
    end
    a1._currentWalkSound = nil
    task.defer(function() -- Line: 137 -- upvalues: a1 (val)
        a1:_updateWalkSound()
    end)
    a1.Model.HumanoidRootPart:WaitForChild("RoarLoop"):Play()
    for i, j in a1.Model.HumanoidRootPart:GetChildren() do
        if j:IsA("Sound") then
            j.Volume = j.Volume * 0.8
            j.SoundGroup = SoundService.Enemies
        end
    end
    a1._stateManager:addStates({
        {
            name = "Idle",
            onEnter = function() -- Line: 153 -- upvalues: a1 (val)
                if a1._currentAttackModule then
                    a1._currentAttackModule:Clean()
                    a1._currentAttackModule = nil
                end
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 162 -- upvalues: a1 (val), TweenService (upval)
                local v1, v2
                if a1._savedTexture then
                    for i, j in a1.Model:GetDescendants() do
                        if j:IsA("BasePart") and j:GetAttribute("Phase2") and a1._savedTexture[j] then
                            j.TextureID = a1._savedTexture[j]
                        end
                    end
                end
                a1.Model.HumanoidRootPart.RoarLoop:Stop()
                for k, n in a1._animations do
                    n:Stop()
                end
                a1._animations.Death:Play()
                a1:_playSound("Death")
                a1:Delay(4)
                for m, i5 in a1.Model:GetDescendants() do
                    if i5:IsA("BasePart") then
                        i5.Anchored = true
                        v1 = TweenService
                        v2 = TweenInfo.new(5.5, Enum.EasingStyle.Quad)
                        v1:Create(i5, v2, {LocalTransparencyModifier = 1}):Play()
                    end
                end
            end,
        },
    })
    a1._animationSequence = {
        Phase2 = function() -- Line: 196 -- upvalues: a1 (val)
            a1:_playSound("Phase2")
            a1._animations.RageMode:Play()
            a1._stopAllAnimations = true
            a1:_updateWalkSound()
        end,
        Teleport_Out = function() -- Line: 203 -- upvalues: a1 (val), Drakobloxxer (upval), TimescaleUtilities (upval), TweenService (upval)
            local v1, v2
            a1:_playSound("Teleport")
            a1._animations.Teleport_Out:Play()
            local v3 = Drakobloxxer.MainBeam:Clone()
            v3:ScaleTo(2)
            v3.Parent = workspace.Trash
            v3:PivotTo((CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)) * (CFrame.Angles(0, 0, 1.5707963267948966)))
            for i, j in v3:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                    TimescaleUtilities.Delay(1, function() -- Line: 219 -- upvalues: j (val)
                        j.Enabled = false
                    end)
                end
                if j:IsA("Light") then
                    v1 = TweenService
                    v2 = TweenInfo.new(1)
                    v1:Create(j, v2, {Brightness = 25}):Play()
                    TimescaleUtilities.Delay(1, function() -- Line: 225 -- upvalues: TweenService (upval), j (val)
                        TweenService:Create(j, TweenInfo.new(1), {Brightness = 0}):Play()
                    end)
                end
            end
            TimescaleUtilities.CleanUp(v3, 10)
        end,
        Teleport_In = function() -- Line: 234 -- upvalues: a1 (val), TimescaleUtilities (upval), Shaker (upval)
            a1._animations.Teleport_In:Play()
            a1:_animateVignette({
                transparency = 0.6,
                tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                color = Color3.fromRGB(255, 55, 212),
            })
            TimescaleUtilities.Delay(0.7, function() -- Line: 247 -- upvalues: a1 (upval)
                a1:_animateVignette({
                    transparency = 1,
                    tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    color = Color3.fromRGB(255, 55, 212),
                })
            end)
            Shaker:Shake({1, 30, 0, 1.5}, 0.1, 4)
        end,
        BigLaserStop = function() -- Line: 258 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            a1._animations.BigLaser:Stop(0.4)
            local Crystal = a1.Model.Crystal
            Crystal.Flare.Flare.Enabled = false
            local BigLaser = workspace.Terrain:FindFirstChild("BigLaser")
            if BigLaser then
                BigLaser:Destroy()
            end
            for i, j in Crystal.DeathBeam:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
                if j:IsA("Beam") then
                    j.Enabled = false
                end
            end
            for k, n in Crystal.Once:GetChildren() do
                n:Emit(1)
            end
            TweenService:Create(Crystal.Flare.Light, TweenInfo.new(0.05), {Brightness = 25}):Play()
            TimescaleUtilities.Delay(0.05, function() -- Line: 285 -- upvalues: TweenService (upval), Crystal (val)
                TweenService:Create(
                    Crystal.Flare.Light,
                    TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
        end,
        BigLaser = function() -- Line: 294 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            a1:_playSound("NightmareBlast")
            a1._animations.BigLaser:Play()
            local Crystal = a1.Model.Crystal
            Crystal.Flare.Flare.Enabled = true
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = workspace.Terrain
            Attachment.Name = "BigLaser"
            Attachment.WorldPosition = Vector3.new(0, 241.86099243164062, 0)
            for i, j in Crystal.DeathBeam:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
                if j:IsA("Beam") then
                    j.Enabled = true
                    j.Attachment1 = Attachment
                end
            end
            for k, n in Crystal.Once:GetChildren() do
                n:Emit(1)
            end
            Crystal.Flare.Light.Enabled = true
            TweenService:Create(Crystal.Flare.Light, TweenInfo.new(0.05), {Brightness = 25}):Play()
            TimescaleUtilities.Delay(0.05, function() -- Line: 324 -- upvalues: TweenService (upval), Crystal (val)
                TweenService:Create(
                    Crystal.Flare.Light,
                    TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 5}
                ):Play()
            end)
        end,
        MiniBeam = function() -- Line: 333 -- upvalues: a1 (val), TimescaleUtilities (upval)
            a1:_playSound("LaserIntro")
            TimescaleUtilities.Delay(1, function() -- Line: 336 -- upvalues: a1 (upval)
                a1:_playSound("LaserLoop")
            end)
            if a1._stopAllAnimations then
                return
            end
            a1._animations.SmallLaserIntro:Play()
            a1._animations.SmallLaserLoop:Play()
        end,
        BeamOutro = function() -- Line: 346 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            local Crystal = a1.Model.Crystal
            Crystal.Flare.Flare.Enabled = false
            TweenService:Create(Crystal.Flare.Light, TweenInfo.new(0.05), {Brightness = 25}):Play()
            TimescaleUtilities.Delay(0.05, function() -- Line: 351 -- upvalues: TweenService (upval), Crystal (val)
                TweenService:Create(
                    Crystal.Flare.Light,
                    TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
            a1._animations.SmallLaserLoop:Stop()
            a1._animations.SmallLaserOutro:Play(0)
        end,
    }
    a1.Executables = {
        PlayAnimation = function(a1_2) -- Line: 365 -- upvalues: a1 (val)
            if a1._animationSequence[a1_2] then
                a1._animationSequence[a1_2]()
                return
            end
            if a1._stopAllAnimations then
                return
            end
            a1._animations[a1_2]:Play()
        end,
        CrystalEffect = function(a1_2) -- Line: 376 -- upvalues: a1 (val)
            for i, j in a1.Model.Crystal.Lighting:GetChildren() do
                j.Enabled = a1_2
            end
        end,
        SummonEffect = function(a1) -- Line: 382 -- upvalues: EmitterManager (upval)
            EmitterManager.Emit("EnemyPurpleImpact", CFrame.new(a1), 2)
        end,
        StormEffects = function() -- Line: 386 -- upvalues: a1 (val), TimescaleUtilities (upval)
            a1:_playSound("NightmareStorm")
            for i, j in a1.Model.LightingVFX:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                    TimescaleUtilities.Delay(3, function() -- Line: 392 -- upvalues: j (val)
                        j.Enabled = false
                    end)
                end
            end
        end,
        UnlockAnimations = function() -- Line: 399 -- upvalues: a1 (val)
            a1._stopAllAnimations = false
        end,
        ChangeState = function(a1_2, ...) -- Line: 403 -- upvalues: a1 (val)
            if not a1._stateManager._states[a1_2] then
                return
            end
            a1._stateManager:changeState(a1_2, ...)
        end,
        Phase2SkinSwitch = function() -- Line: 410 -- upvalues: a1 (val)
            a1:_changeSkin()
        end,
        Projectile = function(a1, a2, a3) -- Line: 414 -- upvalues: Drakobloxxer (upval), EmitterManager (upval)
            local u4 = CFrame.new()
            local u9 = Drakobloxxer.Projectile:Clone()
            u9.Parent = workspace
            u9:PivotTo((CFrame.new(Vector3.new(), a2)))
            u9.Skull.Loop:Play()
            local u24 = nil
            local u25 = 0
            local v1 = (game:GetService("RunService")).RenderStepped:Connect(function(a1_2) -- Line: 425
                -- upvalues: u25 (ref), a3 (val), u9 (val), EmitterManager (upval), a2 (val), u24 (ref), a1 (val)
                -- upvalues: u4 (ref)
                u25 = u25 + a1_2 / a3
                if u9 and u9.Parent and not (u25 >= 1) then
                    local v1 = CFrame.new(math.noise(u25) * 25, math.noise(u25 * 2) * 12, 0)
                    local v2 = CFrame.new((a1:Lerp(a2, u25))) * v1
                    u9:PivotTo((CFrame.new(v2.Position, v2.Position - (u4.Position - v2.Position).Unit * 2)))
                    u4 = v2
                    return
                end
                if u9 and u9.Parent then
                    EmitterManager.Emit("EnemyPurpleImpact", CFrame.new(a2), 2)
                    u9:Destroy()
                end
                u24:Disconnect()
            end)
        end,
        TeleportEffect = function(a1_2) -- Line: 451 -- upvalues: Drakobloxxer (upval), spr (upval), RunService (upval), a1 (val)
            local u5 = Drakobloxxer.TeleportEffects:Clone()
            u5.Parent = workspace.Trash
            local u8 = {progress = 0.001}
            u5.Finish:ScaleTo(0.001)
            u5.Start:ScaleTo(0.001)
            spr.target(u8, 0.3, 4, {progress = 1})
            local v1 = RunService.Heartbeat:Connect(function() -- Line: 466 -- upvalues: u5 (val), u8 (val), a1 (upval)
                u5.Start:ScaleTo(u8.progress)
                u5.Finish:ScaleTo(u8.progress)
                u5.Start:PivotTo((CFrame.new(a1.Model.Crystal.Position)))
            end)
            u5.Finish:PivotTo((CFrame.new(a1_2)) * (CFrame.new(0, 8, 0)))
            a1:Delay(3)
            spr.target(u8, 1, 0.5, {progress = 0.001})
            a1:Delay(3)
            v1:Disconnect()
            u5:Destroy()
        end,
        LaneSwitch = function(a1_2, a2) -- Line: 487
            -- upvalues: a1 (val), EffectsController (upval), TweenService (upval), TimescaleUtilities (upval)
            local v1, v2, v3
            a1.PathDistance = a2
            a1.PathName = a1_2
            a1:RefreshPath(nil, nil, true)
            local Position = a1.Position
            local Scalar = a1.Path:GetScalar(a2 + 1)
            a1.LastPosition = Scalar
            local v4 = (CFrame.new(Position, Scalar)) * CFrame.new(0, a1.Height + 1, 0)
            EffectsController.GroundSmash(CFrame.new(Position), 50)
            local v5 = a1:_createBeam(CFrame.new(Position), 50)
            v5.Parent = workspace.Trash
            for i, j in v5:GetDescendants() do
                if j:IsA("BasePart") then
                    v1 = TweenService
                    v2 = TweenInfo.new(0.3)
                    v3 = {Size = Vector3.new(0, 400, 0)}
                    v1:Create(j, v2, v3):Play()
                end
            end
            a1:_flash()
            a1:_teleportExplosion()
            a1.Model.HumanoidRootPart.CFrame = v4
            TimescaleUtilities.CleanUp(v5, 0.5)
        end,
        Face = function(a1_2) -- Line: 522 -- upvalues: a1 (val), TweenService (upval)
            local v1 = Vector3.new(a1_2.X, a1.Model.HumanoidRootPart.Position.Y, a1_2.Z)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {
                    CFrame = CFrame.new(a1.Model.HumanoidRootPart.Position, v1),
                }
            ):Play()
        end,
        CleanMiniBeam = function() -- Line: 532 -- upvalues: a1 (val), TimescaleUtilities (upval)
            a1:_playSound("LaserOutro")
            a1:_stopSound("LaserLoop")
            if a1._beamLoop then
                a1._beamLoop:Disconnect()
            end
            if a1.Model:FindFirstChild("Beam") then
                local Beam = a1.Model.Beam
                Beam.Parent = workspace.Trash
                for i, j in Beam.Once:GetChildren() do
                    j:Emit(1)
                end
                for k, n in Beam:GetDescendants() do
                    if n:IsA("Beam") or n:IsA("ParticleEmitter") then
                        n.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(Beam, 3)
            end
        end,
        MiniBeamLoop = function(a1_2) -- Line: 557
            -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval), Drakobloxxer (upval)
            -- upvalues: RunService (upval), GameState (upval), u84 (upval)
            local v1
            task.spawn(function() -- Line: 558 -- upvalues: a1 (upval), TweenService (upval), TimescaleUtilities (upval)
                local Crystal = a1.Model.Crystal
                Crystal.Flare.Flare.Enabled = true
                Crystal.Flare.Light.Enabled = true
                Crystal.Flare.Light.Brightness = 0
                TweenService:Create(Crystal.Flare.Light, TweenInfo.new(0.05), {Brightness = 25}):Play()
                TimescaleUtilities.Wait(0.05)
                TweenService:Create(
                    Crystal.Flare.Light,
                    TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 5}
                ):Play()
            end)
            local u9 = CFrame.new(a1.Model.Crystal.Position)
            local u14 = Drakobloxxer.Beam:Clone()
            for i, j in u14.Once:GetChildren() do
                j:Emit(1)
            end
            u14.Parent = a1.Model
            u14.CFrame = u9
            local u32 = {}
            u32.Front = CFrame.new(0, 0, -a1_2.Range)
            u32.Back = CFrame.new(0, 0, a1_2.Range)
            u32.Left = CFrame.new(-a1_2.Range, 0, 0)
            u32.Right = CFrame.new(a1_2.Range, 0, 0)
            local u56 = 0
            local u57 = 0
            local u58 = {}
            for k, n in u32 do
                v1 = Drakobloxxer.BeamDrag:Clone()
                v1:ScaleTo(a1_2.Size / 2)
                v1.Parent = u14
                u58[k] = v1
            end
            a1._beamLoop = RunService.Stepped:Connect(function(a1_3, a2) -- Line: 602
                -- upvalues: u56 (ref), a1_2 (val), GameState (upval), u57 (ref), u14 (val), a1 (upval), u32 (val)
                -- upvalues: u9 (val), u84 (upval), u58 (val)
                local Position, v1, v2, v3
                u56 = u56 + a2 * a1_2.RotationSpeed * GameState.TimeScale
                u57 = math.clamp(u57 + a2 * 2, 0, 1)
                u14.Enable.WorldPosition = a1.Model.Crystal.Position
                local v4 = nil
                local v5 = nil
                for i, j in u32, v4, v5 do
                    v2 = u9 * CFrame.Angles(0, math.rad(u56), 0)
                    Position = (v2 * j * CFrame.new(0, -a1_2.Y, 0)).Position
                    v3 = workspace:Raycast(v2.Position, Position - v2.Position, u84)
                    if v3 then
                        Position = v3.Position
                    end
                    v1 = CFrame.new(v2.Position:Lerp(Position, u57))
                    u14[i].WorldCFrame = v1
                    u58[i]:PivotTo(v1)
                end
            end)
        end,
        BigLaserEffect = function(a1_2) -- Line: 631
            -- upvalues: Drakobloxxer (upval), Shaker (upval), a1 (val), TimescaleUtilities (upval)
            -- upvalues: TweenService (upval)
            local u5 = Drakobloxxer.BigBeam:Clone()
            u5.CFrame = CFrame.new(0, 0, 0)
            local u15 = Drakobloxxer.MainBeam:Clone()
            u15:PivotTo((CFrame.new(0, 0.1, 0)) * (CFrame.Angles(0, 0, 1.5707963267948966)))
            u15:ScaleTo(3)
            u15.Parent = workspace.Trash
            for i, j in u15:GetDescendants() do
                if j:IsA("Light") then
                    j.Brightness = 35
                end
            end
            u5.Parent = workspace.Trash
            Shaker:Shake({1, 20, 0, 1.5}, 0.1, 7)
            a1:_flash()
            TimescaleUtilities.Delay(4, function() -- Line: 651 -- upvalues: u5 (val), TweenService (upval), TimescaleUtilities (upval), u15 (val)
                local v1, v2
                for i, j in u5:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                    if j:IsA("Beam") then
                        v1 = TweenService
                        v2 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                        v1:Create(j, v2, {Width0 = 0, Width1 = 0}):Play()
                    end
                end
                TimescaleUtilities.CleanUp(u5, 3)
                TimescaleUtilities.CleanUp(u15, 6)
            end)
            TimescaleUtilities.Delay(1, function() -- Line: 669 -- upvalues: u15 (val), TweenService (upval)
                local v1, v2
                for i, j in u15:GetDescendants() do
                    if j:IsA("Light") then
                        v1 = TweenService
                        v2 = TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                        v1:Create(j, v2, {Brightness = 0}):Play()
                    end
                end
            end)
        end,
        PlaySound = function(a1_2) -- Line: 682 -- upvalues: a1 (val)
            a1:_playSound(a1_2)
        end,
    }
    a1._stateManager:changeState("Idle")
    a1:_setUp()
end

return v1