-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.GamemodeDebugMenu.DebugNumberStat
-- Decompile time: 1.32 ms

local u0 = {}
u0.__index = u0
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
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

function u0.new(a1, a2, a3, a4) -- Line: 25
    -- upvalues: u0 (val), TextButton (val)
    local v1 = setmetatable({}, u0)
    v1.UI = TextButton:Clone()
    v1.UI.Parent = a1
    v1:Update(a2, a3, a4)
    return v1
end

function u0:Update(a2, a3, a4) -- Line: 41
    -- upvalues: Comma (val)
    local v1 = a2 .. ": "
    self.UI.Name = v1
    self.UI.Text = v1 .. string.format("<font color=\"%s\">%s</font>", "#71DD6D", Comma(a3))
    if a4 then
        self.UI.Text = self.UI.Text .. "\n"
    end
end

return u0