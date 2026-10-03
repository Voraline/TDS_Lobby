-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Prompts.Containers.Handlers.Rejoin
-- Decompile time: 3.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Background = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Background)
local DisconnectionPenaltyController = require(ReplicatedStorage.Client.Controllers.Lobby.DisconnectionPenaltyController)
local Hover = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Hover)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local PlayerGui = require(game.ReplicatedStorage.Client.Modules.PlayerGui)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local u66 = UDim2.new(0.5, 0, 0.5, 0)
local u72 = UDim2.new(0.5, 0, 0.55, 0)
local u73 = {}
u73.__index = u73

local function withSound(a1) -- Line: 21 -- upvalues: Sound (val) -- types: a1: string
    return function(...) -- Line: 22 -- upvalues: Sound (upval), a1 (val)
        Sound(a1):Play(...)
    end
end

function u73.Initialize(a1) -- Line: 27
    -- upvalues: Maid (val), PlayerGui (val), Sound (val), u73 (val), ViewController (val), NewNetwork (val)
    -- upvalues: DisconnectionPenaltyController (val)
    local v1 = {
        Connections = Maid.new(),
        Container = PlayerGui.Primary:WaitForChild("Prompt").Containers:WaitForChild("Rejoin"),
    }
    local v2 = {}
    local u17 = "Click"

    function v2.Click(...) -- Line: 22 -- upvalues: Sound (upval), u17 (val)
        Sound(u17):Play(...)
    end

    local u19 = "Press"

    function v2.Press(...) -- Line: 22 -- upvalues: Sound (upval), u19 (val)
        Sound(u19):Play(...)
    end

    local u21 = "Release"

    function v2.Release(...) -- Line: 22 -- upvalues: Sound (upval), u21 (val)
        Sound(u21):Play(...)
    end

    local u23 = "Swoosh"

    function v2.Swoosh(...) -- Line: 22 -- upvalues: Sound (upval), u23 (val)
        Sound(u23):Play(...)
    end

    v1.SFX = v2
    local u27 = setmetatable(v1, u73)
    ViewController:onViewChange(function(a1) -- Line: 40 -- upvalues: u27 (val)
        local v1 = u27.Container.Visible == true
        if a1 == "Rejoin" and not v1 then
            u27:Prompt()
            return
        end
        if v1 then
            u27:Close()
        end
    end)
    if workspace.Type.Value ~= "Lobby" then
        return u27
    end
    task.defer(function() -- Line: 54 -- upvalues: NewNetwork (upval), DisconnectionPenaltyController (upval), ViewController (upval)
        if NewNetwork.Channel("Rejoin"):invokeServer("Request")
            and DisconnectionPenaltyController.Restricted == "NOT_RESTRICTED" then
            ViewController:queueView("Rejoin")
        end
    end)
    return u27
end

function u73:Prompt() -- Line: 64 -- upvalues: Hover (val), Sound (val), TweenService (val), NewNetwork (val)
    local ButtonConfirm = self.Container:WaitForChild("ButtonConfirm")
    local ButtonReject = self.Container:WaitForChild("ButtonReject")
    local v1, v2 = Hover.new(ButtonConfirm)
    local v3, v4 = Hover.new(ButtonReject)
    self.Connections:Mark((v1:Connect(function() -- Line: 71 -- upvalues: Sound (upval), TweenService (upval), ButtonConfirm (val)
        Sound("Hover"):Play(true)
        TweenService:Create(
            ButtonConfirm,
            TweenInfo.new(0.15),
            {
                Size = UDim2.new(0, 125, 0, 55),
                ImageColor3 = Color3.fromRGB(157, 252, 201),
            }
        ):Play()
    end)))
    self.Connections:Mark((v2:Connect(function() -- Line: 80 -- upvalues: TweenService (upval), ButtonConfirm (val)
        TweenService:Create(
            ButtonConfirm,
            TweenInfo.new(0.15),
            {
                Size = UDim2.new(0, 125, 0, 50),
                ImageColor3 = Color3.fromRGB(82, 255, 163),
            }
        ):Play()
    end)))
    self.Connections:Mark((ButtonConfirm.MouseButton1Click:Connect(function() -- Line: 87 -- upvalues: self (val), NewNetwork (upval)
        self.Teleporting = true
        NewNetwork.Channel("Rejoin"):fireServer("Request")
        self.SFX.Click()
        self:Close()
    end)))
    self.Connections:Mark((v3:Connect(function() -- Line: 96 -- upvalues: Sound (upval), TweenService (upval), ButtonReject (val)
        Sound("Hover"):Play(true)
        TweenService:Create(
            ButtonReject,
            TweenInfo.new(0.15),
            {
                Size = UDim2.new(0, 125, 0, 55),
                ImageColor3 = Color3.fromRGB(255, 176, 176),
            }
        ):Play()
    end)))
    self.Connections:Mark((v4:Connect(function() -- Line: 105 -- upvalues: TweenService (upval), ButtonReject (val)
        TweenService:Create(
            ButtonReject,
            TweenInfo.new(0.15),
            {
                Size = UDim2.new(0, 125, 0, 50),
                ImageColor3 = Color3.fromRGB(255, 124, 124),
            }
        ):Play()
    end)))
    self.Connections:Mark((ButtonReject.MouseButton1Click:Connect(function() -- Line: 112 -- upvalues: NewNetwork (upval), self (val)
        NewNetwork.Channel("Rejoin"):fireServer("Cancel")
        self.SFX.Click()
        self:Close()
    end)))
    self:Open()
end

function u73:Open() -- Line: 121 -- upvalues: Sound (val), u72 (val), TweenService (val), u66 (val), Background (val)
    Sound("Woosh"):Play()
    self.Container.Position = u72
    self.Container.Visible = true
    TweenService:Create(self.Container, TweenInfo.new(0.1), {Position = u66}):Play()
    Background:Enable()
    self.SFX.Swoosh()
    return true
end

function u73:Close() -- Line: 138 -- upvalues: u72 (val), Sound (val), ViewController (val), Background (val)
    self.Container.Visible = false
    self.Container.Position = u72
    if self.Teleporting ~= true then
        Sound("Woosh"):Play()
    else
        Sound("Redeem"):Play()
    end
    if ViewController:getCurrentView() == "Rejoin" then
        ViewController:setView("Hotbar")
    end
    Background:Disable()
    self.Connections:Sweep()
end

return u73