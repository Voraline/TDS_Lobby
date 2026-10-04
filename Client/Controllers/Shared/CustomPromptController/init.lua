-- Script path: ReplicatedStorage.Client.Controllers.Shared.CustomPromptController
-- Decompile time: 16.32 ms

local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local KeyImageResolver = require(script.KeyImageResolver)
local Prompt = ReplicatedStorage:WaitForChild("Assets").UI.Prompt
local u65 = Create("ScreenGui", {
    Name = "ProximityPrompts",
    ResetOnSpawn = false,
    Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
})
local u68 = {}
local u73 = setmetatable({}, {__mode = "k"})
u68.__index = u68

function u68.new(a1, a2) -- Line: 28 -- upvalues: Maid (val), SpringClass (val), u68 (ref), u73 (ref)
    local v1 = {
        maid = Maid.new(),
        prompt = a1,
        pressSpring = SpringClass.new(0, 0.5, 20),
        cashSpring = SpringClass.new(0, 1, 15),
    }
    local v2 = u68
    local v3 = setmetatable(v1, v2)
    v3:constructor(a1, a2)
    u73[v3] = true
    return v3
end

function u68:constructor(a2, a3) -- Line: 42 -- upvalues: Prompt (val), KeyImageResolver (val), u65 (val)
    local maid = self.maid
    local v1 = Prompt:Clone()
    self.promptUI = v1
    self.container = v1.Frame
    self.cashSpring.p = 0
    self.pressSpring.p = 0
    local Frame = v1.Frame
    local TextButton = v1.TextButton
    local Frame_2 = Frame.InputFrame.Frame
    local ButtonText = Frame_2.ButtonText
    local ButtonImage = Frame_2.ButtonImage
    local CircularProgressBar = Frame_2.CircularProgressBar
    local Progress = CircularProgressBar.Progress
    local ButtonBackground = Frame_2.ButtonBackground
    self.buttonProgress = Progress
    local v2, v3 = KeyImageResolver(a3, a2)
    assert(
        v2 or v3,
        (string.format("ProximityPrompt %q has an unsupported keycode for rendering UI: %s", a2.Name, (tostring(a2.KeyboardKeyCode))))
    )
    if not v2 then
        ButtonBackground.Visible = true
        ButtonText.Visible = true
        ButtonImage.Visible = false
    else
        ButtonImage.Image = v2
        ButtonBackground.Visible = false
        ButtonText.Visible = false
        ButtonImage.Visible = true
    end
    if v3 then
        ButtonText.Text = v3
    end
    if a3 == Enum.ProximityPromptInputType.Touch or a2.ClickablePrompt then
        local u51 = false
        v1.Active = true
        TextButton.InputBegan:Connect(function(a1) -- Line: 92 -- upvalues: a2 (val), u51 (ref)
            if a1.UserInputType == Enum.UserInputType.Touch then
                if a1.UserInputState ~= Enum.UserInputState.Change then
                    a2:InputHoldBegin()
                    u51 = true
                end
            elseif a1.UserInputType == Enum.UserInputType.MouseButton1
                and a1.UserInputState ~= Enum.UserInputState.Change then
                a2:InputHoldBegin()
                u51 = true
            end
        end)
        TextButton.InputEnded:Connect(function(a1) -- Line: 104 -- upvalues: u51 (ref), a2 (val)
            if a1.UserInputType == Enum.UserInputType.Touch then
                if u51 then
                    u51 = false
                    a2:InputHoldEnd()
                end
            elseif a1.UserInputType == Enum.UserInputType.MouseButton1 and u51 then
                u51 = false
                a2:InputHoldEnd()
            end
        end)
    end
    if 0 < a2.HoldDuration then
        maid:Mark((a2.PromptButtonHoldBegan:Connect(function() -- Line: 118 -- upvalues: self (val)
            self:OnPromptHold()
        end)))
        maid:Mark((a2.PromptButtonHoldEnded:Connect(function() -- Line: 122 -- upvalues: self (val)
            self:OnPromptHoldEnd()
        end)))
        local UIGradient = CircularProgressBar.Gradient1.ImageLabel.UIGradient
        local UIGradient_2 = CircularProgressBar.Gradient2.ImageLabel.UIGradient
        CircularProgressBar.Progress.Changed:Connect(function(a1) -- Line: 128 -- upvalues: UIGradient (val), UIGradient_2 (val)
            local v1 = math.clamp(a1 * 360, 0, 360)
            UIGradient.Rotation = math.clamp(v1, 180, 360)
            UIGradient_2.Rotation = math.clamp(v1, 0, 180)
        end)
    end
    maid:Mark((a2.Triggered:Connect(function() -- Line: 135 -- upvalues: self (val)
        self:OnPromptTriggered()
    end)))
    maid:Mark((a2.TriggerEnded:Connect(function() -- Line: 139 -- upvalues: self (val)
        self:OnPromptTriggerEnd()
    end)))
    maid:Mark((a2.Changed:Connect(function() -- Line: 143 -- upvalues: self (val), a2 (val)
        self:OnPromptUpdate(a2)
    end)))
    self:OnPromptUpdate(a2)
    maid:Mark(v1)
    for i, v in ipairs(v1:GetDescendants()) do
        if v:IsA("ImageButton") or v:IsA("ImageLabel") then
            v.ImageTransparency = 0
        elseif v:IsA("TextLabel") then
            v.TextTransparency = 0
        elseif v:IsA("UIStroke") then
            v.Transparency = 0.4
        end
    end
    v1.Adornee = a2.Parent
    v1.Parent = u65
