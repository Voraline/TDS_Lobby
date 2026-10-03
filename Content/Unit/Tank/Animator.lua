-- Script path: ReplicatedStorage.Content.Unit.Tank.Animator
-- Decompile time: 9.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1
local u53 = Random.new()
local u54 = {}
local u55 = {}

function v1._face(a1, a2, a3, a4) -- Line: 24
    -- upvalues: u55 (val), u54 (val), spr (val), RunService (val), GameState (val)
    local v1
    if not a3:IsA("Bone") then
        local lookVector_2 = a3.Part1.CFrame.lookVector
        local Unit_2 = (a2 - a3.Part1.Position).Unit
        v1 = math.deg((math.atan2(lookVector_2.Z, lookVector_2.X)) - (math.atan2(Unit_2.Z, Unit_2.X))) * 0.017453292519943295
        local C0 = a3.C0
        if not u55[a3] then
            u55[a3] = a3.C0
        end
        if u54[a3] then
            spr.stop(a3)
            u54[a3]:Disconnect()
        end
        a3.C0 = C0 * CFrame.Angles(0, v1, 0)
        local u118 = tick()
        u54[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 85 -- upvalues: u118 (val), GameState (upval), spr (upval), a3 (val), u55 (upval), u54 (upval)
            if 4 < (tick() - u118) * GameState.TimeScale then
                spr.target(a3, 1, 0.5 * GameState.TimeScale, {C0 = u55[a3]})
                u54[a3]:Disconnect()
            end
        end))
        return
    end
    local lookVector = a3.WorldCFrame.lookVector
    local Unit = (a2 - a3.WorldPosition).Unit
    v1 = math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X))) * 0.017453292519943295
    local CFrame_2 = a3.CFrame
    if not u55[a3] then
        u55[a3] = a3.CFrame
    end
    if u54[a3] then
        spr.stop(a3)
        u54[a3]:Disconnect()
    end
    local v2 = CFrame_2 * CFrame.Angles(0, v1, 0)
    a3.CFrame = v2
    if a4 then
        a4(v2)
    end
    local u60 = tick()
    u54[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 53 -- upvalues: u60 (val), GameState (upval), spr (upval), a3 (val), u55 (upval), u54 (upval)
        if 4 < (tick() - u60) * GameState.TimeScale then
            spr.target(a3, 1, 0.5 * GameState.TimeScale, {CFrame = u55[a3]})
            u54[a3]:Disconnect()
        end
    end))
end

