-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Giftbox
-- Decompile time: 20.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local UI = Shared.UI
local Confetti = require(UI.Components.Confetti)
local GiftboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.GiftboxStore)
local Network = require(Shared.Modules.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local RichText = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.RichText)
local Seasons = require(Shared.Data.Seasons)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Gifts = Network.Channel("Gifts")
local Seasons_2 = Network.Channel("Seasons")
local u70 = TweenInfo.new(0.4, Enum.EasingStyle.Quad)
local u75 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local u80 = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u85 = Color3.fromRGB(255, 170, 0)
local v1 = {}
v1.__index = v1
v1.Opened = Signal.new()
v1.Closed = Signal.new()

local function merge(a1, a2) -- Line: 63 -- types: a1: table, a2: table
    local v1 = {}
    for i, v in ipairs(a1) do
        table.insert(v1, v)
    end
    for i2, i3 in ipairs(a2) do
        table.insert(v1, i3)
    end
    return v1
end

local function disconnect(a1) -- Line: 77
    if a1 == nil then
        return
    end
    if typeof(a1) == "RBXScriptConnection" then
        a1:Disconnect()
        return
    end
    if type(a1) == "function" then
        a1()
        return
    end
    if typeof(a1) == "Instance" then
        a1:Destroy()
    end
end

local function applyProperties(a1, a2) -- Line: 91 -- types: a1: userdata?
    if not a1 then
        return
    end
    for i, j in a2 do
        a1[i] = j
    end
end

local function playTween(a1, a2, a3, a4) -- Line: 101
    -- upvalues: TweenService (val)
    if not a2 then
        return
    end
    if a3 then
        local v1 = TweenService:Create(a2, a3, a4)
        table.insert(a1.Tweens, v1)
        v1:Play()
        return
    end
    if not a2 then
        return
    end
    for i, j in a4 do
        a2[i] = j
    end
end

local function cancelTweens(a1) -- Line: 116 -- types: a1: table
    for i, j in a1.Tweens do
        j:Cancel()
    end
    table.clear(a1.Tweens)
end

local function removeFromList(a1, a2) -- Line: 124 -- types: a1: table, a2: table
    local v1 = table.find(a1, a2)
    if not v1 then
        return false
    end
    table.remove(a1, v1)
    return true
end

function v1:_addCleanup(a2) -- Line: 134
    table.insert(self._cleanups, a2)
end

function v1:_clearItems() -- Line: 138
    for i, j in self._renderedItems do
        j:Destroy()
    end
    table.clear(self._renderedItems)
end

function v1:_setContainerTransparency(a2, a3) -- Line: 146 -- types: self: table, a2: number, a3: userdata?
    self._transparency = a2
    for i, j in self._renderedItems do
        j:SetTransparency(a2, a3)
    end
end

function v1:_playContainerTween(a2) -- Line: 154
    -- upvalues: u70 (val), TweenService (val)
    local Container = self.Container
    if not Container then
        return
    end
    self._visibilityTweenToken = self._visibilityTweenToken + 1
    local _visibilityTweenToken = self._visibilityTweenToken
    if self._containerTween then
        self._containerTween:Cancel()
        self._containerTween = nil
    end
    Container.Visible = true
    self:_setContainerTransparency(if not a2 then 1 else 0, u70)
    local v1 = TweenService:Create(Container, u70, {
        Position = UDim2.new(1, -10, 1, if not a2 then 40 else 8),
        BackgroundTransparency = if not a2 then 1 else 0.2,
    })
    self._containerTween = v1
    v1:Play()
    task.delay(u70.Time, function() -- Line: 180 -- upvalues: self (val), _visibilityTweenToken (val), Container (val), a2 (val)
        if self._visibilityTweenToken == _visibilityTweenToken and self.Container == Container then
            if not a2 then
                Container.Visible = false
            end
            return
        end
    end)
end

