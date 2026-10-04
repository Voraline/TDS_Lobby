-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Codes
-- Decompile time: 5.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Hover = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Hover)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Codes = require(ReplicatedStorage.Shared.Modules.Network).Channel("Codes")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 16
    -- upvalues: Hover (val), Sound (val), TweenService (val), Codes (val), Notification (val)
    local TextBox = a1.Container:WaitForChild("CodeFrame"):WaitForChild("TextBox")
    a1.Container:WaitForChild("Status")
    local Close = a1.Container:WaitForChild("Close")
    local Button = a1.Container:WaitForChild("Button")
    local v1, v2 = Hover.new(Close)
    local v3, v4 = Hover.new(Button)
    v1:Connect(function() -- Line: 29 -- upvalues: Sound (upval), TweenService (upval), Close (val)
        Sound("Hover"):Play(true)
        TweenService:Create(Close, TweenInfo.new(0.15), {Size = UDim2.fromOffset(40, 40)}):Play()
    end)
    v2:Connect(function() -- Line: 37 -- upvalues: TweenService (upval), Close (val)
        TweenService:Create(Close, TweenInfo.new(0.15), {Size = UDim2.fromOffset(35, 35)}):Play()
    end)
    v3:Connect(function() -- Line: 44 -- upvalues: Sound (upval), TweenService (upval), Button (val)
        Sound("Hover"):Play(true)
        TweenService:Create(Button, TweenInfo.new(0.15), {Size = UDim2.fromOffset(295, 40)}):Play()
    end)
    v4:Connect(function() -- Line: 52 -- upvalues: TweenService (upval), Button (val)
        TweenService:Create(Button, TweenInfo.new(0.15), {Size = UDim2.fromOffset(280, 40)}):Play()
    end)

    local function _redeemCode() -- Line: 58
        -- upvalues: TextBox (val), Codes (upval), Notification (upval), Sound (upval)
        local Text = TextBox.Text
        if not (#Text > 0) then
            Notification.Create({Text = "You cannot enter a empty code!"})
            Sound("Error"):Play(true)
            return
        end
        local v1 = Codes:InvokeServer("Redeem", Text)
        if not v1 then
            return
        end
        local Result = v1.Result
        local Message = v1.Message
        if not Message then
            Notification.Create({Text = "Code is invalid or was entered incorrectly. Try entering code without any spaces."})
        else
            Notification.Create({Text = Message})
        end
        if Result then
            Sound("Twitter"):Play(true)
            return
        end
        Sound("Error"):Play(true)
    end

    Button.MouseButton1Click:Connect(function() -- Line: 94 -- upvalues: Sound (upval), _redeemCode (val)
        Sound("Click"):Play(true)
        _redeemCode()
    end)
    Close.MouseButton1Click:Connect(function() -- Line: 100 -- upvalues: Sound (upval), a1 (val)
        Sound("Click"):Play(true)
        a1:Close()
    end)
end

function v1.Open(a1) -- Line: 108 -- upvalues: TweenService (val)
    a1.Container.Position = UDim2.new(0, 0, 0.1, 0)
    a1.Container.Visible = true
    TweenService:Create(
        a1.Container,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0)}
    ):Play()
    a1.Visible = true
    a1.Opened:Fire()
end

function v1:Close() -- Line: 128
    self.Container.Visible = false
    self.Visible = false
    self.Closed:Fire()
end

return v1