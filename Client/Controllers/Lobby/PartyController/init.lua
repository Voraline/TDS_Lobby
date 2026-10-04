-- Script path: ReplicatedStorage.Client.Controllers.Lobby.PartyController
-- Decompile time: 12.92 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SocialService = game:GetService("SocialService")
require(script.types)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local PartyInviteAssetIds = require(ReplicatedStorage.Client.Controllers.Lobby.PartyController.PartyInviteAssetIds)
local PartyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.PartyStore)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Party = Network.Channel("Party")
local LocalPlayer = Players.LocalPlayer
local v1 = {
    acceptInvite = function(a1, a2) -- Line: 38
        -- upvalues: Party (val), ViewController (val), PartyStore (val)
        local v1 = Party:InvokeServer("AcceptInvite", a2)
        if v1.success and v1.party then
            a1:removeInvite(a2)
            ViewController:notify((("You joined %*'s party."):format(a2.DisplayName)))
            PartyStore.setParty(v1.party)
            return true, v1.party
        end
        ViewController:notifyError(v1.error)
        return false
    end,
    createParty = function(a1, a2) -- Line: 51
        -- upvalues: Party (val), ViewController (val), PartyStore (val)
        local v1 = Party:InvokeServer("CreateParty", a2)
        if not v1 then
            ViewController:notifyError("Failed to create party.")
            return
        end
        if v1.success and v1.party then
            PartyStore.setParty(v1.party)
            if not a2 then
                ViewController:notify("Created a new party.")
            else
                ViewController:notify((("Invited %* to the party."):format(a2.DisplayName)))
            end
            return v1.party
        end
        ViewController:notifyError(v1.error)
    end,
    declineInvite = function(a1, a2) -- Line: 74 -- upvalues: Party (val) -- types: a1: table, a2: userdata
        a1:removeInvite(a2)
        Party:FireServer("DeclineInvite", a2)
    end,
    getParty = function(a1, a2) -- Line: 79 -- types: a1: table, a2: userdata
        local v1 = a1:getParties()
        if v1 then
            for i, j in v1 do
                if j.players[1] == a2 then
                    return j
                end
            end
        end
    end,
    getParties = function(a1) -- Line: 92 -- upvalues: Party (val), PartyStore (val)
        local v1 = Party:InvokeServer("GetParties")
        PartyStore.setParties(v1)
        return v1
    end,
    invitePlayer = function(a1, a2) -- Line: 99
        -- upvalues: PartyStore (val), ViewController (val), Party (val)
        local declined = PartyStore.getState().declined
        if declined[a2] and tick() - declined[a2] < 60 then
            ViewController:notifyError((("You must wait %* seconds before inviting %* again."):format(60 - math.round((tick()) - declined[a2]), a2.DisplayName)))
            return nil
        end
        local v1 = Party:InvokeServer("InvitePlayer", a2)
        if v1.success and v1.party then
            ViewController:notify((("Invited %* to the party."):format(a2.DisplayName)))
            return v1.party.invited
        end
        ViewController:notifyError(v1.error)
        return nil
    end,
    joinParty = function(a1, a2) -- Line: 120
        -- upvalues: Party (val), PartyStore (val), ViewController (val)
        local v1 = Party:InvokeServer("JoinParty", a2)
        if not v1.success or not v1.party then
            ViewController:notifyError(v1.error)
        else
            PartyStore.setParty(v1.party)
            a1:removeInvite(a2)
            ViewController:notify((("You joined %*'s party."):format(a2.DisplayName)))
        end
        return v1.party
    end,
    kickPlayer = function(a1, a2) -- Line: 133
        -- upvalues: Party (val), PartyStore (val), ViewController (val)
        local v1 = Party:InvokeServer("KickPlayer", a2)
        if not v1.success or not v1.party then
            ViewController:notifyError(v1.error)
        else
            PartyStore.setParty(v1.party)
            ViewController:notify((("Kicked %* from the party."):format(a2.DisplayName)))
        end
        a1:removeInvited(a2)
    end,
    leaveParty = function(a1) -- Line: 146 -- upvalues: Party (val), PartyStore (val), ViewController (val)
        local v1 = Party:InvokeServer("LeaveParty")
        if not v1.success then
            ViewController:notifyError(v1.error)
            return false
        end
        PartyStore.setParty(nil)
        ViewController:notify("You left the party.")
        return true
    end,
    updateSetting = function(a1, a2, a3) -- Line: 158
        -- upvalues: Party (val), PartyStore (val), ViewController (val)
        local v1 = Party:InvokeServer("UpdateSetting", a2, a3)
        if v1.success and v1.party then
            PartyStore.setPartyParams(v1.party.partyParams)
            return
        end
        ViewController:notifyError(v1.error)
    end,
    removeInvite = function(a1, a2) -- Line: 167 -- upvalues: PartyStore (val), table (val) -- types: a1: table, a2: userdata
        PartyStore.setInvites((table.filter((PartyStore.getState()).invites, function(a1) -- Line: 169 -- upvalues: a2 (val)
            return a1 ~= a2
        end)))
    end,
    removeInvited = function(a1, a2) -- Line: 176 -- upvalues: PartyStore (val), table (val) -- types: a1: table, a2: userdata
        local party = PartyStore.getState().party
        if not party then
            return
        end
        local v1 = table.clone(party)
        local invited = v1.invited
        local v2 = table.find(invited, a2)
        if v2 then
            table.remove(invited, v2)
            PartyStore.setParty(v1)
        end
    end,
}

