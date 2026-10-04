-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Background
-- Decompile time: 2.57 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local LocalPlayer = Players.LocalPlayer
local Primary = (require(game.ReplicatedStorage.Client.Modules.PlayerGui)).Primary
local v1 = {Blur = Lighting:WaitForChild("Blur"), Frame = Primary:WaitForChild("Background")}
v1.Button = v1.Frame:WaitForChild("Button")
v1.Clicked = v1.Button.MouseButton1Click

function v1.Enable(a1, a2) -- Line: 23 -- upvalues: TweenService (val), VRService (val)
    if not a2 then
        TweenService:Create(a1.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 0.6}):Play()
    end
    if not VRService.VREnabled then
        TweenService:Create(a1.Blur, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = 20}):Play()
    end
    a1.Button.Visible = true
end

function v1.Disable(a1) -- Line: 49 -- upvalues: TweenService (val)
    TweenService:Create(a1.Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
    TweenService:Create(a1.Blur, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = 0}):Play()
    a1.Button.Visible = false
end

return v1