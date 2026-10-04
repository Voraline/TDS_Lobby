-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Rusher.Animator
-- Decompile time: 1.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function isLowQuality() -- Line: 13 -- upvalues: SettingsController (val), UserInputService (val)
    local v1 = SettingsController.User:Get("SavedQualityLevel")
    if not v1 then
        return true
    end
    if v1 ~= Enum.QualityLevel.Automatic.Value then
        return v1 <= Enum.SavedQualitySetting.QualityLevel5.Value
    end
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        return true
    end
    return false
end

function v1:_popShield() -- Line: 30
    -- upvalues: SettingsController (val), UserInputService (val), TimescaleUtilities (val), TweenService (val)
    -- upvalues: ItemDrop (val)
    local v1 = SettingsController.User:Get("SavedQualityLevel")
    if not (if v1 then if v1 ~= Enum.QualityLevel.Automatic.Value then v1 <= Enum.SavedQualitySetting.QualityLevel5.Value else if not UserInputService.TouchEnabled then false else not UserInputService.KeyboardEnabled else true) then
        local u27 = self.Model.Shield:Clone()
        u27.Transparency = 0
        u27.Parent = workspace.Trash
        v1 = math.pow(-1, (math.random(0, 1))) * 2
        local v2 = math.pow(-1, (math.random(0, 1))) * 2
        local v3 = {
            dtMultiplier = 4,
            gravity = -1.5,
            velocity = 3.5,
            start = u27.Position,
            goal = (self.Model.HumanoidRootPart.CFrame * CFrame.new(v1, -1, -self.Speed + v2)).Position,
        }
        local Rotation = u27.CFrame.Rotation
        local u72 = Rotation * CFrame.Angles(math.rad(v1 * 60), 0, (math.rad(v2 * 60)))
        TimescaleUtilities.Delay(0.25, function() -- Line: 48 -- upvalues: TweenService (upval), u27 (val)
            TweenService:Create(u27, TweenInfo.new(0.5), {Transparency = 1}):Play()
        end)
        ;(ItemDrop.Drop(v3.start, v3.goal, u27, v3.dtMultiplier, v3.gravity, v3.velocity, function(a1, a2, a3) -- Line: 59 -- upvalues: Rotation (val), u72 (val)
            return Rotation:Lerp(u72, a1)
        end)):andThen(function() -- Line: 62 -- upvalues: u27 (val)
            u27:Destroy()
        end)
    end
    self.Model.Shield:Destroy()
end

function v1.Initialize(a1) -- Line: 69 -- upvalues: Animation (val)
    local u9 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.ShieldBroken,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        ShieldBroken = function() -- Line: 77 -- upvalues: u9 (val), a1 (val)
            u9:Play(0.5)
            a1.Model.Head.Sound:Play()
            a1:_popShield()
        end,
    }
end

return v1