end

function u68:Destroy() -- Line: 166 -- upvalues: u73 (ref)
    u73[self] = nil
    self.maid:Sweep()
end

function u68:Update() -- Line: 172 -- upvalues: Comma (val)
    local v1 = 1 + self.pressSpring.p
    local v2 = math.round(self.cashSpring.p)
    local container = self.container
    container.ActionText.Value.Text = string.format("$%s", Comma(v2))
    container.InputFrame.Frame.UIScale.Scale = v1
end

function u68:Show() -- Line: 183 -- upvalues: TweenService (val)
    self.container.Visible = true
    self.container.UIScale.Scale = 0
    TweenService:Create(self.container.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Scale = 1.5}):Play()
end

function u68:Hide() -- Line: 196 -- upvalues: TweenService (val)
    local v1 = TweenInfo.new(0.4, Enum.EasingStyle.Quint)
    local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quint)
    local container = self.container
    TweenService:Create(container.UIScale, v1, {Scale = 0}):Play()
    TweenService:Create(container.ObjectText.UIStroke, v2, {Transparency = 1}):Play()
    TweenService:Create(container.ActionText.Value.UIStroke, v2, {Transparency = 1}):Play()
    task.wait(0.3)
    self.container.Visible = false
end

function u68:OnPromptUpdate(a2) -- Line: 214
    local container = self.container
    local Value = container.ActionText.Value
    local ObjectText = container.ObjectText
    local v1 = tonumber((a2.ActionText:gsub("[^%d]", "")))
    if v1 == nil then
        container.ActionText.Visible = false
    else
        self.cashSpring.t = v1
    end
    Value.Text = a2.ActionText
    ObjectText.Text = a2.ObjectText
    Value.AutoLocalize = a2.AutoLocalize
    Value.RootLocalizationTable = a2.RootLocalizationTable
    ObjectText.AutoLocalize = a2.AutoLocalize
    ObjectText.RootLocalizationTable = a2.RootLocalizationTable
end

function u68:OnPromptTriggered() -- Line: 238
    self.pressSpring.t = -0.2
end

function u68:OnPromptTriggerEnd() -- Line: 242
    self.pressSpring.t = 0
end

function u68:OnPromptHold() -- Line: 247 -- upvalues: TweenService (val)
    local v1 = TweenInfo.new(0.2)
    local HoldDuration = self.prompt.HoldDuration
    local buttonProgress = self.buttonProgress
    local container = self.container
    local ObjectText = container.ObjectText
    local ActionText = container.ActionText
    local InputFrame = container.InputFrame
    buttonProgress.Value = 0
    self.pressSpring.t = 0.4
    TweenService:Create(ObjectText, v1, {TextTransparency = 1, Position = UDim2.new(0, 0, 1, -28)}):Play()
    TweenService:Create(ObjectText.UIStroke, v1, {Transparency = 1}):Play()
    TweenService:Create(ActionText, v1, {Position = UDim2.new(1, 0, 1, 0)}):Play()
    TweenService:Create(ActionText.Icon, v1, {ImageTransparency = 1}):Play()
    TweenService:Create(ActionText.Value, v1, {TextTransparency = 1}):Play()
    TweenService:Create(ActionText.Value.UIStroke, v1, {Transparency = 1}):Play()
    TweenService:Create(InputFrame, TweenInfo.new(0.4), {Position = UDim2.fromScale(0.5, 0.5)}):Play()
    TweenService:Create(self.buttonProgress, TweenInfo.new(HoldDuration), {Value = 1}):Play()
end

function u68:OnPromptHoldEnd() -- Line: 296 -- upvalues: TweenService (val)
    local v1 = TweenInfo.new(0.2)
    local buttonProgress = self.buttonProgress
    local container = self.container
    local ObjectText = container.ObjectText
    local ActionText = container.ActionText
    local InputFrame = container.InputFrame
    buttonProgress.Value = 1
    self.pressSpring.t = 0
    TweenService:Create(ObjectText, v1, {TextTransparency = 0, Position = UDim2.new(0.5, 0, 1, -28)}):Play()
    TweenService:Create(ObjectText.UIStroke, v1, {Transparency = 0.4}):Play()
    TweenService:Create(ActionText, v1, {Position = UDim2.new(0.5, 0, 1, 0)}):Play()
    TweenService:Create(ActionText.Icon, v1, {ImageTransparency = 0}):Play()
    TweenService:Create(ActionText.Value, v1, {TextTransparency = 0}):Play()
    TweenService:Create(ActionText.Value.UIStroke, v1, {Transparency = 0.4}):Play()
    TweenService:Create(InputFrame, TweenInfo.new(0.4), {Position = UDim2.new(0.5, 0, 0, 20)}):Play()
    TweenService:Create(self.buttonProgress, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Value = 0}):Play()
end

ProximityPromptService.PromptShown:Connect(function(a1, a2) -- Line: 348 -- upvalues: u68 (ref)
    if a1.Style == Enum.ProximityPromptStyle.Default then
        return nil
    end
    local v1 = u68.new(a1, a2)
    v1:Show()
    a1.PromptHidden:Wait()
    v1:Hide()
    v1:Destroy()
end)
RunService:UnbindFromRenderStep("UPDATE_PROMPT_SPRINGS")
RunService:BindToRenderStep("UPDATE_PROMPT_SPRINGS", Enum.RenderPriority.First.Value, function() -- Line: 363 -- upvalues: u73 (ref)
    for k in pairs(u73) do
        k:Update()
    end
end)
return u68