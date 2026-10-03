-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.LockedProductContent
-- Decompile time: 2.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage.Client
local Interfaces = Client.Interfaces
local React = require(ReplicatedStorage.Shared.UI.React)
local Button = require(Interfaces.Universal.Components.Inventory.Button)
local Comma = require(Client.Modules.Comma)
local Icons = require(Interfaces.LegacyInterface.Icons)
local Sift = require(ReplicatedStorage.Packages.Sift)
local TextLabel = require(Interfaces.Components.TextLabel)
local createElement = React.createElement
local u37 = utf8.char(57346)

local function formatRobuxPrice(a1) -- Line: 29 -- upvalues: Comma (val)
    if type(a1) == "number" then
        return Comma(a1)
    end
    if type(a1) == "string" and a1 ~= "" then
        return a1
    end
    return "..."
end

return React.memo(function(a1) -- Line: 37
    -- upvalues: Sift (val), createElement (val), Icons (val), TextLabel (val), Button (val), u37 (val), Comma (val)
    local v1 = a1.onRequirementClick ~= nil
    local v2 = a1.robuxPrice ~= nil
    local v3 = v1 or v2
    local join = Sift.Dictionary.join
    local v4 = {
        BackgroundTransparency = 1,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v5 = if not v3 then UDim2.fromScale(0.8, 0.5) else UDim2.fromScale(0.8, 0.8)
    v4.Size = v5
    local v6 = (join(v4, a1.native or {}))
    local v7 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.03, 0),
        }),
    }
    local v8 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        ZIndex = 100,
        Image = Icons.Locked,
        ScaleType = Enum.ScaleType.Fit,
    }
    local v9 = if not v3 then UDim2.fromScale(0.6, 0.6) else UDim2.fromScale(0.25, 0.25)
    v8.Size = v9
    v7.LockIcon = createElement("ImageLabel", v8, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v8 = {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        LayoutOrder = 2,
        StrokeThickness = 0.125,
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 101,
    }
    v9 = if not v3 then UDim2.fromScale(0.75, 0.35) else UDim2.fromScale(0.95, 0.25)
    v8.Size = v9
    v8.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
    v8.Text = a1.message or "This product is currently locked."
    v8.TextColor3 = Color3.fromRGB(255, 255, 255)
    v7.LockLabel = createElement(TextLabel, v8)
    v7.RequirementButton = v1 and createElement(Button, {
        dontScale = true,
        layoutOrder = 3,
        text = "Play",
        textSize = 16,
        zIndex = 101,
        automaticSize = Enum.AutomaticSize.None,
        color = Color3.fromRGB(255, 153, 20),
        icon = Icons.Maps,
        onClick = a1.onRequirementClick,
        size = UDim2.fromScale(0.45, 0.17),
    })
    v7.OrLabel = v2 and createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        LayoutOrder = 4,
        StrokeThickness = 0.125,
        TextTransparency = 0.25,
        Text = "OR",
        TextScaled = true,
        ZIndex = 101,
        Size = UDim2.fromScale(0.95, 0.12),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })
    local v10 = v2
    if v10 then
        v8 = {
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            LayoutOrder = 5,
            StrokeThickness = 0.125,
            TextScaled = true,
            ZIndex = 101,
            Size = UDim2.fromScale(0.8, 0.12),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }
        local robuxPrice = a1.robuxPrice
        v8.Text = ("%* %*"):format(
            u37,
            if type(robuxPrice) ~= "number" then if type(robuxPrice) ~= "string" then "..." else if robuxPrice == "" then "..." else robuxPrice else Comma(robuxPrice)
        )
        v8.TextColor3 = Color3.fromRGB(255, 255, 255)
        v10 = createElement(TextLabel, v8)
    end
    v7.RobuxPrice = v10
    return createElement("Frame", v6, v7)
end)