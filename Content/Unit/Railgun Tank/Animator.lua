-- Script path: ReplicatedStorage.Content.Unit.Railgun Tank.Animator
-- Decompile time: 8.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u57 = Random.new()
local v1 = {}
v1.__index = v1

local function leftOrRight() -- Line: 22 -- upvalues: u57 (val)
    if u57:NextInteger(0, 1) then
        return 1
    end
    return -1
end

local u60 = {}
local u61 = {}

function v1._face(a1, a2, a3, a4) -- Line: 34
    -- upvalues: u61 (val), u60 (val), spr (val), RunService (val), GameState (val)
    local v1
    if not a3:IsA("Bone") then
        local lookVector_2 = a3.Part1.CFrame.lookVector
        local Unit_2 = (a2 - a3.Part1.Position).Unit
        v1 = math.deg((math.atan2(lookVector_2.Z, lookVector_2.X)) - (math.atan2(Unit_2.Z, Unit_2.X))) * 0.017453292519943295
        local C0 = a3.C0
        if not u61[a3] then
            u61[a3] = a3.C0
        end
        if u60[a3] then
            spr.stop(a3)
            u60[a3]:Disconnect()
        end
        a3.C0 = C0 * CFrame.Angles(0, v1, 0)
        local u118 = tick()
        u60[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 95 -- upvalues: u118 (val), GameState (upval), spr (upval), a3 (val), u61 (upval), u60 (upval)
            if 4 < (tick() - u118) * GameState.TimeScale then
                spr.target(a3, 1, 0.5 * GameState.TimeScale, {C0 = u61[a3]})
                u60[a3]:Disconnect()
            end
        end))
        return
    end
    local lookVector = a3.WorldCFrame.lookVector
    local Unit = (a2 - a3.WorldPosition).Unit
    v1 = math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X))) * 0.017453292519943295
    local CFrame_2 = a3.CFrame
    if not u61[a3] then
        u61[a3] = a3.CFrame
    end
    if u60[a3] then
        spr.stop(a3)
        u60[a3]:Disconnect()
    end
    local v2 = CFrame_2 * CFrame.Angles(0, v1, 0)
    a3.CFrame = v2
    if a4 then
        a4(v2)
    end
    local u60_2 = tick()
    u60[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 63 -- upvalues: u60_2 (val), GameState (upval), spr (upval), a3 (val), u61 (upval), u60 (upval)
        if 4 < (tick() - u60_2) * GameState.TimeScale then
            spr.target(a3, 1, 0.5 * GameState.TimeScale, {CFrame = u61[a3]})
            u60[a3]:Disconnect()
        end
    end))
end

