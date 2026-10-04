-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.BountySelectEnemy
-- Decompile time: 7.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KingpinBountyCrosshair = require(ReplicatedStorage.Client.Interfaces.Game.Components.KingpinBountyCrosshair)
local KingpinStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.KingpinStore)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SelectClonedTower = require(ReplicatedStorage.Client.Interfaces.Game.Components.SelectClonedTower)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useDeviceType = require(ReplicatedStorage.Client.Interfaces.Hooks.useDeviceType)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local u66 = Color3.fromRGB(34, 255, 0)
local u71 = Color3.fromRGB(255, 34, 0)
local u76 = Color3.fromRGB(96, 0, 0)
local u80 = UDim2.fromScale(3, 3)
local u81 = {}
u81.Cancel = {
    ActionText = "Cancel",
    Layout = 2,
    ScaleMultiplier = 0.4,
    useBackground = false,
    Key = Enum.KeyCode.Q,
}
local u84 = {}
u84.Cancel = {
    ActionText = "Cancel",
    Layout = 2,
    ScaleMultiplier = 0.4,
    useBackground = false,
    Key = Enum.KeyCode.ButtonB,
}

local function getBountyBillboard(a1, a2, a3, a4) -- Line: 44
    -- upvalues: NPCReplicator (val), createElement (val), u80 (val), KingpinBountyCrosshair (val)
    local v1 = NPCReplicator.GetNPCFromFolder(a1)
    if v1 and v1.Model and v1.Model.Parent then
        local PrimaryPart = v1.PrimaryPart or v1.Model.PrimaryPart
        if not PrimaryPart then
            return nil
        end
        return createElement("BillboardGui", {
            Active = true,
            AlwaysOnTop = true,
            Brightness = 2,
            LightInfluence = 0,
            MaxDistance = 250,
            Adornee = PrimaryPart,
            Size = u80,
            StudsOffsetWorldSpace = Vector3.new(0, (v1.Height or v1.Model:GetExtentsSize().Y / 2) + 1.25, 0),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            crosshair = createElement(KingpinBountyCrosshair, {BountyReward = a2, Color = a3, ResetKey = a1, StrokeColor = a4}),
        })
    end
    return nil
end

local function render() -- Line: 82
    -- upvalues: useMouse (val), useDeviceType (val), useAtom (val), KingpinStore (val), u81 (val), u84 (val)
    -- upvalues: React (val), u71 (val), u66 (val), NPCReplicator (val), createElement (val), getBountyBillboard (val)
    -- upvalues: u76 (val), createPortal (val), SelectClonedTower (val)
    local v1, v2, v3
    local v4, v5 = useMouse()
    local v6 = useDeviceType()
    local v7 = useAtom(KingpinStore.bountySelection)
    local v8 = useAtom(KingpinStore.kingpinBounties)
    local selected = v7.selected
    local v9 = not (v6 ~= "PC") and u81 or u84
    local v10 = React.joinBindings({v4, v5}):map(function(a1) -- Line: 91
        return UDim2.fromOffset(a1[1] + 50, a1[2] - 4)
    end)
    local v11 = nil
    local v12 = nil
    if selected then
        v1 = v8[selected]
        local v13 = v1 ~= nil
        local v14 = if not (v7.canSelect == false) then u66 else u71
        v2 = NPCReplicator.GetNPCFromFolder(selected)
        if v2 and v2.Model and v2.Model.Parent then
            local v15
            v11 = createElement("Highlight", {
                FillTransparency = 0.6,
                OutlineTransparency = 0,
                DepthMode = Enum.HighlightDepthMode.Occluded,
                FillColor = v14,
                OutlineColor = v14,
                Adornee = v2.Model,
            })
            local v16 = if not v15 then nil else u71
            local v17 = if not v15 then nil else u76
            v12 = getBountyBillboard(selected, v7.reward or (if not v13 then nil else v1.amount), v16, v17)
        end
    end
    v1 = {}
    for i, j in v8 do
        if i ~= selected then
            v3 = getBountyBillboard(i, j.amount, nil, nil)
            if v3 then
                v1[i] = v3
            end
        end
    end
    local Fragment = React.Fragment
    v2 = {}
    v2.world = createPortal({
        highlight = v11,
        selectionBillboard = v12,
        bountyBillboards = createElement(React.Fragment, nil, v1),
    }, workspace.CurrentCamera, "bountyTargetSelection")
    local enabled = v7.enabled and createElement(SelectClonedTower, {
        Position = v10,
        HeaderText = if not v7.enemyName then "Select Enemy" else ("Select %*"):format(v7.enemyName),
        HeaderColor = Color3.fromRGB(255, 220, 100),
        Binds = v9,
    })
    v2.window = enabled
    return createElement(Fragment, nil, v2)
end

return function() -- Line: 156 -- upvalues: createElement (val), render (val)
    return createElement(render, {})
end