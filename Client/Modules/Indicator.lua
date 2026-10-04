-- Script path: ReplicatedStorage.Client.Modules.Indicator
-- Decompile time: 2.57 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Effects = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")
return function(a1, a2) -- Line: 10 -- upvalues: LocalPlayer (val), Effects (val), TweenService (val)
    local Settings = LocalPlayer:FindFirstChild("Settings")
    if Settings then
        local Indicators = Settings:FindFirstChild("Indicators")
        if Indicators and Indicators.Value then
            local v1 = Effects.DamageIndicator:Clone()
            local Size = v1.Size
            v1.Size = UDim2.new(0, 0, 0, 0)
            v1.Parent = a2
            v1.Damage.Text = a1
            v1.Enabled = true
            local ExtentsSize = a2.Parent:GetExtentsSize()
            local v2 = Vector3.new(
                (Random.new()):NextNumber(-ExtentsSize.X / 2, ExtentsSize.X / 2),
                (Random.new()):NextNumber(-ExtentsSize.Y / 2, ExtentsSize.Y / 2),
                ((Random.new()):NextNumber(-ExtentsSize.Z / 2, ExtentsSize.Z / 2))
            )
            TweenService:Create(
                v1,
                TweenInfo.new(0.6666666666666666, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Size = Size}
            ):Play()
            TweenService:Create(
                v1,
                TweenInfo.new(0.6666666666666666, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                {StudsOffsetWorldSpace = v2}
            ):Play()
            game.Debris:AddItem(v1, 2)
            return v1
        end
    end
end