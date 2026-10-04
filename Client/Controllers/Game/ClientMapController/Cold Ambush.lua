-- Script path: ReplicatedStorage.Client.Controllers.Game.ClientMapController.Cold Ambush
-- Decompile time: 15.01 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local Easter = Network.Channel("Easter")
local u49 = nil
local u50 = {}
u50.Atmosphere = {
    Glare = 0.55,
    Haze = 2.11,
    Color = Color3.fromRGB(255, 0, 0),
    Decay = Color3.fromRGB(105, 152, 157),
}
u50.ColorCorrectionEffect = {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 195, 121)}

local function doFinalWave() -- Line: 34 -- upvalues: u50 (val), Lighting (val), TweenService (val), u49 (ref)
    local v1
    local v2 = nil
    local v3 = nil
    for i, j in u50, v2, v3 do
        local u23 = workspace:FindFirstChildWhichIsA(i)
        if not u23 then
            u23 = Instance.new(i)
            pcall(function() -- Line: 39 -- upvalues: u23 (ref)
                u23.Enabled = true
            end)
            u23.Parent = Lighting
        end
        v1 = u23
        TweenService:Create(v1, TweenInfo.new(20), j):Play()
    end
    u49.Environment.Embers.Embers.Enabled = true
end

return function(a1, a2) -- Line: 52
    -- upvalues: ReplicatedStorage (val), u49 (ref), SpringClass (val), RunService (val), Comma (val)
    -- upvalues: TweenService (val), Promise (val), GameState (val), doFinalWave (val), Easter (val)
    local CanCollide
    local Bonus = ReplicatedStorage.Assets.Effects.Particles.CropParticles.Bonus
    local PathCenter = a1:WaitForChild("PathCenter")
    u49 = a1
    if not PathCenter then
        return
    end
    local Bonus_2 = PathCenter.Bonus
    local Sound = PathCenter.Sound
    local v1 = {
        EasterBonus = function(a1, a2_2) -- Line: 72
            -- upvalues: Bonus (val), a2 (val), SpringClass (upval), RunService (upval), Comma (upval)
            -- upvalues: TweenService (upval)
            local u5 = Bonus:Clone()
            local u8 = a2.new()
            local u14 = SpringClass.new(0, 1, 20)
            u8:Mark((RunService.Heartbeat:Connect(function() -- Line: 79 -- upvalues: u14 (val), a1 (val), u5 (val), Comma (upval)
                u14.t = a1
                u5.ActionText.Value.Text = string.format("$%s", Comma((math.round(u14.p))))
            end)))
            local Attachment = Instance.new("Attachment")
            u5.Parent = Attachment
            Attachment.Position = a2_2
            Attachment.Parent = workspace.Terrain
            TweenService:Create(Attachment, TweenInfo.new(1), {Position = Attachment.Position + Vector3.new(0, 1, 0)}):Play()
            TweenService:Create(u5.ActionText.Value, TweenInfo.new(1), {TextTransparency = 0}):Play()
            TweenService:Create(u5.ActionText.Icon, TweenInfo.new(1), {ImageTransparency = 0}):Play()
            TweenService:Create(u5.ActionText.Value.UIStroke, TweenInfo.new(1), {Transparency = 0.3}):Play()
            task.delay(1.5, function() -- Line: 105 -- upvalues: TweenService (upval), Attachment (val), u5 (val), u8 (val)
                local v1 = TweenService:Create(
                    Attachment,
                    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    {Position = Attachment.Position + Vector3.new(0, 3, 0)}
                )
                TweenService:Create(u5.ActionText.Value, TweenInfo.new(1), {TextTransparency = 1}):Play()
                TweenService:Create(u5.ActionText.Icon, TweenInfo.new(1), {ImageTransparency = 1}):Play()
                TweenService:Create(u5.ActionText.Value.UIStroke, TweenInfo.new(1), {Transparency = 1}):Play()
                v1:Play()
                v1.Completed:Wait()
                u8:Sweep()
                Attachment:Destroy()
            end)
        end,
    }
    Promise.new(function(a1) -- Line: 133 -- upvalues: ReplicatedStorage (upval)
        local Attribute = ReplicatedStorage:GetAttribute("PlotAmount")
        if Attribute and Attribute > 0 then
            a1(Attribute)
        end
        local u10 = nil
        local v1 = (ReplicatedStorage:GetAttributeChangedSignal("PlotAmount")):Connect(function() -- Line: 140 -- upvalues: ReplicatedStorage (upval), u10 (ref), a1 (val)
            local Attribute = ReplicatedStorage:GetAttribute("PlotAmount")
            if Attribute and Attribute > 0 then
                u10:Disconnect()
                a1(Attribute)
            end
        end)
    end):andThen(function(a1) end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("PlotsBought")):Connect(function() end)
    local Levels = ((a1:WaitForChild("Environment")):WaitForChild("Wagon")):WaitForChild("Levels")
    local u220 = 0
    local u46 = {}
    for i, v in ipairs(Levels:GetChildren()) do
        u220 = u220 + 1
        u46[i] = v
        CanCollide = v.CanCollide
        v:SetAttribute("_CanCollide", CanCollide)
    end

    local function refreshBread() -- Line: 180 -- upvalues: ReplicatedStorage (upval), u220 (ref), u46 (val)
        local v1, v2
        local v3 = math.ceil((math.clamp(ReplicatedStorage.State.Health.Current.Value - 200, 0, 520)) / 700 * u220)
        local v4 = u220
        for i = 1, v4 do
            v1 = i <= v3
            v2 = u46[i]
            v2.Transparency = if not v1 then 1 else 0
            v2 = u46[i]
            v2.CanCollide = v1 and u46[i]:GetAttribute("_CanCollide") or false
        end
    end

    ReplicatedStorage.State.Health.Current.Changed:Connect(refreshBread)
    ReplicatedStorage.State.Health.Max.Changed:Connect(refreshBread)
    refreshBread()
    local u95 = SpringClass.new(ReplicatedStorage:GetAttribute("Bonus") or 0, 1, 15)
    local u106 = SpringClass.new(ReplicatedStorage:GetAttribute("HealthBonus") or 0, 1, 15)
    local u112 = SpringClass.new(0, 1, 30)
    local UIScale = Bonus_2.Container.UIScale
    local TextLabel = Bonus_2.Container.Status.TextLabel
    local Value = Bonus_2.Container.Cash.Value
    local Value_2 = Bonus_2.Container.Health.Value
    local MaxDistance = Bonus_2.MaxDistance

    local function formatTime(a1) -- Line: 212
        local v1 = math.floor(a1 / 3600)
        local v2 = math.floor(a1 / 60)
        if v1 > 0 then
            return string.format("%02d:%02d:%02d", v1, v2 % 60, a1 % 60)
        end
        return string.format("%02d:%02d", v2 % 60, a1 % 60)
    end

    local function updateBonusUI() -- Line: 223
        -- upvalues: Value (val), Comma (upval), u95 (val), Value_2 (val), u106 (val), Bonus_2 (val), MaxDistance (val)
        -- upvalues: u112 (val), UIScale (val)
        Value.Text = string.format("$%s", Comma((math.round(u95.p))))
        Value_2.Text = string.format("%s", Comma((math.round(u106.p))))
        local v1 = if not (MaxDistance < (Bonus_2.Parent.Position - workspace.Camera.CFrame.Position).Magnitude) then 1 else 0
        if u112.t ~= v1 then
            u112.t = v1
        end
        UIScale.Scale = u112.p
    end

    local function u128() -- Line: 239 -- upvalues: RunService (upval), updateBonusUI (val)
        RunService:UnbindFromRenderStep("UPDATE_EASTER_BONUS_UI")
        RunService:BindToRenderStep("UPDATE_EASTER_BONUS_UI", Enum.RenderPriority.Camera.Value, updateBonusUI)
    end

    local u129 = nil
    Bonus_2.MaxDistance = (1 / 0)
    UIScale.Scale = 0
    TextLabel.Text = "00:00"
    Value.Text = "$0"
    ;(ReplicatedStorage:GetAttributeChangedSignal("Bonus")):Connect(function() -- Line: 254 -- upvalues: u95 (val), ReplicatedStorage (upval)
        u95.t = ReplicatedStorage:GetAttribute("Bonus") or 0
    end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("HealthBonus")):Connect(function() -- Line: 258 -- upvalues: u106 (val), ReplicatedStorage (upval)
        u106.t = ReplicatedStorage:GetAttribute("HealthBonus") or 0
    end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("BonusTimer")):Connect(function() -- Line: 262 -- upvalues: ReplicatedStorage (upval), u129 (ref), Sound (val), TextLabel (val)
        local v1 = ReplicatedStorage:GetAttribute("BonusTimer") or 0
        if u129 and u129 < v1 then
            Sound:Play()
        end
        local v2 = math.floor(v1 / 3600)
        local v3 = math.floor(v1 / 60)
        TextLabel.Text = if not (v2 > 0) then string.format("%02d:%02d", v3 % 60, v1 % 60) else string.format("%02d:%02d:%02d", v2, v3 % 60, v1 % 60)
        u129 = v1
    end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("Boss")):Connect(function() -- Line: 274 -- upvalues: ReplicatedStorage (upval)
        if not ReplicatedStorage:GetAttribute("Boss") then
            return
        end
    end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("BossDead")):Connect(function() end)
    if 0 < (GameState.State:Get("Wave")) then
        u128()
    end
    ;(GameState.State:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 301 -- upvalues: u128 (ref), doFinalWave (upval)
        if a1 == 1 then
            u128()
        end
        if a1 == "❄️" then
            doFinalWave()
        end
    end)
    for k, i2 in pairs(v1) do
        Easter:On(k, i2)
    end
end