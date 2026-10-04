-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.DebugMenu.StatisticsBarChartUI
-- Decompile time: 4.16 ms

local u0 = {}
u0.__index = u0
local u5 = Color3.fromRGB(255, 79, 79)
local u10 = Color3.fromRGB(113, 221, 109)
local v1 = Color3.fromRGB(255, 255, 255)
local Frame = Instance.new("Frame")
Frame.Visible = false
Frame.BackgroundTransparency = 1
Frame.AnchorPoint = Vector2.new(1, 0)
Frame.Size = UDim2.new(0.3, 0, 0.3, 0)
local Frame_2 = Instance.new("Frame")
Frame_2.BackgroundColor3 = v1
Frame_2.BorderSizePixel = 0
Frame_2.ZIndex = 2
Frame_2.Parent = Frame
Frame_2.AnchorPoint = Vector2.new(0, 0)
Frame_2.Size = UDim2.new(1, 0, 0, 1)
Frame_2.Position = UDim2.new(0, 0, 1, 0)
local Frame_3 = Instance.new("Frame")
Frame_3.BackgroundColor3 = v1
Frame_3.BorderSizePixel = 0
Frame_3.ZIndex = 2
Frame_3.Parent = Frame
Frame_3.AnchorPoint = Vector2.new(1, 0)
Frame_3.Size = UDim2.new(0, 1, 1, 0)
Frame_3.Position = UDim2.new(0, 0, 0, 0)
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1.5
UIAspectRatioConstraint.Parent = Frame
local TextLabel_2 = Instance.new("TextLabel")
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Size = UDim2.new(0, 0, 0, 0)
TextLabel_2.AnchorPoint = Vector2.new(0, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.TextColor3 = v1
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
TextLabel_2.TextSize = 12
TextLabel_2.Name = "Title"
TextLabel_2.Text = ""
TextLabel_2.Parent = Frame
local TextLabel = Instance.new("TextLabel")
TextLabel.Font = Enum.Font.Gotham
TextLabel.Size = UDim2.new(0, 0, 0, 0)
TextLabel.AnchorPoint = Vector2.new(1, 0.5)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = v1
TextLabel.TextXAlignment = Enum.TextXAlignment.Right
TextLabel.AutomaticSize = Enum.AutomaticSize.XY
TextLabel.TextSize = 12
TextLabel.Name = "Stats"
TextLabel.Text = ""

function u0.new(a1, a2, a3) -- Line: 75 -- upvalues: u0 (val), Frame (val), TextLabel (val), Frame_2 (val)
    local Frame_3, v1, v2
    local u6 = setmetatable({}, u0)
    u6.UI = Frame:Clone()
    u6.Entries = table.create(20)
    u6.EntryData = table.create(20, 0)
    u6.DataMaxLimit = a2 or 20
    u6.UI.Title.Text = a1
    local v3 = a3 or ""
    for i = 1, 20 do
        Frame_3 = Instance.new("Frame")
        Frame_3.BorderSizePixel = 0
        Frame_3.AnchorPoint = Vector2.new(0, 1)
        Frame_3.Size = UDim2.new(0.05, 0, 0, 0)
        Frame_3.Position = UDim2.new((i - 1) / 20, 0, 1, 0)
        Frame_3.Parent = u6.UI
        u6.Entries[i] = Frame_3
    end
    for j = 1, 5 do
        v1 = TextLabel:Clone()
        v1.Text = (tostring(j * u6.DataMaxLimit / 5)) .. v3
        v1.Position = UDim2.new(0, 0, (5 - j) * 0.2, 0)
        v1.Parent = u6.UI
        v2 = Frame_2:Clone()
        v2.Position = v1.Position
        v2.BackgroundTransparency = 0.5
        v2.Parent = u6.UI
    end
    ;(u6.UI:GetPropertyChangedSignal("Visible")):Connect(function() -- Line: 111 -- upvalues: u6 (val)
        if u6.UI.Visible then
            u6:Refresh()
        end
    end)
    return u6
end

function u0.Add(a1, a2) -- Line: 125
    a1.EntryData[20] = a2
    for i = 1, 19 do
        a1.EntryData[i] = a1.EntryData[i + 1]
    end
    a1:Refresh()
end

function u0:Refresh() -- Line: 140 -- upvalues: u10 (val), u5 (val)
    local v1
    if not self.UI.Visible then
        return
    end
    for i, v in ipairs(self.Entries) do
        v1 = math.clamp(self.EntryData[i] / self.DataMaxLimit, 0, 1)
        v.Size = UDim2.new(0.05, 0, v1, 0)
        v.BackgroundColor3 = u10:Lerp(u5, v1)
    end
end

return u0