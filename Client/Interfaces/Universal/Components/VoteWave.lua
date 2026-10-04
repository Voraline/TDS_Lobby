-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.VoteWave
-- Decompile time: 7.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local NumberedButton = require(ReplicatedStorage.Client.Interfaces.Components.NumberedButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local createElement = React.createElement

local function VoteMenu(a1) -- Line: 13
    -- upvalues: useState (val), useSpring (val), React (val), createElement (val), NumberedButton (val)
    local v1 = a1.YesVotes or 0
    local v2 = a1.NoVotes or 0
    local v3 = math.max(a1.TotalVotes or 0, v1)
    local u11, u12 = useState()
    local u17 = if a1.Shown ~= nil then a1.Shown == true else true
    local v4, u24 = useSpring(4, 1, 20, true)
    local v5 = {u17}
    React.useEffect(function() -- Line: 23 -- upvalues: u24 (val), u17 (val)
        u24(if not u17 then 4 else 1)
    end, v5)
    if not u17 and u11 ~= nil then
        u12(nil)
    end
    v5 = {
        BackgroundTransparency = 0.3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4:map(function(a1) -- Line: 33
            return UDim2.new(0.5 * a1, -10 * (1 - a1), 0.5, 0)
        end),
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v6 = {uICorner = createElement("UICorner")}
    v6.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        ZIndex = -1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    v6.prompt = createElement("TextLabel", {
        TextSize = 26,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 16, 0.5, -16),
        Size = UDim2.new(1, -176, 0, 32),
    }, {uIStroke = createElement("UIStroke", {Thickness = 2})})
    v6.count = createElement("TextLabel", {
        TextSize = 22,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        Text = string.format("%d/%d Required", v1, v3),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 16, 0.5, 16),
        Size = UDim2.new(1, -176, 0, 24),
    }, {uIStroke1 = createElement("UIStroke", {Thickness = 2})})
    local v7 = a1.Timer and createElement("TextLabel", {
        TextSize = 24,
        Rotation = -8,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.Timer,
        TextColor3 = Color3.fromRGB(245, 245, 245),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(126, 126, 126),
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.fromOffset(36, 36),
    }, {
        uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
        }),
        borderStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}),
        uIStroke2 = createElement("UIStroke", {Thickness = 2}),
    }) or nil
    v6.timer = v7
    local v8 = {Icon = 12289762618, Position = UDim2.new(1, -84, 0.5, 0)}
    v8.Selected = u11 == "Yes"
    v8.Color = if u11 == "Yes" then Color3.fromRGB(43, 235, 0) or nil else not (u11 ~= nil) and Color3.fromRGB(43, 235, 0) or nil
    v8.Text = v1

    function v8.Clicked() -- Line: 140 -- upvalues: u11 (val), u12 (val), a1 (val)
        if u11 then
            return
        end
        u12("Yes")
        if a1.Voted then
            a1.Voted(true)
        end
    end

    v6.votesYes = createElement(NumberedButton, v8)
    v8 = {Icon = 12289763206, Position = UDim2.new(1, -8, 0.5, 0)}
    v8.Selected = u11 == "No"
    v8.Color = if u11 == "No" then Color3.fromRGB(229, 31, 31) or nil else not (u11 ~= nil) and Color3.fromRGB(229, 31, 31) or nil
    v8.Text = v2

    function v8.Clicked() -- Line: 160 -- upvalues: u11 (val), u12 (val), a1 (val)
        if u11 then
            return
        end
        u12("No")
        if a1.Voted then
            a1.Voted(false)
        end
    end

    v6.votesNo = createElement(NumberedButton, v8)
    return createElement("Frame", v5, v6)
end

return function(a1) -- Line: 175 -- upvalues: useMediaQuery (val), createElement (val), React (val), VoteMenu (val)
    local v1 = useMediaQuery("large", true)
    local v2 = {BackgroundTransparency = 1, ClipsDescendants = true}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0)
    v2.AnchorPoint = AnchorPoint
    v2.Position = v1:map(function(a1_2) -- Line: 181 -- upvalues: a1 (val)
        if a1.Position then
            return a1.Position
        end
        if a1.Title == "Skip Cutscene?" then
            return UDim2.new(0.5, 0, 0, 0)
        end
        return a1_2 and UDim2.new(0.5, 0, 0, 80) or UDim2.new(0.5, 0, 0, 0)
    end)
    local Size = a1.Size or UDim2.fromOffset(376, 116)
    v2.Size = Size
    return createElement("Frame", v2, {
        padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
        }),
        children = React.createElement(React.Fragment, {}, a1.children or {}),
        vote = createElement(VoteMenu, a1),
    })
end