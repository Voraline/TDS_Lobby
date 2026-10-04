-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Necromancer.Animator
-- Decompile time: 2.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function emitParticles(a1) -- Line: 12 -- types: a1: userdata
    local Attribute
    for i, v in ipairs(a1:GetChildren()) do
        if v:IsA("ParticleEmitter") then
            Attribute = v:GetAttribute("EmitCount")
            if Attribute then
                v:Emit(Attribute)
            end
        end
    end
end

function v1.Initialize(a1) -- Line: 23
    -- upvalues: StateManager (val), Animation (val), TweenService (val), TimescaleUtilities (val), emitParticles (val)
    -- upvalues: ItemDrop (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end

    function a1:_face(a2) -- Line: 37 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            CFrame = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z))),
        }):Play()
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 54 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "Summoning",
            onEnter = function() -- Line: 60 -- upvalues: a1 (val), TimescaleUtilities (upval), emitParticles (upval)
                a1._animations.Summon:Play()
                TimescaleUtilities.Wait(0.8)
                emitParticles(a1.Model.HumanoidRootPart.SpawnEffect)
            end,
        },
        {
            name = "Attacking",
            onEnter = function(a1_2) -- Line: 68 -- upvalues: a1 (val)
                a1._animations.SpellThrow:Play()
                a1:_face(a1_2)
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 75 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        StateChanged = function(a1_2, ...) -- Line: 82 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        Projectile = function(a1) -- Line: 85 -- upvalues: ItemDrop (upval), TimescaleUtilities (upval)
            local Part = Instance.new("Part")
            Part.Size = Vector3.new(0.5, 0.5, 0.5)
            Part.Anchored = true
            Part.CanCollide = false
            Part.Color = Color3.fromRGB(255, 0, 0)
            Part.Transparency = 0.5
            Part.Parent = workspace.Trash
            ;(ItemDrop.Drop(a1.start, a1.goal, Part, a1.dtMultiplier, a1.gravity, a1.velocity, function(a1, a2, a3) -- Line: 101
                return CFrame.lookAt(a3, a2).Rotation
            end)):andThen(function() -- Line: 104 -- upvalues: Part (val), a1 (val), TimescaleUtilities (upval)
                Part:Destroy()
                local Part_2 = Instance.new("Part")
                Part_2.Size = Vector3.new(a1.radius * 2, a1.radius * 2, a1.radius * 2)
                Part_2.Anchored = true
                Part_2.CanCollide = false
                Part_2.Color = Color3.fromRGB(255, 0, 0)
                Part_2.Transparency = 0.9
                Part_2.Position = a1.goal
                Part_2.Shape = Enum.PartType.Ball
                Part_2.Parent = workspace.Trash
                TimescaleUtilities.CleanUp(Part_2, a1.duration)
            end)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1