-- Script path: ReplicatedStorage.Client.Controllers.Game.StatEditorController
-- Decompile time: 2.70 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JSONFormatter = require(ReplicatedStorage.Shared.Modules.JSONFormatter)
local StatEditor = require(ReplicatedStorage.Shared.Modules.Network).Channel("StatEditor")
local u28 = ""
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = false
local Frame = Instance.new("Frame")
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.fromScale(0.5, 0.5)
Frame.Size = UDim2.fromScale(0.5, 0.5)
Frame.Name = "StatEditorExport"
Frame.Parent = ScreenGui
local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame
TextButton.AnchorPoint = Vector2.new(1, 1)
TextButton.Size = UDim2.fromScale(0.1, 0.1)
TextButton.Font = Enum.Font.GothamBold
TextButton.Position = UDim2.fromScale(1, 0)
TextButton.TextScaled = true
TextButton.Text = "X"
TextButton.Parent = Frame
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1
UIAspectRatioConstraint.Parent = TextButton
TextButton.MouseButton1Click:Connect(function() -- Line: 38 -- upvalues: ScreenGui (val)
    ScreenGui.Enabled = false
end)
local TextLabel = Instance.new("TextLabel")
TextLabel.AnchorPoint = Vector2.new(0.5, 1)
TextLabel.Position = UDim2.fromScale(0.5, 0)
TextLabel.Size = UDim2.fromScale(0.7, 0.1)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Text = "Press Ctrl+A to select all and Ctrl+C to copy"
TextLabel.Parent = Frame
TextLabel.TextScaled = true
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Size = UDim2.fromScale(1, 1)
ScrollingFrame.CanvasSize = UDim2.fromScale(0, 0)
ScrollingFrame.Parent = Frame
local TextBox = Instance.new("TextBox")
TextBox.BackgroundTransparency = 1
TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox.Position = UDim2.fromScale(0.5, 0.5)
TextBox.Size = UDim2.fromScale(0.8, 0)
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.AutomaticSize = Enum.AutomaticSize.Y
TextBox.Parent = ScrollingFrame
TextBox.ClearTextOnFocus = false
TextBox.Changed:Connect(function() -- Line: 69 -- upvalues: TextBox (val), u28 (ref)
    if TextBox.Text ~= u28 then
        TextBox.Text = u28
    end
end)
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
StatEditor:On("Show", function(a1) -- Line: 77 -- upvalues: JSONFormatter (val), HttpService (val), u28 (ref), TextBox (val), ScreenGui (val)
    u28 = JSONFormatter(HttpService:JSONEncode(a1))
    TextBox.Text = u28
    ScreenGui.Enabled = true
end)
return true