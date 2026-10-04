-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PlayerList.PlayerListEntry
-- Decompile time: 28.51 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Abbreviate = require(ReplicatedStorage.Shared.Modules.Abbreviate)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local Icons = require(script.Parent.Parent.Parent.Parent.Icons)
require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local RichText = require(ReplicatedStorage.Client.Interfaces.Components.RichText)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useOtherPlayerReplicator = require(ReplicatedStorage.Client.Interfaces.Hooks.useOtherPlayerReplicator)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useEffect = React.useEffect
local memo = React.memo
local useRef = React.useRef
local Event = React.Event

local function invert(a1) -- Line: 29
    return 1 - a1
end

local function formatNumber(a1) -- Line: 33 -- upvalues: Abbreviate (val) -- types: a1: number
    if math.abs(a1) == (1 / 0) then
        if math.sign(a1) == 1 then
            return " ∞"
        end
        return " -∞"
    end
    if a1 ~= a1 then
        return "???"
    end
    return Abbreviate(a1)
end

local function getIcon(a1) -- Line: 43 -- upvalues: Icons (val)
    local Status = a1.Status
    local Player = a1.Player
    local Rank = a1.Rank
    if a1.Blocked then
        return "rbxassetid://13845031504"
    end
    if a1.Friended then
        return "rbxasset://textures/ui/PlayerList/FriendIcon@2x.png"
    end
    if a1.Requested then
        return "rbxassetid://textures/ui/PlayerList/AddFriend@2x.png"
    end
    if Status ~= "Owner" and Status ~= "Developer" then
        if Status == "Content Creator" then
            return "rbxasset://textures/ui/PlayerList/StarIcon@2x.png"
        end
        if Status == "Verified" then
            return Icons.Flair.Verified
        end
        if Status == "VIP+" then
            return "rbxassetid://9666380084"
        end
        if Player and Player.MembershipType == Enum.MembershipType.Premium then
            return "rbxasset://textures/ui/PlayerList/PremiumIcon@2x.png"
        end
        return nil
    end
    return "rbxasset://textures/ui/PlayerList/developer@2x.png"
end

local u114 = memo(function(a1) -- Line: 76 -- upvalues: createElement (val), RichText (val)
    if a1.RichText then
        return createElement(RichText, {
            Animated = false,
            Centered = false,
            FontSize = 16,
            LayoutOrder = 10,
            ParticleScale = 0.8,
            NoStroke = true,
            Text = a1.DisplayName,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = a1.Transparency,
            Size = (UDim2.fromScale(1, 1)) - UDim2.fromOffset(16, 0),
            AutomaticSize = Enum.AutomaticSize.X,
        })
    end
    return createElement("TextLabel", {
        TextSize = 16,
        BackgroundTransparency = 1,
        LayoutOrder = 10,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.DisplayName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = a1.Transparency,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(0, 1),
    })
end)
local u117 = memo(function(a1) -- Line: 112 -- upvalues: createElement (val), React (val)
    return createElement("Frame", {
        BorderSizePixel = 0,
        Visible = true,
        ZIndex = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = a1.Transparency,
        Position = UDim2.fromOffset(2, 2),
        Size = UDim2.new(1, -4, 0, 28),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}),
        items = React.createElement(React.Fragment, {}, a1.children or {}),
    })
end)
local u120 = memo(function(a1) -- Line: 130 -- upvalues: Enum (val), createElement (val), u117 (val), React (val)
    local Status = a1.Status
    local Transparency = a1.Transparency
    if a1.GameMode == "PVP" then
        if a1.Team == Enum.Team.Red then
            return createElement(u117, {Transparency = Transparency}, {
                uIGradient = React.createElement("UIGradient", {Color = ColorSequence.new(Color3.fromRGB(255, 71, 71))}),
            })
        end
        return createElement(u117, {Transparency = Transparency}, {
            uIGradient = React.createElement("UIGradient", {Color = ColorSequence.new(Color3.fromRGB(0, 170, 255))}),
        })
    end
    if Status == "VIP+" then
        return createElement(u117, {Transparency = Transparency}, {
            uIGradient = React.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 196, 76)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 43, 114))),
                }),
            }),
        })
    end
    if Status ~= "Developer" and Status ~= "Owner" then
        return nil
    end
    return createElement(u117, {Transparency = Transparency}, {
        uIGradient = React.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(168, 76, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(53, 43, 200))),
            }),
        }),
    })
end)
local u123 = memo(function(a1) -- Line: 179 -- upvalues: createElement (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, a1.Size or 46, 1, 0),
        Name = a1.Name or "",
    }, {
        value1 = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 16,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.Value or "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(4, 0, 0, 24),
        }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 14})}),
    })
