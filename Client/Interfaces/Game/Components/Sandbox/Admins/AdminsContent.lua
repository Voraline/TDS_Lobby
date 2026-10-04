-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Admins.AdminsContent
-- Decompile time: 3.58 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AdminsEntry = require(script.Parent.AdminsEntry)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePlayers = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayers)
local createElement = React.createElement
local LocalPlayer = Players.LocalPlayer
return function() -- Line: 16
    -- upvalues: useCharmBinding (val), SandboxStore (val), usePlayers (val), useGameStateValue (val), React (val)
    -- upvalues: LocalPlayer (val), createElement (val), AdminsEntry (val)
    local v1 = useCharmBinding(SandboxStore.getState):map(function(a1) -- Line: 19
        return a1.SelectedTab == "Admins"
    end)
    local u9 = usePlayers()
    local u13 = useGameStateValue("OwnedAdmins", {})
    local u17 = useGameStateValue("SandboxAdmins", {})
    return createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
    }, {
        content = React.createElement(React.Fragment, {}, (React.useMemo(function() -- Line: 27
            -- upvalues: u13 (val), LocalPlayer (upval), u9 (val), createElement (upval), AdminsEntry (upval), u17 (val)
            local UserId
            local v1 = {}
            local v2 = u13[tostring(LocalPlayer.UserId)] or {}
            for i, j in u9 do
                UserId = j.UserId
                v1[UserId] = (createElement(AdminsEntry, {
                    enabled = true,
                    idx = 1,
                    id = UserId,
                    owned = v2[tostring(UserId)] or false,
                    selected = u17[tostring(UserId)] or false,
                }))
            end
            return v1
        end, {u9, u13, u17}))),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        }),
        grid = createElement("UIGridLayout", {
            CellSize = UDim2.fromOffset(138, 138),
            CellPadding = UDim2.fromOffset(15, 15),
            SortOrder = Enum.SortOrder.Name,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }, {ratio = createElement("UIAspectRatioConstraint")}),
    })
end