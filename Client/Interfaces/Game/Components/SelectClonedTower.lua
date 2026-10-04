-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SelectClonedTower
-- Decompile time: 9.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Keybind = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Keybind)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 20
    -- upvalues: createElement (val), Keybind (val), React (val), Icons (val), Comma (val)
    local v1 = {}
    if a1.Binds then
        for i, j in a1.Binds do
            v1[i] = (createElement(Keybind, j))
        end
    end
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = a1.Position,
        Size = UDim2.fromOffset(176, 50),
    }
    local v3 = {
        uiListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            Padding = UDim.new(0, 5),
        }),
    }
    local v4 = {
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        LayoutOrder = 0,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(0, 20),
    }
    local v5 = {
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            Color = Color3.fromRGB(255, 255, 255),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
    }
    local v6 = {
        TextSize = 15,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.HeaderText or "Select Tower",
    }
    local HeaderColor = a1.HeaderColor or Color3.fromRGB(179, 232, 255)
    v6.TextColor3 = HeaderColor
    v6.AnchorPoint = Vector2.new(0, 0.5)
    v6.AutomaticSize = Enum.AutomaticSize.XY
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v6.Position = UDim2.fromScale(0, 0.5)
    v6.Size = UDim2.fromOffset(0, 10)
    v5.textLabel = createElement("TextLabel", v6)
    v5.uIPadding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        PaddingTop = UDim.new(0, 5),
    })
    v3.selectTower = createElement("Frame", v4, v5)
    local v7 = createElement
    v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(100, 20),
    }
    v5 = {
        UIScale = createElement("UIScale", {Scale = 0.7}),
        uiListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5),
        }),
        listOfItems = createElement(React.Fragment, nil, v1),
    }
    v3.binds = v7("Frame", v4, v5)
    local TowerName = a1.TowerName
    if TowerName then
        TowerName = a1.Cost
        if TowerName then
            v4 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromOffset(0, 25),
                Size = UDim2.fromOffset(0, 20),
            }
            v5 = {
                uIListLayout = createElement("UIListLayout", {
                    Padding = UDim.new(0, 5),
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
            }
            local TowerName_2 = a1.TowerName and createElement("Frame", {
                BackgroundTransparency = 0.45,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromOffset(0, 25),
                Size = UDim2.fromOffset(0, 20),
            }, {
                uIStroke1 = createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255),
                    LineJoinMode = Enum.LineJoinMode.Bevel,
                }),
                textLabel1 = createElement("TextLabel", {
                    TextSize = 15,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    Text = a1.TowerName,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AnchorPoint = Vector2.new(0, 0.5),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromOffset(0, 10),
                }),
                uIPadding1 = createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 5),
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5),
                    PaddingTop = UDim.new(0, 5),
                }),
            })
            v5.towerName = TowerName_2
            local Cost = a1.Cost and createElement("Frame", {
                BackgroundTransparency = 0.45,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromOffset(0, 25),
                Size = UDim2.fromOffset(0, 20),
            }, {
                iPadding1 = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}),
                iStroke1 = createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255),
                    LineJoinMode = Enum.LineJoinMode.Bevel,
                }),
                moneyImage = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = Icons.Cash,
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromOffset(20, 20),
                }),
                label1 = createElement("TextLabel", {
                    TextSize = 15,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    Text = Comma((math.floor(a1.Cost * ((a1.Percent or 100) / 100)))),
                    TextColor3 = Color3.fromRGB(69, 255, 97),
                    AnchorPoint = Vector2.new(0, 0.5),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromOffset(0, 10),
                }),
                uIListLayout = createElement("UIListLayout", {
                    Padding = UDim.new(0, 5),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                }),
            })
            v5.cost = Cost
            TowerName = createElement("Frame", v4, v5)
        end
    end
    v3.Holder = TowerName
    return createElement("Frame", v2, v3)
end)