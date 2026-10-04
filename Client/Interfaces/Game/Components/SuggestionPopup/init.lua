-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SuggestionPopup
-- Decompile time: 22.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Button)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
local useState = React.useState
local u31 = Color3.fromRGB(100, 130, 239)
local u36 = Color3.fromRGB(58, 222, 64)
return memo(function(a1) -- Line: 44
    -- upvalues: useState (val), useSpring (val), useEffect (val), createElement (val), Button (val), u31 (val)
    -- upvalues: u36 (val)
    local v1
    local nameColor = a1.nameColor or Color3.fromRGB(255, 255, 255)
    local v2 = a1.lifetime or 0
    local currentTime = a1.currentTime or workspace:GetServerTimeNow()
    local createdAt = a1.createdAt
    local v3 = if not (v2 > 0) then 1 else math.clamp(((createdAt or currentTime) + v2 - currentTime) / v2, 0, 1)
    local u32 = if a1.slideDirection ~= -1 then 1 else -1
    local v4 = a1.zIndex or 1
    local u42, u43 = useState(if not a1.exiting then "entering" else "exiting")
    local v5 = if v1 ~= "visible" then 1 else 0
    local v6, u55 = useSpring({speed = 22, start = v5, target = v5, damper = if v1 ~= "entering" then 1 else 0.5})
    local v7, u59 = useSpring({start = 1, target = 1, speed = 10, damper = 0.35})
    local v8 = if v1 ~= "exiting" then 0 else u32 * -360
    local v9, u71 = useSpring({speed = 8, damper = 0.5, start = v8, target = v8})
    local v10 = useEffect
    local v11 = {a1.exiting}
    v10(function() -- Line: 82 -- upvalues: u43 (val), a1 (val)
        u43(if not a1.exiting then "visible" else "exiting")
    end, v11)
    v11 = {u42}
    useEffect(function() -- Line: 86 -- upvalues: u55 (val), u42 (val), u59 (val), u71 (val), u32 (val), a1 (val)
        u55({
            target = if u42 ~= "visible" then 1 else 0,
            damper = if u42 ~= "visible" then 1 else 0.8,
        })
        if u42 ~= "exiting" then
            u59({target = 1})
        end
        local u19 = {}
        if u42 == "visible" then
            u71({force = 0, target = u32 * -360})
            table.insert(u19, (task.delay(0.1, function() -- Line: 106 -- upvalues: u59 (upval)
                u59({target = 1, force = 5})
            end)))
        end
        if u42 == "exiting" and a1.onExited ~= nil then
            table.insert(u19, (task.delay(0.35, a1.onExited)))
        end
        if #u19 == 0 then
            return
        end
        return function() -- Line: 123 -- upvalues: u19 (val)
            for i, j in u19 do
                task.cancel(j)
            end
        end
    end, v11)
    v10 = v6:map(function(a1) -- Line: 130 -- upvalues: u32 (val)
        return UDim2.new(u32 * 1.1 * a1, u32 * -8, 0, 0)
    end)
    local v12 = not a1.exiting and u42 ~= "exiting"
    local v13 = {
        BackgroundTransparency = 1,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.fromOffset(370, 120),
        ZIndex = v4,
    }
    local v14 = {}
    local v15 = {BackgroundTransparency = 1, Position = v10, Size = UDim2.fromScale(1, 1), ZIndex = v4}
    local v16 = {
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 14, 1, 14),
            SliceCenter = Rect.new(14, 14, 64, 24),
            ZIndex = v4 - 1,
        }),
    }
    v16.background = createElement("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        ZIndex = v4,
    }, {corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)})})
    v16.sender = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(0, 0, 0.45, 0),
        ZIndex = v4 + 1,
    }, {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
        }),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = if not a1.icon then "" else ("rbxassetid://%*"):format(a1.icon),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(90, 90),
            ZIndex = v4 + 1,
        }),
        info = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(1, -45, 1, 0),
            ZIndex = v4 + 1,
        }, {
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 1), PaddingTop = UDim.new(0, 1)}),
            header = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.6, 0),
                ZIndex = v4 + 1,
            }, {
                list = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    Padding = UDim.new(0, 4),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                }),
                name = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    TextSize = 20,
                    TextWrapped = false,
                    AutomaticSize = Enum.AutomaticSize.X,
                    FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Size = UDim2.new(0, 0, 1, 0),
                    Text = a1.sourceName,
                    TextColor3 = nameColor,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = v4 + 1,
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.5,
                        Color = Color3.fromRGB(0, 0, 0),
                        LineJoinMode = Enum.LineJoinMode.Bevel,
                    }),
                }),
                suggested = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Text = "suggested:",
                    TextSize = 20,
                    TextWrapped = false,
                    AutomaticSize = Enum.AutomaticSize.X,
                    FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Size = UDim2.new(0, 0, 1, 0),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = v4 + 1,
                }, {
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.5,
                        Color = Color3.fromRGB(0, 0, 0),
                        LineJoinMode = Enum.LineJoinMode.Bevel,
                    }),
                }),
            }),
            subheader = createElement("TextLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                TextScaled = true,
                TextSize = 20,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 0, 0.35, 0),
                Text = a1.detail,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = v4 + 1,
            }, {
                stroke = createElement("UIStroke", {
                    Thickness = 2,
                    Transparency = 0.5,
                    Color = Color3.fromRGB(0, 0, 0),
                    LineJoinMode = Enum.LineJoinMode.Bevel,
                }),
            }),
        }),
    })
    local v17 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.fromScale(0.5, 0.85),
        Size = UDim2.new(1, 0, 0, 0),
        ZIndex = v4 + 1,
    }
    local v18 = {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    v18.padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, -8)})
    v18.view = if a1.showView == false then nil else createElement(Button, {
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        text = "View",
        textSize = 16,
        automaticSize = Enum.AutomaticSize.None,
        color = u31,
        layoutOrder = if u32 ~= -1 then 1 else 2,
        onClick = a1.onView,
        size = UDim2.fromOffset(160, 30),
        zIndex = v4 + 1,
    })
    v18.dismiss = createElement(Button, {
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        text = "OK",
        textSize = 16,
        automaticSize = Enum.AutomaticSize.None,
        color = u36,
        layoutOrder = if u32 ~= -1 then 2 else 1,
        onClick = a1.onDismiss,
        size = UDim2.fromOffset(160, 30),
        zIndex = v4 + 1,
    })
    v16.buttons = createElement("Frame", v17, v18)
    local v19 = createElement
    v17 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.925),
        Size = UDim2.new(0.95, 0, 0, 2),
        ZIndex = v4 + 1,
    }
    v18 = {
        frame = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(v3, 1),
            ZIndex = v4 + 1,
        }),
    }
    v16.timer = v19("Frame", v17, v18)
    if not v12 then
        v19 = nil
    else
        v17 = {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 43, 47),
        }
        v18 = if u32 ~= -1 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0)
        v17.Position = v18
        v17.Size = v7:map(function(a1) -- Line: 383 -- types: a1: number
            return UDim2.fromScale(a1 * 0.35, a1 * 0.35)
        end)
        v17.ZIndex = v4 + 1
        v19 = createElement("Frame", v17, {
            aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
            corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            stroke = createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(89, 0, 1),
                LineJoinMode = Enum.LineJoinMode.Round,
            }),
            player = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "!",
                TextScaled = true,
                TextSize = 20,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0.5),
                Rotation = v9,
                Size = UDim2.fromScale(0.8, 0.8),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                ZIndex = v4 + 1,
            }, {
                stroke = createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(89, 0, 1),
                    LineJoinMode = Enum.LineJoinMode.Round,
                }),
            }),
        })
    end
    v16.notification = v19
    v14.bin = createElement("Frame", v15, v16)
    return createElement("Frame", v13, v14)
end)