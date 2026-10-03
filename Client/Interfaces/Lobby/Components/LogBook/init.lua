-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Components_2 = script.Parent.Parent.Components
local Components = Interfaces.Components
local v1 = script
local Icons = require(Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local IconButton = require(Components.IconButton)
local Information = require(v1.Information)
local NewNavbar = require(Components_2.NewNavbar)
local SideBar = require(v1.SideBar)
local TabButton = require(Components_2.TabButton)
local useCallback = React.useCallback
local memo = React.memo
local createElement = React.createElement
return memo((memo(function(a1) -- Line: 25
    -- upvalues: createElement (val), Information (val), SideBar (val), NewNavbar (val), TabButton (val), Icons (val)
    -- upvalues: useCallback (val), IconButton (val)
    local onTabSelected = a1.onTabSelected
    local tab = a1.tab
    local v1 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.633, 0.738),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = a1.Visible,
    }
    local v2 = {
        UIAspect = createElement("UIAspectRatioConstraint", {AspectRatio = 1.5}),
        uiSizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 1000)}),
        Information = createElement(Information, a1),
        SideBar = createElement(SideBar, a1),
    }
    local v3 = {Position = UDim2.fromScale(0.5, 0.07)}
    local v4 = {}
    local v5 = {
        layoutOrder = 1,
        title = "Enemies",
        selectable = true,
        icon = Icons.Enemies,
        selected = tab == "Enemies",
    }
    local v6 = {onTabSelected}
    v5.clicked = useCallback(function() -- Line: 57 -- upvalues: onTabSelected (val)
        return onTabSelected("Enemies")
    end, v6)
    v4.Enemies = createElement(TabButton, v5)
    v5 = {
        layoutOrder = 2,
        title = "Maps",
        selectable = true,
        icon = Icons.Maps,
        selected = tab == "Maps",
    }
    v6 = {onTabSelected}
    v5.clicked = useCallback(function() -- Line: 70 -- upvalues: onTabSelected (val)
        return onTabSelected("Maps")
    end, v6)
    v4.Maps = createElement(TabButton, v5)
    v5 = {
        layoutOrder = 3,
        title = "Achievements",
        selectable = true,
        icon = Icons.Badge,
        selected = tab == "Achievements",
    }
    v6 = {onTabSelected}
    v5.clicked = useCallback(function() -- Line: 83 -- upvalues: onTabSelected (val)
        return onTabSelected("Achievements")
    end, v6)
    v4.Achievements = createElement(TabButton, v5)
    v4.Exit = createElement(IconButton, {LayoutOrder = 4, Color = Color3.fromRGB(255, 79, 73), Clicked = a1.onClose})
    v2.Navbar = createElement(NewNavbar, v3, v4)
    return createElement("Frame", v1, v2)
end)))