end)
local u126 = memo(function(a1) -- Line: 214
    -- upvalues: useTween (val), useEffect (val), createElement (val), Event (val), ReplicatedStorage (val)
    local Activated = a1.Activated
    local BackgroundColor = a1.BackgroundColor
    local v1, u13 = useTween(BackgroundColor, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), true, true)
    local v2 = {BackgroundColor}
    useEffect(function() -- Line: 225 -- upvalues: u13 (val), BackgroundColor (val)
        u13(BackgroundColor)
    end, v2)
    v2 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        BackgroundTransparency = a1.Transparency,
        TextTransparency = a1.Transparency,
    }
    v2.Text = if not a1.Icon then a1.Text else ""
    v2.TextColor3 = Color3.fromRGB(255, 255, 255)
    v2.TextSize = 16
    v2.AutomaticSize = a1.Icon and Enum.AutomaticSize.None or Enum.AutomaticSize.X
    v2.BackgroundColor3 = v1
    v2.BorderSizePixel = 0
    local Size = a1.Size or UDim2.new(0, 0, 0, 32)
    v2.Size = Size
    v2.LayoutOrder = a1.LayoutOrder
    v2.Visible = a1.Visible

    v2[Event.Activated] = function() -- Line: 248 -- upvalues: ReplicatedStorage (upval), Activated (val)
        require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)("Click"):Play(false)
        if Activated then
            Activated()
        end
    end

    return createElement("TextButton", v2, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
        uIStroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = a1.Transparency,
        }),
        ImageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = a1.Icon,
            Size = UDim2.fromScale(1, 1),
            Visible = not not a1.Icon,
        }, {(createElement("UIAspectRatioConstraint", {AspectRatio = 1}))}),
    })
