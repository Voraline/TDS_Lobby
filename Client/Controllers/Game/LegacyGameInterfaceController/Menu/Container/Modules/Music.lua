-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Menu.Container.Modules.Music
-- Decompile time: 2.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ContentProvider")
local MarketplaceService = game:GetService("MarketplaceService")
game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Hover = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Hover)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local Troops = require(ReplicatedStorage.Shared.Modules.Network).Channel("Troops")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 19
    -- upvalues: Hover (val), TweenService (val), Troops (val), MarketplaceService (val), Sound (val)
    a1.Container:WaitForChild("Length")
    local Title = a1.Container:WaitForChild("Title")
    local Close = a1.Container:WaitForChild("Close")
    local Detector = a1.Container:WaitForChild("Button"):WaitForChild("Detector")
    local TextBox = a1.Container:WaitForChild("Input"):WaitForChild("TextBox")
    local u34 = {}
    local v1, v2 = Hover.new(Close)
    v1:Connect(function() -- Line: 35 -- upvalues: TweenService (upval), Close (val)
        TweenService:Create(Close, TweenInfo.new(0.15), {Size = UDim2.new(0, 55, 0, 55)}):Play()
    end)
    v2:Connect(function() -- Line: 41 -- upvalues: TweenService (upval), Close (val)
        TweenService:Create(Close, TweenInfo.new(0.15), {Size = UDim2.new(0, 50, 0, 50)}):Play()
    end)
    Close.MouseButton1Click:Connect(function() -- Line: 47 -- upvalues: a1 (val)
        a1:Close()
    end)
    Detector.MouseButton1Click:Connect(function() -- Line: 51
        -- upvalues: TextBox (val), Troops (upval), u34 (val), MarketplaceService (upval), Title (val), Sound (upval)
        local success, result = pcall(function() -- Line: 52 -- upvalues: TextBox (upval)
            return (tonumber(TextBox.Text))
        end)
        if success and result then
            if not Troops:InvokeServer("Execute", {Name = "Music", Tower = _G.Troop, Data = {result}}) then
                Sound("Error"):Play()
                return
            end
            local v1 = u34[result]
            if not v1 then
                local success_2, result_2 = pcall(function() -- Line: 68 -- upvalues: MarketplaceService (upval), result (val)
                    return MarketplaceService:GetProductInfo(result)
                end)
                v1 = success_2 and result_2 or nil
            end
            Title.Text = v1.Name or "Untitled Song"
            return
        end
        Sound("Error"):Play()
    end)
    TextBox.FocusLost:Connect(function() -- Line: 88 -- upvalues: TextBox (val), MarketplaceService (upval), u34 (val)
        local success, result = pcall(function() -- Line: 89 -- upvalues: TextBox (upval)
            return (tonumber(TextBox.Text))
        end)
        if success and result then
            local success_2, result_2 = pcall(function() -- Line: 94 -- upvalues: MarketplaceService (upval), result (val)
                return MarketplaceService:GetProductInfo(result)
            end)
            u34[result] = success_2 and result_2 or nil
        end
    end)
end

function v1.Open(a1) -- Line: 103 -- upvalues: TweenService (val)
    a1.Container.Position = UDim2.new(0, 0, -0.2, 0)
    TweenService:Create(
        a1.Container,
        TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0)}
    ):Play()
    a1.Container.Visible = true
    a1.Visible = true
    a1.Opened:Fire()
end

function v1:Close() -- Line: 122
    self.Container.Visible = false
    self.Visible = false
    self.Closed:Fire()
end

return v1