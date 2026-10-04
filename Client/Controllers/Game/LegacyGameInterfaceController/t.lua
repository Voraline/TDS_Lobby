-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.t
-- Decompile time: 30.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local TweenService = game:GetService("TweenService")
game:GetService("UserInputService")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
UDim2.new(0.5, 0, 0, 0)
UDim2.new(0.5, 0, 1, 0)
local u52 = Color3.fromRGB(255, 255, 255)
local u53 = {}
u53.Coordination = Color3.fromRGB(0, 240, 255)
local u59 = {Coordination = 0.45}

local function formatBuffText(a1, a2) -- Line: 23 -- types: a1: string, a2: number
    if a1 ~= "FireworkBuff" and a1 ~= "SharedOptics" then
        if a1 == "Coordination" then
            return "+" .. a2 .. "%"
        end
        return "+" .. a2 .. "%"
    end
    return ""
end

local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Buttons)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
require(ReplicatedStorage.Shared.Modules.Render)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Thread = require(ReplicatedStorage.Shared.Modules.Thread)
local Primary = require(game.ReplicatedStorage.Client.Modules.PlayerGui).Primary
local Troops = require(ReplicatedStorage.Shared.Modules.Network).Channel("Troops")
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local Game = SettingsController.Game
local User = SettingsController.User
local u154 = {}
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Effects = Assets:WaitForChild("Effects")
local Templates = Assets:WaitForChild("Templates")
Effects:WaitForChild("Client"):WaitForChild("Range")
local Cards = Templates:WaitForChild("Cards")
local Upgrade_2 = Primary:WaitForChild("Upgrade")
local Upgrade = Cards:WaitForChild("Upgrade")
local Content = Upgrade_2:WaitForChild("Content")
;(Upgrade:WaitForChild("Container")):WaitForChild("Arrow")
local Content_2 = (Upgrade:WaitForChild("Container")):WaitForChild("Content")
local u207 = {}
local u208 = {}

function u207.Start(a1, a2, a3) -- Line: 85
    -- upvalues: Signal (val), math (val), Thread (val), GameState (val), u208 (val)
    local u3 = {Time = a3}
    u3.Updated = Signal.new()
    task.spawn(function() -- Line: 94 -- upvalues: u3 (val), math (upval), Thread (upval), GameState (upval), u208 (upval), a2 (val)
        while 0 < u3.Time do
            u3.Time = math.clamp(u3.Time - 1, 0, math.huge)
            u3.Updated:Fire(u3.Time)
            Thread.Wait(math.max(GameState.TimeScale, 0.01))
        end
        u208[a2] = nil
    end)
    u208[a2] = u3
end

function u207.Get(a1, a2) -- Line: 112 -- upvalues: u208 (val)
    return u208[a2]
end

local u212 = Maid.new()

local function _createPrivateController(a1, a2) -- Line: 119
    local Name
    local u2 = {}
    for k, v in pairs(a1:GetChildren()) do
        if v:IsA("ImageLabel") then
            Name = v.Name
            u2[tonumber(Name) or Name] = v
        end
    end
    return {
        Refresh = function(a1) -- Line: 131 -- upvalues: u2 (val), a2 (val)
            for k, v in pairs(u2) do
                coroutine.wrap(a2)(v, a1[k])
            end
        end,
    }
end

