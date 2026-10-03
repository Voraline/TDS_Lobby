-- Script path: ReplicatedStorage.Content.Consumables.Heatwave.Animator
-- Decompile time: 4.37 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local HeatwaveOverlay = ReplicatedStorage.Assets.Effects.Client.HeatwaveOverlay
local HeatwaveEffect = ReplicatedStorage.Assets.Effects.Client.HeatwaveEffect
local u82 = CFrame.new() * CFrame.Angles(0, 0, 1.5707963267948966)

local function playSoundTween(a1, a2) -- Line: 27
    -- upvalues: Create (val), NewTween (val)
    local u5 = Create("Sound", {SoundId = "rbxassetid://101505146282268", Volume = 0.5, Parent = a2})
    u5:Play()
    NewTween(u5, TweenInfo.new(a1 + 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(a1) -- Line: 38 -- upvalues: u5 (val)
        u5.Volume = (-math.abs(a1 * 2 - 1) + 1) * 0.5
    end, function() -- Line: 42 -- upvalues: u5 (val)
        u5:Destroy()
    end)
end

local function playColorCorrectionTween(a1) -- Line: 48
    -- upvalues: Create (val), Lighting (val), NewTween (val)
    local u5 = Create("ColorCorrectionEffect", {Parent = Lighting})
    u5:AddTag("DONT_TOUCH")
    NewTween(u5, TweenInfo.new(a1 + 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(a1) -- Line: 55 -- upvalues: u5 (val)
        local v1 = -math.abs(a1 * 2 - 1) + 1
        u5.Contrast = math.lerp(0, 0.2, v1)
        u5.Saturation = math.lerp(0, 0.15, v1)
        u5.TintColor = (Color3.new(1, 1, 1)):Lerp(Color3.fromRGB(198, 152, 108), v1)
    end, function() -- Line: 63 -- upvalues: u5 (val)
        u5:Destroy()
    end)
end

local function playOverlayTransparencyTween(a1, a2) -- Line: 69
    -- upvalues: NewTween (val)
    NewTween(a2, TweenInfo.new(a1 + 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(a1) -- Line: 73 -- upvalues: a2 (val)
        local v1 = -math.abs(a1 * 2 - 1) + 1
        for i, j in a2:GetDescendants() do
            if j:IsA("Beam") then
                j.LocalTransparencyModifier = 1 - v1
            end
        end
    end, function() -- Line: 84 -- upvalues: a2 (val)
        a2:Destroy()
    end)
end

return {
    OnUse = function(a1) -- Line: 91
        -- upvalues: Players (val), TypedPromise (val), HeatwaveEffect (val), HeatwaveOverlay (val), RunService (val)
        -- upvalues: u82 (val), playSoundTween (val), playColorCorrectionTween (val), playOverlayTransparencyTween (val)
        -- upvalues: TimescaleUtilities (val)
        local PlayerByUserId = Players:GetPlayerByUserId(a1.Context.playerId)
        local CurrentCamera = workspace.CurrentCamera
        return TypedPromise.new(function(a1, a2) -- Line: 97
            -- upvalues: PlayerByUserId (val), HeatwaveEffect (upval), HeatwaveOverlay (upval), RunService (upval)
            -- upvalues: CurrentCamera (val), u82 (upval), playSoundTween (upval), playColorCorrectionTween (upval)
            -- upvalues: playOverlayTransparencyTween (upval), TimescaleUtilities (upval)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            if PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("RightHand") then
                local u17 = HeatwaveEffect:Clone()
                local u21 = HeatwaveOverlay:Clone()
                u17.Parent = workspace.Terrain
                u21.Parent = workspace.Terrain
                local u29 = tick()
                local v1 = tick() + 6
                local u39 = RunService.RenderStepped:Connect(function() -- Line: 118
                    -- upvalues: u29 (val), CurrentCamera (upval), PlayerByUserId (upval), u17 (val), u82 (upval)
                    -- upvalues: u21 (val)
                    local v1 = tick() - u29
                    local CFrame_2 = CurrentCamera.CFrame
                    local v2 = PlayerByUserId.Character and CFrame.new(PlayerByUserId.Character.PrimaryPart.CFrame.Position) or CFrame.new()
                    u17.DarkSmoke.CFrame = v2 * CFrame.new(25, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 0)
                    u17.Tumbleweeds.CFrame = v2 * u82 * CFrame.new(0, 0, -25)
                    u21.CFrame = CFrame_2 * CFrame.new(0, -3.4, -5) * CFrame.Angles(0, -1.5707963267948966, 0)
                end)
                playSoundTween(6, PlayerByUserId.Character.Head)
                playColorCorrectionTween(6)
                playOverlayTransparencyTween(6, u21)
                TimescaleUtilities.Delay(6, function() -- Line: 145 -- upvalues: u39 (ref), u21 (val), a1 (val), u17 (val)
                    u39:Disconnect()
                    u21:Destroy()
                    a1()
                    task.defer(function() -- Line: 151 -- upvalues: u17 (upval)
                        for i, j in u17:GetDescendants() do
                            if j:IsA("ParticleEmitter") then
                                j.Rate = 0
                            end
                        end
                    end)
                    task.wait(6)
                    u17:Destroy()
                end)
                return
            end
            a2("Invalid player character")
        end)
    end,
}