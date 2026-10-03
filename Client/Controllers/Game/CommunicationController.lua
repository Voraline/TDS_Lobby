-- Script path: ReplicatedStorage.Client.Controllers.Game.CommunicationController
-- Decompile time: 7.54 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local AudioUtil = require(ReplicatedStorage.Shared.Modules.AudioUtil)
local Communication = require(ReplicatedStorage.Shared.Data.Communication)
local CommunicationAvailability = require(ReplicatedStorage.Client.Modules.CommunicationAvailability)
local CommunicationConfig = require(ReplicatedStorage.Shared.Data.CommunicationConfig)
local CommunicationStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CommunicationStore)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local ToastController = require(ReplicatedStorage.Client.Controllers.Shared.ToastController)
local u72 = {}
local Communication_2 = NewNetwork.Channel("Communication")
local u80 = workspace.Type.Value == "Game"
local u81 = nil
local CameraFocus = CommunicationConfig.CameraFocus
local BindName = CameraFocus.BindName
local TweenTime = CameraFocus.TweenTime
local HoldTime = CameraFocus.HoldTime
local SoundGroup = CommunicationConfig.SoundGroup
local LocalPlayer = Players.LocalPlayer
local u90 = 0
local u91 = nil
local u92 = nil
local u93 = nil
local u94 = nil
local u95 = false
local u96 = nil

local function getTowerReplicatorModule() -- Line: 41 -- upvalues: u81 (ref), ReplicatedStorage (val)
    if not u81 then
        u81 = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
    end
    return u81
end

local function getAttachmentPosition(a1) -- Line: 49 -- types: a1: userdata
    local Height = a1:FindFirstChild("Height") or a1:FindFirstChild("HeightOffset")
    if Height and Height:IsA("Attachment") then
        return Height.WorldPosition
    end
    return nil
end

local function getModelPosition(a1) -- Line: 58 -- types: a1: userdata
    local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart") or a1.PrimaryPart
    if not HumanoidRootPart then
        return a1:GetPivot().Position
    end
    local Height = HumanoidRootPart:FindFirstChild("Height") or HumanoidRootPart:FindFirstChild("HeightOffset")
    return (if not Height then nil else if not Height:IsA("Attachment") then nil else Height.WorldPosition) or HumanoidRootPart.Position
end

local function isOtherPlayerSuggestion(a1) -- Line: 67 -- upvalues: LocalPlayer (val)
    local v1 = false
    if a1 ~= nil then
        v1 = a1.sourceUserId ~= LocalPlayer.UserId
    end
    return v1
end

local function shouldHideSuggestion(a1) -- Line: 71 -- upvalues: SettingsController (val), LocalPlayer (val)
    local v1 = false
    if SettingsController.Game:Get("Hide suggestions") == true then
        v1 = false
        if a1 ~= nil then
            v1 = a1.sourceUserId ~= LocalPlayer.UserId
        end
    end
    return v1
end

local function getVisibleSuggestions(a1) -- Line: 76 -- upvalues: SettingsController (val), LocalPlayer (val)
    local v1
    if SettingsController.Game:Get("Hide suggestions") ~= true then
        return a1
    end
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = false
        if j ~= nil then
            v1 = j.sourceUserId ~= LocalPlayer.UserId
        end
        if not v1 then
            table.insert(v2, j)
        end
    end
    return v2
end

function u72.getSuggestionPosition(a1) -- Line: 91 -- upvalues: u80 (val), u81 (ref), ReplicatedStorage (val)
    local data = a1 and a1.data
    if data and typeof(data.position) == "Vector3" then
        return data.position
    end
    local towerUID = a1 and (a1.towerUID or data and data.towerUID)
    if towerUID and u80 then
        if not u81 then
            u81 = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
        end
        local v1 = u81.getTowerByUID(towerUID)
        if v1 and v1.Model then
            local WorldPosition
            local Model = v1.Model
            local HumanoidRootPart = Model:FindFirstChild("HumanoidRootPart") or Model.PrimaryPart
            if not HumanoidRootPart then
                return Model:GetPivot().Position
            end
            local Height = HumanoidRootPart:FindFirstChild("Height") or HumanoidRootPart:FindFirstChild("HeightOffset")
            if not (if not Height then nil else if not Height:IsA("Attachment") then nil else Height.WorldPosition) then
                return HumanoidRootPart.Position
            end
            return WorldPosition
        end
    end
    return nil
end