function v1:_fireMissile(a2, a3) -- Line: 93
    -- upvalues: ReplicatedStorage (val), EmitterManager (val), EasySound (val), u53 (val), ItemDrop (val)
    -- upvalues: TimescaleUtilities (val), EffectsController (val)
    if not a2.Parent then
        return
    end
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local u12 = ReplicatedStorage.Assets.Effects.Projectile.TankShell:Clone()
    local Position = PrimaryPart.Position
    if self.FBXModel then
        self.Animations.Fire_Cannon:Play()
        local Start = self.Model.CannonFire.Start
        EmitterManager.manualEmit(Start)
        local FireCannon = self.Model.CannonFire.FireCannon
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = FireCannon.SoundId,
            parent = self.Model.CannonFire,
            volume = FireCannon.Volume,
            playbackSpeed = u53:NextNumber(0.8, 1.2),
        })
        self:_face(Position, self.Model.CannonBone.Value)
        u12.Parent = workspace
        a3.start = Start.WorldPosition
        u12.CFrame = CFrame.new(a3.start)
        ;(ItemDrop.Drop(a3.start, a3.goal, u12, a3.dtMultiplier, a3.gravity, a3.velocity, function(a1, a2, a3) -- Line: 133
            CFrame.new()
            local v1 = CFrame.lookAt(a2, a3)
            return (v1 - v1.Position) * CFrame.Angles(0, 3.141592653589793, 0)
        end)):andThen(function() -- Line: 139
            -- upvalues: a3 (val), u12 (val), self (val), EmitterManager (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval)
            local goal = a3.goal
            u12:Destroy()
            local Explosion = self.Model:FindFirstChild("Explosion")
            if not Explosion then
                EffectsController.Explosion({Position = goal, Radius = a3.radius})
                return
            end
            local v1 = Explosion:Clone()
            v1.Anchored = true
            local WeldConstraint = v1:FindFirstChildWhichIsA("WeldConstraint")
            if WeldConstraint then
                WeldConstraint:Destroy()
            end
            v1.Parent = workspace.Trash
            local v2 = goal + Vector3.new(0, v1.Size.Y / 2, 0)
            local v3 = RaycastParams.new()
            v3.FilterType = Enum.RaycastFilterType.Include
            local v4 = {}
            if workspace.Map:FindFirstChild("Road") then
                for i, v in ipairs(workspace.Map.Road:GetDescendants()) do
                    if v:IsA("BasePart") then
                        table.insert(v4, v)
                    end
                end
            end
            if workspace.Map:FindFirstChild("Ground") then
                for i2, i3 in ipairs(workspace.Map.Ground:GetDescendants()) do
                    if i3:IsA("BasePart") then
                        table.insert(v4, i3)
                    end
                end
            end
            if #v4 > 0 then
                v3.FilterDescendantsInstances = v4
                local v5 = goal + Vector3.new(0, 50, 0)
                local v6 = workspace:Raycast(v5, Vector3.new(0, -100, 0), v3)
                if v6 then
                    v2 = v6.Position + Vector3.new(0, v1.Size.Y / 2, 0)
                end
            end
            v1.CFrame = CFrame.new(v2)
            EmitterManager.manualEmit(v1)
            if self.Maid then
                self.Maid:Mark(v1)
            end
            TimescaleUtilities.CleanUp(v1, 1.5)
        end)
        return
    end
    local FireCannon_2 = self.Model.Weapon.Cannon.CannonBarrel.FireCannon
    local Start2 = self.Model.Weapon.Cannon.CannonBarrel.Start2
    self:_face(Position, self.Model.Chasis.HeadRotate)
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        id = FireCannon_2.SoundId,
        parent = self.Model.Weapon.Cannon.CannonBarrel,
        volume = FireCannon_2.Volume,
        playbackSpeed = u53:NextNumber(0.8, 1.2),
    })
    self.Animations.Fire_Cannon:Play()
    EmitterManager.manualEmit(Start2)
    u12.Parent = workspace
    a3.start = self.Model.Weapon.Cannon.CannonBarrel.Start2.WorldPosition
    u12.CFrame = CFrame.new(a3.start)
    ;(ItemDrop.Drop(a3.start, a3.goal, u12, a3.dtMultiplier, a3.gravity, a3.velocity, function(a1, a2, a3) -- Line: 225
        CFrame.new()
        local v1 = CFrame.lookAt(a2, a3)
        return (v1 - v1.Position) * CFrame.Angles(0, 3.141592653589793, 0)
    end)):andThen(function() -- Line: 231
        -- upvalues: a3 (val), u12 (val), self (val), EmitterManager (upval), TimescaleUtilities (upval)
        -- upvalues: EffectsController (upval)
        local goal = a3.goal
        u12:Destroy()
        local Explosion = self.Model:FindFirstChild("Explosion")
        if not Explosion then
            EffectsController.Explosion({Position = goal, Radius = a3.radius})
            return
        end
        local v1 = Explosion:Clone()
        v1.Anchored = true
        local WeldConstraint = v1:FindFirstChildWhichIsA("WeldConstraint")
        if WeldConstraint then
            WeldConstraint:Destroy()
        end
        v1.Parent = workspace.Trash
        local v2 = goal + Vector3.new(0, v1.Size.Y / 2, 0)
        local v3 = RaycastParams.new()
        v3.FilterType = Enum.RaycastFilterType.Include
        local v4 = {}
        if workspace.Map:FindFirstChild("Road") then
            for i, v in ipairs(workspace.Map.Road:GetDescendants()) do
                if v:IsA("BasePart") then
                    table.insert(v4, v)
                end
            end
        end
        if workspace.Map:FindFirstChild("Ground") then
            for i2, i3 in ipairs(workspace.Map.Ground:GetDescendants()) do
                if i3:IsA("BasePart") then
                    table.insert(v4, i3)
                end
            end
        end
        if #v4 > 0 then
            v3.FilterDescendantsInstances = v4
            local v5 = goal + Vector3.new(0, 50, 0)
            local v6 = workspace:Raycast(v5, Vector3.new(0, -100, 0), v3)
            if v6 then
                v2 = v6.Position + Vector3.new(0, v1.Size.Y / 2, 0)
            end
        end
        v1.CFrame = CFrame.new(v2)
        EmitterManager.manualEmit(v1)
        if self.Maid then
            self.Maid:Mark(v1)
        end
        TimescaleUtilities.CleanUp(v1, 1.5)
    end)
end

