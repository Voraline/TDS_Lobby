-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.PartyMembers
-- Decompile time: 1.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local Member = require(Party.PlayerParty.Member)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement

local function createMembers(a1) -- Line: 14
    -- upvalues: React (val), createElement (val), Member (val)
    return React.useMemo(function() -- Line: 15 -- upvalues: a1 (val), createElement (upval), Member (upval)
        local Level, Value
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in a1, v2, v3 do
            if i ~= 1 then
                Level = j:FindFirstChild("Level")
                Value = Level and Level.Value or 0
                table.insert(v1, (createElement(Member, {
                    memberUserId = j.UserId,
                    memberDisplayName = j.DisplayName,
                    level = Value,
                })))
            end
        end
        return v1
    end, {a1})
end

return function(a1) -- Line: 39
    -- upvalues: React (val), PartyContext (val), createElement (val), createMembers (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(0, 160),
        Size = UDim2.new(0, 384, 1, -180),
    }, {
        uiListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
        partyMembers = React.createElement(React.Fragment, nil, createMembers((React.useContext(PartyContext)).players)),
    })
end