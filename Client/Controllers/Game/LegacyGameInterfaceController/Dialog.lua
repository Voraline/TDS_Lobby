-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Dialog
-- Decompile time: 3.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
require(ReplicatedStorage.Shared.Modules.Thread)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local PlayerGui = ReplicatedStorage.Client.Modules.PlayerGui
local u47 = nil
local v1 = {
    __call = function(a1, a2) -- Line: 27
        if a1.Current then
            a1.Current:Wipe()
            a1.Current = nil
        end
        a1:Appear(true)
        a1.Current = a1:Write(a2, true)
    end,
}
local v2 = setmetatable({
    Properties = {
        Font = "SourceSansBold",
        TextScaled = false,
        TextSize = 30,
        TextColor3 = "<TextColor3=255,255,255>",
        TextStrokeColor3 = "<TextColor3=0,0,0>",
        TextStrokeTransparency = 0.8,
        ContainerVerticalAlignment = "Top",
    },
}, v1)
v2.__index = v2

function v2.GetPlayerGui(a1) -- Line: 41 -- upvalues: u47 (ref), PlayerGui (val)
    if not u47 then
        u47 = require(PlayerGui)
    end
    return u47
end

function v2:GetPrimaryGui() -- Line: 49
    return self:GetPlayerGui().Primary
end

function v2:GetUI() -- Line: 53
    if self.ui and self.ui.Parent then
        return self.ui
    end
    self.ui = self:GetPrimaryGui():WaitForChild("Dialog")
    return self.ui
end

function v2:Appear(a2) -- Line: 62 -- upvalues: VRService (val), TweenService (val)
    local v1, v2, v3
    local UI = self:GetUI()
    local PrimaryGui = self:GetPrimaryGui()
    if not a2 then
        TweenService:Create(
            UI.Message,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {TextStrokeTransparency = 1, TextTransparency = 1}
        ):Play()
        TweenService:Create(
            PrimaryGui.Backdrop,
            TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {BackgroundTransparency = 1}
        ):Play()
        TweenService:Create(UI.Speaker, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        TweenService:Create(
            UI.Speaker.TextLabel,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {TextStrokeTransparency = 1, TextTransparency = 1}
        ):Play()
        TweenService:Create(UI.SpeakerIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        v2 = next
        local Descendants_3, Descendants_4 = UI.Message:GetDescendants()
        for k, v in v2, Descendants_3, Descendants_4 do
            if v:IsA("TextLabel") then
                v3 = TweenService
                v1 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                v3:Create(v, v1, {TextStrokeTransparency = 1, TextTransparency = 1}):Play()
            end
        end
        return
    end
    if not VRService.VREnabled then
        TweenService:Create(
            PrimaryGui.Backdrop,
            TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0}
        ):Play()
    end
    TweenService:Create(
        UI.Message,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {TextStrokeTransparency = 0.9, TextTransparency = 0}
    ):Play()
    TweenService:Create(UI.Speaker, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.5}):Play()
    TweenService:Create(
        UI.Speaker.TextLabel,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {TextStrokeTransparency = 0.8, TextTransparency = 0}
    ):Play()
    TweenService:Create(UI.SpeakerIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.1}):Play()
    v2 = next
    local Descendants, Descendants_2 = UI.Message:GetDescendants()
    for k2, i in v2, Descendants, Descendants_2 do
        if i:IsA("TextLabel") then
            v3 = TweenService
            v1 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            v3:Create(i, v1, {TextStrokeTransparency = 0.8, TextTransparency = 0}):Play()
        end
    end
end

function v2:Write(a2) -- Line: 162 -- upvalues: Sound (val)
    local UI = self:GetUI()
    local v1 = a2.Hidden == true
    UI.SpeakerIcon.Image = a2.Icon or "http://www.roblox.com/asset/?id=4157647195"
    local SpeakerIcon = UI.SpeakerIcon
    local v2 = if not v1 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(0, 0, 0)
    SpeakerIcon.ImageColor3 = v2
    UI.Speaker.TextLabel.Text = if not v1 then a2.Author or "" else "???"
    UI.Message.MaxVisibleGraphemes = -1
    UI.Message.Text = a2.Text
    local v3 = 0
    for i, j in utf8.graphemes(a2.Text) do
        v3 = v3 + 1
        UI.Message.MaxVisibleGraphemes = v3
        Sound("Blip"):Play(true)
        task.wait(0.01)
    end
end

return v2