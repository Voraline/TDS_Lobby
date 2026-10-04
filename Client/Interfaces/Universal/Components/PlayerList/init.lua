-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PlayerList
-- Decompile time: 23.25 ms

local u93, v1
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PartyController = require(ReplicatedStorage.Client.Controllers.Lobby.PartyController)
local PlayerListEntry = require(script.PlayerListEntry)
local PlayerListProfile = require(script.PlayerListProfile)
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local joinBindings = React.joinBindings
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useCallback = React.useCallback
local useRef = React.useRef
local useState = React.useState
local memo = React.memo
local LocalPlayer = Players.LocalPlayer
local u89 = if not (workspace:WaitForChild("Type").Value == "Game") then 46 else 80
if not v1 then
    u93 = {
        {Name = "Triumphs", Icon = 9666284160},
        {Name = "Deaths", Icon = 9666309147},
        {Name = "Level", Text = "Lvl"},
    }
else
    u93 = {{Name = "Cash", Icon = 11857757188}}
    if not u93 then
        u93 = {
            {Name = "Triumphs", Icon = 9666284160},
            {Name = "Deaths", Icon = 9666309147},
            {Name = "Level", Text = "Lvl"},
        }
    end
end
local u105 = table.map(u93, function(a1) -- Line: 37
    return a1.Name
end)
local u148 = memo(function(a1) -- Line: 41
    -- upvalues: Players (val), useState (val), createElement (val), PlayerListEntry (val), u105 (val), u89 (val)
    -- upvalues: useCallback (val), PartyController (val), LocalPlayer (val), StarterGui (val)
    local SelectedPlayer = a1.SelectedPlayer
    local SetSelectedPlayer = a1.SetSelectedPlayer
    local ToggleProfile = a1.ToggleProfile
    local UserId = a1.UserId
    local PlayerByUserId = Players:GetPlayerByUserId(UserId or 0)
    local u13, u14 = useState(tick())
    local v1 = createElement
    local v2 = PlayerListEntry
    local v3 = {
        PercentVisible = a1.PercentVisible,
        LayoutOrder = a1.LayoutOrder,
        UserId = UserId,
        Stats = u105,
        StatSize = u89,
        IsSelected = SelectedPlayer:map(function(a1) -- Line: 57 -- upvalues: UserId (val), Players (upval)
            local v1
            if not a1 or a1.UserId ~= UserId then
                v1 = false
            else
                v1 = true
                if UserId == Players.LocalPlayer.UserId then
                    v1 = false
                end
            end
            return v1
        end),
    }
    local v4 = {SetSelectedPlayer, UserId}
    v3.OnActivated = useCallback(function() -- Line: 62 -- upvalues: SetSelectedPlayer (val), UserId (val)
        if SetSelectedPlayer then
            SetSelectedPlayer({UserId = UserId})
        end
    end, v4)
    v3.InvitePlayer = useCallback(function() -- Line: 68
        -- upvalues: u13 (val), u14 (val), PartyController (upval), PlayerByUserId (val), LocalPlayer (upval)
        if tick() - u13 < 0.5 then
            return
        end
        u14(tick())
        if PartyController:getParty(PlayerByUserId) then
            return
        end
        if not PartyController:getParty(LocalPlayer) then
            local v1 = PartyController:createParty(PlayerByUserId)
            return
        end
        PartyController:invitePlayer(PlayerByUserId)
    end, {})
    v4 = {ToggleProfile}
    v3.ViewProfile = useCallback(function() -- Line: 88 -- upvalues: ToggleProfile (val)
        ToggleProfile()
    end, v4)
    v3.UpdateFriend = useCallback(function() -- Line: 92 -- upvalues: PlayerByUserId (val), StarterGui (upval)
        if not PlayerByUserId then
            return
        end
        StarterGui:SetCore(if not dataRef.current.Friended then "PromptSendFriendRequest" else "PromptUnfriend", PlayerByUserId)
    end, {})
    v3.BlockPlayer = useCallback(function() -- Line: 103 -- upvalues: PlayerByUserId (val), StarterGui (upval)
        if not PlayerByUserId then
            return
        end
        StarterGui:SetCore(if not dataRef.current.Blocked then "PromptBlockPlayer" else "PromptUnblockPlayer", PlayerByUserId)
    end, {})
    return v1(v2, v3)
end, function(a1, a2) -- Line: 114 -- upvalues: table (val)
    local deepCompare = table.deepCompare
    local Data = a1.Data or {}
    local Data_2 = a2.Data or {}
    return deepCompare(Data, Data_2) and a1.LayoutOrder == a2.LayoutOrder
end)
local u155 = memo(function(a1) -- Line: 119 -- upvalues: createElement (val), u148 (val), React (val)
    local UserId
    local v1 = {}
    for i, j in a1.Players or {} do
        UserId = j.UserId
        v1[UserId] = (createElement(u148, {
            PercentVisible = a1.PercentVisible,
            SelectedPlayer = a1.SelectedPlayer,
            SetSelectedPlayer = a1.SetSelectedPlayer,
            ToggleProfile = a1.ToggleProfile,
            UserId = UserId,
            LayoutOrder = i,
        }))
    end
    return React.createElement(React.Fragment, {}, v1)
end)
local u158 = memo(function(a1) -- Line: 144 -- upvalues: createElement (val), u89 (val)
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, u89, 1, 0),
        LayoutOrder = a1.LayoutOrder,
    }
    local v2 = {}
    local v3 = if not a1.Text then createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = ("rbxassetid://%*"):format(a1.Icon or 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(24, 24),
        ImageTransparency = a1.Transparency,
    }) else createElement("TextLabel", {
        TextSize = 16,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(24, 24),
    })
    v2.content = v3
    v2.divider = createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(171, 171, 171),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(0, 1, 1, -8),
    })
    return createElement("Frame", v1, v2)
