-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Missions.MissionMap
-- Decompile time: 4.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
return function(a1) -- Line: 33
    -- upvalues: useSound (val), React (val), useTween (val), useSpring (val), NewMaps (val), createElement (val)
    -- upvalues: Tooltip (val), Loader (val)
    local completed = a1.completed
    local clicked = a1.clicked
    local loading = a1.loading
    local tooltip = a1.tooltip
    local u6 = a1.disabled or loading
    local name = a1.name
    local filterMapName = a1.filterMapName
    local Click = useSound("Click")
    local u15, u16 = React.useState(false)
    local u20, u21 = React.useState(false)
    local v1, u32 = useTween(0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), true, true)
    local v2, u39 = useSpring(1, 0.6, 40, true)
    local v3, u54 = useTween(Color3.fromRGB(0, 0, 0), TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), true, true)
    local v4 = {u20, u15}
    React.useEffect(function() -- Line: 58 -- upvalues: u20 (val), u39 (val), u15 (val), u54 (val), u32 (val)
        if u20 then
            u39(0.9)
        elseif not u15 then
            u39(1)
        else
            u39(1.1)
        end
        if u15 then
            u54(Color3.fromRGB(255, 255, 255))
            u32(3)
            return
        end
        u54(Color3.fromRGB(0, 0, 0))
        u32(2)
    end, v4)
    local v5 = NewMaps(name)
    if not v5 then
        return nil
    end
    local DisplayName = v5 and v5.DisplayName or name
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Size = a1.Size or UDim2.fromOffset(200, 200)
    v6.Size = Size
    v6.Position = a1.Position
    v6.AnchorPoint = a1.AnchorPoint
    v6.LayoutOrder = a1.LayoutOrder
    local v7 = {
        tooltip = tooltip and createElement(Tooltip, {
            Name = ("Mission %*"):format(name),
            Header = tooltip.header,
            Subject = tooltip.subject,
        }),
    }
    local v8 = {
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.LayoutOrder,
        Text = "",
    }

    v8[React.Event.MouseButton1Down] = function() -- Line: 108 -- upvalues: u21 (val)
        u21(true)
    end

    v8[React.Event.MouseButton1Up] = function() -- Line: 112 -- upvalues: u21 (val), Click (val), u6 (val), clicked (val)
        u21(false)
        Click()
        if not u6 and clicked then
            clicked()
        end
    end

    v8[React.Event.MouseEnter] = function() -- Line: 121 -- upvalues: u16 (val)
        u16(true)
    end

    v8[React.Event.MouseLeave] = function() -- Line: 125 -- upvalues: u16 (val)
        u16(false)
    end

    local v9 = {uIScale = createElement("UIScale", {Scale = v2})}
    local v10 = {
        Active = false,
        BorderSizePixel = 0,
        Selectable = false,
        Image = ("rbxassetid://%*"):format(v5.ImageID),
    }
    local v11 = u6 and Color3.new(0.2, 0.2, 0.2) or Color3.fromRGB(255, 255, 255)
    v10.ImageColor3 = v11
    v10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v10.Size = UDim2.fromScale(1, 1)
    v10.ScaleType = Enum.ScaleType.Crop
    v11 = {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})}
    v11.uIStroke = createElement("UIStroke", {Color = v3, Thickness = v1})
    v11.lock = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ImageTransparency = 0,
        Image = "rbxassetid://1197061307",
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0.55, 0, 0.55, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        ScaleType = Enum.ScaleType.Fit,
        Visible = not loading and u6,
    })
    v11.loader = loading and createElement(Loader, {
        BackgroundTransparency = 1,
        Visible = true,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0.55, 0, 0.55, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
    })
    local v12 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
    }
    v12.Text = if not name then DisplayName else if not filterMapName then DisplayName else filterMapName(DisplayName)
    v12.TextColor3 = Color3.fromRGB(255, 255, 255)
    v12.AnchorPoint = Vector2.new(0, 1)
    v12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v12.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v12.Position = UDim2.fromScale(0, 0.98)
    v12.Size = UDim2.fromScale(1, 0.11)
    v11.mapTitle = createElement("TextLabel", v12, {uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = 0.7})})
    v11.mission = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.title or "Mission",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.01),
        Size = UDim2.fromScale(1, 0.15),
    }, {uIStroke2 = createElement("UIStroke", {Thickness = 2, Transparency = 0.7})})
    v11.completed = createElement("Frame", {
        Active = true,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 100,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Visible = completed == true,
    }, {
        imageLabel = createElement("ImageLabel", {
            Image = "rbxassetid://12289762618",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.5, 0.5),
        }),
        uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
    })
    v9.image = createElement("ImageLabel", v10, v11)
    v7.button = createElement("TextButton", v8, v9)
    return createElement("Frame", v6, v7)
end