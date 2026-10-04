-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Modifiers
-- Decompile time: 19.34 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowIconButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowIconButton)
local IntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.IntermissionStore)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useGlobalModifiers = require(ReplicatedStorage.Client.Interfaces.Hooks.useGlobalModifiers)
local useIsTutorialMatch = require(ReplicatedStorage.Client.Interfaces.Hooks.useIsTutorialMatch)
local useModifierVoteLocked = require(ReplicatedStorage.Client.Interfaces.Hooks.useModifierVoteLocked)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local Modifier = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Modifier).Modifier
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local LocalPlayer = Players.LocalPlayer
local createElement = React.createElement
local useMemo = React.useMemo
local u122 = {}
u122[Enum.SkillTreeCategory.Defense] = {name = "Defense", layoutOrder = -1, icon = Icons.DefenseSkill}
u122[Enum.SkillTreeCategory.Offense] = {name = "Offense", layoutOrder = -2, icon = Icons.OffenseSkill}
u122[Enum.SkillTreeCategory.Economy] = {name = "Economy", layoutOrder = -3, icon = Icons.EconomySkill}
u122[Enum.SkillTreeCategory.Strategy] = {name = "Strategy", layoutOrder = -4, icon = Icons.StrategySkill}
local u139 = {LegacyVIP = true, VIPPlus = true}

local function getGroupedSkills(a1) -- Line: 57 -- upvalues: LocalPlayer (val), Enum (val), Skills (val)
    local v1, v2, v3
    local v4 = a1[tostring(LocalPlayer.UserId)] or a1[LocalPlayer.UserId] or {}
    local v5 = {}
    local v6 = nil
    local v7 = nil
    for i, j in Enum.SkillTreeCategory, v6, v7 do
        v3 = {}
        for k, n in Skills.nodes do
            if n.category == j then
                v1 = Enum.SkillTreeNode.ToString(k)
                v2 = v4[v1] or 0
                if not (v2 <= 0) then
                    v3[v1] = v2
                end
            end
        end
        if next(v3) then
            v5[j] = v3
        end
    end
    return v5
end

local function modifyForVIPPlus(a1) -- Line: 89 -- types: a1: table
    local v1 = false
    local v2 = false
    for k in pairs(a1) do
        if k == "LegacyVIP" then
            v2 = true
        end
        if k == "VIPPlus" then
            v1 = true
        end
    end
    if v1 and v2 then
        a1.LegacyVIP = nil
    end
end

