-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Challenges.ChallengesContent
-- Decompile time: 4.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChallengesEntry = require(script.Parent.ChallengesEntry)
require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local Paywall = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Paywall)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useChallenges = require(ReplicatedStorage.Client.Interfaces.Hooks.useChallenges)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local createElement = React.createElement
return function() -- Line: 16
    -- upvalues: useCharmBinding (val), SandboxStore (val), useHasSandboxGamepass (val), useChallenges (val)
    -- upvalues: React (val), createElement (val), ChallengesEntry (val), Paywall (val)
    local v1 = useCharmBinding(SandboxStore.getState):map(function(a1) -- Line: 19
        return a1.SelectedTab == "Challenges"
    end)
    local v2 = useHasSandboxGamepass()
    local u11 = useChallenges()
    local v3 = {u11}
    local v4 = React.useMemo(function() -- Line: 26 -- upvalues: u11 (val), createElement (upval), ChallengesEntry (upval)
        local title, v1, v2
        local v3 = {}
        local v4 = nil
        local v5 = nil
        for i, j in u11, v4, v5 do
            v1 = createElement
            v2 = {enabled = true, idx = 1}
            title = j.title or j.name
            v2.name = title
            v2.id = i
            v3[i] = (v1(ChallengesEntry, v2))
        end
        return v3
    end, v3)
    if not v2 then
        return createElement(Paywall)
    end
    return createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        TopImage = "",
        BottomImage = "",
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
    }, {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 0),
        }),
        grid = createElement("UIGridLayout", {
            CellSize = UDim2.fromOffset(138, 138),
            CellPadding = UDim2.fromOffset(15, 15),
            SortOrder = Enum.SortOrder.Name,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }, {ratio = createElement("UIAspectRatioConstraint")}),
        content = createElement(React.Fragment, {}, v4),
    })
end