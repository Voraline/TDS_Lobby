-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Honor Guard.Animator
-- Decompile time: 5.57 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local FallenBlood = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("FallenBlood")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 23
    -- upvalues: StateManager (val), Animation (val), Shaker (val), EasySound (val), FallenBlood (val)
    -- upvalues: TweenService (val), TimescaleUtilities (val), EffectsController (val), EmitterManager (val)
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._effects = {
        EnableTrail = function() -- Line: 38 -- upvalues: a1 (val)
            a1.Model["Left Chainspike"].Trail.Enabled = true
            a1.Model["Right Chainspike"].Trail.Enabled = true
        end,
        DisableTrail = function() -- Line: 42 -- upvalues: a1 (val)
            a1.Model["Left Chainspike"].Trail.Enabled = false
            a1.Model["Right Chainspike"].Trail.Enabled = false
        end,
        Step = function() -- Line: 46 -- upvalues: Shaker (upval), a1 (val), EasySound (upval)
            Shaker:Shake({0.25, 5, 0, 1.5}, 0.5, 1, {radius = 100, position = a1.Model.PrimaryPart.Position})
            local Step = a1.Model.HumanoidRootPart.Step
            EasySound.Play({
                volume = 1,
                soundGroupName = "Enemies",
                id = Step.SoundId,
                playbackSpeed = Step.PlaybackSpeed + (math.pow(-1, (math.random(0, 1)))) * math.random(0, 10) / 100,
                position = a1.Model.HumanoidRootPart.Position,
            })
        end,
        Puddle = function(a1, a2) -- Line: 62
            -- upvalues: FallenBlood (upval), TweenService (upval), TimescaleUtilities (upval)
            local u14 = FallenBlood[math.random(1, #FallenBlood:GetChildren())]:Clone()
            u14.CFrame = (CFrame.new(a1 + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0)
            u14.Parent = workspace.Terrain
            local Size = u14.Size
            u14.Size = Vector3.new(0, 0, 0)
            TweenService:Create(u14, TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = Size}):Play()
            TimescaleUtilities.Delay(a2, function() -- Line: 78 -- upvalues: TweenService (upval), u14 (val), Size (val)
                local v1 = TweenService:Create(u14, TweenInfo.new(1), {Transparency = 1, Size = Size * 0.5})
                v1:Play()
                v1.Completed:Connect(function() -- Line: 85 -- upvalues: u14 (upval)
                    u14:Destroy()
                end)
            end)
        end,
    }

    function a1:_face(a2) -- Line: 92 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
        return v1
    end

    function a1._trackAnimationEvents(a1, a2) -- Line: 109 -- types: a1: table, a2: userdata
        local u11 = (a2:GetMarkerReachedSignal("Effect")):Connect(function(a1_2) -- Line: 111 -- upvalues: a1 (val) -- types: a1_2: string
            local v1 = a1._effects[a1_2]
            if v1 then
                v1()
            end
        end)
        a2.Ended:Connect(function() -- Line: 117 -- upvalues: u11 (ref)
            u11:Disconnect()
        end)
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 125 -- upvalues: a1 (val)
                a1:_trackAnimationEvents((a1._animations.Walk:Play()))
                a1.Model.HumanoidRootPart.ChainballDrag:Play()
                a1.Model["Right Chainspike"].DirtParticles.Dirt.Enabled = true
                a1.Model["Right Chainspike"].DirtParticles.Dust.Enabled = true
                a1.Model["Left Chainspike"].DirtParticles.Dirt.Enabled = true
                a1.Model["Left Chainspike"].DirtParticles.Dust.Enabled = true
            end,
            onLeave = function() -- Line: 134 -- upvalues: a1 (val)
                a1.Model.HumanoidRootPart.ChainballDrag:Stop()
                a1.Model["Right Chainspike"].DirtParticles.Dirt.Enabled = false
                a1.Model["Right Chainspike"].DirtParticles.Dust.Enabled = false
                a1.Model["Left Chainspike"].DirtParticles.Dirt.Enabled = false
                a1.Model["Left Chainspike"].DirtParticles.Dust.Enabled = false
            end,
        },
        {
            name = "Attack",
            onEnter = function(a1_2, a2) -- Line: 144
                -- upvalues: a1 (val), TimescaleUtilities (upval), EffectsController (upval), Shaker (upval)
                -- upvalues: EmitterManager (upval), EasySound (upval)
                local v1 = a1:_face(a1_2)
                a1.Rotation = CFrame.new() * v1.Rotation
                a1:_trackAnimationEvents((a1._animations.Attack:Play()))
                a1.Model.HumanoidRootPart.Anticipation:Play()
                TimescaleUtilities.Wait(1)
                EffectsController.GroundSmash(CFrame.new(a1_2), a2)
                Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a1_2})
                EmitterManager.Emit("GroundImpact", CFrame.new(a1_2), a2)
                local Attachment = Instance.new("Attachment")
                Attachment.Parent = workspace.Terrain
                Attachment.Position = a1_2
                EasySound.Play({id = 18430359458, soundGroupName = "Enemies", parent = Attachment})
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 170 -- upvalues: a1 (val)
                a1._animations.Death:Play()
                a1.Model.HumanoidRootPart.Death:Play()
            end,
        },
    })
    a1.Executables = {
        AreaIndicator = function(a1, a2, a3) -- Line: 178
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), TimescaleUtilities (upval)
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "full",
                fadeInTime = 0.5,
                radius = a1,
                color3 = Color3.fromRGB(255, 0, 64),
                position = a2,
                tweenInfo = TweenInfo.new(a3),
                lifeTime = a3,
            })
            TimescaleUtilities.Wait(a3 + 0.25)
            AreaIndicatorStore.remove(v1)
        end,
        ChangeState = function(a1_2, ...) -- Line: 195 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        Effect = function(a1_2, ...) -- Line: 198 -- upvalues: a1 (val) -- types: a1_2: string
            local v1 = a1._effects[a1_2]
            if v1 then
                v1(...)
            end
        end,
        CreatePuddle = function(a1_2, a2) -- Line: 204 -- upvalues: a1 (val) -- types: a1_2: vector, a2: number
            a1._effects.Puddle(a1_2, a2)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1