return function(a1) -- Line: 108
    -- upvalues: useGameStateValue (val), useIsTutorialMatch (val), LocalPlayer (val), useGlobalModifiers (val)
    -- upvalues: useGameRule (val), useCharmSelector (val), IntermissionStore (val), useViewEnabled (val)
    -- upvalues: useModifierVoteLocked (val), useScale (val), modifyForVIPPlus (val), useMemo (val), table (val)
    -- upvalues: u139 (val), createElement (val), Modifier (val), getGroupedSkills (val), u122 (val), Skills (val)
    -- upvalues: Enum (val), React (val), GlowIconButton (val), ViewController (val), Tooltip (val)
    local GameMode = useGameStateValue("GameMode")
    local v1 = useIsTutorialMatch()
    local u9 = useGameStateValue("GlobalModifiersEnabled", {})
    local u13 = useGameStateValue("ClientModifiers", {})
    local u17 = useGameStateValue("ShrineModifiers", {})
    local u21 = useGameStateValue("Skills", {})
    local v2 = u21[tostring(LocalPlayer.UserId)] or u21[LocalPlayer.UserId] or {}
    local u33 = useGlobalModifiers(true)
    local u37 = useGameRule("SkillsEnabled", false)
    local u41 = useGameRule("Skills", {})
    local v3 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 125
        return a1.visible
    end)
    local GameModifiers = useViewEnabled("GameModifiers")
    local CanVoteForModifiers = useGameStateValue("CanVoteForModifiers")
    local v4 = useModifierVoteLocked()
    local v5 = CanVoteForModifiers and v4 ~= true
    local u61 = GameMode == "Sandbox"
    local u64 = GameMode == "Special"
    local v6 = UDim2.new(0.2, 0, 0, (math.min((useScale(1.8, UDim2.fromOffset(60, 60))).Y.Offset, 60)))
    modifyForVIPPlus(u13)
    local v7 = {u9, u13, u17, u33, v2, u61}
    local v8 = useMemo(function() -- Line: 142
        -- upvalues: table (upval), u9 (val), u13 (val), u139 (upval), u61 (val), u33 (val), u64 (val)
        -- upvalues: createElement (upval), Modifier (upval), u17 (val), getGroupedSkills (upval), u21 (val), u37 (val)
        -- upvalues: u122 (upval), u41 (val), Skills (upval), Enum (upval)
        local description, displayName, displayName_2, flavorText_2, icon, layoutOrder, name, rewardMultiplier, subject, tooltipContent, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        local v12 = {}
        local v13 = table.merge(u9, u13)
        local v14 = nil
        local v15 = nil
        for i, j in v13, v14, v15 do
            if j then
                if not u139[i] or not u61 then
                    v9 = u33[i]
                    if v9 and v9.icon then
                        rewardMultiplier = v9.rewardMultiplier
                        if typeof(rewardMultiplier) == "function" then
                            rewardMultiplier = rewardMultiplier()
                        end
                        if rewardMultiplier == 0 or u64 then
                            rewardMultiplier = nil
                        end
                        flavorText_2 = nil
                        if v9.flavorText then
                            flavorText_2 = if typeof(v9.flavorText) ~= "function" then v9.flavorText else v9.flavorText()
                        end
                        displayName_2 = v9.displayName
                        v2 = createElement
                        v4 = {
                            BackgroundTransparency = 1,
                            Scale = 1.2,
                            key = v9.displayName,
                            Name = v9.displayName,
                            Type = v9.displayName,
                            Icon = v9.icon,
                            Title = v9.displayName,
                            Description = v9.description,
                            AdditionalText = if u61 then nil else if flavorText_2 then flavorText_2 else if not rewardMultiplier then nil else ("x%*"):format(1 + rewardMultiplier),
                        }
                        v12[displayName_2] = (v2(Modifier, v4))
                    end
                end
            end
        end
        v14 = nil
        v15 = nil
        for k, n in u17, v14, v15 do
            if typeof(n) == "table" then
                icon = n.icon or n.Icon
                displayName = n.displayName or n.DisplayName or k
                if icon and typeof(displayName) == "string" and displayName ~= "" then
                    v11 = createElement
                    v2 = {
                        BackgroundTransparency = 1,
                        Scale = 1.2,
                        key = k,
                        Name = k,
                        Type = displayName,
                        Icon = icon,
                        Title = displayName,
                    }
                    subject = n.subject or n.Subject
                    v2.Subject = subject
                    description = n.description or n.Description
                    v2.Description = description
                    tooltipContent = n.tooltipContent or n.TooltipContent
                    v2.TooltipContent = tooltipContent
                    layoutOrder = n.layoutOrder or n.LayoutOrder
                    v2.LayoutOrder = layoutOrder
                    v12[k] = (v11(Modifier, v2))
                end
            end
        end
        for m, i5 in getGroupedSkills(u21) do
            if u37 then
                v9 = u122[m]
                if v9 then
                    v10 = {}
                    for i6, i7 in i5 do
                        if u41[i6] then
                            v5 = Skills.nodes[Enum.SkillTreeNode[i6]]
                            if v5 then
                                v6 = v5.valuePerLevel(i7)
                                v7 = v5.displayName or i6
                                v8 = v5.displayText(v6)
                                table.insert(v10, {Text = ("%*: %*"):format(v7, v8)})
                            end
                        end
                    end
                    name = v9.name
                    v1 = createElement
                    v3 = {
                        Description = "",
                        BackgroundTransparency = 1,
                        Scale = 1.2,
                        key = v9.name,
                        Name = v9.name,
                        Type = v9.name,
                        Icon = if not v9.icon then 0 else v9.icon:match("(%d+)$"),
                        Title = v9.name,
                        Subject = ("Active %* Skills"):format(v9.name),
                        TooltipContent = v10,
                        LayoutOrder = v9.layoutOrder,
                    }
                    v12[name] = (v1(Modifier, v3))
                end
            end
        end
        return v12
    end, v7)
    if v1 then
        return nil
    end
    if v3 and GameModifiers then
        return nil
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 10, 1, -10),
        Size = v6,
    }, {
        uIListLayout = createElement("UIListLayout", {
            Wraps = true,
            Padding = UDim.new(0, -5),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
        }),
        content = if v5 then nil else React.createElement(React.Fragment, {}, v8),
        intermission = if not v5 then nil else React.createElement(React.Fragment, nil, {
            addModifier = createElement(GlowIconButton, {
                icon = 133222778627608,
                Size = UDim2.fromOffset(100, 100),
                color = Color3.fromRGB(0, 0, 0),
                iconSize = UDim2.fromScale(0.5, 0.5),
                clicked = function() -- Line: 310 -- upvalues: ViewController (upval)
                    ViewController:setView("GameModifiers")
                end,
            }, {
                tooltip = createElement(Tooltip, {
                    key = "AddModifierTooltip",
                    Name = "AddModifier",
                    Header = "Add Modifier",
                    Subject = "Vote for a modifier",
                }),
            }),
        }),
    })
end