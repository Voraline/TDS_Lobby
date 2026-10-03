-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.PlayerIcon
-- Decompile time: 3.09 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local u40 = UDim2.fromScale(-1.2, 1.2)
local u42 = Random.new()

local function getPlayerVote(a1, a2) -- Line: 20 -- types: a1: number, a2: table
    for i, j in a2 do
        if table.find(j, a1) then
            return i
        end
    end
end

local function votePower(a1) -- Line: 28 -- upvalues: Players (val), PlayerReplicator (val) -- types: a1: number
    local v1 = PlayerReplicator.GetEntityFromPlayer((Players:GetPlayerByUserId(a1)))
    if not v1 then
        return "x1"
    end
    if not v1.LegacyVIP and not v1.VIPPlus then
        return "x1"
    end
    return "x2"
end

return function(a1) -- Line: 38
    -- upvalues: useRef (val), useState (val), useSpring (val), u40 (val), useGameStateValue (val), useEffect (val)
    -- upvalues: u42 (val), createElement (val), Players (val), PlayerReplicator (val)
    local v1 = useRef()
    local u5 = useState({})
    local PlayerId = a1.PlayerId
    local v2, u13 = useSpring(u40, 1, 15, true)
    local DifficultyVotes = useGameStateValue("DifficultyVotes")
    if not DifficultyVotes then
        DifficultyVotes = {}
    end
    local u21 = useGameStateValue("HasDifficultyVoteCompleted") or false
    local v3 = {u21}
    useEffect(function() -- Line: 48 -- upvalues: u21 (val), u13 (val), u40 (upval), u5 (val), PlayerId (val)
        if u21 then
            u13(u40)
            u5[PlayerId] = nil
        end
    end, v3)
    v3 = {DifficultyVotes}
    useEffect(function() -- Line: 55
        -- upvalues: DifficultyVotes (val), PlayerId (val), a1 (val), u13 (val), u40 (upval), u5 (val), u42 (upval)
        local v1
        if next(DifficultyVotes) == nil then
            return
        end
        for i, j in DifficultyVotes do
            if table.find(j, PlayerId) then
                if not i then
                    return
                end
                if v1 ~= a1.DifficultyName then
                    u13(u40)
                    u5[PlayerId] = nil
                    return
                end
                if not u5[PlayerId] then
                    u5[PlayerId] = (UDim2.fromScale(u42:NextNumber(0.05, 0.85), u42:NextNumber(0.1, 0.85)))
                    u13(u5[PlayerId])
                end
                return
            end
        end
        if true then
            return
        end
        if v1 ~= a1.DifficultyName then
            u13(u40)
            u5[PlayerId] = nil
            return
        end
        if not u5[PlayerId] then
            u5[PlayerId] = (UDim2.fromScale(u42:NextNumber(0.05, 0.85), u42:NextNumber(0.1, 0.85)))
            u13(u5[PlayerId])
        end
    end, v3)
    v3 = {
        BackgroundTransparency = 0.35,
        Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(PlayerId),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 170, 255),
        Position = v2,
        Size = UDim2.fromOffset(48, 48),
        ref = v1,
    }
    local v4 = {uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    v4.uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 170, 255)})
    local v5 = {
        TextScaled = true,
        TextSize = 12,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
    }
    local v6 = PlayerReplicator.GetEntityFromPlayer((Players:GetPlayerByUserId(a1.PlayerId)))
    v5.Text = if not v6 then "x1" else if v6.LegacyVIP then "x2" else if not v6.VIPPlus then "x1" else "x2"
    v5.TextColor3 = Color3.fromRGB(255, 255, 255)
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.Position = UDim2.fromScale(0.9, 0.9)
    v5.Size = UDim2.fromScale(0.4, 0.4)
    v4.textLabel = createElement("TextLabel", v5, {uIStroke = createElement("UIStroke", {Thickness = 2})})
    return createElement("ImageLabel", v3, v4)
end