-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Inventory.Components.Crate
-- Decompile time: 8.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
if not RunService:IsRunning() then
    local function v1() end

    return {Start = v1, Stop = v1}
end
local UnboxingController = require(ReplicatedStorage.Client.Controllers.Shared.UnboxingController)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Streaming = require(ReplicatedStorage.Shared.Modules.Network).Channel("Streaming")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Background = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Background)
local DepthOfField = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.DepthOfField)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Flash = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Flash)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Render = require(ReplicatedStorage.Shared.Modules.Render)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local u135 = if workspace:WaitForChild("Type").Value ~= "Lobby" then CFrame.new() else (workspace:WaitForChild("Lobby")):WaitForChild("Crate"):GetPivot()
Sound:Register("Crate", {Properties = {Volume = 2}})
local u143 = {}
u143.Zoom = Sound:Template("Crate", 5446303515)
u143.Reveal = Sound:Template("Crate", 5446303189)
local u154 = {"Camera", "Item", "Root"}
local u158 = {}

local function getCrateSounds(a1) -- Line: 61 -- upvalues: u158 (val), Asset (val), Sound (val)
    if u158[a1] then
        return u158[a1]
    end
    local v1 = Asset("NewCrates", a1)
    local Sounds = v1 and v1.Sounds
    if not Sounds then
        return nil
    end
    local v2 = {}
    for i, j in Sounds do
        v2[i] = (Sound:Template("Crate", j))
    end
    u158[a1] = v2
    return v2
end

local u163 = Maid.new()
local u164 = {}
local u170 = MusicController.CreateController("Crate", nil, "Music")

