-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.OwnedTowers
-- Decompile time: 10.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Game.Components
local ModelSelection = require(Components.ModelSelection)
local OwnedTower = require(Components.OwnedTower)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local TooltipStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.TooltipStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useInGameTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useInGameTowers)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local u110 = {}
local UserId = Players.LocalPlayer.UserId
local u113 = {}
u113.Tower = Color3.new(1, 1, 1)
u113.Enemy = Color3.new(1, 0, 0)

function u110.Selections() -- Line: 36
    -- upvalues: useCharmSelector (val), TooltipStore (val), u113 (val), UpgradesStore (val), CrosshairStore (val)
    -- upvalues: useTagReplicatorInstance (val), React (val), table (val), NPCReplicator (val), createElement (val)
    -- upvalues: ModelSelection (val)
    local v1 = useCharmSelector(TooltipStore.getState, function(a1) -- Line: 37 -- upvalues: u113 (upval)
        if a1.tooltipType == "Health" then
            if a1.tooltipValue.IsEnemy then
                return u113.Enemy
            end
            return u113.Tower
        end
        if a1.tooltipType == "Tower" then
            return u113.Tower
        end
    end)
    local v2 = useCharmSelector(TooltipStore.getState, function(a1) -- Line: 49
        local tooltipType = a1.tooltipType
        if tooltipType ~= "Tower" and tooltipType ~= "Health" then
            return
        end
        return a1.tooltipValue.Model
    end)
    local u14 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 56
        return a1.enabled
    end)
    local u19 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 60
        return a1.model
    end)
    local v3 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 64
        return a1.valid
    end)
    local v4 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 68
        return a1.targetModel
    end)
    local v5 = useCharmSelector(CrosshairStore.getState, function(a1) -- Line: 71
        return a1.enabled
    end)
    local u39 = useTagReplicatorInstance(u19, "TowerReplicator", "Tower")
    local v6, u44 = React.useState({})
    local v7 = true
    if v2 ~= u19 then
        v7 = v2 == v4
    end
    if v7 then
        v2 = nil
    end
    local v8 = {u39, u19, u14, v4, v2}
    React.useEffect(function() -- Line: 84 -- upvalues: u39 (val), u19 (val), u14 (val), u44 (val)
        local u0 = nil
        if not u39 or not u19 or not u14 then
            u44({})
        else
            u0 = (u39:GetStateChangedSignal("MultipleTargets")):Connect(function(a1) -- Line: 89 -- upvalues: u44 (upval)
                u44(a1)
            end)
            u44(u39:Get("MultipleTargets") or {})
        end
        return function() -- Line: 97 -- upvalues: u0 (ref)
            if u0 then
                u0:Disconnect()
            end
        end
    end, v8)
    if #v6 > 0 then
        v6 = table.map(v6, function(a1) -- Line: 105
            -- upvalues: NPCReplicator (upval), createElement (upval), ModelSelection (upval), u113 (upval)
            local v1 = NPCReplicator.GetNPCFromFolder(a1)
            if not v1 then
                return nil
            end
            return (createElement(ModelSelection, {
                Name = "Target",
                Visible = true,
                ShowFill = true,
                Animate = false,
                Target = v1.Model,
                Color = u113.Enemy,
            }))
        end)
    end
    if v5 then
        return nil
    end
    local createElement_2 = React.createElement
    local Fragment = React.Fragment
    local v9 = {allTargets = React.createElement(React.Fragment, {}, v6)}
    local v10 = createElement
    local v11 = {Name = "Target", Animate = false, Target = v4}
    local v12 = false
    if u19 ~= nil then
        v12 = v4 ~= nil
    end
    v11.Visible = v12
    v11.ShowFill = v2 ~= v4
    v11.Color = u113.Enemy
    v9.target = v10(ModelSelection, v11)
    v10 = createElement
    v11 = {Name = "Selection", ShowFill = false, Target = u19, Visible = u19 ~= nil}
    local Tower = if not v3 then u113.Enemy else u113.Tower
    v11.Color = Tower
    v9.selected = v10(ModelSelection, v11)
    v10 = createElement
    v11 = {
        Name = "Hover",
        ShowFill = true,
        Target = v2,
        Visible = v2 ~= nil,
        Color = v1,
        ShouldDeselect = v7,
    }
    v9.hovering = v10(ModelSelection, v11)
    return createElement_2(Fragment, {}, v9)
end

function u110.Render() -- Line: 159
    -- upvalues: useInGameTowers (val), useCharmSelector (val), UpgradesStore (val), useAtom (val), ClientAtoms (val)
    -- upvalues: SettingsStore (val), UserId (val), Asset (val), SharedGameConstants (val), createElement (val)
    -- upvalues: OwnedTower (val), React (val)
    local BoundarySize, HeightOffset, PrimaryPart, v1, v2, v3, v4
    local v5 = useInGameTowers()
    local v6 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 161
        return a1.model
    end)
    local v7 = useAtom(ClientAtoms.hideTowerRings)
    local v8 = useCharmSelector(SettingsStore.getState, function(a1) -- Line: 166
        return a1.Game and a1.Game["Hide Tower Rings"] == true
    end)
    local v9 = {}
    local v10 = 1
    debug.profilebegin("UIFanout_OwnedTowers")
    for k, v in pairs(v5) do
        v1 = false
        if v.OwnerId == UserId then
            v1 = v6 == nil
        end
        PrimaryPart = nil
        v2 = nil
        v3 = Asset("Troops", v.Name)
        if k and k.PrimaryPart then
            HeightOffset = k.PrimaryPart:FindFirstChild("HeightOffset")
            PrimaryPart = if not HeightOffset then k.PrimaryPart else HeightOffset
            BoundarySize = v3.Properties.BoundarySize or SharedGameConstants.DEFAULT_BOUNDARY_SIZE
            v2 = BoundarySize * 2
        end
        v4 = tostring(v10)
        v9[v4] = (createElement(OwnedTower, {Enabled = not v8 and not v7 and v1, Boundary = v2, Target = PrimaryPart}))
        v10 = v10 + 1
    end
    debug.profileend()
    return createElement("Folder", {Name = "OwnedTowers"}, {towers = React.createElement(React.Fragment, {}, v9)})
end

return function() -- Line: 210 -- upvalues: ReactRoblox (val), createElement (val), u110 (val)
    return ReactRoblox.createPortal({
        render = createElement(u110.Render),
        selections = createElement(u110.Selections),
    }, workspace.CurrentCamera, "ownedTowers")
end