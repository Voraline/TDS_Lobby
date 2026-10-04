-- Script path: ReplicatedStorage.Content.Maps.Failed Gateway.Animator
-- Decompile time: 1.17 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u31 = Random.new()
local Map = NewNetwork.Channel("Map")

local function onWaveChange(a1) -- Line: 13 -- upvalues: TweenService (val), Lighting (val)
    local v1 = TweenInfo.new(20)
    if a1 == 10 then
        TweenService:Create(Lighting, v1, {ClockTime = 23}):Play()
    end
end

return function(a1, a2) -- Line: 23
    -- upvalues: RunService (val), GameState (val), u31 (val), Map (val), onWaveChange (val)
    local GodCubeRig = a1:WaitForChild("Environment"):WaitForChild("SuperComputer"):WaitForChild("GodCubeRig")
    local u14 = 0
    local u19 = CFrame.Angles(0, 0, 0)
    a2:Mark((RunService.PostSimulation:Connect(function(a1) -- Line: 31 -- upvalues: u14 (ref), GameState (upval), u31 (upval), u19 (ref), GodCubeRig (val)
        u14 = u14 + a1 * GameState.TimeScale
        if (u31:NextNumber()) < 0.4 then
            u19 = CFrame.Angles(math.rad((u31:NextNumber(-10, 10))), math.rad((u31:NextNumber(-10, 10))), (math.rad((u31:NextNumber(-10, 10)))))
        end
        GodCubeRig:PivotTo((CFrame.new(GodCubeRig.WorldPivot.Position)) * CFrame.Angles(0, math.rad(u14 * 90), 0) * u19)
    end)))
    a2:Mark((Map:onEvent("TransitionScene", onWaveChange)))
end