-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.PVPIntermission
-- Decompile time: 8.33 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Modules = ReplicatedStorage.Client.Modules
local Components = Interfaces.Game.Components
local Hooks = Interfaces.Hooks
require(ReplicatedStorage.Client.Interfaces.Components.Button)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local PlayerReplicator = require(Modules.Replicators.PlayerReplicator)
require(ReplicatedStorage.Client.Interfaces.Components.Prompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAttribute = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttribute)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local PVPTowerInventoryHeader = require(Components.PVP.PVPTowerInventoryHeader)
local PVPTowerInventory = require(Components.PVP.PVPTowerInventory)
local useCache = require(Hooks.useCache)
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useState = React.useState
local useGameStateValue = require(Hooks.useGameStateValue)
local usePlayerReplicatorValue = require(Hooks.usePlayerReplicatorValue)
local usePlayerTeams = require(Hooks.usePlayerTeams)
require(Hooks.useReactBindings)
local createElement = React.createElement
local useCallback = React.useCallback
local useBinding = React.useBinding
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
local Inventory = Network.Channel("Inventory")
local PVP = NewNetwork.Channel("PVP")

local function withIntermissionLogic(a1) -- Line: 50
    -- upvalues: useGameStateValue (val), useViewEnabled (val), ViewController (val), createElement (val)
    return function() -- Line: 51
        -- upvalues: useGameStateValue (upval), useViewEnabled (upval), ViewController (upval), createElement (upval)
        -- upvalues: a1 (val)
        local Banning = useGameStateValue("Banning")
        local EquippingPVPTowers = useGameStateValue("EquippingPVPTowers")
        local v1 = useGameStateValue("GameMode", "")
        local Ranked = useGameStateValue("Ranked")
        local v2 = useViewEnabled("Inventory") or Banning
        local Banning_2 = useViewEnabled("Banning")
        if Ranked then
            if not EquippingPVPTowers then
                if Banning_2 then
                    if not EquippingPVPTowers and not Banning_2 then
                        ViewController:setView("Hotbar")
                    end
                elseif Banning then
                    ViewController:setView("Banning")
                elseif not EquippingPVPTowers and not Banning_2 then
                    ViewController:setView("Hotbar")
                end
            elseif not Banning then
                ViewController:setView("Inventory")
            elseif Banning_2 then
                if not EquippingPVPTowers and not Banning_2 then
                    ViewController:setView("Hotbar")
                end
            elseif Banning then
                ViewController:setView("Banning")
            elseif not EquippingPVPTowers and not Banning_2 then
                ViewController:setView("Hotbar")
            end
        end
        if v1 == "PVP" and v2 then
            return createElement(a1, {banning = Banning})
        end
        return nil
    end
end

local function getLocalReplicator() -- Line: 80 -- upvalues: PlayerReplicator (val)
    return PlayerReplicator.GetLocalPlayerRaw()
end

local function fastEquipTower(a1) -- Line: 84
    -- upvalues: PlayerReplicator (val), table (val), Inventory (val), ViewController (val)
    local v1 = PlayerReplicator.GetLocalPlayerRaw()
    if not v1 then
        return
    end
    local EquippedPVPTowers = v1.EquippedPVPTowers
    local v2 = table.clone(v1.EquippedPVPTowers)
    local v3 = table.find(v1.EquippedPVPTowers, a1)
    if not v3 then
        table.insert(v2, a1)
        while #v2 > 4 do
            table.remove(v2, 1)
        end
    else
        table.remove(v2, v3)
    end
    v1.Replicator:Set("EquippedPVPTowers", v2)
    local v4, v5 = Inventory:InvokeServer(if not v3 then "Equip" else "Unequip", "PVPTower", a1)
    if not v4 then
        ViewController:notifyError(v5 or "failed to equip tower")
        v1.Replicator:Set("EquippedPVPTowers", EquippedPVPTowers)
    end
    return v4, not v3
end

