-- Script path: ReplicatedStorage.Content.NewEnemies.Security.Animator
-- Decompile time: 2.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1:_face(a2, a3) -- Line: 11 -- types: self: table, a3: vector
    local Position = self.Model.PrimaryPart.Position
    local v1 = CFrame.new(Position, (Vector3.new(a3.X, Position.Y, a3.Z)))
    self.Model.PrimaryPart.CFrame = v1
end

function v1:_setAnimations() -- Line: 18 -- upvalues: Animation (val)
    self._currentAnimations = {}
    for i, j in self.Model.Animations:GetChildren() do
        if j:IsA("Animation") and j.Name ~= "Walk" then
            self._currentAnimations[j.Name] = (Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Preload = true,
                Track = j,
                Target = self.Model.AnimationController.Animator,
            }))
        end
    end
end

function v1:_playAnimation(a2, ...) -- Line: 34 -- types: self: table, a2: string
    if self._currentAnimations[a2] then
        self._currentAnimations[a2]:Play(...)
    end
end

function v1.Initialize(a1) -- Line: 40 -- upvalues: StateManager (val), Cooldown (val), EasySound (val), ItemDrop (val)
    a1._stateManager = StateManager.new()
    a1._cooldown = Cooldown.new(0)
    a1._currentTarget = nil
    a1:_setAnimations()
    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 49 -- upvalues: a1 (val)
                for k, v in pairs(a1._currentAnimations) do
                    v:Stop(0)
                end
            end,
        },
        {
            name = "ThrowStart",
            onEnter = function(a1_2) -- Line: 57 -- upvalues: a1 (val)
                a1._currentTarget = a1_2
            end,
            onUpdate = function(a1_2) -- Line: 60 -- upvalues: a1 (val)
                if not a1._currentTarget then
                    return
                end
                a1:_face(a1_2, a1._currentTarget.PrimaryPart.Position)
            end,
        },
        {
            name = "Throw",
            onEnter = function(a1_2) -- Line: 69 -- upvalues: a1 (val), EasySound (upval), ItemDrop (upval)
                a1:_playAnimation("Throw", 0)
                EasySound.Play({
                    id = 139422531104305,
                    audioGroup = "Enemies",
                    timeScaled = true,
                    destroyOnEnd = true,
                    volume = 0.2,
                    parent = a1.Model.PrimaryPart,
                })
                local v1 = {startPosition = a1.Model.Orb.Position}
                v1.endPosition = a1_2.PrimaryPart.Position - Vector3.new(0, a1_2:GetExtentsSize().Y / 2, 0)
                for i, j in a1.Stats.ProjectileData do
                    v1[i] = j
                end
                local u92 = a1.Model.Orb:Clone()
                u92.Transparency = 0
                u92.Anchored = true
                for k, n in u92:GetDescendants() do
                    if n:IsA("ParticleEmitter") or n:IsA("Trail") then
                        n.Enabled = true
                    end
                end
                ;(ItemDrop.Drop(v1.startPosition, v1.endPosition, u92, v1.dtMultiplier, v1.gravity, v1.velocity, function(a1, a2, a3) -- Line: 110
                    return CFrame.new(a3, a2).Rotation
                end)):andThen(function() -- Line: 116 -- upvalues: u92 (val)
                    u92:Destroy()
                end)
                u92.Parent = workspace
            end,
        },
    })
    a1._stateManager:changeState("Walking")
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 128 -- upvalues: a1 (val)
            a1._stateManager:changeState(a1_2, ...)
        end,
        Death = function() -- Line: 131 -- upvalues: a1 (val)
            a1:_playAnimation("Death")
        end,
    }
    a1:BindToStep("StateUpdate", function(a1_2) -- Line: 136 -- upvalues: a1 (val)
        a1._stateManager:step(a1_2)
    end)
    a1.Maid:Mark(a1._stateManager)
end

return v1