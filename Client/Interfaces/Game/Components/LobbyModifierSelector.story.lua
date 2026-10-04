-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector.story
-- Decompile time: 2.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LobbyModifierSelector = require(script.Parent.LobbyModifierSelector)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 9 -- upvalues: React (val), Tooltip (val), LobbyModifierSelector (val)
    local v1, u4 = React.useState(false)
    local allmods = React.useState("allmods")
    React.useEffect(function() -- Line: 13 -- upvalues: u4 (val)
        local u3 = task.delay(0.1, function() -- Line: 14 -- upvalues: u4 (upval)
            u4(true)
        end)
        return function() -- Line: 18 -- upvalues: u3 (val)
            task.cancel(u3)
        end
    end, {})
    local u18, u19 = React.useState({})
    local v2, u24 = React.useState(nil)
    local v3 = {
        {
            icon = 16899461518,
            name = "Double Cash",
            description = "Earn double cash from each game.",
            rewardMultiplier = 2,
            disabled = false,
            selected = u18["Double Cash"] or false,
            onSelect = function() -- Line: 34 -- upvalues: u19 (val)
                u19(function(a1) -- Line: 35
                    local v1 = table.clone(a1)
                    if v1["Double Cash"] then
                        v1["Double Cash"] = nil
                        return v1
                    end
                    v1["Double Cash"] = true
                    return v1
                end)
            end,
            toolTip = function(a1) -- Line: 45 -- upvalues: u24 (val)
                u24(a1)
            end,
        },
        {
            icon = 17329762727,
            name = "Something Cool I guess",
            description = "yes",
            rewardMultiplier = 2,
            disabled = true,
            selected = u18["Something Cool I guess"] or false,
            onSelect = function() -- Line: 56 -- upvalues: u19 (val)
                u19(function(a1) -- Line: 57
                    local v1 = table.clone(a1)
                    if v1["Something Cool I guess"] then
                        v1["Something Cool I guess"] = nil
                        return v1
                    end
                    v1["Something Cool I guess"] = true
                    return v1
                end)
            end,
            toolTip = function(a1) -- Line: 67 -- upvalues: u24 (val)
                u24(a1)
            end,
        },
        {
            icon = 17847640366,
            name = "agagaga Cool I guess",
            description = "yes",
            rewardMultiplier = 2,
            disabled = false,
            selected = u18["agagaga Cool I guess"] or false,
            onSelect = function() -- Line: 78 -- upvalues: u19 (val)
                u19(function(a1) -- Line: 79
                    local v1 = table.clone(a1)
                    if v1["agagaga Cool I guess"] then
                        v1["agagaga Cool I guess"] = nil
                        return v1
                    end
                    v1["agagaga Cool I guess"] = true
                    return v1
                end)
            end,
            toolTip = function(a1) -- Line: 89 -- upvalues: u24 (val)
                u24(a1)
            end,
        },
    }
    local v4 = 0
    for i, j in v3 do
        if u18[j.name] then
            v4 = v4 + j.rewardMultiplier
        end
    end
    local createElement = React.createElement
    local Fragment = React.Fragment
    local v5 = {}
    local v6 = v2
    if v6 then
        local createElement_2 = React.createElement
        local v7 = {Name = "MedicTowerSelectionTooltip", Header = v2 and v2.name or ""}
        v7.Subject = ("reward: +%*x"):format(v2 and v2.rewardMultiplier or 0)
        v6 = createElement_2(Tooltip, v7)
    end
    v5.ToolTip = v6
    v5.Modifiers = React.createElement(LobbyModifierSelector, {
        visible = v1,
        selected = allmods,
        onClose = function() -- Line: 112 -- upvalues: u4 (val)
            u4(false)
        end,
        modifiers = v3,
        selectedModifiers = u18,
        totalRewards = v4,
        toolTip = function(a1) -- Line: 118 -- upvalues: u24 (val)
            u24(a1)
        end,
        onApply = function() -- Line: 121 -- upvalues: u18 (val)
            print("APPLY MODIFIERS", u18)
        end,
    })
    return createElement(Fragment, nil, v5)
end

return function(a1) -- Line: 128 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 133 -- upvalues: u4 (val)
        u4:unmount()
    end
end