-- Script path: ReplicatedStorage.Content.NewEnemies.Producer.Animator.ProducerAnimatorStates
-- Decompile time: 3.52 ms

local CaptureService = game:GetService("CaptureService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GlobalBus = require(ReplicatedStorage.Shared.Modules.GlobalBus)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

local function scaleAnimationToTime(a1, a2, a3) -- Line: 16 -- types: a2: number, a3: number?
    local v1 = tick() + (a3 or 1)
    local Controller = a1.Controller
    while Controller.Length == 0 do
        if v1 < tick() then
            return
        end
        task.wait()
    end
    a1:AdjustSpeed(Controller.Length / a2)
end

local function flashbang() -- Line: 28
    -- upvalues: Players (val), Lighting (val), CaptureService (val), TweenService (val)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Flashbang"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = Players.LocalPlayer.PlayerGui
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Size = UDim2.fromScale(1, 1)
    ImageLabel.Image = ""
    ImageLabel.Parent = ScreenGui
    local ColorCorrection = Lighting.ColorCorrection
    local u21 = TweenInfo.new(2.5)
    local u24 = tick() + 2.5
    CaptureService:CaptureScreenshot(function(a1) -- Line: 44
        -- upvalues: u24 (val), ScreenGui (val), ColorCorrection (val), TweenService (upval), u21 (val)
        -- upvalues: ImageLabel (val)
        if u24 <= (tick()) then
            ScreenGui:Destroy()
            return
        end
        local Brightness = ColorCorrection.Brightness
        ColorCorrection.Brightness = 1
        TweenService:Create(ColorCorrection, u21, {Brightness = Brightness}):Play()
        ImageLabel.Image = a1
        local v1 = TweenService:Create(ImageLabel, u21, {ImageTransparency = 1})
        v1:Play()
        v1.Completed:Once(function() -- Line: 62 -- upvalues: ScreenGui (upval)
            ScreenGui:Destroy()
        end)
    end)
end

local v1 = {
    name = "Beam",
    onEnter = function(a1, a2) -- Line: 75
        -- upvalues: TimescaleUtilities (val), scaleAnimationToTime (val), EmitterManager (val), flashbang (val)
        local Beam = a1.Stats.Abilities.Beam
        local Windup = Beam.Windup
        local Endlag = Beam.Endlag
        a1:Face(a2.targetPos, (TweenInfo.new(0.5)))
        local ProjectorAnticipation = a1.animations.ProjectorAnticipation
        ProjectorAnticipation:AdjustSpeed((ProjectorAnticipation.Controller.Length or 1) / Windup)
        ProjectorAnticipation:Play()
        a1.Model.Projecter.Transparency = 0
        a1.Model.PrimaryPart.Projector:Play()
        TimescaleUtilities.Wait(Windup)
        if a1:IsAlive() then
            local ProjectorAttack = a1.animations.ProjectorAttack
            ProjectorAttack:Play()
            scaleAnimationToTime(ProjectorAttack, Endlag)
            EmitterManager.manualEmit(a1.Model.FlashEffect.Value)
            flashbang()
            TimescaleUtilities.Wait(Endlag)
        end
        a1.Model.Projecter.Transparency = 1
    end,
}
local v2 = {
    name = "Clapboard",
    onEnter = function(a1, a2) -- Line: 110 -- upvalues: scaleAnimationToTime (val), TimescaleUtilities (val)
        local Clapboard = a1.Stats.Abilities.Clapboard
        local Windup = Clapboard.Windup
        local Endlag = Clapboard.Endlag
        local ClapperAnticipation = a1.animations.ClapperAnticipation
        ClapperAnticipation:Play()
        scaleAnimationToTime(ClapperAnticipation, Windup)
        a1.Model.Clapper.Transparency = 0
        a1.Model.PrimaryPart.Clapper:Play()
        TimescaleUtilities.Wait(Windup)
        if a1:IsAlive() then
            local ClapperAttack = a1.animations.ClapperAttack
            ClapperAttack:Play()
            scaleAnimationToTime(ClapperAttack, Endlag)
            TimescaleUtilities.Wait(Endlag)
        end
        a1.Model.Clapper.Transparency = 1
    end,
}
local v3 = {
    name = "Spotlight",
    onEnter = function(a1, a2) -- Line: 138
        -- upvalues: scaleAnimationToTime (val), GameState (val), GlobalBus (val), RunService (val)
        -- upvalues: TimescaleUtilities (val)
        local Spotlight = a1.Stats.Abilities.Spotlight
        local Windup = Spotlight.Windup
        local Endlag = Spotlight.Endlag
        local SpotlightAnticipation = a1.animations.SpotlightAnticipation
        SpotlightAnticipation:Play()
        scaleAnimationToTime(SpotlightAnticipation, Windup)
        a1.Model.PrimaryPart.Spotlight:Play()
        if not a1._selfSpotlight then
            if GameState.MapName == "The Narratorium" then
                GlobalBus.Fire("ToggleMapLights", false)
                a1.Maid:Mark(function() -- Line: 152 -- upvalues: GlobalBus (upval)
                    GlobalBus.Fire("ToggleMapLights", true)
                end)
            end
            local Node = a1.Model.PrimaryPart.Node
            local u44 = a1:createSpotlight(Node.WorldPosition, 6, false)
            a1._selfSpotlight = u44
            a1.Maid:Mark((RunService.RenderStepped:Connect(function() -- Line: 161 -- upvalues: u44 (val), Node (val)
                if u44:IsDescendantOf(game) then
                    u44:PivotTo((CFrame.new(Node.WorldPosition)))
                end
            end)))
        end
        TimescaleUtilities.Wait(Windup)
        if not a1:IsAlive() then
            return
        end
        local SpotlightAttack = a1.animations.SpotlightAttack
        SpotlightAttack:Play()
        scaleAnimationToTime(SpotlightAttack, Endlag)
    end,
}
local v4 = {
    name = "Summon",
    onEnter = function(a1, a2) -- Line: 181 -- upvalues: scaleAnimationToTime (val)
        local SummonTime = a1.Stats.Abilities.Summon.SummonTime
        local Summon_2 = a1.animations.Summon
        Summon_2:Play()
        scaleAnimationToTime(Summon_2, SummonTime)
        a1.Model.PrimaryPart.Summon:Play()
    end,
}
local v5 = {
    name = "Death",
    onEnter = function(a1) -- Line: 195 -- upvalues: TimescaleUtilities (val)
        for i, j in a1.Model.PrimaryPart:GetChildren() do
            if j:IsA("Sound") then
                j:Stop()
            end
        end
        local v1 = a1.animations.Death:Play()
        a1.Model.PrimaryPart.Death:Play()
        local v2 = v1.Length * 0.95
        TimescaleUtilities.Wait(v2)
        local TransformedWorldCFrame = a1.Model.PrimaryPart.Root.Torso.TransformedWorldCFrame
        local u42 = a1.Model.Projecter:Clone()
        u42:ClearAllChildren()
        u42.Anchored = true
        u42.CFrame = TransformedWorldCFrame * CFrame.Angles(0, -1.5707963267948966, 0)
        u42.Parent = workspace.CurrentCamera
        TimescaleUtilities.Delay(8 - v2, function() -- Line: 216 -- upvalues: u42 (val), TimescaleUtilities (upval)
            u42.Transparency = 0
            TimescaleUtilities.CleanUp(u42, 10)
        end)
    end,
}
return {
    Walk = {
        name = "Walk",
        onEnter = function(a1) end,
    },
    Beam = v1,
    Clapboard = v2,
    Spotlight = v3,
    Summon = v4,
    Death = v5,
}