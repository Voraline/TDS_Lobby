-- Script path: ReplicatedStorage.Content.NewEnemies.Patient Zero.Animator
-- Decompile time: 11.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Trash = workspace:FindFirstChild("Trash")
if not Trash then
    Trash = workspace
end
local Spitball = ReplicatedStorage.Assets.Effects.Mob.Spitball
local PosionPuddles = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("PosionPuddles")
local v1 = {}
v1.__index = v1

function v1:UpdatePuddles(a2) -- Line: 29
    -- upvalues: GameState (val), Trash (val), EasySound (val), PosionPuddles (val), TweenService (val)
    -- upvalues: TimescaleUtilities (val)
    local _puddleLoops, _puddleLoops_2, v1, v2
    if a2 == nil then
        return
    end
    local v3 = nil
    local v4 = nil
    for i, j in a2, v3, v4 do
        v1 = (j.EndTime - workspace:GetServerTimeNow()) * GameState.TimeScale
        if v1 < 0.1 then
            v1 = Trash:FindFirstChild(i)
            if v1 then
                v1:Destroy()
            end
            _puddleLoops = self._puddleLoops and self._puddleLoops[i]
            if _puddleLoops then
                EasySound.Destroy(_puddleLoops)
                self._puddleLoops[i] = nil
            end
        elseif not Trash:FindFirstChild(i) then
            local u62 = PosionPuddles[math.random(1, #PosionPuddles:GetChildren())]:Clone()
            u62.Name = i
            u62.Transparency = 1
            u62.Size = Vector3.new(0, 0, 0)
            u62.CFrame = (CFrame.new(j.Position + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0)
            u62.Parent = Trash
            _puddleLoops_2 = self._puddleLoops or {}
            self._puddleLoops = _puddleLoops_2
            v2 = EasySound.Create({
                id = "rbxassetid://17332105887",
                volume = 0.01,
                looped = true,
                soundGroupName = "Enemies",
                parent = u62,
            })
            self._puddleLoops[i] = v2
            local u111 = TweenService:Create(u62, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Transparency = 0,
                Size = Vector3.new(j.Radius / 2, 0.068, j.Radius / 2),
            })
            u111:Play()
            u62.Color = Color3.fromRGB(75, 255, 240)
            TimescaleUtilities.Delay(1.5, function() -- Line: 84
                -- upvalues: u111 (val), j (val), TweenService (upval), u62 (val), TimescaleUtilities (upval)
                -- upvalues: self (val), i (val), EasySound (upval)
                u111:Cancel()
                local v1 = math.clamp(j.EndTime - workspace:GetServerTimeNow(), 0, 20)
                TweenService:Create(u62, TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Transparency = 1,
                    Size = Vector3.new(j.Radius, 0.068, j.Radius) / 4,
                }):Play()
                TimescaleUtilities.Delay(v1 + 5, function() -- Line: 96 -- upvalues: self (upval), i (upval)
                    self.animating[i] = nil
                end)
                TimescaleUtilities.Delay(v1, function() -- Line: 100 -- upvalues: self (upval), i (upval), EasySound (upval), u62 (upval)
                    local _puddleLoops = self._puddleLoops and self._puddleLoops[i]
                    if _puddleLoops then
                        EasySound.Destroy(_puddleLoops)
                        self._puddleLoops[i] = nil
                    end
                    u62:Destroy()
                end)
            end)
        end
    end
end

function v1:_setUpAnimations() -- Line: 113 -- upvalues: Animation (val)
    local Animations_2 = self.Model.Animations
    local Animator = self.Model.AnimationController.Animator
    self.Animations = {}
    for i, j in Animations_2:GetChildren() do
        self.Animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    self.Animations.WalkAnim:Play()
    self.currentWalk = self.Animations.WalkAnim
end

function v1:_emitEffect(a2) -- Line: 134 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local u7 = self.Model["Right Hand"]:FindFirstChild(a2)
    if u7 then
        if self.emitThreads[a2] then
            task.cancel(self.emitThreads[a2])
        end
        self.emitThreads[a2] = (task.spawn(function() -- Line: 141 -- upvalues: u7 (val), TweenService (upval), TimescaleUtilities (upval)
            local v1, v2
            local v3 = {}
            for i, j in u7:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    table.insert(v3, j)
                end
                if j:IsA("PointLight") then
                    v1 = TweenService
                    v2 = TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    v1:Create(j, v2, {Brightness = 18}):Play()
                    TimescaleUtilities.Delay(0.1, function() -- Line: 159 -- upvalues: TweenService (upval), j (val)
                        TweenService:Create(j, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Brightness = 0}):Play()
                    end)
                end
            end
            for k, n in v3 do
                local u34 = n:GetAttribute("EmitCount") or 0
                local u39 = n:GetAttribute("EmitDuration") or 0
                task.delay(n:GetAttribute("EmitDelay") or 0, function() -- Line: 177 -- upvalues: n (val), u34 (val), u39 (val), TimescaleUtilities (upval)
                    if n:IsA("ParticleEmitter") then
                        n:Emit(u34)
                    end
                    if u39 > 0 then
                        task.defer(function() -- Line: 183 -- upvalues: n (upval), TimescaleUtilities (upval), u39 (upval)
                            n.Enabled = true
                            TimescaleUtilities.Wait(u39)
                            n.Enabled = false
                        end)
                    end
                end)
            end
        end))
    end
