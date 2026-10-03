-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.CloneSelectTower
-- Decompile time: 9.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CircularRangeRing = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.CircularRangeRing)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local HackerTowerBilboard = require(ReplicatedStorage.Client.Interfaces.Game.Components.HackerTowerBilboard)
local React = require(ReplicatedStorage.Shared.UI.React)
local SelectClonedTower = require(ReplicatedStorage.Client.Interfaces.Game.Components.SelectClonedTower)
local TowerDisplayName = require(ReplicatedStorage.Shared.Modules.TowerDisplayName)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useAtomBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomBinding)
local useDeviceType = require(ReplicatedStorage.Client.Interfaces.Hooks.useDeviceType)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
local useOwnedTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useOwnedTowers)
local usePlayerCash = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerCash)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local joinBindings = React.joinBindings
local u97 = {}
u97.Cancel = {
    ActionText = "Cancel",
    Layout = 2,
    ScaleMultiplier = 0.4,
    useBackground = false,
    Key = Enum.KeyCode.Q,
}
local u101 = {}
u101.Cancel = {
    ActionText = "Cancel",
    Layout = 2,
    ScaleMultiplier = 0.4,
    useBackground = false,
    Key = Enum.KeyCode.ButtonB,
}

local function render() -- Line: 45
    -- upvalues: useMouse (val), useDeviceType (val), useAtom (val), ClientAtoms (val), useOwnedTowers (val)
    -- upvalues: usePlayerCash (val), useGameRule (val), useAtomBinding (val), React (val), useReactBindings (val)
    -- upvalues: u97 (val), u101 (val), joinBindings (val), Enum (val), TowerDisplayName (val), createElement (val)
    -- upvalues: HackerTowerBilboard (val), CircularRangeRing (val), SelectClonedTower (val)
    local v1, v2, v3, v4, v5, v6
    local v7, v8 = useMouse()
    local v9 = useDeviceType()
    local v10 = useAtom(ClientAtoms.cloneTowerAtom)
    local v11 = useOwnedTowers({all = not (v10.ownedTowersOnly == true)})
    local v12 = usePlayerCash()
    local InfiniteCash = useGameRule("InfiniteCash")
    local u478 = useAtomBinding(ClientAtoms.cloneTowerRangeRing)
    local v13, u30 = React.useState(false)
    local u516 = React.useRef(nil)
    React.useEffect(function() -- Line: 58 -- upvalues: u516 (val)
        local Part = Instance.new("Part")
        Part.Name = "RangeRingPart"
        Part.Size = Vector3.new(1, 1, 1)
        Part.Transparency = 1
        Part.CanCollide = false
        Part.CanQuery = false
        Part.Anchored = true
        Part.Parent = workspace.Trash
        u516.current = Part
    end, {})
    local v14 = {u478}
    local v15 = {u516}
    useReactBindings(function(a1) -- Line: 71 -- upvalues: u478 (val), u30 (val), u516 (val)
        if a1.enabled ~= u478.enabled then
            u30(a1.enabled)
        end
        if u516.current then
            u516.current.Position = a1.position
        end
    end, v14, v15)
    local v16 = not (v9 ~= "PC") and u97 or u101
    local v17 = joinBindings({v7, v8}):map(function(a1) -- Line: 83
        return UDim2.fromOffset(a1[1] + 4, a1[2] - 4)
    end)
    v14 = {}
    v15 = {}
    local v18 = v10.allowHolograms == true
    local dontSelectList = v10.dontSelectList
    local v19 = {}
    if type(dontSelectList) == "table" then
        local v20 = nil
        v1 = nil
        for i, j in dontSelectList, v20, v1 do
            if type(i) ~= "number" then
                if type(i) == "string" and j == true then
                    v19[i] = true
                end
            elseif type(j) == "string" then
                v19[j] = true
            elseif type(i) == "string" and j == true then
                v19[i] = true
            end
        end
    end
    local selected_2 = if type(v10.selected) ~= "table" then nil else v10.selected
    v1 = nil
    local v21 = nil
    for k, n in v11, v1, v21 do
        if k and k.Parent then
            if not v10.dontSelectModel then
                if n.State.Name ~= v10.dontSelect and not v19[n.State.Name] then
                    if not n.StatusEffectRenderer
                        or not n.StatusEffectRenderer:has(Enum.StatusEffect.Hologram)
                        or v18 then
                        v2 = selected_2 and k == selected_2.Model
                        v3 = n.State.TotalSpent * (v10.costPercent or 100) / 100 <= v12
                        if InfiniteCash then
                            v3 = true
                        end
                        v4 = TowerDisplayName.resolve(n.State.Name, n, k)
                        if v3 then
                            v15[k] = (createElement(HackerTowerBilboard, {Model = k, DisplayName = v4}))
                        end
                        v5 = {DepthMode = Enum.HighlightDepthMode.Occluded}
                        v6 = if not v3 then Color3.fromRGB(227, 22, 22) else v2 and Color3.fromRGB(219, 219, 219) or Color3.fromRGB(37, 153, 255) or Color3.fromRGB(227, 22, 22)
                        v5.FillColor = v6
                        v6 = if not v3 then Color3.fromRGB(255, 87, 87) else v2 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(107, 228, 255) or Color3.fromRGB(255, 87, 87)
                        v5.OutlineColor = v6
                        v5.Adornee = k
                        v14[k] = (createElement("Highlight", v5))
                    end
                end
            elseif k ~= v10.dontSelectModel and n.State.Name ~= v10.dontSelect and not v19[n.State.Name] then
                if not n.StatusEffectRenderer
                    or not n.StatusEffectRenderer:has(Enum.StatusEffect.Hologram)
                    or v18 then
                    v2 = selected_2 and k == selected_2.Model
                    v3 = n.State.TotalSpent * (v10.costPercent or 100) / 100 <= v12
                    if InfiniteCash then
                        v3 = true
                    end
                    v4 = TowerDisplayName.resolve(n.State.Name, n, k)
                    if v3 then
                        v15[k] = (createElement(HackerTowerBilboard, {Model = k, DisplayName = v4}))
                    end
                    v5 = {DepthMode = Enum.HighlightDepthMode.Occluded}
                    v6 = if not v3 then Color3.fromRGB(227, 22, 22) else v2 and Color3.fromRGB(219, 219, 219) or Color3.fromRGB(37, 153, 255) or Color3.fromRGB(227, 22, 22)
                    v5.FillColor = v6
                    v6 = if not v3 then Color3.fromRGB(255, 87, 87) else v2 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(107, 228, 255) or Color3.fromRGB(255, 87, 87)
                    v5.OutlineColor = v6
                    v5.Adornee = k
                    v14[k] = (createElement("Highlight", v5))
                end
            end
        end
    end
    local Fragment = React.Fragment
    local v22 = {
        rangeRing = v13 and createElement(CircularRangeRing, {
            alwaysOnTop = true,
            towerCircle = true,
            target = u516.current,
            radius = u478:map(function(a1) -- Line: 170
                return a1.range
            end),
            color = u478:map(function(a1) -- Line: 173
                return a1.color
            end),
            towerCircleRange = u478:map(function(a1) -- Line: 178
                return a1.towerBoundary
            end),
        }),
    }
    local enabled = v10.enabled
    if enabled then
        local Fragment_2 = React.Fragment
        v4 = {towers = createElement(React.Fragment, nil, v15)}
        v5 = {Position = v17}
        v5.TowerName = selected_2 and TowerDisplayName.resolve(selected_2.Name, selected_2, selected_2.Model)
        v5.Binds = v16
        v5.Cost = if not (0 < (v10.costPercent or 0)) then nil else if not selected_2 then nil else selected_2.TotalSpent
        v5.Percent = v10.costPercent
        v4.window = createElement(SelectClonedTower, v5)
        v4.highLightedTowers = createElement(React.Fragment, nil, v14)
        enabled = createElement(Fragment_2, nil, v4)
    end
    v22[1] = enabled
    return createElement(Fragment, nil, v22)
end

return function(a1) -- Line: 203 -- upvalues: createElement (val), render (val)
    return createElement(render, {})
end