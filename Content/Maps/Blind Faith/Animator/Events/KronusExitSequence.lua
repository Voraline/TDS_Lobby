-- Script path: ReplicatedStorage.Content.Maps.Blind Faith.Animator.Events.KronusExitSequence
-- Decompile time: 4.64 ms

game:GetService("TweenService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local Map = Network.Channel("Map")
local u58 = nil
local v1 = {}

local function loadAnimations(a1) -- Line: 19 -- types: a1: userdata
    local Animation
    local v1 = {}
    local Animator = (a1:WaitForChild("AnimationController")):WaitForChild("Animator")
    for k, v in pairs((a1:WaitForChild("Animations")):GetChildren()) do
        Animation = Instance.new("Animation")
        Animation.AnimationId = v.AnimationId
        v1[v.Name] = (Animator:LoadAnimation(Animation))
        Animation:Destroy()
    end
    return v1
end

local function findClosestNode(a1, a2) -- Line: 34 -- types: a1: vector, a2: table
    local Magnitude
    local Position = nil
    local v1 = (1 / 0)
    for k, v in pairs(a2) do
        Magnitude = (a1 - v.Position).Magnitude
        if Magnitude < v1 then
            Position = v.Position
        end
    end
    return Position
end

function v1.init(a1, a2) -- Line: 49
    -- upvalues: loadAnimations (val), Map (val), EasySound (val), TimescaleUtilities (val), CatRom (val), u58 (ref)
    -- upvalues: RunService (val), GameState (val), TweenService (val), Shaker (val), findClosestNode (val)
    -- upvalues: TweenService_2 (val)
    local Environment = a1:WaitForChild("Environment")
    local EscapeNodes = Environment:WaitForChild("EscapeNodes")
    local KronusModel = Environment:WaitForChild("KronusModel")
    local u16 = loadAnimations(KronusModel)
    a2:Mark((Map:On("KronusExitSequence", function(a1) -- Line: 55
        -- upvalues: KronusModel (val), u16 (val), EasySound (upval), TimescaleUtilities (upval), CatRom (upval)
        -- upvalues: u58 (upval), RunService (upval), GameState (upval), TweenService (upval), Shaker (upval)
        -- upvalues: findClosestNode (upval), EscapeNodes (val), TweenService_2 (upval), Environment (val)
        local Position, v1
        KronusModel:PivotTo(a1)
        if u16.Death then
            u16.Death:Play()
            EasySound.Play({
                id = 140041347544734,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                volume = 1,
                parent = KronusModel.PrimaryPart,
                emitter = {RollOffMaxDistance = 100},
            })
        end
        TimescaleUtilities.Wait(2)
        u16.Death:AdjustSpeed(0.9)
        TimescaleUtilities.Wait(0.1)

        local function flyToNode(a1, a2, a3) -- Line: 76
            -- upvalues: KronusModel (upval), CatRom (upval), u58 (upval), RunService (upval), GameState (upval)
            -- upvalues: TweenService (upval), Shaker (upval), EasySound (upval)
            local Position = KronusModel.PrimaryPart.Position
            local v1 = a1 + Vector3.new(0, KronusModel.PrimaryPart.Size.Y / 1.5, 0)
            local v2 = (Position + v1) / 2 + Vector3.new(0, v1.Y - Position.Y + 4 / (a3 or 1), 0)
            local new = CatRom.new
            local v3 = {}
            local v4 = Vector3.new(Position.X, Position.Y, Position.Z)
            local X_2 = v1.X
            local Y_2 = v1.Y
            local Z_2 = v1.Z
            v3[1] = v4
            v3[2] = v2
            v3[3] = (Vector3.new(X_2, Y_2, Z_2))
            local u44 = new(v3, 0.25)
            u44:PrecomputeArcLengthParams(15)
            local u53 = u44:SolveUniformLength(0, 1)
            local u54 = 0
            local u55 = 0
            local u56 = false
            local u57 = false
            if u58 then
                u58:Disconnect()
                u58 = nil
            end
            local u66 = u53 / a2
            u58 = RunService.Heartbeat:Connect(function(a1) -- Line: 107
                -- upvalues: KronusModel (upval), u58 (upval), u55 (ref), GameState (upval), u66 (val)
                -- upvalues: TweenService (upval), u54 (ref), u53 (val), u44 (val), u57 (ref), Shaker (upval)
                -- upvalues: EasySound (upval), u56 (ref)
                if KronusModel and KronusModel.Parent then
                    u55 = u55 + a1 * GameState.TimeScale
                    local v1 = math.clamp(u55 / u66, 0, 1)
                    local Value = TweenService:GetValue(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                    u54 = Value * u53
                    local v2 = math.clamp(u54 / u53, 0, 1)
                    local v3 = u44:SolveUniformPosition(v2)
                    local v4 = u44:SolveUniformTangent(v2)
                    v4 = Vector3.new(v4.X, 0, v4.Z)
                    KronusModel:PivotTo((CFrame.lookAt(v3, v3 + v4)))
                    if Value > 0.9 and not u57 then
                        u57 = true
                        Shaker:Shake({5, 7}, 0, 0.6)
                        EasySound.Play({
                            id = 130755397358635,
                            destroyOnEnd = true,
                            soundGroupName = "Enemies",
                            volume = 1,
                            parent = KronusModel.PrimaryPart,
                            emitter = {RollOffMaxDistance = 100},
                        })
                    end
                    if v1 >= 1 then
                        u58:Disconnect()
                        u58 = nil
                        u56 = true
                    end
                    return
                end
                u58:Disconnect()
            end)
            repeat
                RunService.Heartbeat:Wait()
            until u56
        end

        for i = 1, 4 do
            Position = KronusModel.PrimaryPart.Position
            v1 = findClosestNode(Position, EscapeNodes[i]:GetChildren())
            TweenService_2:Create(KronusModel.PrimaryPart, TweenInfo.new(0.45), {
                CFrame = CFrame.lookAt(KronusModel.PrimaryPart.Position, (Vector3.new(v1.X, KronusModel.PrimaryPart.Position.Y, v1.Z))),
            }):Play()
            TimescaleUtilities.Wait(0.45)
            if i > 1 then
                EasySound.Play({
                    id = 81878792621148,
                    destroyOnEnd = true,
                    soundGroupName = "Enemies",
                    volume = 1,
                    parent = KronusModel.PrimaryPart,
                    emitter = {RollOffMaxDistance = 100},
                })
                if u16.Leap then
                    u16.Leap:Play()
                    u16.Leap:AdjustSpeed(0.9)
                end
            end
            TimescaleUtilities.Wait(0.2)
            Shaker:Shake({4.2, 4.2}, 0, 0.25)
            flyToNode(v1, 50, if i ~= 4 then nil else 0.2)
        end
        KronusModel:PivotTo(Environment.SpawnLocation.CFrame * (CFrame.new(0, -100, 0)))
    end)))
end

function v1.cleanup(a1, a2) -- Line: 200
    a2:Sweep()
end

return v1