-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.SoftShutdown
-- Decompile time: 5.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useTween = (require(ReplicatedStorage.Packages.ReactFlow)).useTween
local useEffect = React.useEffect
local useBinding = React.useBinding
local createElement = React.createElement
return React.memo(function(a1) -- Line: 25
    -- upvalues: useBinding (val), useTween (val), useEffect (val), createElement (val)
    local u3 = a1.Visible ~= false
    local u7 = a1.ellipsis ~= false
    local u10 = a1.title or "Rebooting servers for an update"
    local v1 = a1.subText or "Teleporting you back in a moment!"
    local v2, u16 = useBinding("")
    local v3, u25 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut),
    })
    local v4 = {u3, u7}
    useEffect(function() -- Line: 39 -- upvalues: u3 (val), u25 (val), u7 (val), u16 (val)
        if not u3 then
            return
        end
        local u1 = true
        local u4 = task.spawn(function() -- Line: 46 -- upvalues: u1 (ref), u25 (upval)
            while u1 do
                u25({start = 0, target = 360})
                task.wait(1.6)
            end
        end)
        local u7_2 = task.spawn(function() -- Line: 57 -- upvalues: u7 (upval), u1 (ref), u16 (upval)
            if not u7 then
                return
            end
            while u1 do
                for i = 1, 3 do
                    u16(("."):rep(i))
                    task.wait(0.5)
                end
            end
        end)
        return function() -- Line: 70 -- upvalues: u1 (ref), u7_2 (val), u4 (val)
            u1 = false
            task.cancel(u7_2)
            task.cancel(u4)
        end
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        Active = u3,
        Visible = u3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 20),
            PaddingLeft = UDim.new(0, 20),
            PaddingRight = UDim.new(0, 20),
            PaddingTop = UDim.new(0, 20),
        }),
        contentContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIScale = createElement("UIScale"),
            imageLabelContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromOffset(80, 80),
            }, {
                imageLabel = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = "rbxasset://textures/loading/robloxTilt.png",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromScale(1, 1),
                    Rotation = v3,
                }),
            }),
            labelContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 0, 0, 80),
            }, {
                titleLabel = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    TextScaled = true,
                    TextSize = 14,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0.5, 0),
                    Size = UDim2.fromScale(2, 0.6),
                    Text = v2:map(function(a1) -- Line: 149 -- upvalues: u10 (val)
                        return (("%*%*"):format(u10, a1))
                    end),
                    TextColor3 = Color3.fromRGB(229, 229, 229),
                }),
                subtitleLabel = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    TextScaled = true,
                    TextSize = 14,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Light, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0.5, 1),
                    Size = UDim2.fromScale(1, 0.3),
                    Text = v1,
                    TextColor3 = Color3.fromRGB(229, 229, 229),
                }),
                uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 5}),
            }),
            uIListLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 20),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        }),
    })
end)