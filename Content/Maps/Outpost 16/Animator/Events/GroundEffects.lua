-- Script path: ReplicatedStorage.Content.Maps.Outpost 16.Animator.Events.GroundEffects
-- Decompile time: 2.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u15 = {
    oldBrightness = {},
    oldColors = {},
    oldTransparencies = {},
    oldSizes = {},
    oldCFs = {},
}

function u15.init(a1) -- Line: 14 -- upvalues: u15 (val)
    for i, j in a1.Environment.EnvDamage:GetDescendants() do
        if j:IsA("Light") then
            u15.oldBrightness[j] = j.Brightness
            j.Brightness = 0
        end
        if j:IsA("BasePart") then
            u15.oldSizes[j] = j.Size
            u15.oldCFs[j] = j.CFrame
            j.Size = j.Size * 0.1
            j.CFrame = j.CFrame * CFrame.new(0, -0.1, 0)
            if j.Material ~= Enum.Material.Neon then
                u15.oldTransparencies[j] = j.Transparency
                j.Transparency = 0
            else
                u15.oldColors[j] = j.Color
                j.Color = Color3.fromRGB(0, 0, 0)
            end
        end
    end
end

function u15.run(a1) -- Line: 37 -- upvalues: u15 (val), TweenService (val), TimescaleUtilities (val)
    local u1 = {}
    u15.tweens = u1
    u15.thread = task.spawn(function() -- Line: 41 -- upvalues: a1 (val), u15 (upval), TweenService (upval), u1 (val), TimescaleUtilities (upval)
        local v1, v2, v3, v4, v5
        for i, j in a1.Environment.EnvDamage:GetDescendants() do
            if j:IsA("Light") and u15.oldBrightness[j] then
                v2 = TweenService
                v4 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                v5 = {Brightness = u15.oldBrightness[j]}
                v2 = v2:Create(j, v4, v5)
                v2:Play()
                table.insert(u1, v2)
            end
            if j:IsA("BasePart") and u15.oldSizes[j] and u15.oldCFs[j] then
                v2 = TweenService
                v4 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                v5 = {Size = u15.oldSizes[j], CFrame = u15.oldCFs[j]}
                v2 = v2:Create(j, v4, v5)
                v2:Play()
                table.insert(u1, v2)
                if j.Material ~= Enum.Material.Neon then
                    if u15.oldTransparencies[j] then
                        v3 = TweenService
                        v5 = TweenInfo.new(1.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                        v1 = {Transparency = u15.oldTransparencies[j]}
                        v3 = v3:Create(j, v5, v1)
                        v3:Play()
                        table.insert(u1, v3)
                    end
                elseif u15.oldColors[j] then
                    v3 = TweenService
                    v5 = TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    v1 = {Color = u15.oldColors[j]}
                    v3 = v3:Create(j, v5, v1)
                    v3:Play()
                    table.insert(u1, v3)
                elseif u15.oldTransparencies[j] then
                    v3 = TweenService
                    v5 = TweenInfo.new(1.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    v1 = {Transparency = u15.oldTransparencies[j]}
                    v3 = v3:Create(j, v5, v1)
                    v3:Play()
                    table.insert(u1, v3)
                end
            end
            TimescaleUtilities.Wait(Random.new():NextNumber(0.03, 0.1))
        end
    end)
end

function u15.cleanup(a1) -- Line: 84 -- upvalues: u15 (val)
    if u15.thread then
        task.cancel(u15.thread)
        u15.thread = nil
        task.defer(function() -- Line: 89 -- upvalues: u15 (upval), a1 (val)
            u15.init(a1)
        end)
    end
    if u15.tweens then
        for i, j in u15.tweens do
            j:Cancel()
        end
        u15.tweens = nil
    end
end

return u15