function v1:_applyContainerState(a2) -- Line: 191 -- types: self: table, a2: boolean
    local Container = self.Container
    if not Container then
        return
    end
    self._visibilityTweenToken = self._visibilityTweenToken + 1
    if self._containerTween then
        self._containerTween:Cancel()
        self._containerTween = nil
    end
    Container.Visible = a2
    Container.Position = UDim2.new(1, -10, 1, if not a2 then 40 else 8)
    Container.BackgroundTransparency = if not a2 then 1 else 0.2
    self:_setContainerTransparency(if not a2 then 1 else 0, nil)
end

function v1:_setItems(a2, a3) -- Line: 210 -- types: self: table, a2: table?, a3: table?
    if a2 then
        self.Gifts = a2
    end
    if a3 then
        self.Seasons = a3
    end
    self:_refreshItems()
end

function v1:_refreshItems() -- Line: 222 -- upvalues: merge (val), GiftboxStore (val)
    local Container = self.Container
    if Container and self.Template then
        local Rewards, v1, v2
        local v3 = merge(self.Gifts, self.Seasons)
        local v4 = #v3
        GiftboxStore.setShowButton(v4 > 0)
        if v4 < 1 and self.Visible then
            self:Close()
        end
        self:_clearItems()
        for i, v in ipairs(v3) do
            v1 = {Cover = v.Cover, Sender = v.Sender, Reward = v.Reward}
            Rewards = v.Rewards or {}
            v1.Rewards = Rewards
            v1.RewardIcon = v.RewardIcon

            function v1.Clicked() -- Line: 247 -- upvalues: v (val), self (val)
                local v1 = true
                if v.Clicked then
                    v1 = v.Clicked()
                end
                if not v1 then
                    return false
                end
                task.delay(0.4, function() -- Line: 257 -- upvalues: self (upval), v (upval)
                    local v1
                    local Seasons = self.Seasons
                    local v2 = table.find(Seasons, v)
                    if v2 then
                        table.remove(Seasons, v2)
                        v1 = true
                    else
                        v1 = false
                    end
                    if v1 then
                        self:_refreshItems()
                    else
                        local Gifts = self.Gifts
                        v2 = table.find(Gifts, v)
                        if v2 then
                            table.remove(Gifts, v2)
                            v1 = true
                        else
                            v1 = false
                        end
                        if v1 then
                            self:_refreshItems()
                        end
                    end
                end)
                return true
            end

            v2 = self:CreateTemplate(v1)
            v2.Root.Parent = Container
            v2:SetTransparency(self._transparency, nil)
            table.insert(self._renderedItems, v2)
        end
        return
    end
end

function v1.Initialize(a1, a2) -- Line: 273 -- upvalues: GiftboxStore (val), Gifts (val) -- types: a1: table, a2: table?
    local Container = a1.Container
    a1:Destroy()
    a1.Container = Container
    a1.Gifts = {}
    a1.Seasons = {}
    a1.Visible = false
    a1._cleanups = {}
    a1._renderedItems = {}
    a1._transparency = 1
    a1._visibilityTweenToken = 0
    local Template = Container:FindFirstChild("Template")
    assert(Template, "Giftbox container is missing Template")
    Template.Parent = nil
    a1.Template = Template
    a1:_applyContainerState(false)
    GiftboxStore.setShowButton(false)
    if a2 then
        if a2.Gifts or a2.Seasons then
            a1:_setItems(a2.Gifts or {}, a2.Seasons or {})
        end
    end
    if a2 and a2.Open then
        a1:Open()
    end
    if not a2 or a2.ListenForUpdates ~= false then
        a1:_addCleanup((Gifts:On("Update", function() -- Line: 304 -- upvalues: a1 (val)
            a1:LoadGiftbox()
        end)))
    end
    if not a2 or a2.Load ~= false then
        task.spawn(function() -- Line: 311 -- upvalues: a1 (val)
            a1:LoadGiftbox()
            a1:LoadSeasons()
        end)
    end
end