local function _createGui(a1, a2) -- Line: 139
    -- upvalues: u53 (val), u52 (val), u59 (val), _createPrivateController (val), TweenService (val), Signal (val)
    -- upvalues: u207 (val), u212 (val), ClientAtoms (val), Notification (val), Sound (val), Troops (val), table (val)
    local Button_4, Price, v1
    local Title = a1:WaitForChild("Title")
    local Description = a1:WaitForChild("Description")
    local Icon = a1:WaitForChild("Icon")
    local Image = Icon:WaitForChild("Image")
    local Close = a1:WaitForChild("Close")
    local Lower = a1:WaitForChild("Lower")
    local Level = Lower:WaitForChild("Level")
    local NextUpgrade = Lower:WaitForChild("NextUpgrade")
    local TargetTitle = Lower:WaitForChild("TargetTitle")
    local Sell = Lower:WaitForChild("Sell")
    local Label = Sell:WaitForChild("Label")
    local Button = Sell:WaitForChild("Button")
    local Target = Lower:WaitForChild("Target")
    local Label_2 = Target:WaitForChild("Label")
    local Button_2 = Target:WaitForChild("Button")
    local Upgrade = Lower:WaitForChild("Upgrade")
    local Label_3 = Upgrade:WaitForChild("Label")
    local Button_3 = Upgrade:WaitForChild("Button")
    local v2 = {
        Buffs = function(a1) -- Line: 166 -- upvalues: Icon (val), u53 (upval), u52 (upval), u59 (upval)
            local Label, Value, v1, v2
            for k, v in pairs(a1) do
                v1 = (Icon:WaitForChild("Buffs")):FindFirstChild(k)
                if v1 then
                    if not (0 < v.Value) then
                        v1.Visible = false
                    else
                        v1.Visible = true
                        Label = v1:WaitForChild("Label")
                        v2 = u53[k] or u52
                        Label.TextColor3 = v2
                        Label.TextStrokeTransparency = u59[k] or 0.8
                        Value = v.Value
                        Label.Text = if k == "FireworkBuff" then "" else if k ~= "SharedOptics" then if k ~= "Coordination" then "+" .. Value .. "%" else "+" .. Value .. "%" else ""
                    end
                end
            end
        end,
        Stats = _createPrivateController(a1:WaitForChild("Stats"), function(a1, a2) -- Line: 191
            a1.Visible = if not a2 then false else not not (a2 > 0)
            if a2 then
                local Label = a1:FindFirstChild("Label")
                if Label then
                    Label.Text = a2
                end
            end
        end),
        Upgrades = _createPrivateController(a1:WaitForChild("Upgrades"), function(a1, a2) -- Line: 206 -- upvalues: TweenService (upval)
            local v1 = TweenService
            local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            local v3 = {}
            local v4 = a2 and Color3.fromRGB(163, 255, 92) or Color3.fromRGB(180, 180, 180)
            v3.ImageColor3 = v4
            v1:Create(a1, v2, v3):Play()
        end),
    }
    local v3 = {}
    local Abilities = a1:WaitForChild("Abilities")
    local u95 = {}
    for k, v in pairs(Abilities:GetChildren()) do
        if v:IsA("ImageLabel") then
            v1 = tonumber(v.Name)
            local Icon_2 = v:WaitForChild("Icon")
            Button_4 = v:WaitForChild("Button")
            local Count = v:WaitForChild("Count")
            Price = v:WaitForChild("Price")
            local Cover = v:WaitForChild("Cover")
            local u175 = {}
            local u178 = Signal.new()
            u178:Connect(function(a1) -- Line: 242
                -- upvalues: Icon_2 (val), u175 (val), u207 (upval), Count (val), Cover (val), TweenService (upval)
                -- upvalues: u212 (upval), v (val)
                local Enabled = a1.Enabled
                if Enabled then
                    local Image = a1.Icon and "rbxassetid://" .. a1.Icon or Icon_2.Image
                    Icon_2.Image = Image
                    local Name = a1.Name or u175.Name
                    u175.Name = Name
                    local Debounce = a1.Debounce or u175.Debounce
                    u175.Debounce = Debounce
                    if a1.Troop then
                        u175.Troop = a1.Troop
                    end
                    local v1 = u207:Get(u175.Troop)
                    Count.Visible = not not v1
                    Cover.Visible = not not v1
                    if v1 then
                        local Time = v1.Time
                        if Time then
                            local function _updateTimer(a1) -- Line: 276
                                -- upvalues: Count (upval), TweenService (upval), Cover (upval)
                                if a1 > 0 then
                                    Count.Text = a1
                                    return
                                end
                                TweenService:Create(
                                    Count,
                                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
                                    {TextTransparency = 1}
                                ):Play()
                                TweenService:Create(
                                    Count,
                                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
                                    {TextStrokeTransparency = 1}
                                ):Play()
                                TweenService:Create(
                                    Cover,
                                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
                                    {BackgroundTransparency = 1}
                                ):Play()
                            end

                            u212:Mark((v1.Updated:Connect(_updateTimer)))
                            _updateTimer(Time)
                            TweenService:Create(
                                Count,
                                TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
                                {TextTransparency = 0}
                            ):Play()
                            TweenService:Create(
                                Count,
                                TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
                                {TextStrokeTransparency = 0.9}
                            ):Play()
                            TweenService:Create(
                                Cover,
                                TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut),
                                {BackgroundTransparency = 0.5}
                            ):Play()
                        end
                    end
                end
                v.Visible = Enabled
                u175.Enabled = Enabled
            end)
            Button_4.MouseButton1Click:Connect(function() -- Line: 362
                -- upvalues: u175 (val), ClientAtoms (upval), Notification (upval), Sound (upval), u207 (upval)
                -- upvalues: Troops (upval), u178 (val)
                if u175.Enabled then
                    if ClientAtoms.cloneTowerAtom().blockOtherAbilities == true then
                        Notification.Create({Text = "Finish or cancel reposition before using another ability."})
                        Sound("Error"):Play(true)
                        return
                    end
                    local Name = u175.Name
                    local Troop = u175.Troop
                    if Name and Troop then
                        if not u207:Get(Troop) then
                            if not Troops:InvokeServer("Abilities", "Activate", {Troop = Troop, Index = Name}) then
                                Notification.Create({Text = "Can't use ability at the moment!"})
                                Sound("Error"):Play(true)
                                return
                            end
                            local Debounce = u175.Debounce
                            if Debounce then
                                u207:Start(Troop, Debounce)
                            end
                            u178:Fire({Enabled = true})
                            return
                        end
                        Notification.Create({Text = "This ability is on cooldown!"})
                        Sound("Error"):Play(true)
                    end
                end
            end)
            u95[v1] = {
                Icon = Icon_2,
                Button = Button_4,
                Count = Count,
                Price = Price,
                Updated = u178,
            }
        end
    end

    function v3.Update(a1, a2, a3) -- Line: 424 -- upvalues: u95 (val), table (upval)
        local Updated, v1
        local v2, v3, v4 = a1, a2, a3
        for k, v in pairs(u95) do
            Updated = v.Updated
            if Updated then
                v1 = v2[k]
                if not v1 or not (v1.Level <= v3) then
                    Updated:Fire({Enabled = false})
                else
                    Updated:Fire((table.merge(v1, {Enabled = true, Troop = v4})))
                end
            end
        end
    end

    return {
        contentFrame = a1,
        totalDamage = (a1:WaitForChild("Icon")):WaitForChild("TotalDamage"),
        titleLabel = Title,
        descriptionLabel = Description,
        iconBackground = Icon,
        iconImageLabel = Image,
        closeButton = Close,
        lowerFrame = Lower,
        levelLabel = Level,
        nextUpgradeLabel = NextUpgrade,
        targetTitleLabel = TargetTitle,
        sellFrame = Sell,
        sellLabel = Label,
        sellButton = Button,
        targetFrame = Target,
        targetLabel = Label_2,
        targetButton = Button_2,
        upgradeFrame = Upgrade,
        upgradeLabel = Label_3,
        upgradeButton = Button_3,
        upgradeControllers = v2,
        abilityControllers = v3,
        Open = a2.Open or nil,
        Close = a2.Close or nil,
    }
