-- Script path: ReplicatedStorage.Content.Unit.Molten Monster.Animator
-- Decompile time: 5.69 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u74 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 24
    -- upvalues: StateManager (val), Shaker (val), EasySound (val), u74 (val), TimescaleUtilities (val)
    -- upvalues: EffectsController (val), HttpService (val), AreaIndicatorStore (val), ReplicatedStorage (val)
    -- upvalues: spr (val), ItemDrop (val), EmitterManager (val), RunService (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local HumanoidRootPart = a1.Model:WaitForChild("HumanoidRootPart")
    local Tamer = a1.Model:WaitForChild("Tamer")
    local Animations_2 = Tamer:WaitForChild("Animations")
    local AnimationController_2 = Tamer:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._monsterAnimations = {}
    a1:_loadAnimations(Animations, AnimationController, a1._monsterAnimations)
    a1._animationEvents = {
        Stomp = function() -- Line: 44 -- upvalues: Shaker (upval), HumanoidRootPart (val), EasySound (upval), u74 (upval)
            Shaker:Shake({0.2, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = HumanoidRootPart.Position})
            EasySound.Play({
                id = 17284713381,
                destroyOnEnd = true,
                parent = HumanoidRootPart,
                playbackSpeed = u74:NextNumber(0.5, 0.7),
            })
        end,
    }
    a1._tamerAnimations = {}
    a1:_loadAnimations(Animations_2, AnimationController_2, a1._tamerAnimations)
    a1._monsterAnimations.Idle:Play()
    a1._tamerAnimations.Idle:Play()
    a1._idleSound = EasySound.Play({id = 122886978415824, looped = true, soundGroupName = "Towers", parent = HumanoidRootPart})
    a1:_walk(true)
    a1.Executables = {
        Fire = function(a1_2) -- Line: 78 -- upvalues: a1 (val), EasySound (upval), HumanoidRootPart (val) -- types: a1_2: vector
            a1:_walk(false)
            a1._monsterAnimations.Fire:Play()
            local v1 = a1:Face(a1_2, (TweenInfo.new(0.5)))
            a1.Rotation = CFrame.new() * v1.Rotation
            EasySound.Play({
                id = 89315293569545,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = HumanoidRootPart,
            })
        end,
        Swipe = function(a1_2, a2) -- Line: 93
            -- upvalues: a1 (val), EasySound (upval), HumanoidRootPart (val), u74 (upval)
            a1:_walk(false)
            if not (a2 % 2 == 0) then
                a1._monsterAnimations["Left Swipe"]:Play()
            else
                a1._monsterAnimations["Right Swipe"]:Play()
            end
            local v1 = a1:Face(a1_2, (TweenInfo.new(0.5)))
            a1.Rotation = CFrame.new() * v1.Rotation
            EasySound.Play({
                id = 78052617806815,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = HumanoidRootPart,
                playbackSpeed = u74:NextNumber(0.8, 1.2),
            })
        end,
        Walk = function() -- Line: 113 -- upvalues: a1 (val)
            a1:_walk(true)
        end,
        Death = function() -- Line: 116
            -- upvalues: a1 (val), EasySound (upval), HumanoidRootPart (val), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval), Shaker (upval)
            a1:_walk(false)
            a1._tamerAnimations.Death:Play()
            a1._monsterAnimations.Death:Play()
            EasySound.Play({
                id = 92002284693447,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = HumanoidRootPart,
            })
            TimescaleUtilities.Delay(2.9, function() -- Line: 128
                -- upvalues: HumanoidRootPart (upval), EffectsController (upval), Shaker (upval), EasySound (upval)
                local WorldCFrame = HumanoidRootPart.Node.WorldCFrame
                EffectsController.GroundSmash(WorldCFrame * CFrame.new(0, 0, -2), 40)
                Shaker:Shake({2, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = WorldCFrame.Position})
                EasySound.Play({
                    id = 82764043213693,
                    destroyOnEnd = true,
                    soundGroupName = "Towers",
                    parent = HumanoidRootPart,
                })
            end)
        end,
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 143
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), a1 (val)
            local v1 = HttpService:GenerateGUID(false)
            local create = AreaIndicatorStore.create
            local v2 = {type = if not (a1_2 > 0) then "full" else "normal", radius = a2}
            local v3 = false
            if a1_2 > 0 then
                v3 = 0
            end
            v2.initialAngle = v3
            v3 = false
            if a1_2 > 0 then
                v3 = a1_2
            end
            v2.desiredAngle = v3
            v2.color3 = Color3.fromRGB(255, 255, 255)
            v3 = false
            if a1_2 > 0 then
                v3 = a3
            end
            v2.cframe = v3
            local Position = false
            if a1_2 == 0 then
                Position = a3.Position
            end
            v2.position = Position
            v2.tweenInfo = TweenInfo.new(0.25)
            v2.lifeTime = a4
            create(v1, v2)
            a1:Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
        FireProjectile = function(a1_2) -- Line: 159
            -- upvalues: ReplicatedStorage (upval), spr (upval), a1 (val), ItemDrop (upval), EmitterManager (upval)
            -- upvalues: Shaker (upval), HumanoidRootPart (val)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.Fireball:Clone()
            u9:ScaleTo(0.1)
            spr.target(u9, 1, 0.75, {Scale = 1})
            u9.Parent = workspace.CurrentCamera
            a1_2.start = a1.Model.FireAttachment.Value.WorldPosition
            ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u9, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 175
                return CFrame.Angles(-a1 * 2, 0, 0)
            end)):andThen(function() -- Line: 178
                -- upvalues: u9 (val), ReplicatedStorage (upval), a1_2 (val), EmitterManager (upval), Shaker (upval)
                -- upvalues: HumanoidRootPart (upval), a1 (upval)
                u9:Destroy()
                local v1 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.FireballExplosion:Clone()
                v1:PivotTo((CFrame.new(a1_2.goal)))
                v1:ScaleTo(a1_2.radius)
                v1.Parent = workspace.CurrentCamera
                EmitterManager.manualEmit(v1)
                Shaker:Shake({1, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = HumanoidRootPart.Position})
                a1:Wait(3)
                v1:Destroy()
            end)
        end,
    }
    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 203 -- upvalues: HumanoidRootPart (val), a1 (val), Tamer (val) -- types: a1_2: number
        local Position = HumanoidRootPart.Position
        local Scalar = a1.Path:GetScalar(a1.PathDistance + 7)
        Tamer:PivotTo((CFrame.lookAt(Scalar, (Vector3.new(Position.X, Scalar.Y, Position.Z)))))
    end)))
