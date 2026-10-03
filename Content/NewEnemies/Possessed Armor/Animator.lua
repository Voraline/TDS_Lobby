-- Script path: ReplicatedStorage.Content.NewEnemies.Possessed Armor.Animator
-- Decompile time: 2.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u32 = {"LeftGauntlet", "RightGauntlet", "LeftPauldron", "RightPauldron", "Chestplate", "WaistArmor", "Helmet"}

local function isLowQuality() -- Line: 22 -- upvalues: SettingsController (val), UserInputService (val)
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

function v1:_popArmor(a2) -- Line: 39
    -- upvalues: SettingsController (val), UserInputService (val), TimescaleUtilities (val), TweenService (val)
    -- upvalues: ItemDrop (val)
    local v1 = SettingsController.User:Get("SavedQualityLevel")
    if not (if v1 then if v1 ~= Enum.QualityLevel.Automatic.Value then v1 <= Enum.SavedQualitySetting.QualityLevel5.Value else if not UserInputService.TouchEnabled then false else not UserInputService.KeyboardEnabled else true) then
        local u26 = a2:Clone()
        u26.Transparency = 0
        u26.Parent = workspace.Trash
        v1 = math.pow(-1, (math.random(0, 1))) * 2
        local v2 = math.pow(-1, (math.random(0, 1))) * 2
        local v3 = {
            dtMultiplier = 4,
            gravity = -1.5,
            velocity = 3.5,
            start = u26.Position,
            goal = (self.Model.HumanoidRootPart.CFrame * CFrame.new(v1, -1, -self.Speed * 2 + v2)).Position,
        }
        local Rotation = u26.CFrame.Rotation
        local u74 = Rotation * CFrame.Angles(math.rad(v1 * 60), 0, (math.rad(v2 * 60)))
        TimescaleUtilities.Delay(0.25, function() -- Line: 57 -- upvalues: TweenService (upval), u26 (val)
            TweenService:Create(u26, TweenInfo.new(0.5), {Transparency = 1}):Play()
        end)
        ;(ItemDrop.Drop(v3.start, v3.goal, u26, v3.dtMultiplier, v3.gravity, v3.velocity, function(a1, a2, a3) -- Line: 68 -- upvalues: Rotation (val), u74 (val)
            return Rotation:Lerp(u74, a1)
        end)):andThen(function() -- Line: 71 -- upvalues: u26 (val)
            u26:Destroy()
        end)
    end
    a2:Destroy()
end

function v1.Initialize(a1) -- Line: 78 -- upvalues: u32 (val)
    a1._lastPoppedPiece = 0
    local u2 = nil
    local v1 = (a1.Replicator:GetStateChangedSignal("Shield")):Connect(function(a1_2) -- Line: 81 -- upvalues: u32 (upval), a1 (val), u2 (ref)
        local v1 = #u32
        local _lastPoppedPiece = a1._lastPoppedPiece
        if #u32 <= _lastPoppedPiece then
            u2:Disconnect()
        end
        local v2 = math.clamp(math.floor(v1 * (1 - a1_2 / a1.MaxShield)), 0, v1)
        if a1._lastPoppedPiece < v2 then
            local v3
            a1.Model.Head.Sound:Play()
            local v4 = v2 - a1._lastPoppedPiece
            for i = 1, v4 do
                v3 = a1.Model.Armor:FindFirstChild(u32[a1._lastPoppedPiece + i])
                if v3 then
                    a1:_popArmor(v3)
                end
            end
            a1._lastPoppedPiece = v2
        end
    end)
end

return v1