-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Admins.AdminsEntry
-- Decompile time: 3.70 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useAttribute = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttribute)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useRightClickMenu = require(ReplicatedStorage.Client.Interfaces.Hooks.useRightClickMenu)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useUserInfo = require(ReplicatedStorage.Client.Interfaces.Hooks.useUserInfo)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")
return function(a1) -- Line: 29
    -- upvalues: useGameStateValue (val), useUserInfo (val), React (val), Players (val), useAttribute (val)
    -- upvalues: useSound (val), useRightClickMenu (val), Sandbox (val), createElement (val), BattlepassPreview (val)
    -- upvalues: Tooltip (val), ImageLabel (val)
    local u4 = useGameStateValue("SandboxAdmins", {})
    local v1 = useUserInfo(a1.id)
    local v2 = u4[tostring(a1.id)]
    local v3 = React.useRef(nil)
    local v4 = React.useRef(Players.LocalPlayer)
    local v5 = useAttribute(v4, "IsPartyHost")
    local Click = useSound("Click")
    useRightClickMenu(v3, {
        Kick = function() -- Line: 42 -- upvalues: Sandbox (upval), a1 (val)
            Sandbox:fireServer("Kick", a1.id)
        end,
        Blacklist = function() -- Line: 45 -- upvalues: Sandbox (upval), a1 (val)
            Sandbox:fireServer("Blacklist", a1.id)
        end,
    }, v5 and a1.id ~= v4.current.UserId, {a1.id})
    local v6 = {innerSize = UDim2.fromScale(1, 1)}
    local v7 = v2 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v6.color = v7
    v6.reference = v3

    function v6.clicked() -- Line: 54 -- upvalues: Click (val), Sandbox (upval), a1 (val), u4 (val)
        Click()
        Sandbox:fireServer("SetAdmin", a1.id, not u4[(tostring(a1.id))])
    end

    v7 = {}
    local v8 = {Name = v1.DisplayName, Header = v1.DisplayName, Disabled = not a1.enabled}
    v8.Content = {
        {Text = "Admin: " .. (if not u4[tostring(a1.id)] then "No" else "Yes")},
        {
            Text = "Able to modify: " .. (if a1.owned then "Yes" else if u4[tostring(a1.id)] then "No" else "Yes"),
        },
    }
    v7.Tooltip = createElement(Tooltip, v8)
    v7.icon = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        ZIndex = 2,
        ImageTransparency = 0,
        Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(a1.id),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.96, 0.96),
    }, {uICorner = createElement("UICorner")})
    return createElement(BattlepassPreview, v6, v7)
end