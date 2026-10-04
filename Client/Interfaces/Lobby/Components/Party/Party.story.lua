-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Party.story
-- Decompile time: 9.83 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 12
    -- upvalues: Players (val), React (val), PartyContext (val), createElement (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13
        -- upvalues: Players (upval), React (upval), PartyContext (upval), createElement (upval), Parent (upval)
        local v1 = {
            Players.LocalPlayer,
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 20
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 25
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 35
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 40
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
        }
        local v2 = React.useContext(PartyContext)
        local v3 = table.clone(v1)
        table.insert(v3, 1, Players.LocalPlayer)
        v2.host = Players.LocalPlayer
        v2.isHost = true
        v2.invites = table.clone({
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 53
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 58
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 68
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 73
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 83
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 88
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 98
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 103
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 113
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 118
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 128
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 133
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 143
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 148
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 158
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 163
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 173
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 178
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 188
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 193
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
            {
                DisplayName = "Roblox",
                Name = "Roblox",
                UserId = 1,
                WaitForChild = function() -- Line: 204
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 209
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1
                    return IntValue
                end,
            },
            {
                DisplayName = "John Doe",
                Name = "JohnDoe",
                UserId = 2,
                WaitForChild = function() -- Line: 219
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
                FindFirstChild = function() -- Line: 224
                    local IntValue = Instance.new("IntValue")
                    IntValue.Value = 1337
                    return IntValue
                end,
            },
        })
        v2.players = v3
        local v4 = table.clone(v1)
        local v5 = table.clone(v1)
        table.remove(v5, 1)
        local v6 = table.clone(v1)
        table.insert(v6, {
            DisplayName = "Jane Doe",
            Name = "JaneDoe",
            UserId = 3,
            WaitForChild = function() -- Line: 251
                local IntValue = Instance.new("IntValue")
                IntValue.Value = 1234
                return IntValue
            end,
            FindFirstChild = function() -- Line: 256
                local IntValue = Instance.new("IntValue")
                IntValue.Value = 1234
                return IntValue
            end,
        })
        table.insert(v6, {
            DisplayName = "Jane Doe",
            Name = "JaneDoe2",
            UserId = 3,
            WaitForChild = function() -- Line: 267
                local IntValue = Instance.new("IntValue")
                IntValue.Value = 777
                return IntValue
            end,
            FindFirstChild = function() -- Line: 272
                local IntValue = Instance.new("IntValue")
                IntValue.Value = 777
                return IntValue
            end,
        })
        local v7 = {}
        local v8 = {
            invited = {},
            players = table.clone(v4),
            partyParams = {
                partyLocked = false,
                maximumLevel = 500,
                maxPlayers = 4,
                membersCanInvite = false,
                minimumLevel = 0,
            },
        }
        local v9 = {
            invited = {},
            players = table.clone(v4),
            partyParams = {
                partyLocked = false,
                maximumLevel = 500,
                maxPlayers = 4,
                membersCanInvite = false,
                minimumLevel = 0,
            },
        }
        v7[1] = {
            invited = {},
            players = v4,
            partyParams = {
                partyLocked = false,
                maximumLevel = 500,
                maxPlayers = 4,
                membersCanInvite = false,
                minimumLevel = 0,
            },
        }
        v7[2] = {
            invited = {},
            players = v6,
            partyParams = {
                partyLocked = false,
                maximumLevel = 500,
                maxPlayers = 4,
                membersCanInvite = false,
                minimumLevel = 0,
            },
        }
        v7[3] = v8
        v7[4] = v9
        v7[5] = {
            invited = {},
            players = v5,
            partyParams = {
                partyLocked = false,
                maximumLevel = 500,
                maxPlayers = 4,
                membersCanInvite = false,
                minimumLevel = 0,
            },
        }
        v2.parties = v7
        v2.currentWindow = "PartySearch"
        if v2.host then
            v2.currentWindow = "CurrentParty"
        end
        table.insert(v1, {
            DisplayName = "Jane Doe",
            Name = "JaneDoe",
            UserId = 3,
            WaitForChild = function() -- Line: 346
                local IntValue = Instance.new("IntValue")
                IntValue.Value = 1234
                return IntValue
            end,
            FindFirstChild = function() -- Line: 351
                local IntValue = Instance.new("IntValue")
                IntValue.Value = 1234
                return IntValue
            end,
        })
        v2.friends = Players.LocalPlayer:GetFriendsOnline()
        return createElement(Parent, {visible = true, scale = 1, players = v1})
    end)
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 381 -- upvalues: u8 (val)
        u8:unmount()
    end
end