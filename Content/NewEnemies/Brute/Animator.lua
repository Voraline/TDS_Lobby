-- Script path: ReplicatedStorage.Content.NewEnemies.Brute.Animator
-- Decompile time: 4.87 ms

local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u70 = Random.new()

local function createAreaIndicator(a1, a2, a3) -- Line: 35
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u7 = HttpService:GenerateGUID(false)
    AreaIndicatorStore.create(u7, {
        type = "full",
        initialAngle = 360,
        desiredAngle = 360,
        radius = a2,
        color3 = Color3.fromRGB(255, 0, 64),
        position = a1,
        tweenInfo = TweenInfo.new(0.25),
        lifeTime = a3,
    })
    TimescaleUtilities.Delay(a3 + 1, function() -- Line: 47 -- upvalues: AreaIndicatorStore (upval), u7 (val)
        AreaIndicatorStore.remove(u7)
    end)
end

function v1.Initialize(a1) -- Line: 52
    -- upvalues: Animation (val), Shaker (val), EasySound (val), u70 (val), GameState (val), TimescaleUtilities (val)
    -- upvalues: createAreaIndicator (val), EffectsController (val)
    local v1
    local PrimaryPart = a1.Model.PrimaryPart
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        v1 = Animation.new({Track = v, Target = AnimationController})
        a1._animations[v.Name] = v1
    end
    task.defer(function() -- Line: 66 -- upvalues: a1 (val), Shaker (upval), PrimaryPart (val), EasySound (upval), u70 (upval)
        (a1.WalkTrack:GetMarkerReachedSignal("Step")):Connect(function() -- Line: 68 -- upvalues: Shaker (upval), PrimaryPart (upval), EasySound (upval), u70 (upval)
            Shaker:Shake({0.2, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = PrimaryPart.Position})
            EasySound.Play({
                id = 139317505417353,
                volume = 0.25,
                soundGroupName = "Enemy",
                destroyOnEnd = true,
                playbackSpeed = u70:NextNumber(1.5, 2),
                parent = PrimaryPart,
            })
        end)
    end)
    ;(a1.Replicator:GetStateChangedSignal("Stopped")):Connect(function(a1_2) -- Line: 84 -- upvalues: a1 (val), GameState (upval) -- types: a1_2: boolean
        if a1_2 then
            a1.WalkTrack:Stop()
            return
        end
        a1.WalkTrack:Play()
        a1:AdjustWalkSpeed(GameState.TimeScale)
    end)
    a1.Executables = {
        AreaIndicator = function(a1) -- Line: 94 -- upvalues: TimescaleUtilities (upval), createAreaIndicator (upval) -- types: a1: table
            local v1
            for i, v in ipairs(a1) do
                v1 = v.delay or 0
                TimescaleUtilities.Delay(v1, function() -- Line: 97 -- upvalues: createAreaIndicator (upval), v (val)
                    createAreaIndicator(v.position, v.radius, v.openTime)
                end)
            end
        end,
        Rocks = function(a1_2) -- Line: 102 -- upvalues: TimescaleUtilities (upval), a1 (val)
            local v1
            for i, v in ipairs(a1_2) do
                v1 = v.delay or 0
                TimescaleUtilities.Delay(v1, function() -- Line: 105 -- upvalues: a1 (upval), v (val)
                    a1:_projectile(v)
                end)
            end
        end,
        Smash = function(a1_2, a2, a3) -- Line: 110
            -- upvalues: a1 (val), EasySound (upval), TimescaleUtilities (upval), EffectsController (upval)
            -- upvalues: Shaker (upval)
            a1._animations.Smash:Play()
            a1:_face(a1_2)
            EasySound.Play({
                id = 128565483867337,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Wait(a3)
            EffectsController.GroundSmash(CFrame.new(a1_2), a2 * 8)
            Shaker:Shake({1.5, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = a1_2})
        end,
        Throw = function(a1_2, a2) -- Line: 126 -- upvalues: a1 (val), EasySound (upval), PrimaryPart (val)
            a1:_face(a1_2)
            a1._animations.Throw:Play(0)
            a1.Model.Rock.Transparency = 0
            EasySound.Play({
                id = 104745489790264,
                destroyOnEnd = true,
                playbackSpeed = 0.75,
                soundGroupName = "Enemies",
                parent = PrimaryPart,
            })
            a1:Wait(a2.delay)
            a1:_projectile(a2)
        end,
        Death = function() -- Line: 140 -- upvalues: a1 (val), EasySound (upval)
            a1.WalkTrack:Stop()
            a1._animations.Death:Play()
            EasySound.Play({
                id = 96313381301741,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
        end,
    }
end

function v1:_face(a2, a3) -- Line: 153 -- upvalues: TweenService (val) -- types: self: table, a2: vector, a3: number
    local PrimaryPart = self.Model.PrimaryPart
    local u13 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    local v1 = TweenService:Create(PrimaryPart, TweenInfo.new(a3 or 0.5), {CFrame = u13})
    v1.Completed:Connect(function() -- Line: 162 -- upvalues: self (val), u13 (val)
        self.Rotation = CFrame.new() * u13.Rotation
    end)
    v1:Play()
    return u13
end

function v1:_projectile(a2) -- Line: 170
    -- upvalues: EasySound (val), ItemDrop (val), EmitterManager (val), Debris (val), u70 (val), TweenService (val)
    -- upvalues: TimescaleUtilities (val), Shaker (val)
    local u6 = self.Model.Rock:Clone()
    u6.Anchored = true
    u6.Transparency = 0
    u6.Trail.Enabled = true
    u6.Parent = workspace.CurrentCamera
    if a2.scale then
        u6.Size = u6.Size * a2.scale
    end
    if not a2.shard then
        self.Model.Rock.Transparency = 1
    end
    local u25 = a2.rotX or 0
    local u27 = a2.rotY or 0
    local PrimaryPart = self.Model.PrimaryPart
    EasySound.Play({id = 104745489790264, destroyOnEnd = true, soundGroupName = "Enemies", parent = PrimaryPart})
    local u45 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.goal.X, PrimaryPart.Position.Y, a2.goal.Z)))
    ;(ItemDrop.Drop(a2.start, a2.goal, u6, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 205 -- upvalues: u45 (val), u25 (val), u27 (val)
        return u45.Rotation * CFrame.Angles(math.rad(u25) * a1, math.rad(u27) * a1, 0)
    end)):andThen(function() -- Line: 209
        -- upvalues: u6 (val), EmitterManager (upval), Debris (upval), a2 (val), EasySound (upval), u70 (upval)
        -- upvalues: TweenService (upval), TimescaleUtilities (upval), Shaker (upval)
        local Attachment = u6:WaitForChild("Attachment")
        Attachment.Parent = workspace.Terrain
        Attachment.WorldPosition = u6.Position
        EmitterManager.manualEmit(Attachment)
        Debris:AddItem(Attachment, 3)
        local v1 = if not a2.shard then 120959631780770 else 139317505417353
        EasySound.Play({
            soundGroupName = "Enemies",
            destroyOnEnd = true,
            id = v1,
            playbackSpeed = u70:NextNumber(0.8, 1.2),
            parent = Attachment,
        })
        if not a2.shard then
            u6:Destroy()
            Shaker:Shake({0.75, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = a2.goal})
            return
        end
        TweenService:Create(u6, TweenInfo.new(5), {Transparency = 1}):Play()
        TimescaleUtilities.CleanUp(u6, 5)
        Shaker:Shake({0.5, 5, 0, 1.5}, 0.5, 1, {radius = 100, position = a2.goal})
    end)
end

return v1