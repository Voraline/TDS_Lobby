-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Button
-- Decompile time: 4.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DifficultyVote = ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote
local Count = require(DifficultyVote.Count)
local Description = require(DifficultyVote.Description)
local Lock = require(DifficultyVote.Lock)
local Thumbnail = require(DifficultyVote.Thumbnail)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local DifficultyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.DifficultyStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Event = React.Event
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
return function(a1) -- Line: 20
    -- upvalues: useRef (val), useSpring (val), useState (val), useCharmSelector (val), DifficultyStore (val)
    -- upvalues: useEffect (val), RunService (val), createElement (val), Event (val), Thumbnail (val), Lock (val)
    -- upvalues: Count (val), Description (val), Tooltip (val), Sound (val)
    local v1 = useRef()
    local v2, u9 = useSpring(1, 0.6, 40, true)
    local v3, u16 = useSpring(2, 1, 40, true)
    local Locked = a1.Locked
    local u20, u21 = useState(false)
    local u24, u25 = useState(nil)
    local u30 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 30
        return a1.selected
    end)
    local v4 = {Locked}
    useEffect(function() -- Line: 34 -- upvalues: Locked (val), u9 (val)
        if Locked then
            u9(1.1)
            return
        end
        u9(1)
    end, v4)
    v4 = {u20, u24}
    useEffect(function() -- Line: 42 -- upvalues: u20 (val), RunService (upval), u24 (val), u21 (val)
        if not u20 then
            return
        end
        local u6 = RunService.Heartbeat:Connect(function() -- Line: 44 -- upvalues: u24 (upval), u21 (upval)
            if 0.2 <= tick() - u24 then
                u21(false)
            end
        end)
        return function() -- Line: 50 -- upvalues: u6 (val)
            if u6.Connected then
                u6:Disconnect()
            end
        end
    end, v4)
    useEffect(function() -- Line: 58 -- upvalues: u30 (val), a1 (val), u16 (val)
        if u30 == a1.DifficultyText then
            u16(8)
            return
        end
        u16(4)
    end)
    local color = a1.color
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Size = a1.Size or UDim2.fromOffset(192, 192)
    v5.Size = Size
    v5.AnchorPoint = a1.AnchorPoint
    v5.Position = a1.Position
    v5.LayoutOrder = a1.LayoutOrder
    v5.Visible = a1.Visible
    v5.ref = v1
    local v6 = {
        dropShadow = createElement("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=9239716855",
            ImageTransparency = 0.2,
            BackgroundTransparency = 1,
            ZIndex = -1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }),
    }
    local v7 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.25,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }

    v7[Event.MouseEnter] = function() -- Line: 105 -- upvalues: u9 (val)
        u9(1.1)
    end

    v7[Event.MouseLeave] = function() -- Line: 109 -- upvalues: u9 (val)
        u9(1)
    end

    local v8 = {
        uICorner = createElement("UICorner"),
        uIStroke = createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Thickness = v3}, {
            uIGradient = createElement("UIGradient", {
                Rotation = 45,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, if not color then Color3.fromRGB(255, 255, 255) else color[1]),
                    (ColorSequenceKeypoint.new(1, if not color then Color3.fromRGB(255, 255, 255) else color[2])),
                }),
            }),
        }),
        uiScale = createElement("UIScale", {Scale = v2}),
        thumbnail = createElement(Thumbnail, {
            Image = a1.Image,
            Locked = a1.Locked,
            DifficultyText = a1.DifficultyText,
            Votes = a1.Votes,
        }),
        lock = createElement(Lock, {Locked = a1.Locked, LevelRequired = a1.LevelRequired}),
        count = createElement(Count, {
            Votes = a1.Votes,
            DifficultyText = a1.DifficultyText,
            GradientColor = color or {Color3.fromRGB(255, 255, 255), (Color3.fromRGB(255, 255, 255))},
        }),
        description = createElement(Description, {
            DifficultyAlias = a1.DifficultyAlias,
            DifficultyText = a1.DifficultyText,
            NewMode = a1.NewMode,
            Revamped = a1.Revamped,
            SubTitle = a1.SubTitle,
        }),
        tooltip = createElement(Tooltip, {
            Name = ("%*Tooltip"):format(a1.DifficultyText),
            Header = a1.tooltipData.Header,
            Subject = a1.tooltipData.Subject,
            Content = a1.tooltipData.Content,
        }),
    }
    local v9 = createElement
    local v10 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 100,
    }

    v10[Event.Activated] = function() -- Line: 188 -- upvalues: Locked (val), u20 (val), u25 (val), u21 (val), a1 (val), Sound (upval)
        if not Locked and not u20 then
            u25(tick())
            u21(true)
            if a1.OnClick then
                a1.OnClick()
            end
            Sound("Difficulty"):Play()
            return
        end
    end

    v10[Event.MouseEnter] = function() -- Line: 203 -- upvalues: Sound (upval)
        Sound("Release"):Play()
    end

    v8.detector = v9("TextButton", v10)
    v6.content = createElement("Frame", v7, v8)
    return createElement("Frame", v5, v6)
end