end)
local u161 = memo(function(a1) -- Line: 190 -- upvalues: u93 (val), createElement (val), u158 (val), React (val)
    local v1
    local v2 = {}
    for i, v in ipairs(u93) do
        v1 = createElement(u158, {
            Name = v.Name,
            Icon = v.Icon,
            Text = v.Text,
            LayoutOrder = i + 1,
            Transparency = a1.Transparency,
            ZIndex = i,
        })
        v2[v.Name] = v1
    end
    return React.createElement(React.Fragment, {}, v2)
end)
return function(a1) -- Line: 208
    -- upvalues: useBinding (val), Players (val), useRef (val), useTween (val), useCharmSelector (val)
    -- upvalues: PlayerListStore (val), useReactBindings (val), useEffect (val), Maid (val), createElement (val)
    -- upvalues: React (val), u161 (val), u155 (val), useCallback (val), PlayerListProfile (val), joinBindings (val)
    local Visible = a1.Visible
    local SelectedPlayerId = a1.SelectedPlayerId
    local SetSelectedPlayerId = a1.SetSelectedPlayerId
    local SetShowProfile = a1.SetShowProfile
    local ShowProfile = a1.ShowProfile
    local u7, u8 = useBinding()
    local v1, u16 = useBinding(#Players:GetPlayers())
    local v2 = useRef()
    local v3 = TweenInfo.new(0.15, Enum.EasingStyle.Sine)
    local v4, u34 = useTween(if not Visible:getValue() then 0 else 1, v3, true, true)
    local u40 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 226
        return a1.players
    end, {})
    local v5 = {SelectedPlayerId}
    local v6 = {u40}
    useReactBindings(function(a1) -- Line: 230 -- upvalues: u8 (val), u40 (val)
        if not a1 then
            u8(nil)
            return
        end
        local v1 = nil
        for i, j in u40 do
            if j.UserId == a1 then
                v1 = j
                break
            end
        end
        u8(v1)
    end, v5, v6)
    v5 = {Visible}
    useReactBindings(function(a1) -- Line: 247 -- upvalues: u34 (val), SetShowProfile (val), SetSelectedPlayerId (val)
        u34(if not a1 then 0 else 1)
        if not a1 then
            SetShowProfile(false)
            SetSelectedPlayerId(nil)
        end
    end, v5)
    useEffect(function() -- Line: 256 -- upvalues: Maid (upval), u16 (val), Players (upval), u7 (val), u8 (val)
        local u2 = Maid.new()
        u2:Mark((Players.PlayerAdded:Connect(function() -- Line: 259 -- upvalues: u16 (upval), Players (upval)
            u16(#Players:GetPlayers())
        end)))
        u2:Mark((Players.PlayerRemoving:Connect(function(a1) -- Line: 264 -- upvalues: u7 (upval), u8 (upval), u16 (upval), Players (upval)
            local v1 = u7:getValue()
            if v1 and v1.UserId == a1.UserId then
                u8(nil)
            end
            u16(#Players:GetPlayers())
        end)))
        return function() -- Line: 273 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    local v7 = createElement
    v5 = {
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -10, 0, 10),
        Size = UDim2.new(0, 356, 0.5, 0),
    }

    v5[React.Change.AbsolutePosition] = function(a1_2) -- Line: 285 -- upvalues: a1 (val) -- types: a1_2: userdata
        if not a1.SetAbsolutePosition then
            return
        end
        a1.SetAbsolutePosition(a1_2.AbsolutePosition)
    end

    v5[React.Change.AbsoluteSize] = function(a1_2) -- Line: 293 -- upvalues: a1 (val) -- types: a1_2: userdata
        if not a1.SetAbsoluteSize then
            return
        end
        a1.SetAbsoluteSize(a1_2.AbsoluteSize)
    end

    v6 = {
        header = createElement("Frame", {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 0, 0, 40),
        }, {
            wrapper = createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                BackgroundTransparency = 0.6,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromScale(1, 1),
                Position = v4:map(function(a1) -- Line: 314
                    return UDim2.new(1 - a1 + 0.5, 20 * (1 - a1), 0.5, 0)
                end),
            }, {
                value = createElement("TextLabel", {
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    LayoutOrder = 10,
                    TextTransparency = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Text = v1:map(function(a1) -- Line: 325 -- upvalues: Players (upval)
                        return (("PLAYERS (%*/%*)"):format(a1, Players.MaxPlayers))
                    end),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromOffset(8, 0),
                    Size = UDim2.fromScale(0, 1),
                }),
                stats = createElement("Frame", {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(1, 0),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromScale(1, 0),
                    Size = UDim2.fromScale(0, 1),
                }, {
                    uIListLayout = createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    }),
                    stats = createElement(u161, {Transparency = 0}),
                }),
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            }),
        }),
        uIScale = createElement("UIScale"),
    }
    local v8 = createElement
    local v9 = {
        ScrollBarThickness = 0,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 1, -44),
        ScrollingEnabled = a1.Visible,
        ref = v2,
        Position = v4:map(function(a1) -- Line: 380
            return UDim2.new(1 - a1, 20 * (1 - a1), 0, 44)
        end),
        Visible = v4:map(function(a1) -- Line: 384
            return a1 > 0
        end),
    }
    local v10 = {}
    local v11 = createElement
    local v12 = {
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v12[React.Change.AbsoluteContentSize] = function(a1_2) -- Line: 393 -- upvalues: a1 (val) -- types: a1_2: userdata
        if not a1.SetContentSize then
            return
        end
        local Parent = a1_2.Parent
        if not Parent then
            return
        end
        local AbsoluteContentSize = a1_2.AbsoluteContentSize
        if Parent.AbsoluteSize.Y < AbsoluteContentSize.Y then
            AbsoluteContentSize = Parent.AbsoluteSize
        end
        a1.SetContentSize(AbsoluteContentSize)
    end

    v10.uIListLayout = v11("UIListLayout", v12)
    v10.players = createElement(u155, {
        Players = u40,
        SelectedPlayer = u7,
        SetSelectedPlayer = useCallback(function(a1) -- Line: 417 -- upvalues: u7 (val), SetSelectedPlayerId (val)
            if u7:getValue() == a1 then
                a1 = nil
            end
            SetSelectedPlayerId(if not a1 then nil else a1.UserId)
        end, {}),
        ToggleProfile = useCallback(function() -- Line: 425 -- upvalues: SetShowProfile (val), ShowProfile (val)
            SetShowProfile(not ShowProfile:getValue())
        end, {}),
    })
    v6.content = v8("ScrollingFrame", v9, v10)
    v6.profile = createElement(PlayerListProfile, {
        IsVisible = joinBindings({Visible, ShowProfile}):map(function(a1) -- Line: 432
            return a1[1] and a1[2]
        end),
        SelectedPlayer = u7,
    })
    return v7("Frame", v5, v6)
end