end)
return (memo(function(a1) -- Line: 287
    -- upvalues: Players (val), useRef (val), useCharmSelector (val), PlayerListStore (val), table (val), useTween (val)
    -- upvalues: useReactBinding (val), invert (val), GameType (val), useGameStateValue (val)
    -- upvalues: useOtherPlayerReplicator (val), useReplicatedState (val), Enum (val), getIcon (val), Abbreviate (val)
    -- upvalues: createElement (val), u123 (val), useReactBindings (val), Event (val), u114 (val), React (val)
    -- upvalues: u126 (val), u120 (val)
    local v1, v2, v3, v4
    local UserId = a1.UserId
    local PlayerByUserId = UserId and Players:GetPlayerByUserId(UserId or 0)
    local u9 = useRef()
    local v5 = {UserId}
    local v6 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 292 -- upvalues: UserId (val), u9 (val), table (upval)
        local v1 = nil
        for i, j in a1.players do
            if j.UserId == UserId then
                v1 = j
                break
            end
        end
        if v1 then
            if u9.current and table.deepCompare(u9.current, v1) then
                return u9.current
            end
            u9.current = v1
        end
        return v1
    end, v5)
    local v7 = v6 and v6.Friended == true
    local v8 = v6 and v6.Blocked == true
    v5 = v6 and v6.Requested == true
    local Rank = v6 and v6.Rank or 0
    local DisplayName = v6 and v6.DisplayName or PlayerByUserId and PlayerByUserId.DisplayName or "Unknown"
    local Status = nil
    if v6 then
        if v6.Status then
            Status = v6.Status
        elseif v6.VIP then
            Status = "VIP+"
        end
    end
    local v9 = TweenInfo.new(0.2, Enum.EasingStyle.Sine)
    local v10, u938 = useTween(if not a1.IsSelected:getValue() then 0 else 1, v9, true, true)
    v9 = useReactBinding(0)
    local v11 = v10:map(invert)
    local v12 = GameType:Get() ~= "Game"
    local v13 = {}
    local v14 = useGameStateValue("GameMode", "N/A")
    local v15 = useReplicatedState(useOtherPlayerReplicator(PlayerByUserId), "Team", Enum.Team.Player)
    local v16 = getIcon({
        Rank = Rank,
        Status = Status,
        Blocked = v8,
        Request = v5,
        Friended = v7,
        Player = PlayerByUserId,
    })
    local v17 = nil
    local v18 = nil
    local v19 = a1
    for i, j in a1.Stats, v17, v18 do
        v1 = v6 and v6.Stats[j] or 0
        if j == "Cash" then
            v1 = ("$%*"):format(if math.abs(v1) ~= (1 / 0) then if v1 == v1 then Abbreviate(v1) else "???" else if math.sign(v1) ~= 1 then " -∞" else " ∞")
        end
        v2 = createElement
        v3 = u123
        v4 = {Name = j, Value = v1, Size = v19.StatSize}
        v13[j] = (v2(v3, v4))
    end
    local v20 = useReactBindings
    v18 = {v19.IsSelected}
    v20(function(a1) -- Line: 380 -- upvalues: u938 (val)
        u938(if not a1 then 0 else 1)
    end, v18)
    v18 = {
        Active = true,
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = v19.LayoutOrder,
        Size = v10:map(function(a1) -- Line: 390
            return UDim2.new(1, 0, 0, 32 + a1 * 37)
        end),
    }
    local v21 = {}
    v2 = {ClipsDescendants = true, BackgroundTransparency = 1}
    v2.AnchorPoint = Vector2.new(0.5, 0.5)
    v2.Size = UDim2.fromScale(1, 1)
    v2.Position = UDim2.fromScale(0.5, 0.5)
    v3 = {}
    local v22 = {
        Text = "",
        Active = true,
        LayoutOrder = 1,
        Selectable = false,
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v9:map(function(a1) -- Line: 409
            return a1 + 0.6
        end),
    }
    v22[Event.Activated] = v19.OnActivated
    local v23 = {}
    local v24 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(8, 0),
        Size = UDim2.fromScale(0, 1),
    }
    local v25 = {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v26 = {RichText = false, Transparency = v9}
    v26.DisplayName = (if not v6 then "" else if not v6.Verified then "" else " ") .. DisplayName
    v25.title = createElement(u114, v26)
    v25.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Image = v16,
        Visible = v16 ~= nil,
        ImageTransparency = v9,
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromOffset(16, 16),
    })
    v23.username = createElement("Frame", v24, v25)
    v23.stats = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0, 1),
    }, {
        uIListLayout1 = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        entries = React.createElement(React.Fragment, {}, v13),
    })
    v23.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v3.frame = createElement("TextButton", v22, v23)
    v22 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 34),
        Size = v10:map(function(a1) -- Line: 476
            return UDim2.new(1, 0, 0, a1 * 35)
        end),
    }
    v23 = {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 6),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
        }),
    }
    v23.uIPadding = createElement("UIPadding", {
        PaddingLeft = UDim.new(0, 1),
        PaddingRight = UDim.new(0, 2),
        PaddingBottom = UDim.new(0, 1),
        PaddingTop = UDim.new(0, 1),
    })
    v24 = {LayoutOrder = 1, Text = "Invite to Party", Key = "Invite"}
    v25 = v12 and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(121, 121, 121)
    v24.BackgroundColor = v25
    v24.Transparency = v11
    v24.Activated = v12 and v19.InvitePlayer or function() -- Line: 502
        return
    end
    v23.invite = createElement(u126, v24)
    v23.profile = createElement(u126, {
        LayoutOrder = 2,
        Text = "View Profile",
        Key = "Profile",
        BackgroundColor = Color3.fromRGB(255, 170, 0),
        Transparency = v11,
        Activated = v19.ViewProfile,
    })
    v24 = {LayoutOrder = 3, Key = "Add", Text = if not v7 then "Add Friend" else "Remove Friend"}
    v24.Icon = if not v7 then "rbxassetid://6034287514" else "rbxasset://textures/ui/PlayerList/UnFriend@2x.png"
    v25 = v7 and Color3.fromRGB(121, 121, 121) or Color3.fromRGB(0, 170, 127)
    v24.BackgroundColor = v25
    v24.Size = UDim2.fromOffset(49, 32)
    v24.Transparency = v11
    v24.Activated = v19.UpdateFriend
    v23.friend = createElement(u126, v24)
    v24 = {
        LayoutOrder = 4,
        Icon = "rbxassetid://6035047387",
        Key = "Block",
        Text = if not v8 then "Block" else "Unblock",
    }
    v25 = v8 and Color3.fromRGB(121, 121, 121) or Color3.fromRGB(200, 55, 57)
    v24.BackgroundColor = v25
    v24.Size = UDim2.fromOffset(49, 32)
    v24.Transparency = v11
    v24.Activated = v6 and v6.BlockPlayer
    v23.block = createElement(u126, v24)
    v3.buttons = createElement("Frame", v22, v23)
    v3.background = createElement(u120, {Status = v6 and v6.Status, Transparency = v9, GameMode = v14, Team = v15})
    v21.wrapper = createElement("Frame", v2, v3)
    return createElement("Frame", v18, v21)
end, function(a1, a2) -- Line: 548
    local v1 = false
    if a1.UserId == a2.UserId then
        v1 = false
        if a1.LayoutOrder == a2.LayoutOrder then
            v1 = a1.IsSelected == a2.IsSelected
        end
    end
    return v1
end))