local function fastEquipConsumable(a1) -- Line: 116
    -- upvalues: PlayerReplicator (val), table (val), Inventory (val), ViewController (val)
    local v1 = PlayerReplicator.GetLocalPlayerRaw()
    if not v1 then
        return
    end
    local EquippedPVPConsumables = v1.EquippedPVPConsumables
    local v2 = table.clone(v1.EquippedPVPConsumables)
    local v3 = table.find(v1.EquippedPVPConsumables, a1)
    if not v3 then
        table.insert(v2, a1)
        while #v2 > 4 do
            table.remove(v2, 1)
        end
    else
        table.remove(v2, v3)
    end
    v1.Replicator:Set("EquippedPVPConsumables", v2)
    local v4, v5 = Inventory:InvokeServer(if not v3 then "Equip" else "Unequip", "Pvpconsumable", a1)
    if not v4 then
        ViewController:notifyError(v5 or "failed to equip tower")
        v1.Replicator:Set("EquippedPVPConsumables", EquippedPVPConsumables)
    end
    return v4, not v3
end

local function onUnequip(a1, a2) -- Line: 152
    -- upvalues: fastEquipTower (val), fastEquipConsumable (val), ViewController (val)
    local v1, v2
    if a1 == "Towers" then
        v1, v2 = fastEquipTower(a2)
        if not v1 then
            ViewController:notifyError(v2 or "failed to unequip tower")
        end
        return
    end
    if a1 ~= "Consumables" then
        return
    end
    v1, v2 = fastEquipConsumable(a2)
    if not v1 then
        ViewController:notifyError(v2 or "failed to unequip tower")
    end
end

