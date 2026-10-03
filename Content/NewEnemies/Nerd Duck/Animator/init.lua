-- Script path: ReplicatedStorage.Content.NewEnemies.Nerd Duck.Animator
-- Decompile time: 2.89 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u45 = ReplicatedStorage.Assets.Effects.Mob["Nerd Duck"]
local v1 = {}
v1.__index = v1
local u47 = {
    HopIntro = 108581975852102,
    HopOutro = 112569240137321,
    StampedeLoop = 111636083525872,
    StampedeIntro = 82381585897393,
    StampedeOutro = 108980494218765,
    NerdRage = 87446449966442,
    Discharge = 78542712493501,
    CancelDischarge = 120384337261313,
    Death = 128905867258280,
    BlastAttack = 115282267758251,
    RepositionIntro = 76305525488821,
    RepositionLoop = 117906386644914,
    RepositionOutro = 96148388400236,
    StunAttack = 133758821839826,
    CancelStunOutro = 76386316164972,
    CancelStunIntro = 134354349270659,
    CancelStunLoop = 114329231822348,
    Explosion = 102372973056415,
    Stomp1 = 122951957455284,
    Stomp2 = 101303542279242,
}

function v1.Initialize(a1) -- Line: 49
    -- upvalues: StateManager (val), Animation (val), u47 (val), EasySound (val), EmitterManager (val), u45 (val)
    -- upvalues: TimescaleUtilities (val)
    local Create, v1, v2, v3
    local Animations = a1.Model.Animations
    a1.stateManager = StateManager.new()
    a1.stateManager:addStates((require(script:WaitForChild("NerdDuckAnimatorStates"))))
    a1.animations = {}
    a1.sounds = {}
    task.defer(function() -- Line: 60 -- upvalues: a1 (val)
        (a1.WalkTrack:GetMarkerReachedSignal("Stomp")):Connect(function() -- Line: 61 -- upvalues: a1 (upval)
            local v1 = a1.sounds["Stomp" .. math.random(1, 2)]
            if v1 then
                v1:Play()
            end
        end)
    end)
    for i, j in Animations:GetChildren() do
        v2 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = j,
            Target = a1.Model.AnimationController.Animator,
        })
        a1.animations[j.Name] = v2
    end
    local v4 = nil
    local v5 = nil
    for k, n in u47, v4, v5 do
        Create = EasySound.Create
        v3 = {volume = 0.5, id = n, name = k, parent = a1.Model.PrimaryPart}
        v1 = true
        if k ~= "Drive" then
            v1 = string.match(k, "Loop$")
        end
        v3.looped = v1
        v2 = Create(v3)
        a1.sounds[k] = v2
    end
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 91 -- upvalues: a1 (val) -- types: a1_2: string
            warn("changing state", a1_2)
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
        StunEffect = function() -- Line: 95 -- upvalues: a1 (val), EmitterManager (upval)
            a1.sounds.CancelStunLoop:Play()
            a1.sounds.Explosion:Play()
            EmitterManager.Emit("ShockDuckyExplosion", CFrame.new(a1.Model.PrimaryPart.Position), 25)
        end,
        PathChange = function(a1_2, a2) -- Line: 105 -- upvalues: a1 (val)
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
        MegaSpawn = function(a1) -- Line: 111 -- upvalues: u45 (upval), EmitterManager (upval), TimescaleUtilities (upval)
            local v1 = u45.DuckyDecoySpawn:Clone()
            v1.Parent = workspace
            v1.Position = a1
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 5)
        end,
        SpawnEffect = function(a1) -- Line: 118 -- upvalues: u45 (upval), EmitterManager (upval), TimescaleUtilities (upval)
            local v1 = u45.SpawnVFX:Clone()
            v1.Parent = workspace
            v1.Position = a1
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 5)
        end,
    }
end

function v1.CreateAreaIndicator(a1, a2) -- Line: 128
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u6 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2.angle < 360) then "full" else "normal", radius = a2.radius}
    local v2 = false
    if a2.angle < 360 then
        v2 = 0
    end
    v1.initialAngle = v2
    local angle = false
    if a2.angle < 360 then
        angle = a2.angle
    end
    v1.desiredAngle = angle
    v1.color3 = Color3.fromRGB(255, 0, 64)
    local cframe = false
    if a2.angle < 360 then
        cframe = a2.cframe
    end
    v1.cframe = cframe
    local Position = false
    if a2.angle == 360 then
        Position = a2.cframe.Position
    end
    v1.position = Position
    v1.tweenInfo = TweenInfo.new(0.25)
    v1.lifeTime = a2.openTime
    create(u6, v1)
    TimescaleUtilities.Delay(a2.openTime + 1, function() -- Line: 141 -- upvalues: AreaIndicatorStore (upval), u6 (val)
        AreaIndicatorStore.remove(u6)
    end)
    return u6
end

return v1