function v1:FireMissile(a2, a3) -- Line: 103
    -- upvalues: ReplicatedStorage (val), EmitterManager (val), EasySound (val), u57 (val), ItemDrop (val)
    -- upvalues: TimescaleUtilities (val), EffectsController (val), Laser (val)
    if a2:IsA("Model") and a2.Parent then
        local PrimaryPart = a2.PrimaryPart
        if not PrimaryPart then
            return
        end
        local Position = PrimaryPart.Position
        if not self.FBXModel then
            local Fire_2 = self.Model.Weapon.Cannon.CannonBarrel.Fire
            local Start_3 = self.Model.Weapon.Cannon.CannonBarrel.Start
            self:_face(Position, self.Model.Chasis.HeadRotate)
            local v1 = {
                Lifetime = 0.75,
                minWidth = 0.15000000000000002,
                maxWidth = 0.30000000000000004,
                Bursts = 2,
            }
            local Attribute = self.Model:GetAttribute("BeamColor") or Color3.fromRGB(0, 170, 255)
            v1.Color = Attribute
            v1.Start = Start_3.WorldPosition
            v1.End = Position
            v1.Offset = u57:NextNumber(0.25, 0.5)
            Laser:Lightning(v1)
            self.Animations.Fire_Cannon:Play()
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = Fire_2.SoundId,
                parent = self.Model.Weapon.Cannon.CannonBarrel,
                volume = Fire_2.Volume,
                playbackSpeed = u57:NextNumber(0.8, 1.2),
            })
            EmitterManager.manualEmit(Start_3)
            EmitterManager.Emit("RailgunExplosion", PrimaryPart.CFrame, a3)
            return
        end
        local Value = self.Model.CannonBone.Value
        local CannonBone = self.Model.CannonBone and self.Model.CannonBone:GetAttribute("UseTankCannon") == true
        if not CannonBone then
            self.Animations.Fire_Cannon:Play()
            local Start = self.Model.CannonFire.Start
            EmitterManager.manualEmit(Start)
            local Fire = self.Model.CannonFire.Fire
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = Fire.SoundId,
                parent = self.Model.CannonFire,
                volume = Fire.Volume,
                playbackSpeed = u57:NextNumber(0.8, 1.2),
            })
            self:_face(Position, Value)
            task.defer(function() -- Line: 230 -- upvalues: self (val), Start (val), Position (val), u57 (upval), Laser (upval)
                local v1 = {
                    Lifetime = 0.75,
                    minWidth = 0.15000000000000002,
                    maxWidth = 0.30000000000000004,
                    Bursts = 2,
                }
                local Attribute = self.Model:GetAttribute("BeamColor") or Color3.fromRGB(0, 170, 255)
                v1.Color = Attribute
                v1.Start = Start.WorldPosition
                v1.End = Position
                v1.Offset = u57:NextNumber(0.25, 0.5)
                Laser:Lightning(v1)
            end)
            return
        end
        local u32 = ReplicatedStorage.Assets.Effects.Projectile.TankShell:Clone()
        self.Animations.Fire_Cannon:Play()
        local Start_2 = self.Model.CannonFire.Start
        EmitterManager.manualEmit(Start_2)
        local FireCannon = self.Model.CannonFire:FindFirstChild("FireCannon")
        if FireCannon then
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = FireCannon.SoundId,
                parent = self.Model.CannonFire,
                volume = FireCannon.Volume,
                playbackSpeed = u57:NextNumber(0.8, 1.2),
            })
        end
        self:_face(Position, Value)
        u32.Parent = workspace
        local WorldPosition = Start_2.WorldPosition
        u32.CFrame = CFrame.new(WorldPosition)
        ;(ItemDrop.Drop(WorldPosition, Position, u32, 4.5, -2.5, 2, function(a1, a2, a3) -- Line: 151
            CFrame.new()
            local v1 = CFrame.lookAt(a2, a3)
            return (v1 - v1.Position) * CFrame.Angles(0, 3.141592653589793, 0)
        end)):andThen(function() -- Line: 158
            -- upvalues: u32 (val), self (val), Position (val), EmitterManager (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval), a3 (val)
            u32:Destroy()
            local Explosion = self.Model:FindFirstChild("Explosion")
            if not Explosion then
                EffectsController.Explosion({Position = Position, Radius = a3})
                return
            end
            local v1 = Explosion:Clone()
            v1.Anchored = true
            local WeldConstraint = v1:FindFirstChildWhichIsA("WeldConstraint")
            if WeldConstraint then
                WeldConstraint:Destroy()
            end
            v1.Parent = workspace.Trash
            local v2 = Position + Vector3.new(0, v1.Size.Y / 2, 0)
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
                local v5 = Position + Vector3.new(0, 50, 0)
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
end

function v1:Fire(a2) -- Line: 278 -- upvalues: EasySound (val), u57 (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Position = PrimaryPart.Position
    if not self.FBXModel then
        local Start = self.Model.Weapon.Gun.Handle.Start
        local Fire_2 = self.Model.Weapon.Gun.Handle.Fire
        self:_face(Position, (((self.Model:WaitForChild("GunRig")):WaitForChild("HeadRotate")):WaitForChild("Rotate")))
        self.Animations.Fire_Turret:Play()
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = Fire_2.SoundId,
            parent = self.Model.Weapon.Gun.Handle,
            volume = Fire_2.Volume,
            playbackSpeed = u57:NextNumber(0.8, 1.2),
        })
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
        playbackSpeed = u57:NextNumber(0.88, 1),
    })
    EmitterManager.manualEmit(self.Model.TurretFire.Start)
    local TurretBone = self.Model:FindFirstChild("TurretBone")
    local GunnerBone = self.Model:FindFirstChild("GunnerBone")
    if TurretBone and TurretBone.Value then
        self:_face(Position, self.Model.TurretBone.Value)
    end
    if GunnerBone and GunnerBone.Value then
        self:_face(Position, self.Model.GunnerBone.Value, function(a1) -- Line: 305 -- upvalues: self (val)
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

function v1.Initialize(a1) -- Line: 355
    -- upvalues: Animation (val), EasySound (val), u57 (val), EffectsController (val), ReplicatedStorage (val)
    -- upvalues: spr (val), RunService (val)
    local v1
    a1.PathOffset = 0
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
    a1.Executables = {
        Missile = function(a1_2, a2) -- Line: 384 -- upvalues: a1 (val)
            a1:FireMissile(a1_2, a2)
        end,
        Death = function(a1_2) -- Line: 388
            -- upvalues: a1 (val), u57 (upval), EffectsController (upval), ReplicatedStorage (upval), spr (upval)
            -- upvalues: RunService (upval)
            local v1
            a1.Animations.Walk:Stop()
            a1.Dead = true
            local v2 = u57:NextNumber(-40, 40)
            local CFrame_2 = a1.Model.PrimaryPart.CFrame
            local new = CFrame.new
            local v3 = CFrame_2 * new((if not u57:NextInteger(0, 1) then -1 else 1) * 2.5, -0.5, 0) * CFrame.Angles(0, math.rad(v2), 0)
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
            EffectsController.Explosion({Radius = 6, Position = a1.Model.Hitbox.Position})
            for i, j in ReplicatedStorage.Assets.Effects.Client.VehicleFlames:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hitbox
            end
            a1.Model.PrimaryPart:WaitForChild("Drive"):Stop()
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 1
            spr.target(a1.Model.PrimaryPart, 0.36, 2, {CFrame = v3})
            spr.target(NumberValue, 1, 3, {Value = 0.8})
            local v4 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 432 -- upvalues: a1 (upval), NumberValue (val)
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
    a1:Thread(function() -- Line: 448 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and a1.Dead == false then
            a1:Fire(v1)
        end
    end)
end

return v1