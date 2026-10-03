-- Script path: ReplicatedStorage.Content.NewEnemies.Champion Templar.Animator
-- Decompile time: 2.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ChampionTemplarSounds = require(script.ChampionTemplarSounds)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 18
    -- upvalues: StateManager (val), Animation (val), ChampionTemplarSounds (val), EasySound (val)
    local v1
    local Animations = a1.Model.Animations
    a1.isDead = false
    a1.animations = {}
    a1.sounds = {}
    a1.stateManager = StateManager.new()
    a1.stateManager:addStates((require(script:WaitForChild("ChampionTemplarAnimationStates"))))
    for i, j in Animations:GetDescendants() do
        if j:IsA("Animation") then
            v1 = Animation.new({
                IgnorePriority = true,
                Preload = true,
                Track = j,
                Target = a1.Model.AnimationController.Animator,
                ShouldStopAtEnd = j.Name:lower():find("death"),
            })
            a1.animations[j.Name] = v1
        end
    end
    for k, n in ChampionTemplarSounds do
        v1 = EasySound.Create({
            volume = 0.5,
            soundGroupName = "EnemyDeath",
            name = k,
            id = n,
            parent = a1.Model.PrimaryPart,
            looped = k:lower():find("loop"),
        })
        a1.sounds[k] = v1
    end
    local Configuration = a1.Model:WaitForChild("Configuration")
    a1.vfx = {
        hammerFront = Configuration.VFXFront.Value,
        hammerBack1 = Configuration.VFXBack1.Value,
        hammerBack2 = Configuration.VFXBack2.Value,
        minigunShoot = Configuration.VFXShoot.Value,
    }
    ;(a1.animations.HammerWalk.Controller:GetMarkerReachedSignal("Step")):Connect(function() -- Line: 63 -- upvalues: a1 (val)
        a1.sounds.Step:Play()
    end)
    ;(a1.animations.MinigunWalk.Controller:GetMarkerReachedSignal("Step")):Connect(function() -- Line: 68 -- upvalues: a1 (val)
        a1.sounds.Step:Play()
    end)
    a1:hammerEffects(false)
    if a1.Replicator:Get("CurrentWeapon") ~= "Hammer" then
        a1:setWeaponTransparency("Hammer", 1)
        a1:setWeaponTransparency("Minigun", 0)
        a1.stateManager:changeState("MinigunWalk", a1)
    else
        a1:setWeaponTransparency("Hammer", 0)
        a1:setWeaponTransparency("Minigun", 1)
        a1.stateManager:changeState("HammerWalk", a1)
    end
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 86 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
    }
end

function v1:hammerEffects(a2) -- Line: 94 -- upvalues: EmitterManager (val) -- types: self: table, a2: boolean
    if self.vfx.hammerFront then
        EmitterManager.toggle(self.vfx.hammerFront, a2)
    end
    if self.vfx.hammerBack1 then
        EmitterManager.toggle(self.vfx.hammerBack1, a2)
    end
    if self.vfx.hammerBack2 then
        EmitterManager.toggle(self.vfx.hammerBack2, a2)
    end
end

function v1.stopAllAnimations(a1) -- Line: 106
    for i, j in a1.animations do
        j:Stop()
    end
end

function v1:setWeaponTransparency(a2, a3) -- Line: 112 -- types: self: table, a2: string, a3: number
    if a2 == "Minigun" then
        self.Model.MINIGUN.Transparency = a3
        return
    end
    if a2 == "Hammer" then
        self.Model.HAMMER.Transparency = a3
    end
end

function v1.getCurrentWeapon(a1) -- Line: 120
    return a1.Replicator:Get("CurrentWeapon")
end

return v1