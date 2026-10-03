-- Script path: ReplicatedStorage.Client.Controllers.Shared.TextChatController
-- Decompile time: 1.05 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local v1 = {}
local u22 = {
    VIP = "<font color='#F5CD30'>[VIP+]</font>",
    Developer = "<font color='#FF0000'>[DEV]</font>",
    Owner = "<font color='#FF0000'>[OWNER]</font>",
}

function v1.init() -- Line: 15 -- upvalues: TextChatService (val), Players (val), PlayerReplicator (val), u22 (val)
    if workspace.Type.Value == "Lobby" then
        local ChatWindowConfiguration = TextChatService:WaitForChild("ChatWindowConfiguration")
        ChatWindowConfiguration.HeightScale = 0.75
    end

    function TextChatService.OnIncomingMessage(a1) -- Line: 20
        -- upvalues: Players (upval), PlayerReplicator (upval), u22 (upval)
        local TextSource = a1.TextSource and Players:GetPlayerByUserId(a1.TextSource.UserId)
        if not TextSource then
            return
        end
        local v1 = PlayerReplicator.GetEntityFromPlayer(TextSource)
        if not v1 then
            return
        end
        local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
        local Flair = TextSource:FindFirstChild("Flair")
        if Flair and Flair:GetAttribute("Enabled") == true and u22[Flair.Value] then
            TextChatMessageProperties.PrefixText = ("%* %*"):format(u22[Flair.Value], a1.PrefixText)
            return TextChatMessageProperties
        end
        if not v1.Replicator:Get("VIPPlus") then
            return
        end
        TextChatMessageProperties.PrefixText = ("<font color='#F5CD30'>[VIP+]</font> %*"):format(a1.PrefixText)
        return TextChatMessageProperties
    end
end

task.spawn(v1.init)
return v1