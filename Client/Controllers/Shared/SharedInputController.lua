-- Script path: ReplicatedStorage.Client.Controllers.Shared.SharedInputController
-- Decompile time: 5.90 ms

local Chat = game:GetService("Chat")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local HotKey = require(ReplicatedStorage.Client.Modules.HotKey)
local Mobile = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Mobile)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local v1 = {
    init = function() -- Line: 17
        -- upvalues: ReplicatedStorage (val), Players (val), Mobile (val), RunService (val), HotKey (val), Chat (val)
        -- upvalues: StarterGui (val), SharedGameConstants (val), TextChatService (val), UserInputService (val)
        local Character
        local Render = require(ReplicatedStorage.Shared.Modules.Render)
        local Raycast = require(ReplicatedStorage.Shared.Modules.Raycast)
        local CommunicationAvailability = require(ReplicatedStorage.Client.Modules.CommunicationAvailability)
        local CommunicationController = require(ReplicatedStorage.Client.Controllers.Game.CommunicationController)
        local Profiles = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Profiles)
        local Buttons = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Buttons)
        local PlayerGui = require(game.ReplicatedStorage.Client.Modules.PlayerGui)
        local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
        local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
        local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
        local Network = require(ReplicatedStorage.Shared.Modules.Network)
        local Shared = PlayerGui.Shared
        local EmotesMenu = Enum.CoreGuiType.EmotesMenu
        local Backpack = Enum.CoreGuiType.Backpack
        local PlayerList = Enum.CoreGuiType.PlayerList
        local LocalPlayer = Players.LocalPlayer
        local u81 = nil
        local u82 = false
        local Mouse = LocalPlayer:GetMouse()
        local HoverFrame = Shared
        if HoverFrame then
            HoverFrame = (Shared:WaitForChild("HoverGui")):WaitForChild("HoverFrame")
        end
        local Whitelist = Raycast.new("Whitelist")

        local function _updateCharacter(a1) -- Line: 50 -- upvalues: Whitelist (val)
            if a1 then
                Whitelist:Add(a1)
            end
        end

        for k, v in pairs(Players:GetPlayers()) do
            v.CharacterAdded:Connect(_updateCharacter)
            Character = v.Character
            if Character then
                Whitelist:Add(Character)
            end
        end
        Players.PlayerAdded:Connect(function(a1) -- Line: 56 -- upvalues: _updateCharacter (val), Whitelist (val)
            a1.CharacterAdded:Connect(_updateCharacter)
            local Character = a1.Character
            if Character then
                Whitelist:Add(Character)
            end
        end)
        ViewController:init()
        local u130 = ViewController:getEmitter("ShowWheel")
        Mobile.Signals.Emote:Connect(function() -- Line: 72 -- upvalues: u130 (val)
            u130:Emit("Show", "Emotes", false)
        end)
        Mobile.Signals.Sticker:Connect(function() -- Line: 76 -- upvalues: u130 (val)
            u130:Emit("Show", "Stickers", false)
        end)
        Mobile.Signals.Communication:Connect(function() -- Line: 80 -- upvalues: CommunicationAvailability (val), CommunicationController (val)
            if not CommunicationAvailability.canUse() then
                return
            end
            CommunicationController.toggle()
        end)
        local u159 = SpringClass.new(16, 1, 15)
        u159.t = 16
        LocalPlayer:SetAttribute("SprintEnabled", true)
        LocalPlayer:SetAttribute("Sprinting", false)

        local function setSprint(a1) -- Line: 94 -- upvalues: LocalPlayer (val), u82 (ref), u159 (val)
            if not LocalPlayer:GetAttribute("SprintEnabled") then
                u82 = false
                return
            end
            LocalPlayer:SetAttribute("Sprinting", a1)
            u159.t = if not a1 then 16 else 50
        end

        Scheduler.add("CharacterMovement", RunService.Heartbeat, function() -- Line: 104 -- upvalues: LocalPlayer (val), u159 (val)
            local Character = LocalPlayer.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            if Character:GetAttribute("Emoting") then
                return
            end
            local Attribute = LocalPlayer:GetAttribute("SprintEnabled")
            local Attribute_2 = Character and Character:GetAttribute("MovementLocked")
            if Humanoid then
                if Attribute_2 then
                    Humanoid.WalkSpeed = 0
                    Humanoid.JumpPower = 0
                    return
                end
                if Attribute then
                    Humanoid.WalkSpeed = u159.p
                    Humanoid.JumpPower = 50
                    return
                end
                Humanoid.WalkSpeed = 16
                Humanoid.JumpPower = 50
            end
        end)
        Mobile.Signals.Run:Connect(function() -- Line: 129 -- upvalues: u82 (ref), LocalPlayer (val), u159 (val)
            u82 = not u82
            local v1 = u82
            if not LocalPlayer:GetAttribute("SprintEnabled") then
                u82 = false
                return
            end
            LocalPlayer:SetAttribute("Sprinting", v1)
            u159.t = if not v1 then 16 else 50
        end)
        ;(HotKey.new("Sprint", Enum.KeyCode.ButtonL3)).Pressed:Connect(function(a1) -- Line: 135 -- upvalues: u82 (ref), LocalPlayer (val), u159 (val)
            local v1 = a1
            if not LocalPlayer:GetAttribute("SprintEnabled") then
                u82 = false
                return
            end
            LocalPlayer:SetAttribute("Sprinting", v1)
            u159.t = if not v1 then 16 else 50
        end)
        Chat:RegisterChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, function() -- Line: 140
            return {BubbleChatEnabled = true}
        end)
        StarterGui:SetCoreGuiEnabled(EmotesMenu, false)
        StarterGui:SetCoreGuiEnabled(Backpack, false)
        StarterGui:SetCoreGuiEnabled(PlayerList, false)
        if SharedGameConstants.GAME_ID ~= game.GameId then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Captures, false)
        end
        ;(Network.Channel("Chat")):On("Message", function(a1) -- Line: 153 -- upvalues: TextChatService (upval) -- types: a1: string
            ((TextChatService:WaitForChild("TextChannels")):WaitForChild("RBXGeneral")):DisplaySystemMessage(a1)
        end)
        ;((TextChatService:WaitForChild("ChatInputBarConfiguration")):GetPropertyChangedSignal("IsFocused")):Connect(function() -- Line: 161 -- upvalues: Network (val), TextChatService (upval)
            (Network.Channel("Chat")):FireServer("Typing", TextChatService.ChatInputBarConfiguration.IsFocused)
        end)

        local function findRoot(a1) -- Line: 166 -- types: a1: userdata
            local v1 = a1:FindFirstAncestorOfClass("Model")
            return v1 and v1:FindFirstChild("HumanoidRootPart")
        end

        if Profiles.ShouldShow() and HoverFrame then
            local u265 = false
            local u273 = UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 174 -- upvalues: u265 (ref), Profiles (val), u81 (ref)
                if a2 then
                    return
                end
                local UserInputType = a1.UserInputType
                if UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch then
                    return
                end
                if u265 then
                    u265 = false
                    Profiles.Disable()
                    return
                end
                if u81 then
                    u265 = true
                    Profiles.Enable(u81)
                end
            end)
            Render:Add("Profiles", Enum.RenderPriority.Last, function() -- Line: 194
                -- upvalues: Whitelist (val), Players (upval), LocalPlayer (val), UserInputService (upval)
                -- upvalues: HoverFrame (val), u81 (ref), Mouse (val)
                local v1 = Whitelist:CastMouse()
                if not v1 then
                    return
                end
                local Hit = v1.Hit
                local v2 = Hit
                if v2 then
                    local v3 = Hit:FindFirstAncestorOfClass("Model")
                    v2 = v3 and v3:FindFirstChild("HumanoidRootPart")
                end
                local PlayerFromCharacter = v2 and Players:GetPlayerFromCharacter(v2.Parent)
                if not PlayerFromCharacter or PlayerFromCharacter == LocalPlayer then
                    u81 = nil
                    HoverFrame.Visible = false
                else
                    if UserInputService.MouseEnabled then
                        HoverFrame.Visible = not v2:FindFirstChild("Profile")
                    end
                    u81 = PlayerFromCharacter
                end
                HoverFrame.Position = UDim2.new(0, Mouse.X + 10, 0, Mouse.Y)
            end)
            Profiles.stopSignal:Connect(function() -- Line: 217 -- upvalues: HoverFrame (val), u273 (val), Render (val)
                HoverFrame.Visible = false
                u273:Disconnect()
                Render:Remove("Profiles")
            end)
        end
        Render:Add("Buttons", Enum.RenderPriority.Last, Buttons.Update)
    end,
}
task.spawn(v1.init)
return v1