end

function v1:_rageEffect(a2) -- Line: 195 -- upvalues: TweenService (val) -- types: self: table, a2: boolean
    local v1, v2
    if a2 == false then
        for k, n in self.Model.Veins:GetChildren() do
            n.Transparency = 1
            n.Rage.Enabled = false
        end
        return
    end
    for i, j in self.Model.Veins:GetChildren() do
        v2 = TweenService
        v1 = TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        v2:Create(j, v1, {Transparency = 0}):Play()
        j.Rage.Enabled = true
    end
end

function v1:_playSound(a2, a3) -- Line: 214 -- upvalues: GameState (val), EasySound (val)
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2)
    if v1 and v1:IsA("Sound") then
        local v2 = v1.PlaybackSpeed * GameState.TimeScale
        if a3 then
            v2 = v2 + Random.new():NextNumber(-0.2, 0.2)
        end
        EasySound.Play({
            destroyOnEnd = true,
            soundGroupName = "Enemies",
            id = v1.SoundId,
            parent = self.Model.HumanoidRootPart,
            volume = v1.Volume,
            playbackSpeed = v2,
        })
        return
    end
end

function v1:_rageWalkStomp() -- Line: 233 -- upvalues: Shaker (val)
    self.Maid:Mark(((self.currentWalk.Controller:GetMarkerReachedSignal("Stomp")):Connect(function() -- Line: 234 -- upvalues: self (val), Shaker (upval)
        if not workspace.CurrentCamera then
            return
        end
        self:_playSound("Stomp", true)
        Shaker:Shake({0.25, 15, 0.1, 1}, 0.2, 0.25)
    end)))
end

