-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel.EmoteWheelSlots
-- Decompile time: 2.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmotePreview = require(script.Parent.EmotePreview)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local createElement = React.createElement
local memo = React.memo

local function getImage(a1) -- Line: 20
    if typeof(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    if typeof(a1) ~= "string" then
        return nil
    end
    if not string.find(a1, "rbxasset", 1, true)
        and not string.find(a1, "rbxthumb", 1, true)
        and not string.find(a1, "http", 1, true) then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1
end

return {
    EmoteWheelSlotEmpty = memo(function(a1) -- Line: 40 -- upvalues: createElement (val) -- types: a1: table
        return createElement("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=5015480909",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 4,
            ImageTransparency = a1.transparency:map(function(a1) -- Line: 43
                return 1 - a1
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.2, 0.2),
        }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    end),
    EmoteWheelSlot = memo(function(a1) -- Line: 59 -- upvalues: createElement (val), EmotePreview (val), getImage (val) -- types: a1: table
        local animation = a1.animation
        local v1 = a1.transparency:map(function(a1_2) -- Line: 62 -- upvalues: a1 (val)
            local v1 = 1 - a1_2
            if a1.disabled then
                return (math.max(v1, 0.45))
            end
            return v1
        end)
        local v2 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }
        local v3 = {
            viewport = animation and createElement(EmotePreview, {name = a1.name, active = a1.active, transparency = a1.transparency}),
        }
        local v4 = {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.name,
            TextTransparency = v1,
        }
        local v5 = if not a1.disabled then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(175, 183, 190)
        v4.TextColor3 = v5
        v4.AnchorPoint = Vector2.new(0.5, 0.5)
        v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v4.Position = UDim2.fromScale(0.5, 0.7)
        v4.Size = UDim2.fromScale(1.25, 0.125)
        v3.textLabel = createElement("TextLabel", v4, {
            uIStroke = createElement("UIStroke", {
                Thickness = 4,
                Transparency = a1.transparency:map(function(a1) -- Line: 111
                    return 1 - 0.75 * a1
                end),
            }),
        })
        local icon = a1.icon and createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Image = getImage(a1.icon),
            ImageTransparency = v1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(48, 48, 48),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.4),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.6, 0.6),
        }, {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint")})
        v3.icon = icon
        local subIcon = a1.subIcon and createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 4,
            Image = getImage(a1.subIcon),
            ImageTransparency = v1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.85, 0.15),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.35, 0.35),
        }, {uIAspectRatioConstraint2 = createElement("UIAspectRatioConstraint")})
        v3.subIcon = subIcon
        return createElement("Frame", v2, v3)
    end),
}