function v1:CreateTemplate(a2) -- Line: 318
    -- upvalues: RichText (val), Confetti (val), TweenService (val), u75 (val), u85 (val), u80 (val), u70 (val)
    -- upvalues: Sound (val)
    local v1
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(1, 0, 0, 100)
    Frame.Position = UDim2.fromScale(0, 0)
    Frame.Visible = false
    local u20 = self.Template:Clone()
    local Button = u20.Frame.Button
    local BindableEvent = Instance.new("BindableEvent")
    local UIScale = Instance.new("UIScale")
    local u29 = {
        FadeOut = false,
        Root = Frame,
        UI = u20,
        Button = Button,
        Event = BindableEvent,
    }
    u29.Tweens = {}
    local v2 = false
    local v3 = nil
    for i, j in a2.Rewards or {} do
        if j.type == "tag" then
            v1 = j.tag:lower()
            v2 = true
            v3 = RichText({
                Animated = false,
                Size = u20.Value.Size,
                Position = u20.Value.Position,
                AnchorPoint = u20.Value.AnchorPoint,
                Text = string.format("<%s>%s</%s>", v1, a2.Reward, v1),
            })
            break
        end
    end
    local v4 = Confetti
    local v5 = {
        AlwaysOnTop = true,
        Event = BindableEvent,
        Emitters = {
            {
                Amount = 40,
                Lifetime = 1,
                Force = 20,
                Radius = 5,
                Direction = Vector2.new(-0.9, 0),
            },
        },
    }
    v4(v5).Parent = Frame
    u20.Size = UDim2.fromScale(1, 1)
    u20.Position = UDim2.fromScale(0, 0)
    u20.Image = string.format("rbxassetid://%d", a2.Cover or 0)
    u20.BackgroundTransparency = 1
    u20.Parent = Frame
    u20.Reward.Icon.Image = string.format("rbxassetid://%d", a2.RewardIcon or 0)
    u20.Season.Text = a2.Sender or ""
    u20.Season.Visible = a2.Sender ~= nil
    u20.Value.Text = not v2 and a2.Reward or ""
    if v3 then
        v3.Parent = u20
    end
    UIScale.Parent = Button

    function u29:SetTransparency(a2, a3) -- Line: 395
        -- upvalues: u20 (val), TweenService (upval), Button (val)
        local v1, v2
        if (if not self.FadeOut then a2 else 1) < 1 then
            self.Root.Visible = true
        end
        local v3 = nil
        for i, j in self.Tweens, nil, v3 do
            j:Cancel()
        end
        table.clear(self.Tweens)
        local v4 = u20
        local v5 = {ImageTransparency = v1}
        if v4 then
            if a3 then
                v3 = TweenService:Create(v4, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif v4 then
                for k, n in v5 do
                    v4[k] = n
                end
            end
        end
        local UIStroke = u20.UIStroke
        v5 = {Transparency = v1}
        if UIStroke then
            if a3 then
                v3 = TweenService:Create(UIStroke, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif UIStroke then
                for m, i5 in v5 do
                    UIStroke[m] = i5
                end
            end
        end
        local Glow = u20.Reward.Glow
        v5 = {ImageTransparency = v1}
        if Glow then
            if a3 then
                v3 = TweenService:Create(Glow, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif Glow then
                for i6, i7 in v5 do
                    Glow[i6] = i7
                end
            end
        end
        local Icon = u20.Reward.Icon
        v5 = {ImageTransparency = v1}
        if Icon then
            if a3 then
                v3 = TweenService:Create(Icon, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif Icon then
                for i8, i9 in v5 do
                    Icon[i8] = i9
                end
            end
        end
        local Season = u20.Season
        v5 = {TextTransparency = v1}
        if Season then
            if a3 then
                v3 = TweenService:Create(Season, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif Season then
                for i10, i11 in v5 do
                    Season[i10] = i11
                end
            end
        end
        local UIStroke_2 = u20.Season.UIStroke
        v5 = {Transparency = v1}
        if UIStroke_2 then
            if a3 then
                v3 = TweenService:Create(UIStroke_2, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif UIStroke_2 then
                for i12, i13 in v5 do
                    UIStroke_2[i12] = i13
                end
            end
        end
        local Value = u20.Value
        v5 = {TextTransparency = v1}
        if Value then
            if a3 then
                v3 = TweenService:Create(Value, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif Value then
                for i14, i15 in v5 do
                    Value[i14] = i15
                end
            end
        end
        local UIStroke_3 = u20.Value.UIStroke
        v5 = {Transparency = v1}
        if UIStroke_3 then
            if a3 then
                v3 = TweenService:Create(UIStroke_3, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif UIStroke_3 then
                for i16, i17 in v5 do
                    UIStroke_3[i16] = i17
                end
            end
        end
        v4 = Button
        v5 = {ImageTransparency = v1}
        if v4 then
            if a3 then
                v3 = TweenService:Create(v4, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif v4 then
                for i18, i19 in v5 do
                    v4[i18] = i19
                end
            end
        end
        local Value_2 = Button.Value
        v5 = {TextTransparency = v1}
        if Value_2 then
            if a3 then
                v3 = TweenService:Create(Value_2, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif Value_2 then
                for i20, i21 in v5 do
                    Value_2[i20] = i21
                end
            end
        end
        local UIStroke_4 = Button.Value.UIStroke
        v5 = {Transparency = v1}
        if UIStroke_4 then
            if a3 then
                v3 = TweenService:Create(UIStroke_4, a3, v5)
                table.insert(self.Tweens, v3)
                v3:Play()
            elseif UIStroke_4 then
                for i22, i23 in v5 do
                    UIStroke_4[i22] = i23
                end
            end
        end
        if not v2 and a3 then
            task.delay(a3.Time, function() -- Line: 440 -- upvalues: self (val)
                if self.Root.Parent and not self.FadeOut then
                    self.Root.Visible = false
                end
            end)
            return
        end
        if not v2 then
            self.Root.Visible = false
        end
    end

    function u29:SetHover(a2) -- Line: 450
        -- upvalues: Button (val), u75 (upval), u85 (upval), TweenService (upval), UIScale (val), u80 (upval)
        local v1
        local v2 = Button
        local v3 = u75
        local v4 = {}
        local v5 = if not a2 then 0 else 0.5
        v4.ImageColor3 = u85:Lerp(Color3.new(0, 0, 0), v5)
        if v2 then
            if v3 then
                v1 = TweenService:Create(v2, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif v2 then
                for i, j in v4 do
                    v2[i] = j
                end
            end
        end
        v2 = UIScale
        v3 = u80
        v4 = {Scale = if not a2 then 1 else 1.1}
        if not v2 then
            return
        end
        if v3 then
            v1 = TweenService:Create(v2, v3, v4)
            table.insert(self.Tweens, v1)
            v1:Play()
            return
        end
        if not v2 then
            return
        end
        for k, n in v4 do
            v2[k] = n
        end
    end

    function u29:Fade(a2) -- Line: 459
        -- upvalues: u20 (val), u70 (upval), TweenService (upval), Button (val)
        local v1
        self.FadeOut = true
        self.Root.Visible = true
        for i, j in self.Tweens do
            j:Cancel()
        end
        table.clear(self.Tweens)
        local v2 = u20
        local v3 = u70
        local v4 = {ImageTransparency = 1, Position = UDim2.fromScale(if not a2 then 0 else 1, 0)}
        if v2 then
            if v3 then
                v1 = TweenService:Create(v2, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif v2 then
                for k, n in v4 do
                    v2[k] = n
                end
            end
        end
        local UIStroke = u20.UIStroke
        v3 = u70
        v4 = {Transparency = 1}
        if UIStroke then
            if v3 then
                v1 = TweenService:Create(UIStroke, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif UIStroke then
                for m, i5 in v4 do
                    UIStroke[m] = i5
                end
            end
        end
        local Glow = u20.Reward.Glow
        v3 = u70
        v4 = {ImageTransparency = 1}
        if Glow then
            if v3 then
                v1 = TweenService:Create(Glow, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif Glow then
                for i6, i7 in v4 do
                    Glow[i6] = i7
                end
            end
        end
        local Icon = u20.Reward.Icon
        v3 = u70
        v4 = {ImageTransparency = 1}
        if Icon then
            if v3 then
                v1 = TweenService:Create(Icon, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif Icon then
                for i8, i9 in v4 do
                    Icon[i8] = i9
                end
            end
        end
        local Season = u20.Season
        v3 = u70
        v4 = {TextTransparency = 1}
        if Season then
            if v3 then
                v1 = TweenService:Create(Season, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif Season then
                for i10, i11 in v4 do
                    Season[i10] = i11
                end
            end
        end
        local UIStroke_2 = u20.Season.UIStroke
        v3 = u70
        v4 = {Transparency = 1}
        if UIStroke_2 then
            if v3 then
                v1 = TweenService:Create(UIStroke_2, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif UIStroke_2 then
                for i12, i13 in v4 do
                    UIStroke_2[i12] = i13
                end
            end
        end
        local Value = u20.Value
        v3 = u70
        v4 = {TextTransparency = 1}
        if Value then
            if v3 then
                v1 = TweenService:Create(Value, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif Value then
                for i14, i15 in v4 do
                    Value[i14] = i15
                end
            end
        end
        local UIStroke_3 = u20.Value.UIStroke
        v3 = u70
        v4 = {Transparency = 1}
        if UIStroke_3 then
            if v3 then
                v1 = TweenService:Create(UIStroke_3, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif UIStroke_3 then
                for i16, i17 in v4 do
                    UIStroke_3[i16] = i17
                end
            end
        end
        v2 = Button
        v3 = u70
        v4 = {ImageTransparency = 1}
        if v2 then
            if v3 then
                v1 = TweenService:Create(v2, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif v2 then
                for i18, i19 in v4 do
                    v2[i18] = i19
                end
            end
        end
        local Value_2 = Button.Value
        v3 = u70
        v4 = {TextTransparency = 1}
        if Value_2 then
            if v3 then
                v1 = TweenService:Create(Value_2, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif Value_2 then
                for i20, i21 in v4 do
                    Value_2[i20] = i21
                end
            end
        end
        local UIStroke_4 = Button.Value.UIStroke
        v3 = u70
        v4 = {Transparency = 1}
        if UIStroke_4 then
            if v3 then
                v1 = TweenService:Create(UIStroke_4, v3, v4)
                table.insert(self.Tweens, v1)
                v1:Play()
            elseif UIStroke_4 then
                for i22, i23 in v4 do
                    UIStroke_4[i22] = i23
                end
            end
        end
        task.delay(u70.Time, function() -- Line: 500 -- upvalues: self (val)
            if self.Root.Parent then
                self.Root.Visible = false
            end
        end)
    end

    local function cleanupItem() -- Line: 507 -- upvalues: u29 (val), BindableEvent (val)
        if u29.Destroyed then
            return
        end
        u29.Destroyed = true
        local v1 = u29
        for i, j in v1.Tweens do
            j:Cancel()
        end
        table.clear(v1.Tweens)
        BindableEvent:Destroy()
    end

    function u29:Destroy() -- Line: 517 -- upvalues: u29 (val), BindableEvent (val), Frame (val)
        local v1 = not self.Destroyed
        if not u29.Destroyed then
            u29.Destroyed = true
            local v2 = u29
            for i, j in v2.Tweens do
                j:Cancel()
            end
            table.clear(v2.Tweens)
            BindableEvent:Destroy()
        end
        if v1 then
            Frame:Destroy()
        end
    end

    Button.Activated:Connect(function() -- Line: 526 -- upvalues: Sound (upval), a2 (val), BindableEvent (val), u29 (val), self (val)
        Sound("Click"):Play()
        if if not a2.Clicked then true else a2.Clicked() then
            Sound("Obtain"):Play()
            BindableEvent:Fire()
            u29:Fade(self._transparency < 1)
        end
    end)
    Button.MouseEnter:Connect(function() -- Line: 543 -- upvalues: u29 (val)
        u29:SetHover(true)
    end)
    Button.MouseLeave:Connect(function() -- Line: 547 -- upvalues: u29 (val)
        u29:SetHover(false)
    end)
    Frame.Destroying:Once(function() -- Line: 551 -- upvalues: u29 (val), BindableEvent (val)
        if u29.Destroyed then
            return
        end
        u29.Destroyed = true
        local v1 = u29
        for i, j in v1.Tweens do
            j:Cancel()
        end
        table.clear(v1.Tweens)
        BindableEvent:Destroy()
    end)
    u29:SetHover(false)
    return u29
end

function v1.Toggle(a1) -- Line: 559
    if a1.Visible then
        a1:Close()
        return
    end
    a1:Open()
end

function v1:Open() -- Line: 567
    self.Visible = true
    self:_playContainerTween(true)
    self.Opened:Fire()
end

function v1:Close() -- Line: 573
    self.Visible = false
    self:_playContainerTween(false)
    self.Closed:Fire()
end

function v1:LoadGiftbox() -- Line: 579 -- upvalues: Gifts (val), Notification (val)
    if not self.Container then
        return
    end
    local v1 = Gifts:InvokeServer("Request") or {}
    local v2 = {}
    for k, v in pairs(v1) do
        table.insert(v2, {
            Cover = v.cover,
            Sender = v.sender,
            Reward = v.name,
            Rewards = v.rewards,
            RewardIcon = v.icon,
            Clicked = function() -- Line: 594 -- upvalues: Gifts (upval), v (val), Notification (upval)
                local success, result = pcall(function() -- Line: 595 -- upvalues: Gifts (upval), v (upval), Notification (upval)
                    local v1, v2 = Gifts:InvokeServer("Claim", v.id)
                    if not v1 then
                        return error(v2, 2)
                    end
                    Notification.Create({Text = string.format("You have claimed %q!", v.name)})
                    return v2
                end)
                if success then
                    return success
                end
                Notification.Create({
                    Text = result or "An error occurred while attempting to claim reward",
                    Color = Color3.fromRGB(236, 0, 0),
                })
                return false
            end,
        })
    end
    if self.Container then
        self:_setItems(v2, nil)
    end
end

function v1:LoadSeasons() -- Line: 627 -- upvalues: Seasons (val), Seasons_2 (val), Notification (val)
    local v1, v2
    if not self.Container then
        return
    end
    local Seasons_3 = Seasons.Seasons
    local v3 = Seasons_2:InvokeServer("GetUnclaimed") or {}
    local v4 = {}
    local v5 = self
    for k, v in pairs(v3) do
        v2 = Seasons_3[v.season]
        if v2 then
            if not v2.hidePostSeasonUnclaimedRewards or not Seasons.InactiveSeasons[v.season] then
                v1 = v2.tiers[v.tier]
                if v1 then
                    table.insert(v4, {
                        Cover = v2.cover,
                        Season = v2.name,
                        Reward = v1.name,
                        RewardIcon = v1.icon,
                        Clicked = function() -- Line: 656 -- upvalues: Seasons_2 (upval), v (val), Notification (upval)
                            local success, result = pcall(function() -- Line: 657 -- upvalues: Seasons_2 (upval), v (upval)
                                local v1, v2 = Seasons_2:InvokeServer("Claim", v.season, v.tier)
                                if not v1 then
                                    return error(v2, 2)
                                end
                                return v2
                            end)
                            if success then
                                return success
                            end
                            Notification.Create({
                                Text = result or "An error occurred while attempting to claim reward",
                                Color = Color3.fromRGB(236, 0, 0),
                            })
                            return false
                        end,
                    })
                end
            end
        end
    end
    if v5.Container then
        v5:_setItems(nil, v4)
    end
end

function v1:Destroy() -- Line: 686 -- upvalues: GiftboxStore (val)
    if self._containerTween then
        self._containerTween:Cancel()
        self._containerTween = nil
    end
    if self._cleanups then
        for i, j in self._cleanups do
            if j ~= nil then
                if typeof(j) == "RBXScriptConnection" then
                    j:Disconnect()
                elseif type(j) == "function" then
                    j()
                elseif typeof(j) == "Instance" then
                    j:Destroy()
                end
            end
        end
        table.clear(self._cleanups)
    end
    if self._renderedItems then
        self:_clearItems()
    end
    if self.Template then
        self.Template:Destroy()
        self.Template = nil
    end
    self.Container = nil
    self.Visible = false
    self.Gifts = {}
    self.Seasons = {}
    self._transparency = 1
    self._visibilityTweenToken = (self._visibilityTweenToken or 0) + 1
    GiftboxStore.setShowButton(false)
end

return v1