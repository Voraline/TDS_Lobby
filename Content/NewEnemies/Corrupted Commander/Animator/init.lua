-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Commander.Animator
-- Decompile time: 1.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local u25 = {Stomp = {Volume = 0.5}}
local u27 = {
    Shoot = 93704949210035,
    SummonAPCs = 137078319439767,
    CallToWar = 74891254412445,
    Death = 118799382693649,
    Stomp = 17284713381,
}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 24
    -- upvalues: StateManager (val), u27 (val), EasySound (val), u25 (val), Animation (val)
    local Create, v1, v2, v3
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.stateManager = StateManager.new()
    a1.animations = {}
    a1.sounds = {}
    local v4 = nil
    local v5 = nil
    for i, j in u27, v4, v5 do
        Create = EasySound.Create
        v3 = {volume = 2.8, id = j, name = i, parent = a1.Model.PrimaryPart}
        v1 = true
        if i ~= "Walk" then
            v1 = string.match(i, "Loop$")
        end
        v3.looped = v1
        v2 = Create(v3)
        if u25[i] then
            for k, n in u25[i] do
                v2[k] = n
            end
        end
        a1.sounds[i] = v2
    end
    for m, i5 in (Animations:GetChildren()) do
        v2 = Animation.new({IgnorePriority = true, Preload = true, Track = i5, Target = AnimationController})
        a1.animations[i5.Name] = v2
    end
    task.defer(function() -- Line: 59 -- upvalues: a1 (val)
        (a1.WalkTrack:GetMarkerReachedSignal("Thump")):Connect(function() -- Line: 60 -- upvalues: a1 (upval)
            a1:CameraShakeFromEnemy(2)
            a1.sounds.Stomp:Play()
        end)
    end)
    a1.Maid:Mark(a1.stateManager)
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 69 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
    }
    a1.stateManager:addStates((require(script:WaitForChild("CorruptedCommanderAnimatorStates"))))
    a1.stateManager:changeState("Walk", a1)
end

function v1.animate(a1, a2, a3) -- Line: 79 -- types: a1: table, a2: string, a3: number?
    local v1 = a1.animations[a2]
    if v1 then
        v1:Play(a3 or 0.2, 1, 1)
    end
    return v1.Controller
end

function v1.playSound(a1, a2) -- Line: 88 -- types: a1: table, a2: string
    local v1 = a1.sounds[a2]
    if v1 then
        v1:Play()
    end
end

function v1:CameraShakeFromEnemy(a2) -- Line: 95 -- upvalues: Shaker (val) -- types: self: table, a2: number
    Shaker:Shake({a2, 10, 0.1, 1}, 0.1, 0.25, {radius = 30, position = self.Model.PrimaryPart.Position})
end

return v1