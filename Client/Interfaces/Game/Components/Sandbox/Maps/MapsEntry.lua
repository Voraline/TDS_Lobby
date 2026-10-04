-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Maps.MapsEntry
-- Decompile time: 5.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local UsernameFromId = require(ReplicatedStorage.Shared.Modules.UsernameFromId)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useSurvivalMapData = require(ReplicatedStorage.Client.Interfaces.Hooks.useSurvivalMapData)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")

local function map(a1, a2, a3, a4, a5) -- Line: 20
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

return function(a1) -- Line: 32
    -- upvalues: useSurvivalMapData (val), useGameStateValue (val), useSound (val), React (val), UsernameFromId (val)
    -- upvalues: createElement (val), BattlepassPreview (val), Sandbox (val), Tooltip (val), ImageLabel (val)
    local u3, v1 = useSurvivalMapData(a1.name)
    local v2 = useGameStateValue("MapName") == a1.name
    local Click = useSound("Click")
    local v3 = {u3}
    local v4 = React.useMemo(function() -- Line: 40 -- upvalues: u3 (val), UsernameFromId (upval)
        local v1 = {}
        if u3.Creator == nil then
            return v1
        end
        for i, j in u3.Creator do
            table.insert(v1, (UsernameFromId(j)))
        end
        return v1
    end, v3)
    local v5 = {innerSize = UDim2.fromScale(0.95, 0.95)}
    local v6 = v2 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v5.color = v6

    function v5.clicked() -- Line: 56 -- upvalues: a1 (val), Click (val), Sandbox (upval)
        if a1.locked then
            return
        end
        Click()
        Sandbox:fireServer("SwitchMap", a1.name)
    end

    v6 = {}
    local v7 = {
        Subject = "Map",
        Name = a1.name,
        Header = a1.name,
        Disabled = not a1.enabled,
    }
    v7.Content = if not a1.locked then {
        {
            Text = if not v1 then ("%*: %*"):format(if not (#v4 > 1) then "Creator" else "Creators", (table.concat(v4, ", "))) else "Loading...",
        },
    } else if not a1.communityMap then {{Icon = "rbxassetid://91688211474848", Text = "Beat this map on any gamemode to unlock!"}} else {
        {
            Icon = "rbxassetid://91688211474848",
            Text = "You need the Admin mode gamepass to unlock this map!",
        },
    }
    v6.Tooltip = createElement(Tooltip, v7)
    v6.icon = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Image = ("rbxassetid://%*"):format(u3.ImageID),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.96, 0.96),
        imageLoading = v1,
    }, {uICorner = createElement("UICorner")})
    v6.Locked = createElement("Frame", {
        ZIndex = 999,
        BackgroundTransparency = 0.4,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = a1.locked,
    }, {
        uICorner = createElement("UICorner"),
        image = createElement("ImageLabel", {
            Image = "rbxassetid://1197061307",
            BackgroundTransparency = 1,
            ZIndex = 999,
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.55, 0.55),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }),
    })
    return createElement(BattlepassPreview, v5, v6)
end