end

local u215 = {}
u215.ScreenGui = _createGui(Content, {
    Open = function(a1) -- Line: 492 -- upvalues: Content (val), TweenService (val)
        Content.Position = UDim2.new(0.5, 0, -0.2, 0)
        TweenService:Create(
            Content,
            TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.5, 0, 0, 0)}
        ):Play()
    end,
    Close = function(a1) -- Line: 504 -- upvalues: TweenService (val), Content (val)
        TweenService:Create(
            Content,
            TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
            {Position = UDim2.new(0.5, 0, 1, 0)}
        ):Play()
    end,
})
u215.BillboardGui = _createGui(Content_2, {
    Open = function() -- Line: 516 -- upvalues: Upgrade (val), Content_2 (val), TweenService (val)
        Upgrade.Enabled = true
        local Parent = Content_2.Parent.Parent
        Parent.SizeOffset = Vector2.new(0, 0.65)
        TweenService:Create(
            Parent,
            TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
            {SizeOffset = Vector2.new(0, 0.575)}
        ):Play()
    end,
    Close = function() -- Line: 530 -- upvalues: Upgrade (val)
        Upgrade.Enabled = false
    end,
})
u154.Gui = u215.BillboardGui

function u154:Prompt(a2) -- Line: 538
    -- upvalues: u215 (val), Upgrade (val), Primary (val), u212 (val), Sound (val), Asset (val), Troops (val)
    -- upvalues: table (val), math (val), Comma (val)
    local Magnitude
    local Mode = _G.Mode
    if a2 == self.Target then
        return true
    end
    self.Target = a2
    local u335 = u215[Mode]
    if self.Type and Mode ~= self.Type then
        self:Close()
    end
    self.Gui = u335
    self.Type = Mode
    if self.Type == "BillboardGui" then
        Upgrade.Parent = Primary.Parent
        Upgrade.Adornee = a2:FindFirstChild("HumanoidRootPart")
    end
    u212:Sweep()
    u212:Mark((u335.closeButton.MouseButton1Click:Connect(function() -- Line: 566 -- upvalues: Sound (upval), self (val)
        Sound("Click"):Play()
        self:Close()
    end)))
    local CurrentCamera = workspace.CurrentCamera
    local Paths = workspace:FindFirstChild("Map"):WaitForChild("Paths")
    local Position = a2:WaitForChild("HumanoidRootPart"):WaitForChild("GridPart").CFrame.Position
    local v1 = nil
    for k, v in pairs(Paths:GetDescendants()) do
        if v:IsA("BasePart") then
            Magnitude = (Position - v.Position).Magnitude
            if not v1 or Magnitude < v1.Distance then
                v1 = {Instance = v, Distance = Magnitude}
            end
        end
    end
    local Instance = v1 and v1.Instance
    local CFrame = Instance.CFrame
    local Position_2 = Instance.Position
    local Display = a2:WaitForChild("Display")
    local u91 = {}
    u91.Range = Display:WaitForChild("Range")
    u91.Damage = Display:WaitForChild("Damage")
    u91.Fatigue = Display:WaitForChild("Fatigue")
    u91.Discount = Display:WaitForChild("Discount")
    u91.Cooldown = Display:WaitForChild("Cooldown")
    u91.Coordination = Display:WaitForChild("Coordination")
    u91.SharedOptics = Display:WaitForChild("SharedOptics")
    u91.FireworkBuff = Display:WaitForChild("FireworkBuff")
    local Type = a2:WaitForChild("Type")
    local Owner = a2:WaitForChild("Owner")
    local Worth = a2:WaitForChild("Worth")
    local Range = a2:WaitForChild("Range")
    local Damage = a2:WaitForChild("Damage")
    local Upgrade_2 = a2:WaitForChild("Upgrade")
    local Cooldown = a2:WaitForChild("Cooldown")
    local Income = a2:WaitForChild("Income")
    local SpawnTime = a2:WaitForChild("SpawnTime")
    local TotalDamage = a2:WaitForChild("TotalDamage")

    local function v2() -- Line: 629 -- upvalues: Range (val), u91 (val)
        return Range.Value + Range.Value * (u91.Range.Value / 100)
    end

    local Value = Type.Value
    local Value_2 = Owner.Value
    local v3 = Asset("Troops", Value)
    local Skins = v3.Skins
    local Stats = v3.Stats

    local function _refreshTarget(a1) -- Line: 641 -- upvalues: u335 (val), Troops (upval), a2 (val)
        u335.targetLabel.Text = not (type(a1) ~= "string") and a1 or Troops:InvokeServer("Target", "Get", {Troop = a2})
    end

    local function _refreshUpgrade() -- Line: 649
        -- upvalues: Upgrade_2 (val), Stats (val), u335 (val), table (upval), math (upval), u91 (val), Comma (upval)
        local Value = Upgrade_2.Value
        local v1 = Value + 1
        local v2 = Stats.Upgrades[#Stats.Upgrades < v1 and Value or v1]
        u335.nextUpgradeLabel.Text = "Next Upgrade:\n" .. v2.Title
        u335.iconImageLabel.Image = "rbxassetid://" .. v2.Image
        u335.descriptionLabel.Text = string.upper(table.concat(v2.Description, "\n"))
        local v3 = math.floor(math.clamp(v2.Cost - v2.Cost * (u91.Discount.Value / 100), 0, math.huge))
        if Value == 5 then
            v3 = nil
        end
        u335.levelLabel.Text = "Level " .. Value
        u335.upgradeLabel.Text = if v3 then "Upgrade: $" .. Comma(v3) else "Fully Upgraded!"
    end

    local function _refreshContent() -- Line: 680
        -- upvalues: u335 (val), Value (val), Comma (upval), Worth (val), _refreshTarget (val), _refreshUpgrade (val)
        u335.titleLabel.Text = Value
        u335.sellLabel.Text = "Sell: $" .. Comma(Worth.Value)
        task.spawn(_refreshTarget)
        task.spawn(_refreshUpgrade)
    end

    local function _refreshController() -- Line: 689
        -- upvalues: u335 (val), Range (val), Damage (val), Cooldown (val), Income (val), SpawnTime (val)
        -- upvalues: TotalDamage (val), Upgrade_2 (val), Stats (val), a2 (val), u91 (val), Value (val), Comma (upval)
        -- upvalues: Worth (val), _refreshTarget (val), _refreshUpgrade (val)
        u335.upgradeControllers.Stats.Refresh({
            Range = Range.Value,
            Damage = Damage.Value,
            Cooldown = Cooldown.Value,
            Income = Income.Value,
            SpawnTime = SpawnTime.Value,
        })
        u335.totalDamage.Text = "Total Damage: " .. TotalDamage.Value
        local Refresh_2 = u335.upgradeControllers.Upgrades.Refresh
        local Value_2 = Upgrade_2.Value
        Refresh_2({Value_2 >= 1, Value_2 >= 2, Value_2 >= 3, Value_2 >= 4, Value_2 >= 5})
        u335.abilityControllers.Update(Stats.Abilities or {}, Upgrade_2.Value, a2)
        u335.upgradeControllers.Buffs(u91)
        u335.titleLabel.Text = Value
        u335.sellLabel.Text = "Sell: $" .. Comma(Worth.Value)
        task.spawn(_refreshTarget)
        task.spawn(_refreshUpgrade)
    end

    u212:Mark((u335.targetButton.MouseButton1Click:Connect(function() -- Line: 720 -- upvalues: Sound (upval), Troops (upval), a2 (val), u335 (val)
        Sound("Click"):Play()
        local v1 = Troops:InvokeServer("Target", "Set", {Troop = a2})
        u335.targetLabel.Text = not (type(v1) ~= "string") and v1 or Troops:InvokeServer("Target", "Get", {Troop = a2})
    end)))
    u212:Mark((u335.upgradeButton.MouseButton1Click:Connect(function() -- Line: 728 -- upvalues: Troops (upval), a2 (val), Sound (upval), _refreshUpgrade (val)
        if not Troops:InvokeServer("Upgrade", "Set", {Troop = a2}) then
            Sound("Error"):Play()
            return
        end
        Sound("Purchase"):Play()
        _refreshUpgrade()
    end)))
    u212:Mark((u335.sellButton.MouseButton1Click:Connect(function() -- Line: 742 -- upvalues: Sound (upval), Troops (upval), a2 (val), self (val)
        Sound("Sell"):Play()
        return Troops:InvokeServer("Sell", {Troop = a2}) and self:Close()
    end)))
    for k2, i in pairs(u91) do
        u212:Mark((i.Changed:Connect(_refreshController)))
    end
    u212:Mark((Worth.Changed:Connect(_refreshController)))
    u212:Mark((Range.Changed:Connect(_refreshController)))
    u212:Mark((Damage.Changed:Connect(_refreshController)))
    u212:Mark((Upgrade_2.Changed:Connect(_refreshController)))
    u212:Mark((Cooldown.Changed:Connect(_refreshController)))
    u212:Mark((Income.Changed:Connect(_refreshController)))
    u212:Mark((SpawnTime.Changed:Connect(_refreshController)))
    u212:Mark((TotalDamage.Changed:Connect(_refreshController)))
    _refreshController()
    self.Test = u335
    return self:Open()
end

function u154:Open() -- Line: 768 -- upvalues: Sound (val)
    self.Gui.Open()
    Sound("UpgradeOpen"):Play()
    return true
end

function u154:Close() -- Line: 776 -- upvalues: u212 (val)
    self.Gui.Close()
    u212:Sweep()
    self.Target = nil
end

function u154.Set(a1) -- Line: 784 -- upvalues: u154 (val)
    local v1 = if not a1 then "ScreenGui" else "BillboardGui"
    if u154.Target then
        u154:Prompt(u154.Target, v1)
    end
end

u154.Set(Game:Get("Upgrade Interface"))
Game:On("Upgrade Interface", u154.Set)
return u154