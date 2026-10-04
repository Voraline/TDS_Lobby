-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Jester.Animator
-- Decompile time: 2.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function emitParticles(a1) -- Line: 13 -- types: a1: userdata
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

function v1.Initialize(a1) -- Line: 24
    -- upvalues: StateManager (val), Animation (val), TweenService (val), ItemDrop (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._effects = {
        HideBox = function() -- Line: 39 -- upvalues: a1 (val)
            a1.Model.Handle.Transparency = 1
            a1.Model.Handle.Lid.Transparency = 1
        end,
        ShowBox = function() -- Line: 43 -- upvalues: a1 (val)
            a1.Model.Handle.Transparency = 0
            a1.Model.Handle.Lid.Transparency = 0
        end,
    }

    function a1:_face(a2) -- Line: 49 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
        return v1
    end

    function a1._trackAnimationEvents(a1, a2) -- Line: 66 -- types: a1: table, a2: userdata
        local u11 = (a2:GetMarkerReachedSignal("Effect")):Connect(function(a1_2) -- Line: 68 -- upvalues: a1 (val) -- types: a1_2: string
            local v1 = a1._effects[a1_2]
            if v1 then
                v1()
            end
        end)
        a2.Ended:Connect(function() -- Line: 74 -- upvalues: u11 (ref)
            u11:Disconnect()
        end)
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 82 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "ThrowBox",
            onEnter = function(a1_2) -- Line: 88 -- upvalues: a1 (val) -- types: a1_2: vector
                local v1 = a1:_face(a1_2)
                a1.Rotation = CFrame.new() * v1.Rotation
                a1:_trackAnimationEvents((a1._animations.Throw:Play()))
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 98 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 105 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        Projectile = function(a1_2) -- Line: 108 -- upvalues: a1 (val), ItemDrop (upval)
            local u6 = a1.Model.Handle:Clone()
            u6.Parent = workspace.Trash
            u6.Transparency = 0
            u6.Lid.Transparency = 0
            u6.Anchored = true
            u6.CanCollide = false
            ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u6, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 123
                return ((CFrame.lookAt(a2, a3)) * CFrame.Angles(a1, 0, 0)).Rotation
            end)):andThen(function() -- Line: 127 -- upvalues: u6 (val)
                u6:Destroy()
            end)
        end,
        Explosion = function(a1, a2) -- Line: 131 -- upvalues: EmitterManager (upval) -- types: a1: vector, a2: number
            EmitterManager.Emit("ConfuseExplosion", CFrame.new(a1), a2)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1