end

function v1._loadAnimations(a1, a2, a3, a4) -- Line: 212
    -- upvalues: Animation (val)
    local Attribute, Name, v1
    for i, v in ipairs(a2:GetChildren()) do
        Name = v.Name
        v1 = Animation.new({Target = a3, Track = v, IgnorePriority = Name == "Idle"})
        v2[Name] = v1
        Attribute = v:GetAttribute("Speed")
        if Attribute then
            v1:AdjustSpeed(Attribute)
        end
    end
end

function v1:_walk(a2) -- Line: 233 -- upvalues: TweenService (val) -- types: self: table, a2: boolean
    if a2 then
        self._walkTrackConn = (self._monsterAnimations.Walk:Play(0.5):GetMarkerReachedSignal("Effect")):Connect(function(a1) -- Line: 252 -- upvalues: self (val) -- types: a1: string
            if self._animationEvents[a1] then
                self._animationEvents[a1]()
            end
        end)
        self._tamerAnimations.Walk:Play(0.5)
        self.Model.Tamer.Particles.Dirt.Enabled = true
        self.Model.Tamer.Particles.Dust.Enabled = true
        TweenService:Create(self._idleSound, TweenInfo.new(0.5), {Volume = 1}):Play()
        return
    end
    if self._walkTrackConn then
        self._walkTrackConn:Disconnect()
        self._walkTrackConn = nil
    end
    self._monsterAnimations.Walk:Stop(0.5)
    self._tamerAnimations.Walk:Stop(0.5)
    self.Model.Tamer.Particles.Dirt.Enabled = false
    self.Model.Tamer.Particles.Dust.Enabled = false
    TweenService:Create(self._idleSound, TweenInfo.new(0.5), {Volume = 0}):Play()
end

return v1