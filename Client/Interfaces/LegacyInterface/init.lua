-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface
-- Decompile time: 3.17 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local LegacyInterface = (ReplicatedStorage:WaitForChild("Client")).Interfaces.LegacyInterface
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ViewController = require(LegacyInterface.Controllers.ViewController)
local u49 = if not (workspace:WaitForChild("Type").Value == "Lobby") then {"Matchmaking", "Prompt"} else {"Hotbar", "Matchmaking", "Portal", "Prompt"}
return {
    Views = {},
    createPrompts = function(a1) -- Line: 34 -- upvalues: LocalPlayer (val), ViewController (val), CollectionService (val)
        local function createPrompt(a1, a2, a3) -- Line: 35
            -- upvalues: LocalPlayer (upval), ViewController (upval)
            local ProximityPrompt = Instance.new("ProximityPrompt")
            ProximityPrompt.RequiresLineOfSight = false
            ProximityPrompt.MaxActivationDistance = 10
            ProximityPrompt.HoldDuration = 0.1
            ProximityPrompt.ObjectText = "Open " .. a1
            ProximityPrompt.Style = Enum.ProximityPromptStyle.Custom
            local u17 = ProximityPrompt.Triggered:Connect(function(a1_2) -- Line: 43 -- upvalues: LocalPlayer (upval), ViewController (upval), a1 (val)
                if a1_2 ~= LocalPlayer then
                    return
                end
                ViewController:setView(a1)
            end)
            ProximityPrompt.Destroying:Connect(function() -- Line: 51 -- upvalues: u17 (val)
                u17:Disconnect()
            end)
            ProximityPrompt.Parent = a3 or a2
            return ProximityPrompt
        end

        local function attachToView(a1) -- Line: 60 -- upvalues: createPrompt (val) -- types: a1: userdata
            local Attribute = a1:GetAttribute("View")
            local Attribute_2 = a1:GetAttribute("Offset")
            if Attribute and a1:IsA("BasePart") then
                local Attachment = Instance.new("Attachment")
                Attachment.Name = "PromptAttachment"
                Attachment.Position = Attribute_2 or Vector3.new(0, 5, 0)
                Attachment.Parent = a1
                createPrompt(Attribute, a1, Attachment)
                a1.Anchored = true
                a1.CanCollide = false
                a1.CanQuery = false
                a1.CanTouch = false
                return
            end
        end

        ;(CollectionService:GetInstanceAddedSignal("UI_PROMPT")):Connect(attachToView)
        for k, v in pairs(CollectionService:GetTagged("UI_PROMPT")) do
            attachToView(v)
        end
    end,
    init = function(self) -- Line: 89 -- upvalues: PlayerGui (val), u49 (val), GameState (val)
        local Views, result_2, success_2, v1
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Name = "Interface"
        ScreenGui.DisplayOrder = 2000
        ScreenGui.Parent = PlayerGui
        local Frame = Instance.new("Frame")
        Frame.BackgroundTransparency = 1
        Frame.Name = "Root"
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.Position = UDim2.fromScale(0.5, 0.5)
        Frame.Size = UDim2.fromScale(1, 1)
        Frame.Parent = ScreenGui
        for i, v in ipairs(script.Controllers:GetChildren()) do
            if v:IsA("ModuleScript") then
                v1 = require(v)
                if v1.init then
                    v1:init()
                end
            end
        end
        for i2, i3 in ipairs(u49) do
            v1 = script:FindFirstChild(i3)
            Views = v1 and v1:FindFirstChild("Views")
            local u97 = Views
            if u97 then
                u97 = Views:FindFirstChild(i3)
            end
            if i3 ~= "Hotbar" then
                if GameState.GameMode ~= "PVP" then
                    if u97 then
                        success_2, result_2 = pcall(function() -- Line: 135 -- upvalues: u97 (val), Frame (val)
                            return assert((require(u97)))({Root = Frame})
                        end)
                        if not success_2 then
                            warn(string.format("Error occured while loading view %q: %s", u97:GetFullName(), result_2))
                        else
                            result_2.Parent = if i3 == "Prompt" then ScreenGui else Frame
                            result_2.Name = i3
                            v2.Views[i3] = {Component = result_2, View = u97}
                        end
                    end
                elseif i3 ~= "Inventory" and u97 then
                    success_2, result_2 = pcall(function() -- Line: 135 -- upvalues: u97 (val), Frame (val)
                        return assert((require(u97)))({Root = Frame})
                    end)
                    if not success_2 then
                        warn(string.format("Error occured while loading view %q: %s", u97:GetFullName(), result_2))
                    else
                        result_2.Parent = if i3 == "Prompt" then ScreenGui else Frame
                        result_2.Name = i3
                        v2.Views[i3] = {Component = result_2, View = u97}
                    end
                end
            end
        end
        if table.find(u49, "Hotbar") then
            local Currency = script.Hotbar.Views.Currency
            local success, result = pcall(function() -- Line: 161 -- upvalues: Currency (val)
                return assert((require(Currency)))({})
            end)
            if not success then
                warn(string.format("Error occured while loading view %q: %s", Currency:GetFullName(), result))
            else
                result.Parent = Frame
            end
        end
        v2:createPrompts()
    end,
}