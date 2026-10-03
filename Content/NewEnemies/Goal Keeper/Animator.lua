-- Script path: ReplicatedStorage.Content.NewEnemies.Goal Keeper.Animator
-- Decompile time: 2.16 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: StateManager (val), Animation (val), TweenService (val), EmitterManager (val), TimescaleUtilities (val)
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end

    function a1:_face(a2) -- Line: 29 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
        return v1
    end

    function a1._trackAnimationEvents(a1, a2) -- Line: 46 -- types: a1: table, a2: userdata
        local u11 = (a2:GetMarkerReachedSignal("Trail")):Connect(function(a1_2) -- Line: 48 -- upvalues: a1 (val)
            if a1_2 == "Enable" then
                a1.Model.Handle.Trail.Enabled = true
                return
            end
            a1.Model.Handle.Trail.Enabled = false
        end)
        a2.Ended:Connect(function() -- Line: 55 -- upvalues: u11 (ref)
            u11:Disconnect()
        end)
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 63 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "Attack",
            onEnter = function(a1_2) -- Line: 69 -- upvalues: a1 (val), EmitterManager (upval)
                local v1 = a1:_face(a1_2)
                a1:_trackAnimationEvents((a1._animations.Attack:Play()))
                EmitterManager.manualEmit(a1.Model.VFX)
                a1.Rotation = CFrame.new() * v1.Rotation
            end,
        },
    })
    a1.Executables = {
        HitVFX = function(a1_2) -- Line: 80
            -- upvalues: a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            if a1_2 and a1_2.PrimaryPart then
                local HitVFX = a1.Model.VFX:FindFirstChild("HitVFX")
                if HitVFX and HitVFX:IsA("Attachment") then
                    local v1 = HitVFX:Clone()
                    v1.Parent = a1_2.PrimaryPart
                    EmitterManager.manualEmit(v1)
                    TimescaleUtilities.CleanUp(v1, 3)
                    return
                end
                return
            end
        end,
        AreaIndicator = function(a1, a2, a3, a4) -- Line: 96
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), TimescaleUtilities (upval)
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "normal",
                initialAngle = 0,
                radius = a2,
                desiredAngle = a1,
                color3 = Color3.fromRGB(255, 0, 64),
                cframe = a3 * CFrame.new(0, -3.5, 0),
                tweenInfo = TweenInfo.new(0.25),
                lifeTime = a4,
            })
            TimescaleUtilities.Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
        ChangeState = function(a1_2, ...) -- Line: 114 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
end

return v1