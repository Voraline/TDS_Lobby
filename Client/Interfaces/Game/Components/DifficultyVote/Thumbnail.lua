-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Thumbnail
-- Decompile time: 3.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DifficultyVote = ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote
local PlayerIcon = require(DifficultyVote.PlayerIcon)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local Event = React.Event
local useEffect = React.useEffect
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local u32 = {}

local function createPlayerIcons(a1) -- Line: 14
    -- upvalues: Players (val), u32 (val), createElement (val), PlayerIcon (val)
    for i, j in Players:GetPlayers() do
        u32[j.UserId] = (createElement(PlayerIcon, {PlayerId = j.UserId, DifficultyName = a1}))
    end
    return u32
end

return function(a1) -- Line: 25
    -- upvalues: useSpring (val), useEffect (val), createElement (val), Event (val), React (val)
    -- upvalues: createPlayerIcons (val)
    local v1, u7 = useSpring(1, 0.6, 5, true)
    local v2 = useEffect
    local v3 = {a1.Locked}
    v2(function() -- Line: 28 -- upvalues: a1 (val), u7 (val)
        if a1.Locked then
            u7(1.2)
            return
        end
        u7(1)
    end, v3)
    v3 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local v4 = if not a1.Locked then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(22, 22, 22)
    v3.GroupColor3 = v4
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v3.Size = UDim2.fromScale(1, 1)
    v4 = {uICorner = createElement("UICorner")}
    local v5 = createElement
    local v6 = {
        Image = a1.Image,
        ScaleType = Enum.ScaleType.Crop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Rotation = imageRotation,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 0,
    }

    v6[Event.MouseEnter] = function() -- Line: 59 -- upvalues: u7 (val)
        u7(1.2)
    end

    v6[Event.MouseLeave] = function() -- Line: 63 -- upvalues: u7 (val)
        u7(1)
    end

    v4.image = v5("ImageLabel", v6, {uiScale = createElement("UIScale", {Scale = v1})})
    v4.players = React.createElement(React.Fragment, {}, (createPlayerIcons(a1.DifficultyText)))
    return createElement("CanvasGroup", v3, v4)
end