local function PVPIntermission(a1) -- Line: 169
    -- upvalues: usePlayerTeams (val), Enum (val), useCache (val), usePlayerReplicatorValue (val), LocalPlayer (val)
    -- upvalues: useGameStateValue (val), useAttribute (val), useBinding (val), useSound (val), ViewController (val)
    -- upvalues: useEffect (val), createElement (val), PVPTowerInventory (val), table (val), useCallback (val)
    -- upvalues: fastEquipConsumable (val), PVP (val), fastEquipTower (val), onUnequip (val)
    -- upvalues: PVPTowerInventoryHeader (val)
    local v1 = usePlayerTeams()
    local v2 = v1[Enum.Team.Red] or {}
    local v3 = v1[Enum.Team.Blue] or {}
    local v4 = useCache("Inventory.Troops", {})
    local v5 = usePlayerReplicatorValue(LocalPlayer, "EquippedPVPTowers", {})
    local v6 = usePlayerReplicatorValue(LocalPlayer, "EquippedPVPConsumables", {})
    local banning = a1.banning
    if useGameStateValue("Gamemode") == "PVP" then end
    local v7 = useGameStateValue("Ranked") == true
    local u44 = useGameStateValue("BannedTowers", {})
    local v8 = useGameStateValue("BansPerPlayer", {})
    local u53 = useAttribute(workspace, "PVPCountdownEnds", 0)
    local v9, u57 = useBinding(0)
    local Error = useSound("Error")
    local Equip = useSound("Equip")
    local Unequip = useSound("Unequip")
    local v10 = {u53}
    useEffect(function() -- Line: 194 -- upvalues: u53 (val), u57 (val)
        local ServerTimeNow = workspace:GetServerTimeNow()
        if u53 and not (u53 <= ServerTimeNow) then
            local u6 = true
            local u11 = task.spawn(function() -- Line: 202 -- upvalues: u6 (ref), u53 (upval), u57 (upval)
                local v1
                while u6 do
                    v1 = u53
                    if not (workspace:GetServerTimeNow() < v1) then
                        break
                    end
                    u57(u53 - workspace:GetServerTimeNow())
                    task.wait(0.5)
                end
                u6 = false
            end)
            return function() -- Line: 211 -- upvalues: u6 (ref), u11 (ref)
                u6 = false
                if u11 then
                    task.cancel(u11)
                end
            end
        end
    end, v10)
    v10 = {
        Size = UDim2.fromScale(0.5, 0.7),
        Position = UDim2.fromScale(0.5, 0.55),
        AnchorPoint = Vector2.new(0.5, 0.5),
        redPlayers = table.map(v2, function(a1, a2) -- Line: 225
            return a2.UserId
        end),
        bluePlayers = table.map(v3, function(a1, a2) -- Line: 228
            return a2.UserId
        end),
        towerInventory = v4,
        equippedTowers = v5,
        equippedConsumables = v6,
        banningTowers = banning,
        bannedTowers = u44,
        bansPerPlayer = v8,
    }
    local v11 = {v6}
    v10.consumableClicked = useCallback(function(a1) -- Line: 240 -- upvalues: fastEquipConsumable (upval), Error (val), Equip (val), Unequip (val)
        local v1, v2 = fastEquipConsumable(a1)
        if not v1 then
            Error()
            return
        end
        if v2 then
            Equip()
            return
        end
        Unequip()
    end, v11)
    v11 = {v5, banning, u44}
    v10.towerClicked = useCallback(function(a1) -- Line: 253
        -- upvalues: banning (val), table (upval), u44 (val), ViewController (upval), Error (val), PVP (upval)
        -- upvalues: fastEquipTower (upval), Equip (val), Unequip (val)
        if not banning then
            if table.find(u44, a1) then
                ViewController:notifyError("This tower is banned!")
                Error()
                return
            end
            local v1, v2 = fastEquipTower(a1)
            if not v1 then
                Error()
                return
            end
            if v2 then
                Equip()
                return
            end
            Unequip()
            return
        end
        if table.find(u44, a1) then
            ViewController:notifyError("This tower is already banned!")
            Error()
            return
        end
        ViewController:prompt({
            Override = true,
            Subject = "Ban Tower",
            Icon = "rbxassetid://108137113182163",
            Description = ("Are you sure you want to ban the \"%*\" Tower?"):format(a1),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(220, 52, 10),
                    Clicked = function() -- Line: 270 -- upvalues: ViewController (upval), PVP (upval), a1 (val)
                        ViewController:closePrompt()
                        PVP:fireServer("BanTower", a1)
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 278 -- upvalues: ViewController (upval)
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end, v11)
    v10.hotbarClicked = onUnequip
    v10.leaveClicked = not banning and function() -- Line: 190 -- upvalues: ViewController (upval)
        ViewController:setView("Hotbar")
        return
    end
    local v12 = {}
    local v13 = {
        timer = if not v7 then nil else v9,
        title = if not banning then "EQUIP YOUR TOWERS!" else "BAN YOUR TOWERS",
    }
    local v14 = if not banning then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(255, 92, 92)
    v13.color = v14
    v14 = if not banning then Color3.fromRGB(12, 12, 12) else Color3.fromRGB(255, 255, 255)
    v13.backgroundColor = v14
    v12.header = createElement(PVPTowerInventoryHeader, v13)
    return createElement(PVPTowerInventory, v10, v12)
end

return function() -- Line: 51
    -- upvalues: useGameStateValue (val), useViewEnabled (val), ViewController (val), createElement (val)
    -- upvalues: PVPIntermission (val)
    local Banning = useGameStateValue("Banning")
    local EquippingPVPTowers = useGameStateValue("EquippingPVPTowers")
    local v1 = useGameStateValue("GameMode", "")
    local Ranked = useGameStateValue("Ranked")
    local v2 = useViewEnabled("Inventory") or Banning
    local Banning_2 = useViewEnabled("Banning")
    if Ranked then
        if not EquippingPVPTowers then
            if Banning_2 then
                if not EquippingPVPTowers and not Banning_2 then
                    ViewController:setView("Hotbar")
                end
            elseif Banning then
                ViewController:setView("Banning")
            elseif not EquippingPVPTowers and not Banning_2 then
                ViewController:setView("Hotbar")
            end
        elseif not Banning then
            ViewController:setView("Inventory")
        elseif Banning_2 then
            if not EquippingPVPTowers and not Banning_2 then
                ViewController:setView("Hotbar")
            end
        elseif Banning then
            ViewController:setView("Banning")
        elseif not EquippingPVPTowers and not Banning_2 then
            ViewController:setView("Hotbar")
        end
    end
    if v1 == "PVP" and v2 then
        return createElement(PVPIntermission, {banning = Banning})
    end
    return nil
end