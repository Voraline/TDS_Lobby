-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyInvite.story
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InviteContainer = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.InviteContainer)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), InviteContainer (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 11 -- upvalues: createElement (upval), InviteContainer (upval)
        return createElement(InviteContainer, {
            invites = {
                {
                    DisplayName = "Roblox",
                    Name = "Roblox",
                    UserId = 1,
                    WaitForChild = function() -- Line: 17
                        local IntValue = Instance.new("IntValue")
                        IntValue.Value = 1
                        return IntValue
                    end,
                    FindFirstChild = function() -- Line: 22
                        local IntValue = Instance.new("IntValue")
                        IntValue.Value = 1
                        return IntValue
                    end,
                },
                {
                    DisplayName = "Roblox",
                    Name = "Roblox",
                    UserId = 1,
                    WaitForChild = function() -- Line: 32
                        local IntValue = Instance.new("IntValue")
                        IntValue.Value = 1
                        return IntValue
                    end,
                    FindFirstChild = function() -- Line: 37
                        local IntValue = Instance.new("IntValue")
                        IntValue.Value = 1
                        return IntValue
                    end,
                },
                {
                    DisplayName = "Roblox",
                    Name = "Roblox",
                    UserId = 1,
                    WaitForChild = function() -- Line: 47
                        local IntValue = Instance.new("IntValue")
                        IntValue.Value = 1
                        return IntValue
                    end,
                    FindFirstChild = function() -- Line: 52
                        local IntValue = Instance.new("IntValue")
                        IntValue.Value = 1
                        return IntValue
                    end,
                },
            },
        })
    end)
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 72 -- upvalues: u8 (val)
        u8:unmount()
    end
end