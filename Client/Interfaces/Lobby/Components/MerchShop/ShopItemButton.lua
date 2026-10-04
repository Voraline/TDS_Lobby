-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopItemButton
-- Decompile time: 9.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local React = require(ReplicatedStorage.Shared.UI.React)
local ShopItemBanner = require(script.Parent.ShopItemBanner)
local ShopIcon = require(script.Parent.ShopIcon)
local useFontScale = require(Hooks.useFontScale)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local memo = React.memo
local u39 = memo(function(a1) -- Line: 55 -- upvalues: createElement (val)
    return createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://12072054746",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.502153, 0.526851),
        Size = UDim2.fromScale(0.25, 0.25),
        LayoutOrder = a1.layoutOrder,
    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
end)
return (memo(function(a1) -- Line: 68
    -- upvalues: useRef (val), useState (val), useFontScale (val), createElement (val), ShopIcon (val), u39 (val)
    -- upvalues: useEffect (val), React (val), Loader (val), ShopItemBanner (val)
    local v1, v2
    local v3 = {}
    local u468 = useRef()
    local u471 = useRef()
    local v4 = a1.loading == true
    local v5, u478 = useState(Vector2.zero)
    local v6, u482 = useState(Vector2.zero)
    local v7 = useFontScale({scale = 3.5})
    local v8 = nil
    local v9 = nil
    local v10 = a1
    for i, j in a1.items, v8, v9 do
        v1 = ("item%*"):format(i)
        v3[v1] = (createElement(ShopIcon, {
            size = UDim2.fromOffset(v5.Y * 0.7, v5.Y * 0.7),
            layoutOrder = i * 2 - 1,
            text = j.text,
            icon = j.icon,
            banner = j.banner,
            iconSize = j.iconSize,
            iconScaleType = j.iconScaleType,
            color = j.color,
        }))
        v1 = ("divider%*"):format(i)
        v2 = i < #v10.items and createElement(u39, {layoutOrder = i * 2}) or nil
        v3[v1] = v2
    end
    v9 = {u468, u471}
    useEffect(function() -- Line: 97 -- upvalues: u471 (val), u482 (val), u468 (val), u478 (val)
        if u471.current then
            u482(u471.current.AbsoluteContentSize)
        end
        if u468.current then
            u478(u468.current.AbsoluteSize)
        end
    end, v9)
    v9 = {Active = false, AnchorPoint = v10.anchorPoint, AutomaticSize = v10.automaticSize}
    local size = if not v4 then UDim2.new(UDim.new(0, v6.X + v7), v10.size and v10.size.Y or UDim.new(1, 0)) else v10.size
    v9.Size = size
    local position = v10.position or UDim2.fromScale(0.505157, -0.0155759)
    v9.Position = position
    local color = if not v4 then v10.color or Color3.fromRGB(91, 150, 227) else Color3.fromRGB(116, 116, 116)
    v9.BackgroundColor3 = color
    v9.ScaleType = Enum.ScaleType.Crop
    v9.Selectable = false
    v9.LayoutOrder = v10.layoutOrder
    v9.ref = u468
    v9[React.Event.MouseButton1Click] = v10.onClick

    v9[React.Change.AbsoluteSize] = function(a1) -- Line: 125 -- upvalues: u478 (val)
        u478(a1.AbsoluteSize)
    end

    local v11 = {}
    v2 = {}
    local cornerRadius = v10.cornerRadius or UDim.new(0.0349345, 0)
    v2.CornerRadius = cornerRadius
    v11.corner = createElement("UICorner", v2)
    v11.stroke = createElement("UIStroke", {Color = Color3.new(1, 1, 1)})
    v11.gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(48, 48, 48))),
        }),
    })
    v11.aspectRatio = v4 and createElement("UIAspectRatioConstraint", {
        AspectRatio = 1,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Height,
    })
    v11.loading = v4 and createElement(Loader, {
        BackgroundTransparency = 1,
        ZIndex = 10,
        Visible = true,
        Size = UDim2.fromScale(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
    v11.banner = if v4 then nil else v10.banner and createElement(ShopItemBanner, {
        position = UDim2.fromScale(1.008, -0.065),
        size = UDim2.fromScale(0.662225, 0.133895),
        text = v10.banner,
    })
    v2 = {BackgroundTransparency = 1}
    local itemContainerSize = v10.itemContainerSize or UDim2.fromScale(1, 0.75)
    v2.Size = itemContainerSize
    local itemContainerPosition = v10.itemContainerPosition or UDim2.new(0, v7 / 2, 0.93, 0)
    v2.Position = itemContainerPosition
    v2.AnchorPoint = Vector2.new(0, 1)
    v2.Visible = not v4
    local v12 = {}
    local v13 = createElement
    local v14 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.03, 0),
        ref = u471,
    }

    v14[React.Change.AbsoluteContentSize] = function(a1) -- Line: 183 -- upvalues: u482 (val)
        u482(a1.AbsoluteContentSize)
    end

    v12.listLayout = v13("UIListLayout", v14)
    v11.content = createElement("Frame", v2, v12, v3)
    v11.design = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://107406366403543",
            ImageTransparency = 0.8,
            ImageColor3 = Color3.fromRGB(251, 251, 251),
            Position = UDim2.fromScale(-0.146545, -0.211917),
            Size = UDim2.fromScale(0.891293, 0.897628),
        }),
        imageLabel2 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://107406366403543",
            ImageTransparency = 0.8,
            ImageColor3 = Color3.fromRGB(251, 251, 251),
            Position = UDim2.fromScale(0.367445, -0.0889666),
            Size = UDim2.fromScale(0.849714, 1.00026),
        }),
        imageLabel3 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://140505470920175",
            ImageTransparency = 0.8,
            ImageColor3 = Color3.fromRGB(251, 251, 251),
            Position = UDim2.fromScale(0.272391, 0.426869),
            Size = UDim2.fromScale(0.828881, 0.897628),
        }),
    })
    return createElement("ImageButton", v9, v11, v10.children)
end))