local function playSuggestionSound(a1) -- Line: 108
    -- upvalues: LocalPlayer (val), Communication (val), AudioUtil (val), SoundGroup (val)
    if a1.targetUserId ~= LocalPlayer.UserId then
        return
    end
    local v1 = Communication.getTypeSound(a1.type)
    if not v1 then
        return
    end
    AudioUtil.playSoundOneShot(v1, SoundGroup, {volume = 1})
end

local function showSentSuggestionNotification(a1) -- Line: 123
    -- upvalues: LocalPlayer (val), Communication (val), Notification (val)
    if a1.sourceUserId ~= LocalPlayer.UserId then
        return
    end
    local data = a1.data or {}
    local v1 = nil
    if a1.type == Communication.Type.UseAbility then
        v1 = ("use %*"):format(data.abilityName or "an ability")
    elseif a1.type == Communication.Type.UseConsumable then
        v1 = ("use %*"):format(data.consumableName or "a consumable")
    end
    if not v1 then
        return
    end
    Notification.Create({Text = ("Suggested %* to %*."):format(a1.targetName or "a teammate", v1)})
end

local function stopCameraFocus() -- Line: 145
    -- upvalues: u90 (ref), u91 (ref), u93 (ref), u95 (ref), RunService (val), BindName (val), u92 (ref), u96 (ref)
    -- upvalues: u94 (ref)
    u90 = u90 + 1
    if u91 then
        u91:Cancel()
        u91 = nil
    end
    if u93 then
        u93:Disconnect()
        u93 = nil
    end
    if u95 then
        RunService:UnbindFromRenderStep(BindName)
        u95 = false
    end
    if u92 then
        u92:Destroy()
        u92 = nil
    end
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera and u96 then
        CurrentCamera.CameraType = u96.cameraType
        CurrentCamera.CameraSubject = u96.cameraSubject
    end
    u96 = nil
    u94 = nil
end

function u72.open(a1) -- Line: 178
    -- upvalues: CommunicationAvailability (val), CommunicationStore (val)
    if not CommunicationAvailability.canUse() then
        CommunicationStore.setOpen(false)
        return
    end
    CommunicationStore.setOpen(true, a1)
end

function u72.close() -- Line: 187 -- upvalues: CommunicationStore (val)
    CommunicationStore.setOpen(false)
end

function u72.toggle(a1) -- Line: 191
    -- upvalues: CommunicationAvailability (val), CommunicationStore (val)
    if not CommunicationAvailability.canUse() then
        CommunicationStore.setOpen(false)
        return
    end
    CommunicationStore.toggle(a1)
end

function u72.requestSuggestion(a1) -- Line: 200
    -- upvalues: u80 (val), CommunicationAvailability (val), u72 (val), Communication_2 (val)
    if u80 and CommunicationAvailability.canUse() then
        u72.close()
        Communication_2:fireServer("RequestSuggestion", a1)
        return
    end
end

function u72.dismiss(a1) -- Line: 209
    -- upvalues: u94 (ref), stopCameraFocus (val), CommunicationStore (val), Communication_2 (val)
    if a1 == u94 then
        stopCameraFocus()
    end
    CommunicationStore.dismissNotification(a1)
    Communication_2:fireServer("DismissSuggestion", a1)
end

function u72.focusSuggestion(a1) -- Line: 218
    -- upvalues: stopCameraFocus (val), CommunicationStore (val), u72 (val), u90 (ref), u94 (ref), u96 (ref), u92 (ref)
    -- upvalues: RunService (val), BindName (val), u95 (ref), TweenService (val), TweenTime (val), u91 (ref), u93 (ref)
    -- upvalues: HoldTime (val)
    if not a1 then
        return
    end
    stopCameraFocus()
    CommunicationStore.focusSuggestion(a1.id)
    local v1 = u72.getSuggestionPosition(a1)
    local CurrentCamera = workspace.CurrentCamera
    if v1 and CurrentCamera then
        local v2 = CFrame.lookAt(v1 + Vector3.new(0, 35, 38), v1)
        local u19 = u90 + 1
        u90 = u19
        u94 = a1.id
        u96 = {
            cameraType = CurrentCamera.CameraType,
            cameraSubject = CurrentCamera.CameraSubject,
        }
        local CFrameValue = Instance.new("CFrameValue")
        CFrameValue.Value = CurrentCamera.CFrame
        u92 = CFrameValue
        CurrentCamera.CameraType = Enum.CameraType.Scriptable
        RunService:BindToRenderStep(BindName, Enum.RenderPriority.Camera.Value + 1, function() -- Line: 250 -- upvalues: CurrentCamera (val), u19 (val), u90 (upval), CFrameValue (val)
            if workspace.CurrentCamera == CurrentCamera and u19 == u90 then
                CurrentCamera.CameraType = Enum.CameraType.Scriptable
                CurrentCamera.CFrame = CFrameValue.Value
                return
            end
        end)
        u95 = true
        local v3 = TweenService:Create(CFrameValue, TweenInfo.new(TweenTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Value = v2})
        u91 = v3
        u93 = v3.Completed:Connect(function(a1) -- Line: 266 -- upvalues: u19 (val), u90 (upval), HoldTime (upval), stopCameraFocus (upval)
            if u19 == u90 and a1 == Enum.PlaybackState.Completed then
                task.delay(HoldTime, function() -- Line: 271 -- upvalues: u19 (upval), u90 (upval), stopCameraFocus (upval)
                    if u19 == u90 then
                        stopCameraFocus()
                    end
                end)
                return
            end
        end)
        v3:Play()
        return
    end
