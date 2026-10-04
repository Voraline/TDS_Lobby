-- Script path: ReplicatedStorage.Client.Controllers.Game.EasterClientController
-- Decompile time: 10.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
;((require(ReplicatedStorage.Shared.Modules.MapManager)).GetLoadedMap()):andThen(function(a1) -- Line: 9 -- upvalues: ReplicatedStorage (val), RunService (val), TweenService (val)
    local Bonus = ReplicatedStorage.Assets.Effects.Particles.CropParticles.Bonus
    local PathCenter = a1:FindFirstChild("PathCenter")
    if not PathCenter then
        return
    end
    local Bonus_2 = PathCenter.Bonus
    local Sound = PathCenter.Sound
    local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
    local Network = require(ReplicatedStorage.Shared.Modules.Network)
    local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
    local Comma = require(ReplicatedStorage.Client.Modules.Comma)
    local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
    local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
    local Easter = Network.Channel("Easter")
    local v1 = {
        EasterBonus = function(a1, a2) -- Line: 31
            -- upvalues: Bonus (val), Maid (val), SpringClass (val), RunService (upval), Comma (val)
            -- upvalues: TweenService (upval)
            local u5 = Bonus:Clone()
            local u8 = Maid.new()
            local u14 = SpringClass.new(0, 1, 20)
            u8:Mark((RunService.Heartbeat:Connect(function() -- Line: 38 -- upvalues: u14 (val), a1 (val), u5 (val), Comma (upval)
                u14.t = a1
                u5.ActionText.Value.Text = string.format("$%s", Comma((math.round(u14.p))))
            end)))
            local Attachment = Instance.new("Attachment")
            u5.Parent = Attachment
            Attachment.Position = a2
            Attachment.Parent = workspace.Terrain
            TweenService:Create(Attachment, TweenInfo.new(1), {Position = Attachment.Position + Vector3.new(0, 1, 0)}):Play()
            TweenService:Create(u5.ActionText.Value, TweenInfo.new(1), {TextTransparency = 0}):Play()
            TweenService:Create(u5.ActionText.Icon, TweenInfo.new(1), {ImageTransparency = 0}):Play()
            TweenService:Create(u5.ActionText.Value.UIStroke, TweenInfo.new(1), {Transparency = 0.3}):Play()
            task.delay(1.5, function() -- Line: 64 -- upvalues: TweenService (upval), Attachment (val), u5 (val), u8 (val)
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
    local u60 = SpringClass.new(0, 1, 15)
    local u65 = SpringClass.new(0, 1, 30)
    local UIScale = Bonus_2.Container.UIScale
    local TextLabel = Bonus_2.Container.Status.TextLabel
    local Value = Bonus_2.Container.Cash.Value
    local MaxDistance = Bonus_2.MaxDistance

    local function formatTime(a1) -- Line: 102
        local v1 = math.floor(a1 / 3600)
        local v2 = math.floor(a1 / 60)
        if v1 > 0 then
            return string.format("%02d:%02d:%02d", v1, v2 % 60, a1 % 60)
        end
        return string.format("%02d:%02d", v2 % 60, a1 % 60)
    end

    local function updateBonusUI() -- Line: 113
        -- upvalues: Value (val), Comma (val), u60 (val), Bonus_2 (val), MaxDistance (val), u65 (val), UIScale (val)
        Value.Text = string.format("$%s", Comma((math.round(u60.p))))
        local v1 = if not (MaxDistance < (Bonus_2.Parent.Position - workspace.Camera.CFrame.Position).Magnitude) then 1 else 0
        if u65.t ~= v1 then
            u65.t = v1
        end
        UIScale.Scale = u65.p
    end

    local function u77() -- Line: 128 -- upvalues: RunService (upval), updateBonusUI (val)
        RunService:UnbindFromRenderStep("UPDATE_EASTER_BONUS_UI")
        RunService:BindToRenderStep("UPDATE_EASTER_BONUS_UI", Enum.RenderPriority.Camera.Value, updateBonusUI)
    end

    local u78 = nil
    Bonus_2.MaxDistance = (1 / 0)
    UIScale.Scale = 0
    TextLabel.Text = "00:00"
    Value.Text = "$0"
    ;(ReplicatedStorage:GetAttributeChangedSignal("Bonus")):Connect(function() -- Line: 143 -- upvalues: u60 (val), ReplicatedStorage (upval)
        u60.t = ReplicatedStorage:GetAttribute("Bonus") or 0
    end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("BonusTimer")):Connect(function() -- Line: 147 -- upvalues: ReplicatedStorage (upval), u78 (ref), Sound (val), TextLabel (val)
        local v1 = ReplicatedStorage:GetAttribute("BonusTimer") or 0
        if u78 and u78 < v1 then
            Sound:Play()
        end
        local v2 = math.floor(v1 / 3600)
        local v3 = math.floor(v1 / 60)
        TextLabel.Text = if not (v2 > 0) then string.format("%02d:%02d", v3 % 60, v1 % 60) else string.format("%02d:%02d:%02d", v2, v3 % 60, v1 % 60)
        u78 = v1
    end)
    local v2 = ((a1:WaitForChild("Environment")):WaitForChild("Platform")):WaitForChild("Pile Levels")
    local u230 = 0
    local u114 = {}
    for i, v in ipairs(v2:GetChildren()) do
        u230 = u230 + 1
        u114[i] = v
    end

    local function refreshBread() -- Line: 172 -- upvalues: ReplicatedStorage (upval), u230 (ref), u114 (val)
        local v1, v2
        local v3 = math.ceil(ReplicatedStorage.State.Health.Current.Value / 1910 * u230)
        local v4 = u230
        for i = 1, v4 do
            v1 = i <= v3
            v2 = u114[i]
            v2.Transparency = if not v1 then 1 else 0
            u114[i].CanCollide = v1
        end
    end

    ReplicatedStorage.State.Health.Current.Changed:Connect(refreshBread)
    ReplicatedStorage.State.Health.Max.Changed:Connect(refreshBread)
    refreshBread()
    Promise.new(function(a1) -- Line: 200 -- upvalues: ReplicatedStorage (upval)
        local Attribute = ReplicatedStorage:GetAttribute("PlotAmount")
        if Attribute and Attribute > 0 then
            a1(Attribute)
        end
        local u10 = nil
        local v1 = (ReplicatedStorage:GetAttributeChangedSignal("PlotAmount")):Connect(function() -- Line: 207 -- upvalues: ReplicatedStorage (upval), u10 (ref), a1 (val)
            local Attribute = ReplicatedStorage:GetAttribute("PlotAmount")
            if Attribute and Attribute > 0 then
                u10:Disconnect()
                a1(Attribute)
            end
        end)
    end):andThen(function(a1) end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("PlotsBought")):Connect(function() end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("Boss")):Connect(function() -- Line: 233 -- upvalues: ReplicatedStorage (upval)
        if not ReplicatedStorage:GetAttribute("Boss") then
            return
        end
    end)
    ;(ReplicatedStorage:GetAttributeChangedSignal("BossDead")):Connect(function() -- Line: 248 -- upvalues: ReplicatedStorage (upval)
        if not ReplicatedStorage:GetAttributeChangedSignal("BossDead") then
            return
        end
    end)
    if 0 < (GameState.State:Get("Wave")) then
        u77()
    end
    ;(GameState.State:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 261 -- upvalues: u77 (ref)
        if a1 == 1 then
            u77()
        end
    end)
    for k, i2 in pairs(v1) do
        Easter:On(k, i2)
    end
end)
return {}