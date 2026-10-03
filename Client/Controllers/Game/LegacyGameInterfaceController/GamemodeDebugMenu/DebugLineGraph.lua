-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.GamemodeDebugMenu.DebugLineGraph
-- Decompile time: 5.05 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Maid = require(ReplicatedStorage.Shared.Modules.GuiLib.Utilities.Maid)
local u27 = {}
u27.__index = u27
local u32 = Color3.fromRGB(113, 221, 109)
local u37 = Color3.fromRGB(255, 255, 255)
local Frame = Instance.new("Frame")
Frame.Visible = true
Frame.BackgroundTransparency = 1
Frame.AnchorPoint = Vector2.new(1, 0)
Frame.Size = UDim2.new(0, 200, 0, 200)
local Frame_2 = Instance.new("Frame")
Frame_2.BackgroundTransparency = 1
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.Size = UDim2.new(0.9, 0, 0.9, 0)
Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame_2.Name = "DotContainer"
Frame_2.Parent = Frame
local Frame_3 = Instance.new("Frame")
Frame_3.BackgroundColor3 = u37
Frame_3.BorderSizePixel = 0
Frame_3.ZIndex = 2
Frame_3.Parent = Frame
Frame_3.AnchorPoint = Vector2.new(0, 0)
Frame_3.Size = UDim2.new(1, 0, 0, 1)
Frame_3.Position = UDim2.new(0, 0, 1, 0)
local Frame_4 = Instance.new("Frame")
Frame_4.BackgroundColor3 = u37
Frame_4.BorderSizePixel = 0
Frame_4.ZIndex = 2
Frame_4.Parent = Frame
Frame_4.AnchorPoint = Vector2.new(1, 0)
Frame_4.Size = UDim2.new(0, 1, 1, 0)
Frame_4.Position = UDim2.new(0, 0, 0, 0)
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1.5
UIAspectRatioConstraint.Parent = Frame
local TextLabel = Instance.new("TextLabel")
TextLabel.Font = Enum.Font.Gotham
TextLabel.Size = UDim2.new(0, 0, 0, 0)
TextLabel.Position = UDim2.new(0, 5, 1, 0)
TextLabel.AnchorPoint = Vector2.new(0, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = u37
TextLabel.TextXAlignment = Enum.TextXAlignment.Right
TextLabel.AutomaticSize = Enum.AutomaticSize.XY
TextLabel.TextSize = 12
TextLabel.Name = "Title"
TextLabel.Text = ""
TextLabel.Parent = Frame
local TextLabel_2 = Instance.new("TextLabel")
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Size = UDim2.new(0, 0, 0, 0)
TextLabel_2.Position = UDim2.new(-0.05, 0, 1, 0)
TextLabel_2.AnchorPoint = Vector2.new(1, 0.5)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.TextColor3 = u37
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
TextLabel_2.TextSize = 12
TextLabel_2.Name = "Min"
TextLabel_2.Text = ""
TextLabel_2.Parent = Frame
local TextLabel_3 = Instance.new("TextLabel")
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Size = UDim2.new(0, 0, 0, 0)
TextLabel_3.Position = UDim2.new(-0.05, 0, 0, 0)
TextLabel_3.AnchorPoint = Vector2.new(1, 0.5)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.TextColor3 = u37
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_3.AutomaticSize = Enum.AutomaticSize.XY
TextLabel_3.TextSize = 12
TextLabel_3.Name = "Max"
TextLabel_3.Text = ""
TextLabel_3.Parent = Frame
local Frame_5 = Instance.new("Frame")
Frame_5.BackgroundColor3 = u37
Frame_5.BackgroundTransparency = 0.7
Frame_5.BorderSizePixel = 0
Frame_5.ZIndex = 0
Frame_5.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_5.Size = UDim2.new(1, 0, 0, 1)
Frame_5.Position = UDim2.new(0.5, 0, 0, 0)
Frame_5.Parent = Frame_2
local TextLabel_4 = Instance.new("TextLabel")
TextLabel_4.Font = Enum.Font.Gotham
TextLabel_4.Size = UDim2.new(0, 0, 0, 0)
TextLabel_4.AnchorPoint = Vector2.new(1, 0.5)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.TextColor3 = u37
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_4.AutomaticSize = Enum.AutomaticSize.XY
TextLabel_4.TextSize = 12
TextLabel_4.Name = "Stats"
TextLabel_4.Text = ""
local Mouse = Players.LocalPlayer:GetMouse()

function u27.new(a1, a2, a3) -- Line: 116
    -- upvalues: u27 (val), Frame (val), u37 (val), Maid (val), RunService (val), Mouse (val), u32 (val)
    local Frame_2, TextLabel, v1
    local u6 = setmetatable({}, u27)
    local v2 = a3 or 3
    u6.UI = Frame:Clone()
    u6.UI.Title.Text = a2
    u6._midpoints = {}
    for i = 1, v2 do
        v1 = i / (v2 + 0.5)
        TextLabel = Instance.new("TextLabel")
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.Size = UDim2.new(0, 0, 0, 0)
        TextLabel.Position = UDim2.new(-0.1, 0, v1, 0)
        TextLabel.AnchorPoint = Vector2.new(1, 0.5)
        TextLabel.TextTransparency = 0.5
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = u37
        TextLabel.TextXAlignment = Enum.TextXAlignment.Right
        TextLabel.AutomaticSize = Enum.AutomaticSize.XY
        TextLabel.TextSize = 12
        TextLabel.Name = "Mid"
        TextLabel.Text = ""
        TextLabel.Parent = u6.UI.DotContainer
        Frame_2 = Instance.new("Frame")
        Frame_2.BackgroundColor3 = u37
        Frame_2.BackgroundTransparency = 0.7
        Frame_2.BorderSizePixel = 0
        Frame_2.ZIndex = 0
        Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_2.Size = UDim2.new(1, 0, 0, 1)
        Frame_2.Position = UDim2.new(0.5, 0, v1, 0)
        Frame_2.Parent = u6.UI.DotContainer
        table.insert(u6._midpoints, {TextLabel, v1})
    end
    u6._maid = Maid.new()
    u6._dots = {}
    RunService.Heartbeat:Connect(function() -- Line: 160 -- upvalues: Mouse (upval), u6 (val), u32 (upval)
        local v1 = Vector2.new(Mouse.X, Mouse.Y)
        for i, j in u6._dots do
            if not ((v1 - j.AbsolutePosition).Magnitude < 9) then
                j.BackgroundColor3 = u32
                j.Stats.Visible = false
            else
                j.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                j.Stats.Visible = true
            end
        end
    end)
    u6.UI.Parent = a1
    return u6
end

function u27.Draw(a1, a2) -- Line: 179 -- upvalues: Comma (val), u32 (val), u37 (val) -- types: a1: table, a2: table
    local AbsolutePosition, AbsolutePosition_2, Frame, Frame_2, TextLabel, v1, v2, v3, v4, v5, v6, v7, v8
    a1._maid:Sweep()
    a1._maid:Mark(function() -- Line: 182 -- upvalues: a1 (val)
        a1._dots = {}
    end)
    local v9 = if not next(a2) then 0 else math.max((unpack(a2)))
    local v10 = #a2
    local v11 = nil
    a1.UI.Min.Text = 0
    a1.UI.Max.Text = Comma((tostring(v9)))
    local DotContainer = a1.UI.DotContainer
    for i, v in ipairs(a1._midpoints) do
        v[1].Text = Comma((tostring((math.floor(v9 * (1 - v[2]))))))
    end
    for i2 = 1, v10 do
        v8 = a2[i2]
        v1 = v8 / v9
        v2 = (i2 - 1) / (v10 - 1)
        v3 = 1 - v1
        Frame = Instance.new("Frame")
        Frame.BackgroundColor3 = u32
        Frame.BorderSizePixel = 0
        Frame.ZIndex = 2
        Frame.Parent = DotContainer
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.Size = UDim2.new(0, 2, 0, 2)
        Frame.Position = UDim2.new(v2, 0, v3, 0)
        TextLabel = Instance.new("TextLabel")
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.Size = UDim2.new(0, 0, 0, 0)
        TextLabel.AnchorPoint = Vector2.new(0.5, 1)
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = u37
        TextLabel.TextXAlignment = Enum.TextXAlignment.Center
        TextLabel.AutomaticSize = Enum.AutomaticSize.XY
        TextLabel.TextSize = 12
        TextLabel.Name = "Stats"
        TextLabel.Text = (Comma((tostring(v8)))) .. "\n" .. Comma((tostring(i2)))
        TextLabel.Visible = false
        TextLabel.Parent = Frame
        table.insert(a1._dots, Frame)
        if v11 then
            AbsolutePosition = v11.AbsolutePosition
            AbsolutePosition_2 = Frame.AbsolutePosition
            v4 = AbsolutePosition_2 - AbsolutePosition
            v5 = math.sqrt(v4.X ^ 2 + v4.Y ^ 2)
            v6 = Vector2.new((AbsolutePosition_2.X + AbsolutePosition.X) / 2, (AbsolutePosition_2.Y + AbsolutePosition.Y) / 2)
            v7 = Vector2.new(
                (v6.X - DotContainer.AbsolutePosition.X) / DotContainer.AbsoluteSize.X,
                (v6.Y - DotContainer.AbsolutePosition.Y) / DotContainer.AbsoluteSize.Y
            )
            Frame_2 = Instance.new("Frame")
            Frame_2.BackgroundTransparency = 0.5
            Frame_2.BackgroundColor3 = u32
            Frame_2.BorderSizePixel = 0
            Frame_2.ZIndex = 1
            Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame_2.Size = UDim2.new(0, v5, 0, 1)
            Frame_2.Rotation = math.deg((math.atan2(v4.Y, v4.X)))
            Frame_2.Position = UDim2.new(v7.X, 0, v7.Y, 2)
            Frame_2.Parent = DotContainer
            a1._maid:Mark(Frame_2)
        end
        a1._maid:Mark(Frame)
    end
end

return u27