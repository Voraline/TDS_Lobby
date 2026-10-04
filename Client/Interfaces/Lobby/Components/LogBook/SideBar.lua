-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.SideBar
-- Decompile time: 5.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sidebars = script.Parent.Sidebars
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local EnemySidebar = require(Sidebars.EnemySidebar)
local MapSidebar = require(Sidebars.MapSidebar)
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useSpring = ReactFlow.useSpring
return memo(function(a1) -- Line: 30
    -- upvalues: useState (val), useSpring (val), useEffect (val), createElement (val), EnemySidebar (val)
    -- upvalues: MapSidebar (val)
    local selectedEnemy = a1.selectedEnemy
    local selectedMap = a1.selectedMap
    local tab = a1.tab
    local u6, v1 = useState(true)
    local v2, u11 = useSpring({start = 1, target = 0, damper = 0.6, speed = 20})
    local v3, u15 = useSpring({start = 0, target = 0, damper = 0.6, speed = 16})
    local v4, u19 = useSpring({start = 0, target = 0, damper = 0.6, speed = 20})
    local v5 = {tab}
    useEffect(function() -- Line: 55 -- upvalues: u15 (val), u19 (val), tab (val)
        u15({force = 10})
        u19({target = if tab ~= "Maps" then 0 else 1})
    end, v5)
    v5 = {u6}
    useEffect(function() -- Line: 65 -- upvalues: u6 (val), u15 (val), u11 (val)
        if u6 then
            u15({force = 10})
        end
        u11({target = if not u6 then 0 else 1})
    end, v5)
    if tab == "Achievements" then
        return nil
    end
    v5 = {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 1),
        Size = UDim2.fromScale(0.392, 0.906),
    }
    local v6 = {
        uICorner = createElement("UICorner"),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)}),
    }
    local v7 = false
    if tab == "Enemies" then
        v7 = selectedEnemy and createElement(EnemySidebar, {selectedEnemy = selectedEnemy, setIsLoading = v1, transparency = v2})
    end
    v6.enemyPreview = v7
    v7 = false
    if tab == "Maps" then
        v7 = selectedMap and createElement(MapSidebar, {selectedMap = selectedMap, setIsLoading = v1, transparency = v2})
    end
    v6.mapPreview = v7
    v6.holder = createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Visible = u6 and not selectedEnemy and not selectedMap,
    }, {
        thinking = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://85032210421620",
            ImageTransparency = 0.9,
            Size = UDim2.fromScale(0.6, 0.6),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
        }, {
            uIScale = createElement("UIScale", {
                Scale = v3:map(function(a1) -- Line: 125
                    return 1 + a1 * 0.5
                end),
            }),
        }),
        enemyText = createElement("TextLabel", {
            Text = "select an enemy to preview",
            TextScaled = true,
            BackgroundTransparency = 1,
            ZIndex = 9,
            Font = Enum.Font.GothamMedium,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Position = v4:map(function(a1) -- Line: 136
                return UDim2.fromScale(0.5, 0.4 + (1 - a1) * 0.1)
            end),
            Size = UDim2.fromScale(1, 0.04),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextTransparency = v4:map(function(a1) -- Line: 143
                return a1
            end),
        }),
        mapText = createElement("TextLabel", {
            Text = "select a map to view",
            TextScaled = true,
            BackgroundTransparency = 1,
            ZIndex = 9,
            Font = Enum.Font.GothamMedium,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Position = v4:map(function(a1) -- Line: 154
                return UDim2.fromScale(0.5, 0.4 + a1 * 0.1)
            end),
            Size = UDim2.fromScale(1, 0.04),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextTransparency = v4:map(function(a1) -- Line: 160
                return 1 - a1
            end),
        }),
    })
    v6.uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 0.649})
    return createElement("Frame", v5, v6)
end)