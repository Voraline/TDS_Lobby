-- Script path: ReplicatedStorage.Client.Interfaces.Components.TooltipWindow
-- Decompile time: 26.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TextService = (require((((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib")))).import(
    script,
    game:GetService("ReplicatedStorage"),
    "rbxts",
    "node_modules",
    "@rbxts",
    "services"
).TextService

local function mapBinding(a1, a2) -- Line: 15
    if type(a1) == "table" then
        return a1:map(function(a1) -- Line: 18 -- upvalues: a2 (val)
            return a2(a1)
        end)
    end
    return a2(a1)
end

local function hasContent(a1) -- Line: 25
    if a1 == nil then
        return false
    end
    for i, j in a1 do
        return true
    end
    return false
end

local function getTextBounds(a1, a2) -- Line: 36 -- upvalues: TextService (val)
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Width = 192
    GetTextBoundsParams.Size = a2
    GetTextBoundsParams.Text = a1
    GetTextBoundsParams.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    return UDim2.fromOffset(math.min(192, (TextService:GetTextBoundsAsync(GetTextBoundsParams)).X), 0)
end

local function TooltipHeader(a1) -- Line: 49 -- upvalues: React (val)
    local v1
    local createElement = React.createElement
    local v2 = {
        TextSize = 16,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        key = "header",
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.Text,
        TextColor3 = Color3.fromRGB(232, 232, 232),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local MaxSize = a1.MaxSize

    local function u22(a1) -- Line: 62
        local v1 = UDim2
        local v2 = a1
        if v2 == nil then
            v2 = 0
        end
        return v1.fromOffset(v2, 18)
    end

    if type(MaxSize) ~= "table" then
        local v3 = UDim2
        local v4 = MaxSize
        if v4 == nil then
            v4 = 0
        end
        v1 = v3.fromOffset(v4, 18)
    else
        v1 = MaxSize:map(function(a1) -- Line: 18 -- upvalues: u22 (val)
            return u22(a1)
        end)
    end
    v2.Size = v1
    v2.TextXAlignment = Enum.TextXAlignment.Center
    return createElement("TextLabel", v2, {(React.createElement("UIStroke", {key = "UIStroke", Thickness = 2, Transparency = 0.01}))})
end

local function TooltipSubject(a1) -- Line: 80 -- upvalues: React (val)
    local v1
    local createElement = React.createElement
    local v2 = {
        TextSize = 12,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        key = "subject",
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.Text,
        TextColor3 = Color3.fromRGB(255, 170, 0),
        TextYAlignment = Enum.TextYAlignment.Top,
        TextXAlignment = Enum.TextXAlignment.Center,
        AutomaticSize = Enum.AutomaticSize.Y,
    }
    local MaxSize = a1.MaxSize

    local function u20(a1) -- Line: 94
        local v1 = UDim2
        local v2 = a1
        if v2 == nil then
            v2 = 0
        end
        return v1.fromOffset(v2, 18)
    end

    if type(MaxSize) ~= "table" then
        local v3 = UDim2
        local v4 = MaxSize
        if v4 == nil then
            v4 = 0
        end
        v1 = v3.fromOffset(v4, 18)
    else
        v1 = MaxSize:map(function(a1) -- Line: 18 -- upvalues: u20 (val)
            return u20(a1)
        end)
    end
    v2.Size = v1
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v2.Position = UDim2.fromOffset(0, 20)
    return createElement("TextLabel", v2, {
        React.createElement("UIPadding", {
            key = "UIPadding",
            PaddingBottom = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
        }),
        React.createElement("UIStroke", {key = "UIStroke", Thickness = 2, Transparency = 0.01}),
        (React.createElement("Frame", {
            BorderSizePixel = 0,
            LayoutOrder = 3,
            key = "Divider",
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromOffset(0, 22),
            Size = UDim2.new(1, 0, 0, 1),
            Visible = a1.Divider ~= false,
        }, {
            React.createElement("UIGradient", {
                key = "UIGradient",
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0.25),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.8, 0.25),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        })),
    })
end

local function TooltipLine(a1) -- Line: 141 -- upvalues: React (val)
    local v1, v2, v3, v4, v5
    local MaxSize = a1.MaxSize

    local function u2(a1) -- Line: 142
        local v1 = a1
        if v1 == nil then
            v1 = 0
        end
        return v1
    end

    if type(MaxSize) ~= "table" then
        v1 = MaxSize
        if v1 == nil then
            v1 = 0
        end
    else
        v1 = MaxSize:map(function(a1) -- Line: 18 -- upvalues: u2 (val)
            return u2(a1)
        end)
    end
    if a1.Icon == nil then
        local createElement_5 = React.createElement
        v2 = {
            LineHeight = 1.2,
            TextSize = 12,
            TextWrapped = true,
            BackgroundTransparency = 1,
            RichText = true,
            key = "value",
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        }
        local Text = a1.Text

        local function u159(a1_2) -- Line: 214 -- upvalues: a1 (val)
            local v1 = if a1.Bullets == false then "" else "•"
            local v2 = a1_2
            if v2 == nil then
                v2 = ""
            end
            return v1 .. " " .. v2
        end

        if type(Text) ~= "table" then
            v4 = if a1.Bullets == false then "" else "•"
            v5 = Text
            if v5 == nil then
                v5 = ""
            end
            v3 = v4 .. " " .. v5
        else
            v3 = Text:map(function(a1) -- Line: 18 -- upvalues: u159 (val)
                return u159(a1)
            end)
        end
        v2.Text = v3
        v2.LayoutOrder = a1.LayoutOrder
        v2.TextColor3 = Color3.fromRGB(255, 255, 255)
        v2.TextXAlignment = Enum.TextXAlignment.Left
        v2.AutomaticSize = Enum.AutomaticSize.Y
        v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

        local function u202(a1) -- Line: 230
            return UDim2.fromOffset(a1, 0)
        end

        v2.Size = if type(v1) ~= "table" then UDim2.fromOffset(v1, 0) else v1:map(function(a1) -- Line: 18 -- upvalues: u202 (val)
            return u202(a1)
        end)
        return createElement_5("TextLabel", v2, {
            React.createElement("UIPadding", {
                key = "UIPadding",
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 8),
                PaddingBottom = UDim.new(0, 8),
            }),
        })
    end
    local createElement = React.createElement
    v2 = {
        BackgroundTransparency = 1,
        key = "valueIcon",
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder,
    }

    local function u26(a1) -- Line: 155
        return UDim2.fromOffset(a1, 0)
    end

    v2.Size = if type(v1) ~= "table" then UDim2.fromOffset(v1, 0) else v1:map(function(a1) -- Line: 18 -- upvalues: u26 (val)
        return u26(a1)
    end)
    v3 = {}
    local createElement_2 = React.createElement
    v4 = {BackgroundTransparency = 1, key = "icon"}
    local Icon = a1.Icon

    local function u50(a1) -- Line: 161
        if a1 == nil then
            return ""
        end
        if string.match(a1, "^rbxassetid://") then
            return a1
        end
        return "rbxassetid://" .. a1
    end

    v4.Image = if type(Icon) ~= "table" then if Icon ~= nil then if not string.match(Icon, "^rbxassetid://") then "rbxassetid://" .. Icon else Icon else "" else Icon:map(function(a1) -- Line: 18 -- upvalues: u50 (val)
        return u50(a1)
    end)
    v4.AnchorPoint = Vector2.new(0, 0)
    v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v4.Position = UDim2.fromScale(0, 0)
    v4.Size = UDim2.fromOffset(20, 20)
    local v6 = createElement_2("ImageLabel", v4)
    local createElement_3 = React.createElement
    v5 = {
        LineHeight = 0.9,
        TextSize = 12,
        TextWrapped = true,
        RichText = true,
        BackgroundTransparency = 1,
        key = "value",
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Color3.fromRGB(255, 255, 127),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(22, 0),
        Size = UDim2.new(1, -20, 0, 0),
    }
    local v7 = {
        React.createElement("UIPadding", {
            key = "UIPadding",
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 8),
        }),
    }
    v3[1] = v6
    v3[2] = createElement_3("TextLabel", v5, v7)
    return createElement("Frame", v2, v3)
end

return {
    TooltipHeader = TooltipHeader,
    TooltipSubject = TooltipSubject,
    TooltipLine = TooltipLine,
    TooltipWindow = function(a1) -- Line: 246
        -- upvalues: getTextBounds (val), React (val), TooltipLine (val), TooltipHeader (val), TooltipSubject (val)
        local Content_2, Content_3, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local u1 = {}
        local u71 = 0
        local v11 = true
        if a1.Subject == nil then
            local Content = a1.Content
            if Content ~= nil then
                v7 = nil
                v8 = nil
                for i, j in Content, v7, v8 do
                    if a1.Header ~= nil then
                        u71 = math.max(u71, (getTextBounds(a1.Header, 16)).X.Offset)
                    end
                    if a1.Subject ~= nil then
                        u71 = math.max(u71, (getTextBounds(a1.Subject, 16)).X.Offset)
                    end
                    Content_2 = a1.Content
                    if Content_2 ~= nil then
                        function v7(a1) -- Line: 259 -- upvalues: u71 (ref), getTextBounds (upval)
                            u71 = math.max(u71, (getTextBounds(a1.Text, 12)).X.Offset)
                        end

                        for k, n in Content_2 do
                            u71 = math.max(u71, (getTextBounds(n.Text, 12)).X.Offset)
                        end
                    end
                    Content_3 = a1.Content
                    if Content_3 ~= nil then
                        function v8(a1_2, a2) -- Line: 268
                            -- upvalues: React (upval), TooltipLine (upval), a1 (val), u71 (ref), u1 (val)
                            table.insert(u1, (React.createElement(TooltipLine, {
                                Bullets = a1.Bullets,
                                MaxSize = u71,
                                Text = a1_2.Text,
                                Icon = a1_2.Icon,
                                LayoutOrder = 2 + a2,
                            })))
                        end

                        for m, i5 in Content_3 do
                            v4 = m - 1
                            table.insert(u1, (React.createElement(TooltipLine, {
                                Bullets = a1.Bullets,
                                MaxSize = u71,
                                Text = i5.Text,
                                Icon = i5.Icon,
                                LayoutOrder = 2 + v4,
                            })))
                        end
                    end
                    v8 = {BackgroundTransparency = 1, ZIndex = 2, key = "toolTip"}
                    v8.AnchorPoint = a1.AnchorPoint
                    v8.AutomaticSize = Enum.AutomaticSize.XY
                    v8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v8.Position = a1.Position
                    v9 = if not v11 then UDim2.fromOffset(0, 0) else UDim2.fromOffset(0, 50)
                    v8.Size = v9
                    v8.Visible = a1.Visible
                    v9 = {
                        React.createElement("Frame", {
                            BackgroundTransparency = 0.5,
                            ZIndex = 0,
                            key = "background",
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                            Size = UDim2.fromScale(1, 1),
                        }, {
                            React.createElement("UICorner", {key = "UICorner"}),
                            (React.createElement("UIStroke", {
                                key = "BorderStroke",
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                Color = Color3.fromRGB(255, 255, 255),
                            })),
                        }),
                    }
                    v10 = #v9
                    v1 = {
                        BackgroundTransparency = 1,
                        key = "content",
                        AutomaticSize = Enum.AutomaticSize.XY,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Size = UDim2.fromScale(0, 1),
                    }
                    v2 = {
                        React.createElement("UIPadding", {
                            key = "UIPadding",
                            PaddingBottom = UDim.new(0, 8),
                            PaddingLeft = UDim.new(0, 8),
                            PaddingRight = UDim.new(0, 8),
                            PaddingTop = UDim.new(0, v6),
                        }),
                        React.createElement("UIListLayout", {
                            key = "UIListLayout",
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                        }),
                        (React.createElement(TooltipHeader, {MaxSize = u71, Text = a1.Header})),
                    }
                    v3 = #v2
                    v4 = false
                    if a1.Subject ~= nil then
                        v4 = React.createElement(TooltipSubject, {
                            MaxSize = u71,
                            Text = a1.Subject,
                            Divider = a1.Content ~= nil,
                        })
                    end
                    if v4 then
                        v2[v3 + 1] = v4
                    end
                    v3 = #v2
                    for i6, i7 in u1 do
                        v2[v3 + i6] = i7
                    end
                    v9[v10 + 1] = (React.createElement("Frame", v1, v2))
                    v5 = v10 + 2
                    v9[v5] = (React.createElement("ImageLabel", {
                        Image = "http://www.roblox.com/asset/?id=9239716855",
                        BackgroundTransparency = 1,
                        ZIndex = -1,
                        key = "DropShadow",
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(14, 14, 64, 24),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.new(1, 14, 1, 14),
                    }))
                    return (React.createElement("Frame", v8, v9))
                end
            end
            v11 = false
        end
        if a1.Header ~= nil then
            u71 = math.max(u71, (getTextBounds(a1.Header, 16)).X.Offset)
        end
        if a1.Subject ~= nil then
            u71 = math.max(u71, (getTextBounds(a1.Subject, 16)).X.Offset)
        end
        Content_2 = a1.Content
        if Content_2 ~= nil then
            function v7(a1) -- Line: 259 -- upvalues: u71 (ref), getTextBounds (upval)
                u71 = math.max(u71, (getTextBounds(a1.Text, 12)).X.Offset)
            end

            for i8, i9 in Content_2 do
                u71 = math.max(u71, (getTextBounds(i9.Text, 12)).X.Offset)
            end
        end
        Content_3 = a1.Content
        if Content_3 ~= nil then
            function v8(a1_2, a2) -- Line: 268
                -- upvalues: React (upval), TooltipLine (upval), a1 (val), u71 (ref), u1 (val)
                table.insert(u1, (React.createElement(TooltipLine, {
                    Bullets = a1.Bullets,
                    MaxSize = u71,
                    Text = a1_2.Text,
                    Icon = a1_2.Icon,
                    LayoutOrder = 2 + a2,
                })))
            end

            for i10, i11 in Content_3 do
                v4 = i10 - 1
                table.insert(u1, (React.createElement(TooltipLine, {
                    Bullets = a1.Bullets,
                    MaxSize = u71,
                    Text = i11.Text,
                    Icon = i11.Icon,
                    LayoutOrder = 2 + v4,
                })))
            end
        end
        v8 = {BackgroundTransparency = 1, ZIndex = 2, key = "toolTip"}
        v8.AnchorPoint = a1.AnchorPoint
        v8.AutomaticSize = Enum.AutomaticSize.XY
        v8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v8.Position = a1.Position
        v9 = if not v11 then UDim2.fromOffset(0, 0) else UDim2.fromOffset(0, 50)
        v8.Size = v9
        v8.Visible = a1.Visible
        v9 = {
            React.createElement("Frame", {
                BackgroundTransparency = 0.5,
                ZIndex = 0,
                key = "background",
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromScale(1, 1),
            }, {
                React.createElement("UICorner", {key = "UICorner"}),
                (React.createElement("UIStroke", {
                    key = "BorderStroke",
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = Color3.fromRGB(255, 255, 255),
                })),
            }),
        }
        v10 = #v9
        v1 = {BackgroundTransparency = 1, key = "content"}
        v1.AutomaticSize = Enum.AutomaticSize.XY
        v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v1.Size = UDim2.fromScale(0, 1)
        v2 = {
            React.createElement("UIPadding", {
                key = "UIPadding",
                PaddingBottom = UDim.new(0, if not v11 then 4 else 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, v6),
            }),
            React.createElement("UIListLayout", {
                key = "UIListLayout",
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            (React.createElement(TooltipHeader, {MaxSize = u71, Text = a1.Header})),
        }
        v3 = #v2
        v4 = false
        if a1.Subject ~= nil then
            v4 = React.createElement(TooltipSubject, {MaxSize = u71, Text = a1.Subject, Divider = a1.Content ~= nil})
        end
        if v4 then
            v2[v3 + 1] = v4
        end
        v3 = #v2
        for i12, i13 in u1 do
            v2[v3 + i12] = i13
        end
        v9[v10 + 1] = (React.createElement("Frame", v1, v2))
        v5 = v10 + 2
        v9[v5] = (React.createElement("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=9239716855",
            BackgroundTransparency = 1,
            ZIndex = -1,
            key = "DropShadow",
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }))
        return (React.createElement("Frame", v8, v9))
    end,
}