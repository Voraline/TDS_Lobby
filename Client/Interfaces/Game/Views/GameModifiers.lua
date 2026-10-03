-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.GameModifiers
-- Decompile time: 3.53 ms

local result, success
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local LobbyModifierSelector = require(ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useModifierVote = require(ReplicatedStorage.Client.Interfaces.Hooks.useModifierVote)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useMemo = React.useMemo
local u56 = {}
for i, j in Content("GlobalModifiers"):GetChildren() do
    if j:IsA("ModuleScript") then
        success, result = pcall(require, j)
        if success and result and result.canToggle then
            u56[j.Name] = result
        end
    end
end

local function render() -- Line: 30
    -- upvalues: useViewEnabled (val), useCache (val), useState (val), useModifierVote (val), useMemo (val), u56 (val)
    -- upvalues: table (val), useEffect (val), React (val), Tooltip (val), LobbyModifierSelector (val)
    local u18, u19
    local GameModifiers_2, GameModifiers = useViewEnabled("GameModifiers")
    local u7 = useCache("Inventory.Modifiers", {})
    local u10, u11 = useState({})
    local v1, u15 = useState(nil)
    _, u18, u19 = useModifierVote()
    local v2 = {u10, u7}
    local v3 = useMemo(function() -- Line: 39 -- upvalues: u7 (val), u56 (upval), u10 (val), table (upval), u15 (val), u11 (val)
        local v1, v2
        local v3 = {}
        local v4 = 1
        local v5 = {}
        for i, j in u7 do
            v5[j] = true
        end
        local v6 = nil
        local v7 = nil
        for k, n in u56, v6, v7 do
            v1 = u10[k] or false
            v2 = n.rewardMultiplier or 0
            if v5[k] ~= true then
                u43 = true
            else
                local u43 = false
            end
            if typeof(v2) == "function" then
                v2 = v2()
            end
            if v1 then
                v4 = v4 + v2
            end
            table.insert(v3, {
                icon = n.icon or 0,
                name = k,
                displayName = n.displayName or k,
                rewardMultiplier = v2,
                description = n.description or "",
                selected = v1,
                disabled = u43,
                toolTip = u15,
                onSelect = function() -- Line: 71 -- upvalues: u43 (val), u11 (upval), table (upval), k (val)
                    if u43 then
                        return
                    end
                    u11(function(a1) -- Line: 76 -- upvalues: table (upval), k (upval)
                        local v1 = table.clone(a1)
                        if v1[k] then
                            v1[k] = nil
                            return v1
                        end
                        v1[k] = true
                        return v1
                    end)
                end,
            })
        end
        table.sort(v3, function(a1, a2) -- Line: 89
            return a1.name < a2.name
        end)
        return {modifiers = v3, multiplier = math.round(v4 * 10000) / 10000}
    end, v2)
    local v4 = {GameModifiers_2}
    useEffect(function() -- Line: 99 -- upvalues: u11 (val), u18 (val)
        u11(u18)
    end, v4)
    local createElement = React.createElement
    local Fragment = React.Fragment
    local v5 = {}
    local v6 = v1
    if v6 then
        local createElement_2 = React.createElement
        local v7 = {Name = "GameModifiersTooltip"}
        local displayName = v1 and v1.displayName or v1.name or ""
        v7.Header = displayName
        v7.Subject = ("reward: +%*x"):format(v1 and v1.rewardMultiplier or 0)
        v6 = createElement_2(Tooltip, v7)
    end
    v5.ToolTip = v6
    v5.Modifiers = React.createElement(LobbyModifierSelector, {
        visible = GameModifiers_2,
        onClose = function() -- Line: 112 -- upvalues: GameModifiers (val)
            GameModifiers("Hotbar")
        end,
        modifiers = v3.modifiers,
        totalRewards = v3.multiplier,
        selectedModifiers = u10,
        onApply = function() -- Line: 118 -- upvalues: u19 (val), u10 (val), GameModifiers (val)
            task.spawn(u19, u10)
            GameModifiers("Hotbar")
        end,
    })
    return createElement(Fragment, nil, v5)
end

return function(a1) -- Line: 126 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(9999)
    return createElement(render)
end