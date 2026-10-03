-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Achievements
-- Decompile time: 4.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Buttons = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Buttons)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Handlers = script:WaitForChild("Handlers")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: Signal (val), Handlers (val), Buttons (val), TweenService (val), Sound (val)
    local Name, v1
    local Tabs = a1.Container:WaitForChild("Tabs")
    local Pages = a1.Container:WaitForChild("Pages")
    local u187 = Signal.new()
    local UIPageLayout = Pages:WaitForChild("UIPageLayout")
    local u18 = {}
    UIPageLayout.Animated = false
    for k, v in pairs(Pages:GetChildren()) do
        if v:IsA("Frame") then
            u18[v.Name] = v
        end
    end
    u187:Connect(function(a1_2) -- Line: 34 -- upvalues: u18 (val), a1 (val), u187 (val), UIPageLayout (val)
        local v1 = u18[a1_2]
        if v1 then
            local v2 = a1.Handlers[a1_2]
            if v2 then
                if not v2.Loaded then
                    task.spawn(v2.Start, u187)
                    v2.Loaded = true
                end
                UIPageLayout:JumpTo(v1)
            end
        end
    end)
    a1.Handlers = {}
    for k2, i in pairs(Handlers:GetChildren()) do
        local u193 = require(i)
        if u193 then
            Name = i.Name
            local u199 = Pages:WaitForChild(Name)
            if Name ~= "Seasons" and Name ~= "Scores" then
                a1.Handlers[Name] = {
                    Start = function(...) -- Line: 67 -- upvalues: u193 (val), u199 (val)
                        return u193(u199, ...)
                    end,
                }
            end
        end
    end
    u187:Fire("Rewards")
    for k3, j in pairs(Tabs:GetChildren()) do
        if j.Name == "Season" or j.Name == "Scores" then
            j.Visible = false
        elseif j:IsA("Frame") then
            local Size = j.Move.Icon.Size
            v1 = Buttons(j:WaitForChild("Button")):Default()({MultiplierSpeed = 12, SizeMultiplyHover = 1.1})
            v1.instance.MouseButton1Click:Connect(function() -- Line: 91 -- upvalues: j (val), u187 (val)
                u187:Fire(j.Name)
            end)
            j.Move.Position = UDim2.new(0.5, 0, 0.5, 30)
            j.Move.ImageTransparency = 1
            j.Move.Icon.Position = UDim2.new(0.5, 0, 0.5, 30)
            j.Move.Icon.ImageTransparency = 1
            j.Move.Text.Position = UDim2.new(0.493, 0, 0.71, 30)
            j.Move.Text.TextTransparency = 1
            delay(k3 / 10, function() -- Line: 106 -- upvalues: TweenService (upval), j (val)
                TweenService:Create(
                    j.Move,
                    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}
                ):Play()
                TweenService:Create(
                    j.Move.Icon,
                    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}
                ):Play()
                TweenService:Create(
                    j.Move.Text,
                    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {TextTransparency = 0, Position = UDim2.new(0.493, 0, 0.71, 0)}
                ):Play()
            end)
            v1.instance.MouseButton1Down:Connect(function() -- Line: 124 -- upvalues: TweenService (upval), j (val), Sound (upval)
                TweenService:Create(
                    j.Move,
                    TweenInfo.new(0.05, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0.5, 0, 0.5, 5)}
                ):Play()
                Sound("Press"):Play()
            end)
            v1.instance.MouseButton1Up:Connect(function() -- Line: 136 -- upvalues: TweenService (upval), j (val), Sound (upval)
                TweenService:Create(
                    j.Move,
                    TweenInfo.new(0.05, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                    {Position = UDim2.new(0.5, 0, 0.5, 0)}
                ):Play()
                Sound("Release"):Play()
            end)
            v1.instance.MouseEnter:Connect(function() -- Line: 148 -- upvalues: TweenService (upval), j (val), Size (val)
                TweenService:Create(j.Move.Icon, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Size = UDim2.new(0, Size.X.Offset * 1.1, 0, Size.Y.Offset * 1.1),
                }):Play()
            end)
            v1.instance.MouseLeave:Connect(function() -- Line: 163 -- upvalues: TweenService (upval), j (val), Size (val)
                TweenService:Create(j.Move.Icon, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = Size}):Play()
                TweenService:Create(
                    j.Move,
                    TweenInfo.new(0.05, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                    {Position = UDim2.new(0.5, 0, 0.5, 0)}
                ):Play()
            end)
        end
    end
    ;(Buttons(a1.Container:WaitForChild("Close")):Default()({MultiplierSpeed = 12, SizeMultiplyHover = 1.1})).instance.MouseButton1Click:Connect(function() -- Line: 188 -- upvalues: Sound (upval), a1 (val)
        Sound("Click"):Play()
        a1:Close()
    end)
end

function v1.Open(a1) -- Line: 195 -- upvalues: TweenService (val), Sound (val)
    (game:GetService("Lighting")):WaitForChild("Blur")
    a1.Container.Visible = true
    a1.Container.Position = UDim2.new(0, 0, 0.1, 0)
    TweenService:Create(
        a1.Container,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0)}
    ):Play()
    a1.Visible = true
    Sound("Achievements"):Play()
    a1.Opened:Fire()
end

function v1:Close() -- Line: 218
    (game:GetService("Lighting")):WaitForChild("Blur")
    self.Container.Visible = false
    self.Visible = false
    self.Closed:Fire()
end

return v1