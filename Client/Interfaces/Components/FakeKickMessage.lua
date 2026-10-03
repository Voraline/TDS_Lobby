-- Script path: ReplicatedStorage.Client.Interfaces.Components.FakeKickMessage
-- Decompile time: 6.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Vignette = require(ReplicatedStorage.Client.Interfaces.Game.Components.Vignette)
local createElement = React.createElement
local useEffect = React.useEffect
local u28 = {"+", "-", "@", "#", "$", "%", "^", "&", "*", "(", ")", "!", "[", "]"}
return function(a1) -- Line: 28
    -- upvalues: ReactFlow (val), React (val), useEffect (val), RunService (val), u28 (val), createElement (val)
    -- upvalues: Vignette (val)
    local v1, v2 = ReactFlow.useTween({start = 0, target = 1, info = TweenInfo.new(0.03, Enum.EasingStyle.Linear)})
    local Leave, Leave_2 = React.useBinding("Leave")
    local v3, u19 = React.useBinding(0)
    local v4, u29 = ReactFlow.useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(0.85, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
    })
    local u35, u36 = React.useBinding({"Disconnected", a1.kickMessage})
    v2({})
    useEffect(function() -- Line: 50
        -- upvalues: Leave_2 (val), Leave (val), RunService (upval), u19 (val), u35 (val), u28 (upval), u36 (val)
        -- upvalues: u29 (val)
        local u0 = nil
        local u3 = task.spawn(function() -- Line: 52
            -- upvalues: Leave_2 (upval), Leave (upval), u0 (ref), RunService (upval), u19 (upval), u35 (upval)
            -- upvalues: u28 (upval), u36 (upval), u29 (upval)
            task.wait(5)
            local v1 = 0.4
            for i = 1, 3 do
                Leave_2((Leave:getValue()) .. "?")
                task.wait(v1)
                v1 = v1 + 0.4
            end
            task.wait(0.5)
            local u30 = {}
            local u33 = Random.new(100)
            local u35_2 = tick()
            u0 = RunService.Heartbeat:Connect(function(a1) -- Line: 71
                -- upvalues: u35_2 (ref), u19 (upval), u35 (upval), u33 (val), u30 (val), u28 (upval), u36 (upval)
                local v1 = tick() - u35_2
                if v1 >= 0.04 then
                    local v2, v3, v4, v5, v6
                    u35_2 = tick()
                    u19(math.random(-1, 1))
                    v1 = u35:getValue()
                    for i, j in u35:getValue() do
                        v5 = u33:NextInteger(1, #j)
                        if not u30[i] then
                            u30[i] = {}
                        end
                        if not u30[i][v5] then
                            v6 = u30[i]
                            v6[v5] = true
                            v6 = u28[u33:NextInteger(1, #u28)]
                            v3 = v5 - 1
                            v2 = j:sub(1, v3)
                            v4 = v5 + 1
                            v1[i] = v2 .. v6 .. j:sub(v4)
                        end
                    end
                    u36(v1)
                end
            end)
            task.delay(1.4, function() -- Line: 103 -- upvalues: u29 (upval)
                u29({target = 0})
            end)
            Leave_2("")
            for j = 1, 8 do
                Leave_2((Leave:getValue()) .. "?")
                task.wait(0.03)
            end
        end)
        return function() -- Line: 115 -- upvalues: u3 (val), u0 (ref)
            task.cancel(u3)
            if u0 then
                u0:Disconnect()
            end
        end
    end, {})
    return createElement("Frame", {
        Active = true,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        Size = UDim2.fromScale(1, 1),
    }, {
        vignette = createElement(Vignette, {
            color = Color3.new(),
            transparency = v4:map(function(a1) -- Line: 131
                return a1 - 0.1
            end),
        }),
        bright = createElement("Frame", {
            ZIndex = 99,
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = v4,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }),
        alert = createElement("ImageButton", {
            Image = "rbxassetid://121200876836753",
            ImageTransparency = 1,
            AutoButtonColor = false,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Selectable = false,
            ImageColor3 = Color3.fromRGB(57, 59, 61),
            ImageRectOffset = Vector2.new(402, 494),
            ImageRectSize = Vector2.new(17, 17),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(8, 9, 9, 11),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(57, 59, 61),
            Position = v3:map(function(a1) -- Line: 154
                return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(a1 + math.random(-1, 1) * 10, a1 + math.random(-1, 1) * 10)
            end),
            Rotation = v3:map(function(a1) -- Line: 161
                return a1 + math.random(-1, 1) * a1 * 2
            end),
            Size = UDim2.fromOffset(400, 246),
        }, {
            alertContents = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromOffset(400, 246),
            }, {
                leave = createElement("ImageLabel", {BackgroundTransparency = 1, LayoutOrder = 3, Size = UDim2.new(1, 0, 0, 36)}, {
                    layout = createElement("UIListLayout", {
                        Padding = UDim.new(0, 12),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                    margin = createElement("UIPadding"),
                    buttons = createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 3,
                        Size = UDim2.new(1, 0, 0, 36),
                    }, {
                        var_1 = createElement("ImageButton", {
                            Image = "rbxassetid://121200876836753",
                            AutoButtonColor = false,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            ZIndex = 100000000,
                            ScaleType = Enum.ScaleType.Slice,
                            SliceCenter = Rect.new(256, 256, 256, 256),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromOffset(352, 36),
                        }, {
                            buttonContent = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
                                buttonMiddleContent = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
                                    uIListLayout = createElement("UIListLayout", {
                                        Padding = UDim.new(0, 5),
                                        FillDirection = Enum.FillDirection.Horizontal,
                                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                        SortOrder = Enum.SortOrder.LayoutOrder,
                                        VerticalAlignment = Enum.VerticalAlignment.Center,
                                    }),
                                    text = createElement("TextLabel", {
                                        TextSize = 20,
                                        TextWrapped = true,
                                        BackgroundTransparency = 1,
                                        LayoutOrder = 2,
                                        FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json"),
                                        Text = Leave,
                                        TextColor3 = Color3.fromRGB(57, 59, 61),
                                        Size = UDim2.fromOffset(900, 22),
                                    }),
                                }),
                            }),
                        }),
                        margin1 = createElement("UIPadding"),
                    }),
                }),
                layout1 = createElement("UIListLayout", {Padding = UDim.new(0, 24), SortOrder = Enum.SortOrder.LayoutOrder}),
                middle = createElement("ImageLabel", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 86)}, {
                    layout2 = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder}),
                    content = createElement("ImageLabel", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 86)}, {
                        padding = createElement("UIPadding"),
                        bodyText = createElement("TextLabel", {
                            TextSize = 20,
                            TextWrapped = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json"),
                            Text = u35:map(function(a1) -- Line: 259
                                return a1[2]
                            end),
                            TextColor3 = Color3.fromRGB(189, 190, 190),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromOffset(338, 92),
                        }),
                    }),
                    padding1 = createElement("UIPadding"),
                }),
                top = createElement("ImageLabel", {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 52)}, {
                    titleArea = createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.new(1, 0, 0, 40),
                    }, {
                        title = createElement("TextLabel", {
                            TextSize = 25,
                            TextWrapped = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                            Text = u35:map(function(a1) -- Line: 292
                                return a1[1]
                            end),
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextTruncate = Enum.TextTruncate.AtEnd,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromOffset(233, 27),
                        }),
                        underline = createElement("Frame", {
                            BackgroundTransparency = 0.8,
                            BorderSizePixel = 0,
                            LayoutOrder = 2,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Position = UDim2.fromOffset(0, 45),
                            Size = UDim2.new(1, 0, 0, 1),
                        }),
                        padding2 = createElement("UIPadding"),
                    }),
                    padding3 = createElement("UIPadding", {PaddingTop = UDim.new(0, 12)}),
                }),
                padding4 = createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 24),
                    PaddingLeft = UDim.new(0, 24),
                    PaddingRight = UDim.new(0, 24),
                }),
            }),
            uIScale = createElement("UIScale", {Scale = v1}),
        }),
    })
end