end

if u80 then
    task.spawn(function() -- Line: 281
        -- upvalues: Communication_2 (val), SettingsController (val), LocalPlayer (val), CommunicationStore (val)
        -- upvalues: playSuggestionSound (val), showSentSuggestionNotification (val), u94 (ref), stopCameraFocus (val)
        -- upvalues: Notification (val), ToastController (val), isOtherPlayerSuggestion (val)
        -- upvalues: getVisibleSuggestions (val)
        Communication_2:onEvent("SuggestionCreated", function(a1) -- Line: 282
            -- upvalues: SettingsController (upval), LocalPlayer (upval), CommunicationStore (upval)
            -- upvalues: playSuggestionSound (upval), showSentSuggestionNotification (upval)
            local v1 = false
            if SettingsController.Game:Get("Hide suggestions") == true then
                v1 = false
                if a1 ~= nil then
                    v1 = a1.sourceUserId ~= LocalPlayer.UserId
                end
            end
            if v1 then
                return
            end
            CommunicationStore.addSuggestion(a1)
            playSuggestionSound(a1)
            showSentSuggestionNotification(a1)
        end)
        Communication_2:onEvent("SuggestionRemoved", function(a1) -- Line: 292 -- upvalues: u94 (upval), stopCameraFocus (upval), CommunicationStore (upval)
            if a1 == u94 then
                stopCameraFocus()
            end
            CommunicationStore.removeSuggestion(a1)
        end)
        Communication_2:onEvent("SuggestionRejected", function(a1) -- Line: 300 -- upvalues: Notification (upval), ToastController (upval)
            if a1.reason == "This tower is already max level!" then
                Notification.Create({Text = a1.reason, Color = Color3.fromRGB(255, 0, 0)})
                return
            end
            ToastController.showToast({
                title = "Communication",
                duration = 4,
                description = a1.reason or "Could not send suggestion.",
            })
        end)
        Communication_2:onEvent("CooldownUpdated", function(a1, a2) -- Line: 316 -- upvalues: CommunicationStore (upval)
            CommunicationStore.updateCooldown(a1, a2)
        end)
        SettingsController.Game:On("Hide suggestions", function(a1) -- Line: 320
            -- upvalues: u94 (upval), CommunicationStore (upval), LocalPlayer (upval), stopCameraFocus (upval)
            -- upvalues: isOtherPlayerSuggestion (upval)
            if a1 ~= true then
                return
            end
            local v1 = u94 and CommunicationStore.getState().suggestions[u94]
            if v1 then
                local v2 = false
                if v1 ~= nil then
                    v2 = v1.sourceUserId ~= LocalPlayer.UserId
                end
                if v2 then
                    stopCameraFocus()
                end
            end
            CommunicationStore.removeSuggestions(isOtherPlayerSuggestion)
        end)
        task.defer(function() -- Line: 335 -- upvalues: Communication_2 (upval), CommunicationStore (upval), getVisibleSuggestions (upval)
            local success, result = pcall(function() -- Line: 336 -- upvalues: Communication_2 (upval)
                return Communication_2:invokeServer("RequestSnapshot")
            end)
            if success and typeof(result) == "table" then
                CommunicationStore.setSuggestions((getVisibleSuggestions(result)))
            end
        end)
    end)
end
return u72