function u164.Start(a1, a2) -- Line: 86
    -- upvalues: Asset (val), Signal (val), Flash (val), Streaming (val), Enum (val), u163 (val), Animation (val)
    -- upvalues: u135 (ref), u154 (val), Render (val), VRService (val), EmitterManager (val), TweenService (val)
    -- upvalues: getCrateSounds (val), u143 (val), u164 (val), UnboxingController (val), DepthOfField (val)
    -- upvalues: MusicController (val), u170 (val), Promise (val)
    local Troop = a2.Troop
    local Skin = a2.Skin
    local Name = a2.Name
    assert(Name, "Crate name is nil")
    local v1 = Asset("NewCrates", Name)
    if not v1 then
        return error("Crate asset not found: " .. Name)
    end
    local u20 = Signal.new()
    local CurrentCamera = workspace.CurrentCamera
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    Flash:Enable((TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))).Completed:Wait()
    Streaming:FireServer("SelectTower", Troop, Skin)
    Asset("Troops", Troop)
    local u52 = Asset("TroopsModel", Troop, Skin)
    local v2 = Asset("Troops", Troop).Properties.SkinData[Skin]
    local u65 = if not v2 then "Common" else Enum.SkinRarity.ToString(v2.Rarity)
    local u85 = nil
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0.1
    u163:Mark(NumberValue)
    NumberValue.Changed:Connect(function(a1) -- Line: 118 -- upvalues: u85 (ref)
        if u85 then
            u85:ScaleTo(a1)
        end
    end)
    if u52 then
        u85 = u52:Clone()
        u85.Parent = CurrentCamera
        u85:ScaleTo(0.1)
        local AnimationController = u85:FindFirstChild("AnimationController")
        if AnimationController and (u52:WaitForChild("Animations")):FindFirstChild("Idle") then
            Animation.new({
                Target = AnimationController,
                Properties = {Looped = true},
                Track = ((u52:WaitForChild("Animations")):WaitForChild("Idle")):WaitForChild(0),
            }):Play()
        end
        u163:Mark(u85)
    end
    local u137 = nil
    local Model = v1.Model
    if Model then
        u137 = Model:Clone()
        u137.Parent = workspace
        u137:PivotTo(u135)
        if v1.VFX then
            local v3 = v1.VFX:Clone()
            v3:PivotTo((u137:GetPivot()))
            v3.Parent = u137
        end
        for k, v in pairs(u137:GetDescendants()) do
            if v:IsA("BasePart") and table.find(u154, v.Name) then
                v.Transparency = 1
            end
        end
        u163:Mark(u137)
    end
    local u199 = Animation.new({
        Id = v1.Animation,
        Properties = {Looped = false},
        Target = u137:WaitForChild("AnimationController"),
    })
    u199.Camera = u137:WaitForChild("Camera")
    u199:Play()
    if v1.MasterSound then
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://" .. tostring(v1.MasterSound)
        Sound.Volume = 1
        Sound.Parent = u137
        Sound:Play()
        u163:Mark(Sound)
    end
    Render:Add("Camera", Enum.RenderPriority.First, function() -- Line: 206 -- upvalues: CurrentCamera (val), VRService (upval), u199 (ref)
        CurrentCamera.CameraType = Enum.CameraType.Scriptable
        if not VRService.VREnabled then
            CurrentCamera.CFrame = u199.Camera.CFrame
        end
    end)
    u163:Mark(((u199.Controller:GetMarkerReachedSignal("Emit")):Connect(function(a1) -- Line: 216 -- upvalues: u137 (ref), EmitterManager (upval)
        local PrimaryPart = if a1 == "" then u137.PrimaryPart else u137:FindFirstChild(a1, true)
        if PrimaryPart then
            EmitterManager.manualEmit(PrimaryPart)
        end
    end)))
    u163:Mark(((u199.Controller:GetMarkerReachedSignal("Toggle")):Connect(function(a1) -- Line: 227 -- upvalues: u137 (ref), EmitterManager (upval)
        local v1
        local v2 = a1:split(":")
        v1, v2 = unpack(v2)
        local v3 = if v2 == nil then true else v2 == "true"
        local v4 = u137:FindFirstChild(v1, true)
        if v4 then
            EmitterManager.toggle(v4, v3)
        end
    end)))

    local function getRarityAsset(a1) -- Line: 238 -- upvalues: u65 (val)
        return a1:FindFirstChild(u65, true) or a1:FindFirstChild(u65 .. "_Active", true)
    end

    u163:Mark(((u199.Controller:GetMarkerReachedSignal("EmitRarity")):Connect(function(a1) -- Line: 246 -- upvalues: u137 (ref), u65 (val), EmitterManager (upval)
        local v1
        if not (if a1 == "" then u137 else u137:FindFirstChild(a1, true)) then
            return
        end
        local v2 = v1:FindFirstChild(u65, true) or v1:FindFirstChild(u65 .. "_Active", true)
        if v2 then
            EmitterManager.manualEmit(v2)
        end
    end)))
    u163:Mark(((u199.Controller:GetMarkerReachedSignal("ToggleRarity")):Connect(function(a1) -- Line: 264 -- upvalues: u137 (ref), u65 (val), EmitterManager (upval)
        local v1, v2
        local v3 = a1:split(":")
        v1, v3 = unpack(v3)
        local v4 = if v3 == nil then true else v3 == "true"
        if not (if v1 == "" then u137 else u137:FindFirstChild(v1, true)) then
            return
        end
        local v5 = v2:FindFirstChild(u65, true) or v2:FindFirstChild(u65 .. "_Active", true)
        if v5 then
            EmitterManager.toggle(v5, v4)
        end
    end)))
    u163:Mark(((u199.Controller:GetMarkerReachedSignal("Reveal")):Connect(function() -- Line: 283 -- upvalues: u85 (ref), u137 (ref), TweenService (upval), NumberValue (val), Render (upval)
        local HumanoidRootPart = u85:FindFirstChild("HumanoidRootPart") or u85.PrimaryPart
        local Item = u137:FindFirstChild("Item", true)
        if not Item then
            Item = u137:WaitForChild("Item")
        end
        u85.PrimaryPart = HumanoidRootPart
        TweenService:Create(NumberValue, TweenInfo.new(1, Enum.EasingStyle.Sine), {Value = 0.8}):Play()
        Render:Add("Item", Enum.RenderPriority.First, function() -- Line: 295 -- upvalues: u85 (upval), Item (val)
            if u85 and Item then
                local WorldCFrame = if not Item:IsA("Attachment") then Item.CFrame else Item.WorldCFrame
                u85:SetPrimaryPartCFrame(WorldCFrame)
                return
            end
        end)
    end)))
    u163:Mark(((u199.Controller:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 309 -- upvalues: getCrateSounds (upval), Name (val), u143 (upval)
        local v1 = getCrateSounds(Name)
        local v2 = u143[a1] or v1 and v1[a1]
        return v2 and v2:Play()
    end)))
    u163:Mark(((u199.Controller:GetMarkerReachedSignal("Freeze")):Connect(function() -- Line: 320
        -- upvalues: u199 (ref), u143 (upval), u52 (val), u164 (upval), u20 (val), u85 (ref), TweenService (upval)
        -- upvalues: NumberValue (val), UnboxingController (upval), Troop (val), Skin (val)
        u199:Pause()
        u143.Zoom:Play()
        if not u52 then
            task.defer(function() -- Line: 325 -- upvalues: u164 (upval), u20 (upval)
                u164:Stop()
                u20:Fire()
            end)
            return
        end
        if u85 then
            TweenService:Create(
                NumberValue,
                TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0.4),
                {Value = 0.1}
            ):Play()
            task.delay(0.6000000000000001, function() -- Line: 349 -- upvalues: u85 (upval)
                u85.Parent = nil
            end)
        end
        local v1, v2 = UnboxingController.GetMetadataForReward("Skin", Troop, Skin)
        local finished = v2.finished

        function v2.finished() -- Line: 358 -- upvalues: u164 (upval), u20 (upval), finished (val)
            u164:Stop()
            u20:Fire()
            if finished then
                finished()
            end
        end

        UnboxingController.Present(v1, v2)
    end)))
    DepthOfField:Enable(
        TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {FarIntensity = 1, FocusDistance = 0, InFocusRadius = 8, NearIntensity = 0}
    )
    Flash:Disable((TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)))
    if v1.MusicName and MusicController.Tracks[v1.MusicName] then
        u170:Play(v1.MusicName)
        u163:Mark(function() -- Line: 382 -- upvalues: u170 (upval)
            u170:Stop()
        end)
    end
    return (Promise.new(function(a1) -- Line: 387 -- upvalues: u20 (val)
        local u1 = nil
        local v1 = u20:Connect(function() -- Line: 389 -- upvalues: u1 (ref), a1 (val)
            u1:Disconnect()
            a1()
        end)
    end))
end

function u164.Stop(a1) -- Line: 396
    -- upvalues: Background (val), Sound (val), u163 (val), Render (val), DepthOfField (val)
    Background:Disable()
    Sound("Swoosh"):Play()
    u163:Sweep()
    Render:Remove("Item")
    Render:Remove("Camera")
    local CurrentCamera = workspace.CurrentCamera
    CurrentCamera.CameraType = Enum.CameraType.Custom
    CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    DepthOfField:Disable((TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)))
end

return u164