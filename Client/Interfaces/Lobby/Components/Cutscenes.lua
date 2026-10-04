-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Cutscenes
-- Decompile time: 7.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local ImageLabel = require(Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local IconButton = require(Interfaces.Components.IconButton)
local useMediaQuery = require(Interfaces.Hooks.useMediaQuery)
local createElement = React.createElement
local Event = React.Event
local useMemo = React.useMemo
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local Cutscenes = ReplicatedStorage:WaitForChild("Content"):WaitForChild("Cutscenes")
return function(a1) -- Line: 26
    -- upvalues: useMediaQuery (val), useMemo (val), Cutscenes (val), createElement (val), Event (val)
    -- upvalues: CutSceneController (val), ImageLabel (val), IconButton (val), React (val)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = a1.Visible}, {
        window = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = (useMediaQuery("large", true)):map(function(a1) -- Line: 27
                return a1 and UDim2.fromScale(0.6, 0.6) or UDim2.fromScale(0.8, 0.8)
            end),
            Visible = a1.Visible,
        }, {
            aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.65}),
            sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(900, (1 / 0))}),
            background = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = "rbxassetid://93677620891960",
                disableSpinner = true,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.509),
                Size = UDim2.fromScale(1.13, 1.21),
            }),
            render = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = "rbxassetid://123630164799190",
                ImageTransparency = 0.8,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Crop,
                Size = UDim2.fromScale(1, 0.996),
            }, {corner = createElement("UICorner", {CornerRadius = UDim.new(0.0217, 0)})}),
            title = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Cutscenes",
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 3,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.035, 0.03),
                Size = UDim2.fromScale(0.622, 0.08),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            subTitle = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Browse all cutscenes",
                TextScaled = true,
                TextTransparency = 0.4,
                TextWrapped = true,
                ZIndex = 3,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.034, 0.12),
                Size = UDim2.fromScale(0.55, 0.05),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            close = createElement(IconButton, {
                ZIndex = 4,
                AnchorPoint = Vector2.new(1, 0),
                Size = UDim2.fromScale(0.044, 0.069),
                Position = UDim2.fromScale(0.982, 0.035),
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = function() -- Line: 178 -- upvalues: a1 (val)
                    if a1.Close then
                        a1.Close()
                    end
                end,
            }),
            content = createElement("Frame", {
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                ZIndex = 4,
                Position = UDim2.fromScale(0.035, 0.18),
                Size = UDim2.fromScale(0.93, 0.76),
            }, {
                cutsceneList = createElement("ScrollingFrame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ScrollBarThickness = 8,
                    Position = UDim2.fromScale(0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                }, {
                    UIPadding = createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8),
                        PaddingBottom = UDim.new(0, 8),
                        PaddingLeft = UDim.new(0, 16),
                        PaddingRight = UDim.new(0, 8),
                    }),
                    UIListLayout = createElement("UIListLayout", {
                        Wraps = true,
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        Padding = UDim.new(0.01, 0),
                    }),
                    items = createElement(React.Fragment, {}, (useMemo(function() -- Line: 32 -- upvalues: Cutscenes (upval), createElement (upval), Event (upval), CutSceneController (upval)
                        local Name, v1, v2
                        local v3 = {}
                        local u2 = os.clock()
                        for i, j in Cutscenes:GetChildren() do
                            local u19 = require(j)
                            Name = j.Name
                            v2 = createElement
                            v1 = {
                                Size = UDim2.fromScale(0.32, 0.5),
                                Image = "",
                                ImageTransparency = 1,
                                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            }

                            v1[Event.MouseButton1Click] = function() -- Line: 44 -- upvalues: u2 (ref), CutSceneController (upval), u19 (val), j (val)
                                if os.clock() - u2 < 2 then
                                    return
                                end
                                u2 = os.clock()
                                ;((CutSceneController.PlayLocal(u19.Name, j.Name)):andThen(print)):catch(warn)
                            end

                            v3[Name] = (v2("ImageButton", v1, {
                                UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3}),
                                corner = createElement("UICorner", {CornerRadius = UDim.new(0.075, 0)}),
                                UIStroke = createElement("UIStroke", {
                                    Thickness = 0.02,
                                    Transparency = 0.9,
                                    StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                                    Color = Color3.fromRGB(255, 255, 255),
                                }),
                                SceneName = createElement("TextLabel", {
                                    TextScaled = true,
                                    BorderSizePixel = 0,
                                    BackgroundTransparency = 1,
                                    Text = j.Name,
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                                    Size = UDim2.fromScale(0.8, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                }),
                            }))
                        end
                        return v3
                    end, {}))),
                }),
            }),
        }),
    })
end