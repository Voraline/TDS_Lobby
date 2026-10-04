-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Winter2024Event
-- Decompile time: 1.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EventSplashScreen = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen)
local React = require(ReplicatedStorage.Shared.UI.React)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local useBadges = require(Hooks.useBadges)
local useFFlag = require(Hooks.useFFlag)
local useScale = require(Hooks.useScale)
local createElement = React.createElement
local useState = React.useState
return function() -- Line: 21
    -- upvalues: useFFlag (val), useBadges (val), useState (val), useScale (val), createElement (val)
    -- upvalues: EventSplashScreen (val)
    local v1 = useFFlag("roblox.event", false)
    local v2 = useBadges({1529540131801708, 2706884651328732})
    local v3, u12 = useState(true)
    local v4 = useScale(1.25)
    if not v1 then
        return nil
    end
    if v2[1529540131801708] and v2[2706884651328732] then
        return nil
    end
    return createElement(EventSplashScreen, {
        Title = "Frost Invasion",
        Size = UDim2.fromOffset(900, 550),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Objectives = {
            {
                Icon = "rbxassetid://110281184700921",
                Text = "<font size=\"9\">Frost Spirit has returned to TDS!</font><font size=\"2\"><br /><br /></font><font size=\"7\" weight=\"800\">Complete the Frost Invasion event mission on Easy difficulty.</font><font size=\"3\"><br /></font>",
            },
            {
                Icon = "rbxassetid://131996663705871",
                Text = "<font size=\"11\">Challenge Frost Spirit in his true form.</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Find the shards, enter the code, and hold your ground against a vengeful spirit.</font><font size=\"3\"><br /></font>",
            },
        },
        Visible = v3,
        Scale = v4,
        OnStartClicked = function() -- Line: 53 -- upvalues: u12 (val)
            u12(false)
        end,
    })
end