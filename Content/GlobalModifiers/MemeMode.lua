-- Script path: ReplicatedStorage.Content.GlobalModifiers.MemeMode
-- Decompile time: 2.55 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Brain Rot",
    description = "Dop dop yes yes",
    icon = 16972125270,
    rewardMultiplier = 0.5,
    onEnableServer = function(a1, a2, a3) -- Line: 16 -- upvalues: ServerStorage (val), LegacyMiddleware (val), GameState (val)
        local Meme = require(ServerStorage.Server.Modules.EnemyReplaceLists.Meme)
        local MiddlewareTranslations = require(ServerStorage.Server.Modules.ServerMiddlewareMeta.MiddlewareTranslations)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.ManagerCreatedEnemy, LegacyMiddleware.Boundedness.Inbound, function(a1, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 25 -- upvalues: Meme (val)
            return Meme.Enemies[a2] or a2, a3, a4, a5, a6, a7, a8, a9
        end))
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 54 -- upvalues: Meme (val), GameState (upval)
            if Meme.Health[a2.Name] then
                local MaxHealth = not (typeof(Meme.Health[a2.Name]) ~= "number") and Meme.Health[a2.Name] or Meme.Health[a2.Name][GameState.Difficulty] or a2.MaxHealth
                a2.MaxHealth = MaxHealth
                a2.Health = a2.MaxHealth
                a2.Replicator:Set("MaxHealth", a2.MaxHealth)
                a2.Replicator:Set("Health", a2.Health)
                a2:ResetCashHealth()
            end
            return a2
        end))
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnDialogue, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 81 -- upvalues: MiddlewareTranslations (val)
            local Text
            for k, v in pairs(a2) do
                Text = MiddlewareTranslations.Furry(v.Text) or v.Text
                v.Text = Text
            end
            return a2
        end))
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 91 -- upvalues: ReplicatedStorage (val), Players (val), TweenService (val)
        local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
        local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
        local v1 = a1.makeInstance("Sound", {
            Name = "Fart",
            SoundId = "rbxassetid://6445594239",
            Volume = 1,
            Parent = workspace.CurrentCamera,
        })
        local u62 = a1.makeInstance("ScreenGui", {
            Name = "VignetteGui",
            IgnoreGuiInset = true,
            ResetOnSpawn = false,
            ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
            Children = {
                a1.makeInstance("ImageLabel", {
                    Name = "Vignette",
                    Image = "rbxassetid://8052577310",
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                }),
            },
        })
        v1:Play()
        TweenService:Create(u62.Vignette, TweenInfo.new(1, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
        Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
        a1.task(task.delay(1, function() -- Line: 134 -- upvalues: TweenService (upval), u62 (val)
            TweenService:Create(u62.Vignette, TweenInfo.new(5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
        end))
        Notification.Create({Text = "The brain rot has begun!"})
        a1.modifyInstance(workspace.Music, {Value = "Skibidi"})
    end,
}