function v1.Initialize(a1) -- Line: 244
    -- upvalues: TimescaleUtilities (val), Laser (val), EffectsController (val), Shaker (val), ReplicatedStorage (val)
    -- upvalues: Trash (val), ItemDrop (val), EmitterManager (val), Spitball (val), TweenService (val)
    a1:_rageEffect(false)
    a1.animating = {}
    a1.emitThreads = {}
    a1._puddleLoops = {}
    a1:_setUpAnimations()
    local SummonEffect = a1.Model["Right Hand"]:FindFirstChild("SummonEffect")
    local u21 = a1.Replicator:Get("Health")
    local u22 = nil
    local u23 = false
    ;(a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1_2) -- Line: 257 -- upvalues: u21 (ref), u22 (ref), a1 (val), TimescaleUtilities (upval)
        if u21 < a1_2 then
            if u22 then
                task.cancel(u22)
            end
            u22 = task.spawn(function() -- Line: 262 -- upvalues: a1 (upval), TimescaleUtilities (upval)
                for i, j in a1.Model.HumanoidRootPart.Healing:GetChildren() do
                    j.Enabled = true
                end
                TimescaleUtilities.Wait(2)
                for k, n in a1.Model.HumanoidRootPart.Healing:GetChildren() do
                    n.Enabled = false
                end
            end)
        end
        u21 = a1_2
    end)
    ;(a1.Replicator:GetStateChangedSignal("Puddles")):Connect(function(a1_2) -- Line: 276 -- upvalues: a1 (val)
        a1:UpdatePuddles(a1_2)
    end)
    a1:UpdatePuddles((a1.Replicator:Get("Puddles")))
    a1.Executables = {
        Death = function() -- Line: 283 -- upvalues: u23 (ref), a1 (val)
            u23 = true
            for i, j in a1.Animations do
                j:Stop(0)
            end
            a1.currentWalk:Stop(0)
            for k, n in a1.Model.Flask:GetChildren() do
                n.Transparency = 1
            end
            a1:_playSound("Dead")
            a1.Animations.Death:Play(0)
            a1:Delay(10)
        end,
        Rage = function() -- Line: 300 -- upvalues: a1 (val), u23 (ref)
            a1.currentWalk:Stop()
            a1.Animations.RageIntro:Play(0)
            a1:_playSound("Rage", false)
            a1:_rageEffect(true)
            a1:Delay(4)
            if u23 then
                return
            end
            a1.currentWalk = a1.Animations.RageWalk
            a1.currentWalk:Play()
            a1:_rageWalkStomp()
        end,
        ProjectileAnimation = function() -- Line: 314 -- upvalues: a1 (val)
            a1:_playSound("EquipCannon")
            a1.currentWalk:Stop(0)
            a1.Animations.CannonIntro:Play(0)
            a1.Animations.CannonIdle:Play()
        end,
        Shoot = function() -- Line: 321 -- upvalues: a1 (val)
            a1:_emitEffect("CannonEffect")
            a1:_playSound("ShootCannon", true)
            a1.Animations.CannonFire:Play(0)
        end,
        StopProjectileAnimations = function() -- Line: 328 -- upvalues: a1 (val)
            a1:_playSound("UnequipCannon")
            a1.Animations.CannonOutro:Play(0)
            a1.Animations.CannonIdle:Stop()
            a1.currentWalk:Play(0.5)
        end,
        SummonAnimation = function() -- Line: 335 -- upvalues: a1 (val), TimescaleUtilities (upval), u23 (ref), SummonEffect (val), Laser (upval)
            a1.currentWalk:Stop()
            a1:_playSound("Summon", false)
            a1.Animations.Summon:Play(0)
            TimescaleUtilities.Delay(0.6, function() -- Line: 340 -- upvalues: u23 (upval), a1 (upval), SummonEffect (upval), Laser (upval)
                if not u23 then
                    a1:_emitEffect("SummonEffect")
                    local v1 = {
                        Lifetime = 0.75,
                        minWidth = 0.15000000000000002,
                        maxWidth = 0.30000000000000004,
                        Bursts = 2,
                        Color = Color3.fromRGB(0, 255, 115),
                        Start = SummonEffect.WorldPosition * Vector3.new(0, 1, 0) * 15,
                        End = SummonEffect.WorldPosition,
                        Offset = Random.new():NextNumber(0.25, 0.5),
                    }
                    Laser:Lightning(v1)
                end
            end)
            a1:Delay(2.5)
            if not u23 then
                a1.currentWalk:Play()
            end
        end,
        Stomp = function() -- Line: 365 -- upvalues: a1 (val), u23 (ref)
            a1:_playSound("Stun", false)
            a1.currentWalk:Stop()
            a1.Animations.Stun:Play(0)
            a1:Delay(3)
            if not u23 then
                a1.currentWalk:Play()
            end
        end,
        StompEffect = function(a1_2) -- Line: 375 -- upvalues: EffectsController (upval), a1 (val), Shaker (upval)
            EffectsController.GroundSmash(CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition), a1_2)
            Shaker:Shake({8, 30, 0.1, 1}, 0.1, 0.5)
        end,
        FlaskThrow = function() -- Line: 380 -- upvalues: a1 (val)
            a1.Animations.FlaskThrow:Play(0)
        end,
        FlaskEquip = function() -- Line: 384 -- upvalues: a1 (val), u23 (ref)
            a1:_playSound("FlaskEquip", true)
            a1.currentWalk:Stop()
            a1.Animations.FlaskEquip:Play(0)
            a1.Animations.FlaskIdle:Play()
            a1:Delay(0.25)
            if not u23 then
                for i, j in a1.Model.Flask:GetChildren() do
                    j.Transparency = j:GetAttribute("Transparency")
                end
            end
        end,
        FlaskUnequip = function() -- Line: 399 -- upvalues: a1 (val), u23 (ref), ReplicatedStorage (upval), Trash (upval), ItemDrop (upval)
            a1.Animations.FlaskUnequip:Play()
            a1.Animations.FlaskIdle:Stop()
            a1:Delay(0.35)
            if u23 then
                return
            end
            a1:_playSound("FlaskThrow", true)
            local u31 = ReplicatedStorage.Assets.Effects.Client.Flask:Clone()
            u31.Parent = Trash
            u31.Flask.FlaskBreak.Volume = 0.2
            local Position = (a1.Model.HumanoidRootPart.CFrame * CFrame.new(20, 0, 0)).Position
            local v1 = {
                Gravity = -2,
                Velocity = 3,
                dtMultiplier = 4,
                startPosition = (CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)) * CFrame.new(1.5, 0, 0),
                endPosition = CFrame.new(Position.X, a1.Model.HumanoidRootPart.Node.WorldPosition.Y, Position.Z),
            }
            ;(ItemDrop.Drop(v1.startPosition, v1.endPosition, u31, v1.dtMultiplier, v1.Gravity, v1.Velocity, function(a1, a2, a3) -- Line: 437
                return (CFrame.lookAt(a3, a2)).Rotation * CFrame.Angles(math.rad(100 * a1), 0, 0)
            end)):andThen(function() -- Line: 441 -- upvalues: u31 (val)
                u31:Destroy()
            end)
            for i, j in a1.Model.Flask:GetChildren() do
                j.Transparency = 1
            end
            a1.currentWalk:Play(0.5)
        end,
        Flask = function(a1_2) -- Line: 452
            -- upvalues: a1 (val), ReplicatedStorage (upval), Trash (upval), TimescaleUtilities (upval)
            -- upvalues: ItemDrop (upval), EmitterManager (upval)
            local u1 = {}
            u1.startPosition = a1.Model.Folder.HandCore_Glow.Position
            u1.endPosition = a1_2.endPosition
            u1.dtMultiplier = a1_2.dtMultiplier
            u1.Gravity = a1_2.Gravity
            u1.Velocity = a1_2.Velocity
            local u18 = ReplicatedStorage.Assets.Effects.Client.Flask:Clone()
            u18.Parent = Trash
            for i, j in a1.Model.Flask:GetChildren() do
                j.Transparency = 1
            end
            a1:_playSound("FlaskThrow", true)
            TimescaleUtilities.Delay(0.35, function() -- Line: 475 -- upvalues: a1 (upval)
                for i, j in a1.Model.Flask:GetChildren() do
                    j.Transparency = j:GetAttribute("Transparency")
                end
            end)
            ;(ItemDrop.Drop(u1.startPosition, u1.endPosition, u18, u1.dtMultiplier, u1.Gravity, u1.Velocity, function(a1, a2, a3) -- Line: 488
                return (CFrame.lookAt(a3, a2)).Rotation * CFrame.Angles(math.rad(90 * a1), 0, 0)
            end)):andThen(function() -- Line: 492 -- upvalues: EmitterManager (upval), u1 (val), u18 (val)
                EmitterManager.Emit("BileExplosion", CFrame.new(u1.endPosition), 6)
                u18:Destroy()
            end)
        end,
        ShotgunOrb = function(a1_2) -- Line: 498
            -- upvalues: a1 (val), Spitball (upval), Trash (upval), TimescaleUtilities (upval), ItemDrop (upval)
            -- upvalues: EmitterManager (upval)
            local v1
            for i, j in a1_2 do
                j.startPosition = a1.Model.Folder.HandCore_Glow.Position
                local u19 = Spitball:Clone()
                u19.Transparency = 0
                u19.Parent = Trash
                TimescaleUtilities.Delay(0.01, function() -- Line: 510 -- upvalues: u19 (val)
                    u19.Bits.Enabled = true
                    u19.Trail.Enabled = true
                end)
                u19.Name = "ToxicOrb"
                u19.Size = Vector3.new(0.5, 0.5, 0.5)
                v1 = {
                    Gravity = j.Gravity,
                    Velocity = j.Velocity,
                    dtMultiplier = j.dtMultiplier,
                }
                ;(ItemDrop.Drop(j.startPosition, j.endPosition, u19, v1.dtMultiplier, v1.Gravity, v1.Velocity, function(a1, a2, a3) -- Line: 531
                    local v1 = CFrame.new(a3, a2)
                    return v1 - v1.Position
                end)):andThen(function() -- Line: 535 -- upvalues: EmitterManager (upval), j (val), u19 (val), a1 (upval)
                    EmitterManager.Emit("BileExplosion", CFrame.new(j.endPosition), 4)
                    u19.CFrame = CFrame.new(j.endPosition)
                    u19.Transparency = 1
                    u19.Bits.Enabled = false
                    u19.Trail.Enabled = false
                    a1:Delay(3, function() -- Line: 543 -- upvalues: u19 (upval)
                        u19:Destroy()
                    end)
                end)
                a1:Delay(0.02)
            end
        end,
        LookAt = function(a1_2) -- Line: 552 -- upvalues: a1 (val), TweenService (upval) -- types: a1_2: vector
            local Position = a1.Model.PrimaryPart.Position
            TweenService:Create(a1.Model.PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                CFrame = CFrame.new(Position, (Vector3.new(a1_2.X, Position.Y, a1_2.Z))),
            }):Play()
        end,
        ToxicOrb = function(a1_2, a2, a3) -- Line: 566
            -- upvalues: Spitball (upval), Trash (upval), TimescaleUtilities (upval), ItemDrop (upval)
            -- upvalues: EmitterManager (upval), a1 (val)
            local u6 = Spitball:Clone()
            u6.Transparency = 0
            u6.Parent = Trash
            TimescaleUtilities.Delay(0.01, function() -- Line: 571 -- upvalues: u6 (val)
                u6.Bits.Enabled = true
                u6.Trail.Enabled = true
            end)
            u6.Name = "ToxicOrb"
            local Gravity = a3.Gravity
            local Velocity = a3.Velocity
            local dtMultiplier = a3.dtMultiplier
            ;(ItemDrop.Drop(a1_2, a2, u6, dtMultiplier, Gravity, Velocity, function(a1, a2, a3) -- Line: 589
                local v1 = CFrame.new(a3, a2)
                return v1 - v1.Position
            end)):andThen(function() -- Line: 593 -- upvalues: EmitterManager (upval), a2 (val), u6 (val), a1 (upval)
                EmitterManager.Emit("BileExplosion", CFrame.new(a2), 4)
                u6.CFrame = CFrame.new(a2)
                u6.Transparency = 1
                u6.Bits.Enabled = false
                u6.Trail.Enabled = false
                a1:Delay(3, function() -- Line: 601 -- upvalues: u6 (upval)
                    u6:Destroy()
                end)
            end)
        end,
    }
end

return v1