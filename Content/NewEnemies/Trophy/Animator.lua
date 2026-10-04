-- Script path: ReplicatedStorage.Content.NewEnemies.Trophy.Animator
-- Decompile time: 5.15 ms

local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Trophy = ReplicatedStorage.Assets.Effects.Mob.Trophy
local v1 = {}
v1.__index = v1
local u68 = Random.new()

local function createAreaIndicator(a1, a2, a3) -- Line: 36
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
    TimescaleUtilities.Delay(a3 + 1, function() -- Line: 48 -- upvalues: AreaIndicatorStore (upval), u7 (val)
        AreaIndicatorStore.remove(u7)
    end)
end

function v1.Initialize(a1) -- Line: 53
    -- upvalues: Animation (val), Shaker (val), EasySound (val), u68 (val), GameState (val), TimescaleUtilities (val)
    -- upvalues: createAreaIndicator (val), Trophy (val), EmitterManager (val), Debris (val)
    local v1
    local PrimaryPart = a1.Model.PrimaryPart
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        v1 = Animation.new({Track = v, Target = AnimationController, Properties = {Looped = v.Name == "Walk"}})
        a1._animations[v.Name] = v1
    end
    task.defer(function() -- Line: 70 -- upvalues: a1 (val), Shaker (upval), PrimaryPart (val), EasySound (upval), u68 (upval)
        (a1.WalkTrack:GetMarkerReachedSignal("Step")):Connect(function() -- Line: 72 -- upvalues: Shaker (upval), PrimaryPart (upval), EasySound (upval), u68 (upval)
            Shaker:Shake({0.2, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = PrimaryPart.Position})
            EasySound.Play({
                id = 139317505417353,
                volume = 0.25,
                soundGroupName = "Enemy",
                destroyOnEnd = true,
                playbackSpeed = u68:NextNumber(1.5, 2),
                parent = PrimaryPart,
            })
        end)
    end)
    ;(a1.Replicator:GetStateChangedSignal("Stopped")):Connect(function(a1_2) -- Line: 88 -- upvalues: a1 (val), GameState (upval) -- types: a1_2: boolean
        if a1_2 then
            a1.WalkTrack:Stop()
            return
        end
        a1.WalkTrack:Play()
        a1:AdjustWalkSpeed(GameState.TimeScale)
    end)
    a1.Executables = {
        AreaIndicator = function(a1) -- Line: 98 -- upvalues: TimescaleUtilities (upval), createAreaIndicator (upval) -- types: a1: table
            local v1
            for i, v in ipairs(a1) do
                v1 = v.delay or 0
                TimescaleUtilities.Delay(v1, function() -- Line: 101 -- upvalues: createAreaIndicator (upval), v (val)
                    createAreaIndicator(v.position, v.radius, v.openTime)
                end)
            end
        end,
        Rocks = function(a1_2) -- Line: 106 -- upvalues: TimescaleUtilities (upval), a1 (val)
            local v1
            for i, v in ipairs(a1_2) do
                v1 = v.delay or 0
                TimescaleUtilities.Delay(v1, function() -- Line: 109 -- upvalues: a1 (upval), v (val)
                    a1:_projectile(v)
                end)
            end
        end,
        Smash = function(a1_2, a2, a3) -- Line: 114
            -- upvalues: a1 (val), EasySound (upval), TimescaleUtilities (upval), Trophy (upval), EmitterManager (upval)
            -- upvalues: Debris (upval), Shaker (upval)
            a1._animations.Smash:Play()
            a1:_face(a1_2)
            EasySound.Play({
                id = 128565483867337,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Wait(a3)
            local v1 = Trophy.Smash:Clone()
            v1.Size = Vector3.new(4, v1.Size.Y, 4)
            v1.CFrame = CFrame.new(a1_2)
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
            Debris:AddItem(v1, 3)
            Shaker:Shake({1.5, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = a1_2})
        end,
        Throw = function(a1_2, a2) -- Line: 135 -- upvalues: a1 (val), EasySound (upval), PrimaryPart (val)
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
        Death = function() -- Line: 149 -- upvalues: a1 (val), EasySound (upval)
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

function v1:_face(a2, a3) -- Line: 162 -- upvalues: TweenService (val) -- types: self: table, a2: vector, a3: number
    local PrimaryPart = self.Model.PrimaryPart
    local u13 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    local v1 = TweenService:Create(PrimaryPart, TweenInfo.new(a3 or 0.5), {CFrame = u13})
    v1.Completed:Connect(function() -- Line: 171 -- upvalues: self (val), u13 (val)
        self.Rotation = CFrame.new() * u13.Rotation
    end)
    v1:Play()
    return u13
end

function v1:_projectile(a2) -- Line: 179
    -- upvalues: EmitterManager (val), EasySound (val), ItemDrop (val), Trophy (val), TimescaleUtilities (val)
    -- upvalues: u68 (val), TweenService (val), Shaker (val)
    local u6 = self.Model.Rock:Clone()
    u6.Anchored = true
    u6.Transparency = 0
    EmitterManager.toggle(u6, true)
    u6.Parent = workspace.CurrentCamera
    if a2.scale then
        u6.Size = u6.Size * a2.scale
    end
    if not a2.shard then
        self.Model.Rock.Transparency = 1
    end
    local u28 = a2.rotX or 0
    local u30 = a2.rotY or 0
    local PrimaryPart = self.Model.PrimaryPart
    EasySound.Play({id = 104745489790264, destroyOnEnd = true, soundGroupName = "Enemies", parent = PrimaryPart})
    local u48 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.goal.X, PrimaryPart.Position.Y, a2.goal.Z)))
    ;(ItemDrop.Drop(a2.start, a2.goal, u6, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 214 -- upvalues: u48 (val), u28 (val), u30 (val)
        return u48.Rotation * CFrame.Angles(math.rad(u28) * a1, math.rad(u30) * a1, 0)
    end)):andThen(function() -- Line: 218
        -- upvalues: a2 (val), Trophy (upval), EmitterManager (upval), TimescaleUtilities (upval), EasySound (upval)
        -- upvalues: u68 (upval), TweenService (upval), u6 (val), Shaker (upval)
        local v1 = (a2.shard and Trophy.Rocks or Trophy.Throw):Clone()
        v1.Size = Vector3.new(4, v1.Size.Y, 4)
        v1.CFrame = CFrame.new(a2.goal)
        v1.Parent = workspace.Trash
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 3)
        local v2 = if not a2.shard then 120959631780770 else 139317505417353
        EasySound.Play({
            soundGroupName = "Enemies",
            destroyOnEnd = true,
            id = v2,
            playbackSpeed = u68:NextNumber(0.8, 1.2),
            parent = v1,
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