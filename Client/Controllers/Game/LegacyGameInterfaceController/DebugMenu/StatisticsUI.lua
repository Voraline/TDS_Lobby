-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.DebugMenu.StatisticsUI
-- Decompile time: 1.62 ms

local u0 = {}
u0.__index = u0
local Frame = Instance.new("Frame")
Frame.BackgroundTransparency = 1
Frame.AnchorPoint = Vector2.new(1, 0)
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)
Frame.Position = UDim2.new(1, -5, 0, 5)
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1.5
UIAspectRatioConstraint.Parent = Frame
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Parent = Frame
local TextButton = Instance.new("TextButton")
TextButton.Font = Enum.Font.Gotham
TextButton.Size = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextXAlignment = Enum.TextXAlignment.Right
TextButton.AutomaticSize = Enum.AutomaticSize.XY
TextButton.TextSize = 12
TextButton.RichText = true
TextButton.Name = "Stats"
TextButton.Text = ""
u0.RootUI = Frame

function u0.new() -- Line: 48 -- upvalues: u0 (val), TextButton (val), Frame (val)
    local v1 = setmetatable({}, u0)
    v1.UI = TextButton:Clone()
    v1.UI.Parent = Frame
    return v1
end

function u0.UpdateMS(a1, a2, a3, a4, a5) -- Line: 65
    local v1 = "#71DD6D"
    if a4 <= a3 then
        v1 = "#FF4F4F"
    elseif a4 * 0.5 <= a3 then
        v1 = "#DDDB6D"
    end
    a1.UI.Name = a2
    a1.UI.Text = a2 .. string.format("<font color=\"%s\">%s ms</font>", v1, string.format("%.2f", a3))
    if a5 then
        a1.UI.Text = a1.UI.Text .. "\n"
    end
end

return u0