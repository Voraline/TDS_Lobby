-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Hero.Animator
-- Decompile time: 2.90 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: StateManager (val), Animation (val), TweenService (val), HttpService (val), AreaIndicatorStore (val)
    -- upvalues: TimescaleUtilities (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Track = v, Target = AnimationController}))
    end

    function a1:_face(a2) -- Line: 27 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
        return v1
    end

    function a1:_trackAnimationEvents(a2) -- Line: 44 -- types: self: table, a2: userdata
        local Value = self.Model.Configuration.VFX.SwordTrail.Value
        local u16 = (a2:GetMarkerReachedSignal("Trail")):Connect(function(a1) -- Line: 49 -- upvalues: Value (val)
            if a1 == "Enable" then
                Value.Enabled = true
                return
            end
            Value.Enabled = false
        end)
        a2.Ended:Connect(function() -- Line: 56 -- upvalues: u16 (ref)
            u16:Disconnect()
        end)
    end

    local u32 = nil
    a1._stateManager:addStates({
        {
            name = "Spawning",
            onEnter = function() -- Line: 65 -- upvalues: a1 (val)
                a1._animations.Spawn:Play(0)
            end,
        },
        {
            name = "Walking",
            onEnter = function() -- Line: 71 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "Attack1",
            onEnter = function(a1_2) -- Line: 77 -- upvalues: u32 (ref), a1 (val)
                u32 = a1.Model.PrimaryPart.CFrame
                local v1 = a1:_face(a1_2)
                a1.Rotation = CFrame.new() * v1.Rotation
                a1:_trackAnimationEvents((a1._animations.Attack1:Play()))
            end,
        },
        {
            name = "Attack2",
            onEnter = function(a1_2) -- Line: 88 -- upvalues: a1 (val)
                local v1 = a1:_face(a1_2)
                a1.Rotation = CFrame.new() * v1.Rotation
                a1:_trackAnimationEvents((a1._animations.Attack2:Play()))
            end,
        },
        {
            name = "Attack3",
            onEnter = function(a1_2) -- Line: 98 -- upvalues: a1 (val)
                local v1 = a1:_face(a1_2)
                a1.Rotation = CFrame.new() * v1.Rotation
                a1:_trackAnimationEvents((a1._animations.Attack3:Play()))
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 108 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        AreaIndicator = function(a1, a2, a3, a4) -- Line: 115
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), TimescaleUtilities (upval)
            local v1 = HttpService:GenerateGUID(false)
            local create = AreaIndicatorStore.create
            local v2 = {type = if not (a1 > 0) then "full" else "normal", radius = a2}
            local v3 = false
            if a1 > 0 then
                v3 = 0
            end
            v2.initialAngle = v3
            v3 = false
            if a1 > 0 then
                v3 = a1
            end
            v2.desiredAngle = v3
            v2.color3 = Color3.fromRGB(255, 0, 64)
            v3 = false
            if a1 > 0 then
                v3 = a3
            end
            v2.cframe = v3
            local Position = false
            if a1 == 0 then
                Position = a3.Position
            end
            v2.position = Position
            v2.tweenInfo = TweenInfo.new(0.25)
            v2.lifeTime = a4
            create(v1, v2)
            TimescaleUtilities.Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
        ChangeState = function(a1_2, ...) -- Line: 131 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
    local v1 = a1.Replicator:WaitForState("TimeSpawned")
    if not (workspace:GetServerTimeNow() - v1 < 0.5) then
        a1._stateManager:changeState("Walking")
    else
        a1._stateManager:changeState("Spawning")
    end
end

return v1