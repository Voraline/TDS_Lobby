-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Gamemodes.GamemodesContent
-- Decompile time: 6.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Collapsible = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local GamemodesEntry = require(script.Parent.GamemodesEntry)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useGamemodes = require(ReplicatedStorage.Client.Interfaces.Hooks.useGamemodes)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useSandboxUnlock = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxUnlock)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local createElement = React.createElement
return function() -- Line: 18
    -- upvalues: useCharmBinding (val), SandboxStore (val), useSandboxUnlock (val), useHasSandboxGamepass (val)
    -- upvalues: useSandboxWhitelist (val), useGamemodes (val), React (val), RunService (val), createElement (val)
    -- upvalues: GamemodesEntry (val), Collapsible (val)
    local v1 = useCharmBinding(SandboxStore.getState):map(function(a1) -- Line: 21
        return a1.SelectedTab == "Gamemodes"
    end)
    local Gamemodes = useSandboxUnlock("Gamemodes")
    local u12 = useHasSandboxGamepass()
    local Gamemodes_2 = useSandboxWhitelist("Gamemodes")
    local u17 = useGamemodes()
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
        content = createElement(React.Fragment, {}, (React.useMemo(function() -- Line: 30
            -- upvalues: u17 (val), Gamemodes_2 (val), RunService (upval), createElement (upval), GamemodesEntry (upval)
            -- upvalues: u12 (val), Gamemodes (val), Collapsible (upval)
            local v1, v2, v3, v4, v5, v6
            local v7 = {}
            local v8 = nil
            local v9 = nil
            for i, j in u17, v8, v9 do
                v4 = {}
                v5 = false
                v6 = nil
                v1 = nil
                for k, n in j, v6, v1 do
                    if Gamemodes_2[("%*/%*"):format(n.gamemode, n.id)] or RunService:IsStudio() then
                        v5 = true
                        v2 = createElement
                        v3 = {
                            enabled = true,
                            idx = 1,
                            gamemode = n.gamemode,
                            name = n.displayName,
                            id = n.id,
                            locked = if not u12 then not Gamemodes[("%*/%*"):format(n.gamemode, n.id)] else false,
                        }
                        v4[n] = (v2(GamemodesEntry, v3))
                    end
                end
                if v5 then
                    v4.grid = createElement("UIGridLayout", {
                        CellSize = UDim2.fromOffset(138, 138),
                        CellPadding = UDim2.fromOffset(0, 0),
                        SortOrder = Enum.SortOrder.Name,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                    }, {ratio = createElement("UIAspectRatioConstraint")})
                    v7[i] = (createElement(Collapsible, {name = i, content = v4}))
                end
            end
            return v7
        end, {u17, Gamemodes_2, Gamemodes, u12}))),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
        }),
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.Name,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            FillDirection = Enum.FillDirection.Vertical,
        }),
    })
end