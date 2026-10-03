-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.CharacterScale
-- Decompile time: 3.02 ms

game:GetService("MarketplaceService")
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local useGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useGamepass)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local Event = React.Event
local u47 = {}
local v1 = {Icon = 10361109002, Value = Enum.CharacterScale.Normal}
local v2 = {Icon = 10361126349, Value = Enum.CharacterScale.Large}
local v3 = {Icon = 10361137090, Value = Enum.CharacterScale.Small}
u47[1] = v1
u47[2] = v2
u47[3] = v3

local function CharacterScale(a1) -- Line: 26
    -- upvalues: useTween (val), useEffect (val), createElement (val), Event (val)
    local u26, u37, v1, v2
    if not a1.Selected then
        u26 = Color3.fromRGB(63, 63, 63)
    else
        u26 = Color3.fromRGB(13, 238, 103)
        if not u26 then
            u26 = Color3.fromRGB(63, 63, 63)
        end
    end
    if not (a1.Owned == true) then
        v2 = Color3.new()
        u26 = u26:Lerp(v2, 0.4)
    end
    local v3 = useTween
    v2 = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
    v3, u37 = v3(u26, v2, nil, true)
    local v4 = {u26}
    useEffect(function() -- Line: 37 -- upvalues: u37 (val), u26 (ref)
        u37(u26)
    end, v4)
    v4 = {
        Text = "",
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = v3,
        LayoutOrder = a1.LayoutOrder,
        Position = UDim2.new(1, -76, 0.5, 0),
        Selectable = true,
        Size = UDim2.fromOffset(68, 68),
        AutoButtonColor = v1,
    }
    v4[Event.Activated] = a1.Updated
    local v5 = {uICorner = createElement("UICorner")}
    local v6 = {Thickness = 2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}
    local v7 = if not v1 then 0.5 else 0
    v6.Color = (Color3.fromRGB(189, 189, 189)):Lerp(Color3.new(), v7)
    v5.uIStroke = createElement("UIStroke", v6)
    v6 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://" .. a1.Type.Icon,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v7 = if not v1 then 0.6 else 0
    v6.ImageColor3 = (Color3.fromRGB(255, 255, 255)):Lerp(Color3.new(), v7)
    v7 = if not v1 then 0.6 else 0
    v6.BackgroundColor3 = (Color3.fromRGB(255, 255, 255)):Lerp(Color3.new(), v7)
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.Size = UDim2.fromOffset(64, 64)
    v5.icon = createElement("ImageLabel", v6)
    return (createElement("TextButton", v4, v5))
end

return function(a1) -- Line: 72
    -- upvalues: useSound (val), useGamepass (val), u47 (val), createElement (val), CharacterScale (val), React (val)
    local v1
    local v2 = {}
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    local Click = useSound("Click")
    local u104, u10 = useGamepass(65949871)
    local v3 = nil
    local v4 = nil
    for i, j in u47, v3, v4 do
        v1 = createElement(CharacterScale, {
            Type = j,
            LayoutOrder = i,
            Selected = (tostring(j.Value)) == tostring(a1.Current),
            Owned = u104,
            Updated = function() -- Line: 85 -- upvalues: Click (val), u104 (val), Clicked (val), j (val), u10 (val)
                Click()
                if u104 then
                    Clicked(j.Value)
                    return
                end
                u10()
            end,
        })
        v2[tostring(i)] = v1
    end
    return createElement("Frame", {
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = if not u104 then 0.6 else 1,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        buttons = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            Position = UDim2.new(1, -16, 0.5, 0),
            Size = UDim2.fromOffset(0, 48),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            content = React.createElement(React.Fragment, {}, v2),
        }),
    })
end