function v1:_fire(a2) -- Line: 287 -- upvalues: EasySound (val), u53 (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Position = PrimaryPart.Position
    if not self.FBXModel then
        local Fire_2 = self.Model.Weapon.Gun.Barrel.Fire
        local Start = self.Model.Weapon.Gun.Barrel.Start
        self:_face(Position, self.Model.GunRig.HeadRotate.Rotate)
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = Fire_2.SoundId,
            parent = self.Model.Weapon.Gun.Barrel,
            volume = Fire_2.Volume,
            playbackSpeed = u53:NextNumber(0.8, 1.2),
        })
        self.Animations.Fire_Turret:Play()
        EmitterManager.manualEmit(Start)
        self:Bullet({Start = Start.WorldPosition, End = Position, Spread = 50, Speed = 140})
        self:Delay(self.Cooldown)
        return
    end
    self.Animations.Fire_Turret:Play()
    local Fire = self.Model.TurretFire.Fire
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        id = Fire.SoundId,
        parent = self.Model.TurretFire,
        volume = Fire.Volume,
        playbackSpeed = u53:NextNumber(0.88, 1),
    })
    EmitterManager.manualEmit(self.Model.TurretFire.Start)
    local TurretBone = self.Model:FindFirstChild("TurretBone")
    if TurretBone and TurretBone.Value then
        self:_face(Position, self.Model.TurretBone.Value)
    end
    local GunnerBone = self.Model:FindFirstChild("GunnerBone")
    if GunnerBone and GunnerBone.Value then
        self:_face(Position, self.Model.GunnerBone.Value, function(a1) -- Line: 314 -- upvalues: self (val)
            self.Model.GunnerBone.Value.WorldCFrame = self.Model.TurretBone.Value.WorldCFrame * CFrame.new(0, -0.1, 0.2)
        end)
    end
    self:Bullet({
        Start = self.Model.TurretFire.Position,
        End = Position,
        Spread = 50,
        Speed = 140,
    })
    self:Delay(self.Cooldown)
end

function LeftOrRight() -- Line: 361 -- upvalues: u53 (val)
    if u53:NextInteger(0, 1) then
        return 1
    end
    return -1
end

function v1.Initialize(a1) -- Line: 370
    -- upvalues: EasySound (val), Animation (val), u53 (val), EffectsController (val), ReplicatedStorage (val)
    -- upvalues: spr (val), RunService (val)
    local v1
    a1.PathOffset = 0
    local Drive = a1.Model.PrimaryPart:WaitForChild("Drive")
    a1._driveLoop = EasySound.Create({
        looped = true,
        audioGroup = "Towers",
        id = Drive.SoundId,
        parent = a1.Model.PrimaryPart,
        volume = Drive.Volume,
        playbackSpeed = Drive.PlaybackSpeed or 1,
    })
    a1._driveLoop:Play()
    a1.Animations = {}
    for i, j in {"Fire_Cannon", "Fire_Turret", "Walk"} do
        v1 = Animation.new({
            IgnorePriority = true,
            Track = a1.Model.Animations:WaitForChild(j),
            Target = (a1.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
        })
        a1.Animations[j] = v1
    end
    a1.Animations.Walk:Play()
    a1.Executables = {
        Missile = function(a1_2, a2) -- Line: 400 -- upvalues: a1 (val)
            a1:_fireMissile(a1_2, a2)
        end,
        Death = function(a1_2) -- Line: 404
            -- upvalues: a1 (val), u53 (upval), EffectsController (upval), ReplicatedStorage (upval), spr (upval)
            -- upvalues: RunService (upval)
            local v1
            a1.Animations.Walk:Stop()
            a1.Dead = true
            local v2 = u53:NextNumber(-40, 40)
            local v3 = a1.Model.PrimaryPart.CFrame * CFrame.new(LeftOrRight() * 2.5, -0.5, 0) * CFrame.Angles(0, math.rad(v2), 0)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("SpecialMesh") then
                    v.TextureId = ""
                elseif v:IsA("BasePart") then
                    v.BrickColor = BrickColor.new("Black")
                    v.Material = Enum.Material.CorrodedMetal
                    if v:IsA("MeshPart") then
                        v.TextureID = ""
                    end
                end
            end
            EffectsController.Explosion({Radius = 5, Position = a1.Model.Hitbox.Position})
            for i, j in ReplicatedStorage.Assets.Effects.Client.VehicleFlames:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hitbox
            end
            a1.Model.PrimaryPart:WaitForChild("Drive"):Stop()
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 1
            spr.target(a1.Model.PrimaryPart, 0.36, 2, {CFrame = v3})
            spr.target(NumberValue, 1, 3, {Value = 0.8})
            local v4 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 448 -- upvalues: a1 (upval), NumberValue (val)
                a1.Model:ScaleTo(NumberValue.Value)
            end)
            a1:Delay(a1_2)
            spr.stop(NumberValue)
            NumberValue:Destroy()
            if a1.Model and a1.Model.Parent and a1.Model.PrimaryPart then
                spr.stop(a1.Model.PrimaryPart)
            end
            v4:Disconnect()
        end,
    }
    a1:Thread(function() -- Line: 464 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and a1:IsAlive() then
            a1:_fire(v1)
        end
    end)
end

return v1