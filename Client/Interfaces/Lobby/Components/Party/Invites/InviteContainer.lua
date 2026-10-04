-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.InviteContainer
-- Decompile time: 4.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local Invite = require(Party.Invites.Invite)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useMemo = React.useMemo
local useEffect = React.useEffect
local useBinding = React.useBinding

local function createInvites(a1) -- Line: 13
    -- upvalues: useMemo (val), createElement (val), Invite (val)
    return useMemo(function() -- Line: 14 -- upvalues: a1 (val), createElement (upval), Invite (upval)
        local v1 = {}
        for i, j in a1 do
            if i > 3 then
                break
            end
            table.insert(v1, (createElement(Invite, {player = j, userId = j.UserId, displayName = j.DisplayName})))
        end
        return v1
    end, {a1})
end

return function(a1) -- Line: 35
    -- upvalues: useBinding (val), useEffect (val), createElement (val), React (val), createInvites (val)
    local v1, u4 = useBinding(0)
    local v2, u8 = useBinding(0)
    local v3, u12 = useBinding(Enum.VerticalAlignment.Center)
    local v4 = useEffect
    local v5 = {a1.isMobile}
    v4(function() -- Line: 40 -- upvalues: a1 (val), u4 (val), u12 (val), u8 (val)
        if a1.isMobile then
            u4(60)
            u12(Enum.VerticalAlignment.Top)
            return
        end
        u4(0)
        u12(Enum.VerticalAlignment.Bottom)
        u8(0.75)
    end, v5)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = React.joinBindings({v1, v2}):map(function(a1) -- Line: 55
            return UDim2.new(1, 0, a1[2], a1[1])
        end),
        Size = UDim2.fromOffset(370, 120),
    }, {
        uiScale = createElement("UIScale", {Scale = a1.scale}),
        uiListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = v3,
        }),
        invites = React.createElement(React.Fragment, nil, createInvites(a1.invites)),
    })
end