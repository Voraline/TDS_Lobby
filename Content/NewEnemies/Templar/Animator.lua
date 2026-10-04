-- Script path: ReplicatedStorage.Content.NewEnemies.Templar.Animator
-- Decompile time: 3.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12
    -- upvalues: Animation (val), StateManager (val), TweenService (val), Shaker (val), RunService (val)
    -- upvalues: GameState (val)
    a1._attackAnimation = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Blast,
        Target = a1.Model.AnimationController.Animator,
    })
    a1._stateManager = StateManager.new()
    a1._connection = nil
    local u16 = RaycastParams.new()
    u16.FilterType = Enum.RaycastFilterType.Include
    u16.FilterDescendantsInstances = {workspace:WaitForChild("Map")}

    function a1:_toggleEffects(a2) -- Line: 25 -- types: self: table, a2: boolean
        local v1, v2 = self, a2
        for i, j in self.Model.Core.Start:GetChildren() do
            if j:IsA("Beam") or j:IsA("ParticleEmitter") then
                j.Enabled = v2
            end
        end
        for k, n in v1.Model.HumanoidRootPart.BeamEnd:GetChildren() do
            if n:IsA("Beam") or n:IsA("ParticleEmitter") or n:IsA("PointLight") then
                n.Enabled = v2
            end
        end
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 41 -- upvalues: a1 (val), TweenService (upval)
                if a1._connection then
                    a1:_toggleEffects(false)
                    a1._connection:Disconnect()
                    a1.Model.HumanoidRootPart.Loop:Stop()
                    a1.Model.HumanoidRootPart.Outro:Play()
                    a1.Model.Torso.Flash.FX:Emit(1)
                    TweenService:Create(
                        a1.Model.Torso.Flash.Light,
                        TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Brightness = 0}
                    ):Play()
                end
                a1._attackAnimation:Stop(0.5)
            end,
        },
        {
            name = "Attacking",
            onEnter = function(a1_2) -- Line: 61
                -- upvalues: a1 (val), TweenService (upval), Shaker (upval), RunService (upval), GameState (upval)
                -- upvalues: u16 (val)
                a1._attackAnimation:Play()
                task.spawn(function() -- Line: 64 -- upvalues: a1 (upval)
                    a1:Delay(0.4)
                    a1.Model.HumanoidRootPart.Intro:Play()
                end)
                a1:Delay(0.8)
                a1.Model.Torso.Flash.FX:Emit(2)
                TweenService:Create(a1.Model.Torso.Flash.Light, TweenInfo.new(0.5), {Brightness = 8}):Play()
                a1.Model.HumanoidRootPart.Loop:Play()
                Shaker:Shake({1, 30.5, 0.25, 0.1}, 0.1, 3)
                a1:_toggleEffects(true)
                if a1._connection then
                    a1._connection:Disconnect()
                    a1._connection = nil
                end
                local Position = a1.Model.HumanoidRootPart.Position
                a1._connection = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 89 -- upvalues: a1 (upval), GameState (upval), Position (val), u16 (upval)
                    if not a1.currentTarget then
                        return
                    end
                    if not a1:IsAlive() then
                        a1._connection:Disconnect()
                        return
                    end
                    local v1 = a2 * GameState.TimeScale
                    local v2 = math.sin((tick()) * 12) * 2
                    local v3 = math.cos((tick()) * 8) * 2
                    local v4 = a1.currentTarget + Vector3.new(v2, 0, v3)
                    local Magnitude = (v4 - Position).Magnitude
                    local v5 = (v4 - Position).Unit * Magnitude + Vector3.new(v2, 0, v3)
                    local v6 = workspace:Raycast(Position, v5, u16)
                    if v6 and v6.Instance.Transparency == 1 then
                        u16:AddToFilter({v6.Instance})
                    end
                    a1.HumanoidRootPart.CFrame = a1.HumanoidRootPart.CFrame:Lerp(CFrame.new(Position, (Vector3.new(v4.X, Position.Y, v4.Z))), v1 * 3)
                    local Position_2 = v6 and v6.Position or v4
                    a1.Model.HumanoidRootPart.BeamEnd.WorldCFrame = a1.Model.HumanoidRootPart.BeamEnd.WorldCFrame:Lerp(CFrame.new(Position_2), v1 * 30)
                end)
            end,
        },
    })
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 131 -- upvalues: a1 (val)
            a1._stateManager:changeState(a1_2, ...)
        end,
        SetTarget = function(a1_2) -- Line: 134 -- upvalues: a1 (val)
            a1.currentTarget = a1_2
        end,
    }
end

return v1