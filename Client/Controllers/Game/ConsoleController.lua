-- Script path: ReplicatedStorage.Client.Controllers.Game.ConsoleController
-- Decompile time: 10.18 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
task.spawn(function() -- Line: 7 -- upvalues: ReplicatedStorage (val), UserInputService (val), GuiService (val)
    local HotbarStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.HotbarStore)
    local Cache = require(ReplicatedStorage.Client.Modules.Cache)
    local ConsumableController = require(ReplicatedStorage.Client.Controllers.Shared.ConsumableController)
    local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
    local Hotbar = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Hotbar)
    local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
    local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
    local PathPlacementCursorController_2 = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
    local NewPlacementController = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
    local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
    local upgradeHandler = require(ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Upgrade.upgradeHandler)
    local u81 = 0
    local u82 = 0
    UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 29
        -- upvalues: PlayerReplicator (val), Cache (val), HotbarStore (val), PathPlacementCursorController (val)
        -- upvalues: u82 (ref), NewPlacementController (val), ConsumableController (val), u81 (ref), Hotbar (val)
        -- upvalues: PathPlacementCursorController_2 (val), GuiService (upval), upgradeHandler (val), GameState (val)
        -- upvalues: Notification (val)
        local v1 = PlayerReplicator.GetLocalPlayer():expect()
        local v2 = Cache("Inventory.Troops")
        local v3 = v1.Replicator:Get("EquippedTowers")
        local v4 = v1.Replicator:Get("EquippedConsumables")
        if not a2 then
            local v5
            if a1.KeyCode ~= Enum.KeyCode.ButtonR1 then
                if a1.KeyCode == Enum.KeyCode.ButtonB then
                    GuiService.SelectedObject = nil
                    if not NewPlacementController.Active then
                        upgradeHandler:clearTroop()
                    else
                        NewPlacementController:Stop()
                    end
                    if PathPlacementCursorController_2.active then
                        PathPlacementCursorController_2:Stop()
                        return
                    end
                elseif a1.KeyCode ~= Enum.KeyCode.ButtonL1 then
                    if a1.KeyCode == Enum.KeyCode.ButtonY then
                        if not HotbarStore.getState().consumablesEnabled then
                            v5 = v3[u81 + 1]
                            Hotbar.Clicked:Fire(v5, v2._data[v5].Skin, v2._data[v5].GoldenPerks)
                            return
                        end
                        local Replicator = GameState.Replicator
                        if Replicator:Get("GameStarted") and not Replicator:Get("GameOver") then
                            if not Replicator:Get("TowerInteraction") then
                                Notification.Create({
                                    Text = "You can't use consumables right now!",
                                    Color = Color3.fromRGB(255, 0, 0),
                                })
                                return
                            end
                            local v6 = v4._data[u82 + 1]
                            NewPlacementController:Stop()
                            ConsumableController.Equip(v6)
                            return
                        end
                        Notification.Create({
                            Text = "You can only use consumables during a game!",
                            Color = Color3.fromRGB(255, 0, 0),
                        })
                        return
                    end
                    if a1.KeyCode == Enum.KeyCode.ButtonL2 then
                        if NewPlacementController.Active then
                            NewPlacementController.Rotate:Fire()
                            return
                        end
                        u82 = 0
                    end
                elseif not HotbarStore.getState().consumablesEnabled then
                    if NewPlacementController.Active then
                        u81 = (u81 - 1) % #v3
                        v5 = v3[u81 + 1]
                        Hotbar.Clicked:Fire(v5, v2._data[v5].Skin, v2._data[v5].GoldenPerks)
                        return
                    end
                elseif NewPlacementController.Active then
                    u82 = (u82 - 1) % #v4._data
                    v5 = v4._data[u82 + 1]
                    NewPlacementController:Stop()
                    ConsumableController.Unequip()
                    ConsumableController.Equip(v5)
                    return
                end
            elseif not HotbarStore.getState().consumablesEnabled then
                if NewPlacementController.Active then
                    u81 = (u81 + 1) % #v3
                    v5 = v3[u81 + 1]
                    Hotbar.Clicked:Fire(v5, v2._data[v5].Skin, v2._data[v5].GoldenPerks)
                    return
                end
                if PathPlacementCursorController_2.active then
                    local Place = PathPlacementCursorController_2.Place
                    if Place then
                        Place:Fire()
                        return
                    end
                end
            elseif PathPlacementCursorController.active then
                u82 = (u82 + 1) % #v4._data
                v5 = v4._data[u82 + 1]
                NewPlacementController:Stop()
                ConsumableController.Unequip()
                ConsumableController.Equip(v5)
                return
            end
        end
    end)
end)
return {}