local function canSendGameInvite(a1) -- Line: 191
    -- upvalues: SocialService (val), LocalPlayer (val)
    local success, result = pcall(function() -- Line: 192 -- upvalues: SocialService (upval), LocalPlayer (upval), a1 (val)
        return SocialService:CanSendGameInviteAsync(LocalPlayer, a1)
    end)
    return success and result
end

function v1.inviteFriend(a1, a2) -- Line: 199
    -- upvalues: SocialService (val), LocalPlayer (val), ViewController (val), HttpService (val)
    -- upvalues: PartyInviteAssetIds (val)
    local VisitorId = a2.VisitorId
    local success, result = pcall(function() -- Line: 192 -- upvalues: SocialService (upval), LocalPlayer (upval), VisitorId (val)
        return SocialService:CanSendGameInviteAsync(LocalPlayer, VisitorId)
    end)
    if not success or not result then
        ViewController:notifyError("You cannot send a game invite to this player.")
        return
    end
    local v1 = HttpService:JSONEncode({senderUserId = LocalPlayer.UserId})
    local ExperienceInviteOptions = Instance.new("ExperienceInviteOptions")
    ExperienceInviteOptions.InviteUser = a2.VisitorId
    ExperienceInviteOptions.LaunchData = v1
    ExperienceInviteOptions.InviteMessageId = PartyInviteAssetIds["PartyInvite" .. math.random(1, 9)]
    ExperienceInviteOptions.PromptMessage = ("Would you like to invite %* to your party?"):format(a2.DisplayName)
    ViewController:setView("None")
    SocialService:PromptGameInvite(LocalPlayer, ExperienceInviteOptions)
    SocialService.GameInvitePromptClosed:Once(function() -- Line: 219 -- upvalues: ViewController (upval)
        ViewController:setView("Party")
    end)
end

function v1.init() -- Line: 224
    -- upvalues: SocialService (val), LocalPlayer (val), PartyStore (val), Party (val), ViewController (val)
    task.spawn(function() -- Line: 225 -- upvalues: SocialService (upval), LocalPlayer (upval), PartyStore (upval)
        local result, result_2, success, success_2
        while true do
            local u1 = nil
            success, result = pcall(function() -- Line: 192 -- upvalues: SocialService (upval), LocalPlayer (upval), u1 (val)
                return SocialService:CanSendGameInviteAsync(LocalPlayer, u1)
            end)
            if success and result then
                success_2, result_2 = pcall(function() -- Line: 232 -- upvalues: LocalPlayer (upval)
                    return LocalPlayer:GetFriendsOnline()
                end)
                if success_2 then
                    PartyStore.setFriends(result_2)
                end
                task.wait(120)
            else
                task.wait(300)
            end
        end
    end)
    local v1 = Party:InvokeServer("GetCurrentParty")
    if v1 then
        if v1.players[1] then
            ViewController:notify((("You have joined %*'s party."):format(v1.players[1].DisplayName)))
        end
        PartyStore.setParty(v1)
    end
end

Party:On("DeclineInvite", function(a1, a2) -- Line: 253 -- upvalues: ViewController (val), table (val), PartyStore (val) -- types: a1: userdata
    ViewController:notify((("%* declined your party invite."):format(a1.DisplayName)))
    local v1 = table.clone(PartyStore.getState().declined)
    v1[a1] = (tick())
    PartyStore.setDeclined(v1)
    PartyStore.setParty(a2)
end)
Party:On("HostChanged", function(a1) -- Line: 261 -- upvalues: LocalPlayer (val), ViewController (val) -- types: a1: userdata
    if a1 == LocalPlayer then
        ViewController:notify("You are now the party leader.")
        return
    end
    ViewController:notify((("%* is now the party leader."):format(a1.DisplayName)))
end)
Party:On("Invite", function(a1) -- Line: 269 -- upvalues: table (val), PartyStore (val) -- types: a1: userdata
    local v1 = table.clone(PartyStore.getState().invites)
    table.insert(v1, a1)
    PartyStore.setInvites(v1)
end)
Party:On("Kicked", function(a1) -- Line: 276 -- upvalues: PartyStore (val), ViewController (val) -- types: a1: userdata
    PartyStore.setParty(nil)
    ViewController:notify((("You were kicked from %*'s party."):format(a1.DisplayName)))
end)
Party:On("PlayerJoined", function(a1) -- Line: 281 -- upvalues: ViewController (val) -- types: a1: userdata
    ViewController:notify((("%* joined the party."):format(a1.DisplayName)))
end)
Party:On("PlayerKicked", function(a1) -- Line: 285 -- upvalues: ViewController (val) -- types: a1: userdata
    ViewController:notify((("%* was kicked from the party."):format(a1.DisplayName)))
end)
Party:On("PlayerLeft", function(a1) -- Line: 289 -- upvalues: ViewController (val) -- types: a1: userdata
    ViewController:notify((("%* left the party."):format(a1.DisplayName)))
end)
Party:On("UpdateParty", function(a1) -- Line: 293 -- upvalues: PartyStore (val)
    PartyStore.setParty(a1)
end)
Party:On("UpdateParties", function(a1) -- Line: 297 -- upvalues: PartyStore (val) -- types: a1: table
    PartyStore.setParties(a1)
end)
Party:On("RemoveInvite", function(a1) -- Line: 301 -- upvalues: table (val), PartyStore (val) -- types: a1: userdata
    local v1 = table.clone(PartyStore.getState().invites)
    local v2 = table.find(v1, a1)
    if v2 then
        table.remove(v1, v2)
        PartyStore.setInvites(v1)
    end
end)
task.spawn(v1.init)
return v1