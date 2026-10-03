-- Script path: ReplicatedStorage.Content.NewEnemies.Blight Walker.Animator
-- Decompile time: 2.98 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local FallenBlood = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("FallenBlood")
local PoisonBubble = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Mob")):WaitForChild("PoisonBubble")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 23
    -- upvalues: StateManager (val), Animation (val), PoisonBubble (val), ItemDrop (val), HttpService (val)
    -- upvalues: AreaIndicatorStore (val), TimescaleUtilities (val), EmitterManager (val), FallenBlood (val)
    -- upvalues: TweenService (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    a1._animations.Walk = Animation.new({Target = AnimationController, Track = Animations:WaitForChild("Walk")})
    a1._animations.Spit = Animation.new({
        ShouldStopAtEnd = true,
        IgnorePriority = true,
        Target = AnimationController,
        Track = Animations:WaitForChild("Spit"),
    })

    function a1:_face(a2) -- Line: 40 -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        self.Model:PivotTo((CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))))
    end

    function a1:_fireProjectile(a2) -- Line: 49
        -- upvalues: PoisonBubble (upval), ItemDrop (upval), HttpService (upval), AreaIndicatorStore (upval)
        -- upvalues: TimescaleUtilities (upval), EmitterManager (upval)
        local u5 = PoisonBubble:Clone()
        u5.Parent = workspace.Trash
        a2.start = self.Model.Head.Start.WorldPosition
        local v1 = (ItemDrop.GetTimeToDestinationWithGV(a2.start, a2.goal, a2.gravity, a2.velocity)) / a2.dtMultiplier
        local u25 = HttpService:GenerateGUID(false)
        AreaIndicatorStore.create(u25, {
            type = "full",
            fadeInTime = 0.25,
            radius = a2.radius,
            tweenInfo = TweenInfo.new(v1),
            lifeTime = v1,
            color3 = Color3.fromRGB(255, 0, 64),
            position = a2.goal,
        })
        ;(ItemDrop.Drop(a2.start, a2.goal, u5.Bubble, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) end)):andThen(function() -- Line: 81
            -- upvalues: u5 (val), TimescaleUtilities (upval), EmitterManager (upval), a2 (val)
            -- upvalues: AreaIndicatorStore (upval), u25 (val)
            u5.Bubble.Transparency = 1
            for k, v in pairs(u5.Bubble.Core:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = false
                end
            end
            TimescaleUtilities.CleanUp(u5, 2)
            EmitterManager.Emit("BlightWalkerExplosion", CFrame.new(a2.goal))
            TimescaleUtilities.Wait(1)
            AreaIndicatorStore.remove(u25)
        end)
    end

    a1._stateManager:addStates({
        {
            name = "Walk",
            onEnter = function() -- Line: 100 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
            onLeave = function() -- Line: 103 -- upvalues: a1 (val)
                a1._animations.Walk:Stop()
            end,
        },
        {
            name = "Spit",
            onEnter = function(a1_2) -- Line: 109 -- upvalues: a1 (val)
                a1._animations.Spit:Play()
                a1:_face(a1_2.goal)
                a1:_fireProjectile(a1_2)
            end,
            onLeave = function() -- Line: 114 -- upvalues: a1 (val)
                a1._animations.Spit:Stop()
            end,
        },
    })
    a1.Executables = {
        CreatePuddle = function(a1, a2) -- Line: 121
            -- upvalues: FallenBlood (upval), TweenService (upval), TimescaleUtilities (upval)
            local u14 = FallenBlood[math.random(1, #FallenBlood:GetChildren())]:Clone()
            u14.CFrame = (CFrame.new(a1 + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0)
            u14.Parent = workspace.Terrain
            local Size = u14.Size
            u14.Size = Vector3.new(0, 0, 0)
            TweenService:Create(u14, TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = Size}):Play()
            TimescaleUtilities.Delay(a2, function() -- Line: 137 -- upvalues: TweenService (upval), u14 (val), Size (val)
                local v1 = TweenService:Create(u14, TweenInfo.new(1), {Transparency = 1, Size = Size * 0.5})
                v1:Play()
                v1.Completed:Connect(function() -- Line: 144 -- upvalues: u14 (upval)
                    u14:Destroy()
                end)
            end)
        end,
        Projectile = function(a1_2) -- Line: 149 -- upvalues: a1 (val)
            a1._stateManager:changeState("Spit", a1_2)
            a1:_fireProjectile(a1_2)
        end,
        ChangeState = function(a1_2, ...) -- Line: 153 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
    a1._stateManager:changeState("Walk")
end

return v1