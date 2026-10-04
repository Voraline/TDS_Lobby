-- Script path: ReplicatedStorage.Client.Controllers.Shared.ConsumableController
-- Decompile time: 27.84 ms

local v1
local u0 = {}
local u1 = {}
u1.__index = u1
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Consumables = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Consumables)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local InventoryController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.InventoryController)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PathCursorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PathCursorStore)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local u105 = {}
local LocalPlayer = Players.LocalPlayer
local Consumables_2 = Network.Channel("Consumables")
local u110 = nil
local u114 = FFlagController.get("consumables.disabled", false)
local GameRules = if not (workspace:WaitForChild("Type").Value == "Game") then nil else require(ReplicatedStorage.Shared.Modules.GameRules)

local function usePlacementCursor(a1, a2) -- Line: 40
    -- upvalues: TypedPromise (val), ReplicatedStorage (val), PlayerReplicator (val), Enum (val), PathCursorStore (val)
    -- upvalues: Notification (val)
    return TypedPromise.new(function(a1_2, a2_2, a3) -- Line: 41
        -- upvalues: ReplicatedStorage (upval), PlayerReplicator (upval), a2 (val), Enum (upval)
        -- upvalues: PathCursorStore (upval), a1 (val), Notification (upval)
        local u3 = nil
        local u4 = nil
        local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
        a3(function() -- Line: 48 -- upvalues: PathPlacementCursorController (val), u4 (ref), u3 (ref)
            PathPlacementCursorController:Stop()
            if u4 then
                u4:Disconnect()
            end
            if u3 then
                u3:Disconnect()
            end
        end)
        local Team = PlayerReplicator.GetLocalPlayerRaw().Team
        local Red = nil
        if a2.PVP then
            Red = if not a2.PVPUsedOnOwnTeam then if Team ~= Enum.Team.Blue then Enum.Team.Blue else Enum.Team.Red else Team
        end
        PathPlacementCursorController:Start({
            constrainToPath = a2.LockedToPath or false,
            constrainToGround = a2.ConstrainToGround or false,
            uiEnabled = not a2.RequiresClick,
            team = a2.team or Red,
            placementRadius = a2.PlacementRadius or false,
        })
        if a2.CursorSize then
            PathCursorStore.setSize(a2.CursorSize)
        end
        u3 = PathPlacementCursorController.OnClicked:Connect(function(a1_3, a2_2, a3) -- Line: 84
            -- upvalues: a1 (upval), Enum (upval), Notification (upval), PathPlacementCursorController (val), a2 (upval)
            -- upvalues: u3 (ref), u4 (ref), a1_2 (val)
            if a1.State ~= Enum.ConsumableState.Ready then
                Notification.Create({
                    Text = "Consumable is not ready to be placed.",
                    Color = Color3.fromRGB(255, 0, 0),
                })
                PathPlacementCursorController:Start({constrainToPath = a2.LockedToPath or false})
                return
            end
            u3:Disconnect()
            u4:Disconnect()
            u3 = nil
            u4 = nil
            a1_2({pathName = a1_3, position = a3, pathToEnd = a2_2, team = a2.team})
        end)
        local v1 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 113 -- upvalues: u4 (ref), u3 (ref), a2_2 (val)
            u4:Disconnect()
            u3:Disconnect()
            u3 = nil
            u4 = nil
            a2_2("Cancelled")
        end)
    end)
end

local function consumablesDisabled() -- Line: 125 -- upvalues: GameState (val), u114 (val)
    return GameState.ConsumablesDisabled or u114()
end

local function consumableIsDisabled(a1) -- Line: 129 -- upvalues: Consumables (val) -- types: a1: string
    local v1 = Consumables(a1)
    return v1 and v1.Disabled
end

local function consumableHasCooldown(a1) -- Line: 134
    -- upvalues: GameRules (val), u110 (ref), LocalPlayer (val)
    if GameRules and GameRules.Has("InfiniteConsumables") then
        return 0
    end
    if not u110 then
        return 1
    end
    local v1 = a1:gsub(" ", "")
    local State = u110.State
    local v2 = State[v1] or State[("%*_%*"):format(LocalPlayer.UserId, v1)]
    if typeof(v2) == "number" then
        return 2
    end
    if v2 then
        return 3
    end
    return 0
end

local function canAffordConsumable(a1) -- Line: 157
    -- upvalues: Consumables (val), PlayerReplicator (val)
    local v1 = Consumables(a1)
    local Cost = v1 and v1.Cost or 0
    local CostCalculation = v1 and v1.CostCalculation
    local v2 = PlayerReplicator.GetLocalPlayer():expect()
    local v3 = v2.Replicator:Get("Consumables") or {}
    local v4 = v3[a1] or 0
    if Cost and CostCalculation then
        Cost = CostCalculation(v4, Cost)
    end
    if not (Cost > 0) then
        return true
    end
    return Cost <= (v2.Cash or 0)
end

local function canUseConsumable(a1, a2, a3) -- Line: 177
    -- upvalues: consumableHasCooldown (val), Notification (val)
    local v1 = consumableHasCooldown(a1)
    if v1 == 0 then
        return true
    end
    local v2 = {
        "Error checking for consumable",
        ("Consumable \"%*\" is on cooldown!"):format(a1),
        (("Please wait for \"%*\" to finish!"):format(a1)),
    }
    if a3 ~= false then
        Notification.Create({Color = Color3.fromRGB(255, 0, 0), Text = v2[v1]})
    end
    return false
end

function u1.fromReplicator(a1) -- Line: 200
    -- upvalues: u105 (val), u1 (val), Consumables (val), Players (val), LocalPlayer (val)
    local v1 = u105[a1:WaitForState("Id")]
    if v1 then
        if not v1.Replicator then
            v1.Replicator = a1
            a1:Hook(v1)
        end
        return v1
    end
    local v2 = a1:WaitForState("PlayerId")
    local v3 = setmetatable({}, u1)
    v3.Replicator = a1
    a1:Hook(v3)
    v3.Consumable = Consumables(v3.Type)
    v3.Animator = v3.Consumable.Animator
    v3.Executor = Players:GetPlayerByUserId(v2)
    v3.Local = v3.Executor == LocalPlayer
    v3:init()
    return v3
end

function u1.fromLocal(a1, a2) -- Line: 226
    -- upvalues: u1 (val), Enum (val), LocalPlayer (val), Consumables (val)
    local v1 = setmetatable({}, u1)
    v1.Id = a2
    v1.Type = a1
    v1.State = Enum.ConsumableState.Ready
    v1.Changed = workspace:GetServerTimeNow()
    v1.PlayerId = LocalPlayer.UserId
    v1.Equipped = true
    v1.Context = {}
    v1.Local = true
    v1.Consumable = Consumables(a1)
    v1.Animator = v1.Consumable.Animator
    v1.Executor = LocalPlayer
    v1:init()
    return v1
end

function u1.Destroy(a1) -- Line: 247
    a1.Maid:Sweep()
end

function u1:init() -- Line: 251 -- upvalues: Maid (val), Consumables (val), u105 (val), SandboxStore (val)
    self.Maid = Maid.new()
    self.Consumable = Consumables(self.Type)
    self.Maid:Mark(function() -- Line: 256 -- upvalues: u105 (upval), self (val)
        u105[self.Id] = nil
        if self._consume then
            self._consume:cancel()
            self._consume = nil
        end
        if self._equip then
            self._equip:cancel()
            self._equip = nil
        end
        if self._placementPromise then
            self._placementPromise:cancel()
            self._placementPromise = nil
        end
        if self.Equipped and self.Animator and self.Animator.OnUnequip then
            self.Animator.OnUnequip(self)
        end
    end)
    if self.Equipped and self.Animator and self.Animator.OnEquip then
        if self.Local then
            SandboxStore.setDisabledModifier("consumables", true)
        end
        self._equip = self.Animator.OnEquip(self)
        self._equip:catch(warn)
        self._equip:finally(function() -- Line: 289 -- upvalues: self (val)
            self._equip = nil
        end)
    end
    u105[self.Id] = self
end

function u1:Consume() -- Line: 297
    if self._consume then
        self._consume:cancel()
        self._consume = nil
    end
    task.defer(function() -- Line: 303 -- upvalues: self (val)
        if self.Animator and self.Animator.OnUse then
            self._consume = self.Animator.OnUse(self)
            self._consume:catch(warn)
            self._consume:finally(function() -- Line: 308 -- upvalues: self (upval)
                self._consume = nil
            end)
        end
        ;(self:Unequip()):andThen(function() -- Line: 313 -- upvalues: self (upval)
            if self.Local then
                self:Requip()
            end
        end)
    end)
end

function u1:Start() -- Line: 321
    -- upvalues: TypedPromise (val), ReplicatedStorage (val), PlayerReplicator (val), Enum (val), PathCursorStore (val)
    -- upvalues: Notification (val), GameState (val), u114 (val), Consumables (val), canUseConsumable (val)
    -- upvalues: canAffordConsumable (val), Consumables_2 (val)
    if self.Local and not self._readyWaiting then
        if self._equip then
            self._equip:await()
        end
        local Consumable = self.Consumable
        if not Consumable.RequiresCursor and not Consumable.RequiresClick then
            local ConsumablesDisabled = GameState.ConsumablesDisabled or u114()
            if ConsumablesDisabled then
                Notification.Create({Text = "Consumables are disabled!", Color = Color3.fromRGB(255, 0, 0)})
                self:Unequip()
                return
            end
            local v1 = Consumables(self.Type)
            if v1 and v1.Disabled then
                Notification.Create({Text = "This consumable is disabled!", Color = Color3.fromRGB(255, 0, 0)})
                self:Unequip()
                return
            end
            if not canAffordConsumable(self.Type) then
                Notification.Create({
                    Text = "You cannot afford this consumable!",
                    Color = Color3.fromRGB(255, 0, 0),
                })
                self:Unequip()
                return
            end
            if not canUseConsumable(self.Type, self.Id) then
                self:Unequip()
                return
            end
            Consumables_2:FireServer("Consume", self.Type, {})
            return
        end
        self._readyWaiting = true
        self._placementPromise = TypedPromise.new(function(a1, a2, a3) -- Line: 41
            -- upvalues: ReplicatedStorage (upval), PlayerReplicator (upval), Consumable (val), Enum (upval)
            -- upvalues: PathCursorStore (upval), self (val), Notification (upval)
            local u3 = nil
            local u4 = nil
            local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
            a3(function() -- Line: 48 -- upvalues: PathPlacementCursorController (val), u4 (ref), u3 (ref)
                PathPlacementCursorController:Stop()
                if u4 then
                    u4:Disconnect()
                end
                if u3 then
                    u3:Disconnect()
                end
            end)
            local Team = PlayerReplicator.GetLocalPlayerRaw().Team
            local Red = nil
            if Consumable.PVP then
                Red = if not Consumable.PVPUsedOnOwnTeam then if Team ~= Enum.Team.Blue then Enum.Team.Blue else Enum.Team.Red else Team
            end
            PathPlacementCursorController:Start({
                constrainToPath = Consumable.LockedToPath or false,
                constrainToGround = Consumable.ConstrainToGround or false,
                uiEnabled = not Consumable.RequiresClick,
                team = Consumable.team or Red,
                placementRadius = Consumable.PlacementRadius or false,
            })
            if Consumable.CursorSize then
                PathCursorStore.setSize(Consumable.CursorSize)
            end
            u3 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2, a3) -- Line: 84
                -- upvalues: self (upval), Enum (upval), Notification (upval), PathPlacementCursorController (val)
                -- upvalues: Consumable (upval), u3 (ref), u4 (ref), a1 (val)
                if self.State ~= Enum.ConsumableState.Ready then
                    Notification.Create({
                        Text = "Consumable is not ready to be placed.",
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    PathPlacementCursorController:Start({constrainToPath = Consumable.LockedToPath or false})
                    return
                end
                u3:Disconnect()
                u4:Disconnect()
                u3 = nil
                u4 = nil
                a1({pathName = a1_2, position = a3, pathToEnd = a2, team = Consumable.team})
            end)
            local v1 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 113 -- upvalues: u4 (ref), u3 (ref), a2 (val)
                u4:Disconnect()
                u3:Disconnect()
                u3 = nil
                u4 = nil
                a2("Cancelled")
            end)
        end)
        local v2, v3 = self._placementPromise:awaitStatus()
        self._placementPromise = nil
        self._readyWaiting = false
        local ConsumablesDisabled_2 = GameState.ConsumablesDisabled or u114()
        if ConsumablesDisabled_2 then
            Notification.Create({Text = "Consumables are disabled!", Color = Color3.fromRGB(255, 0, 0)})
            self:Unequip()
            return
        end
        local v4 = Consumables(self.Type)
        if v4 and v4.Disabled then
            Notification.Create({Text = "This consumable is disabled!", Color = Color3.fromRGB(255, 0, 0)})
            self:Unequip()
            return
        end
        if not canUseConsumable(self.Type, self.Id) then
            self:Unequip()
            return
        end
        if v2 ~= TypedPromise.Status.Resolved then
            self:Unequip()
            if v2 ~= TypedPromise.Status.Cancelled and v3 ~= "Cancelled" then
                error((("Placement: %*"):format(v3)))
            end
            return
        end
        if canAffordConsumable(self.Type) then
            Consumables_2:FireServer("Consume", self.Type, {
                pathName = v3.pathName,
                position = v3.position,
                pathToEnd = v3.pathToEnd,
                direction = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, v3.position).LookVector,
            })
            return
        end
        Notification.Create({Text = "You cannot afford this consumable!", Color = Color3.fromRGB(255, 0, 0)})
        self:Unequip()
        return
    end
end

function u1:Unequip() -- Line: 431 -- upvalues: TypedPromise (val), SandboxStore (val), Consumables_2 (val)
    if not self.Equipped then
        return TypedPromise.resolve()
    end
    if self._unequipPromise then
        return self._unequipPromise
    end
    self.Equipped = false
    if self.Local then
        SandboxStore.setDisabledModifier("consumables", false)
        Consumables_2:FireServer("Unequip", self.Id)
    end
    if self.Animator and self.Animator.OnUnequip then
        local u27 = self.Animator.OnUnequip(self)
        u27:finally(function() -- Line: 450 -- upvalues: self (val), u27 (val)
            if self._unequipPromise == u27 then
                self._unequipPromise = nil
            end
        end)
        self._unequipPromise = u27
        return u27
    end
    return TypedPromise.resolve()
end

function u1:Requip() -- Line: 463
    -- upvalues: GameState (val), GameRules (val), PlayerReplicator (val), Enum (val), InventoryController (val)
    -- upvalues: u0 (val)
    if not self.Consumable.RequiresCursor or GameState.ConsumablesDisabled then
        return
    end
    if GameRules and GameRules.Has("NoConsumableCooldowns") then
        local v1, v2 = PlayerReplicator.GetLocalPlayer():await()
        if not v1 then
            return
        end
        if self.State == Enum.ConsumableState.Ready then
            repeat
                task.wait()
            until self.State ~= Enum.ConsumableState.Ready
        end
        local v3 = InventoryController:getConsumables()
        local Consumables = v2.Consumables or {}
        local v4 = v3[self.Type]
        v4 = Consumables[self.Type] or 0
        if self.Consumable.SingleUse then
            return
        end
        if self.Consumable.MaxUses and self.Consumable.MaxUses <= v4 then
            return
        end
        u0.Equip(self.Type, false)
        return
    end
end

function u0.GetEquippedConsumable() -- Line: 503 -- upvalues: u105 (val), LocalPlayer (val)
    for i, j in u105 do
        if j.Executor == LocalPlayer and j.Equipped == true then
            return j
        end
    end
    return nil
end

function u0.Equip(a1, a2) -- Line: 513
    -- upvalues: u0 (val), GameState (val), u114 (val), Notification (val), canUseConsumable (val), HttpService (val)
    -- upvalues: Asset (val), u1 (val), Consumables_2 (val)
    local v1 = u0.GetEquippedConsumable()
    if v1 then
        if v1.Type == a1 then
            return
        end
        v1:Unequip():await()
    end
    local ConsumablesDisabled = GameState.ConsumablesDisabled or u114()
    if ConsumablesDisabled then
        Notification.Create({Text = "Consumables are disabled!", Color = Color3.fromRGB(255, 0, 0)})
        return
    end
    if not canUseConsumable(a1, nil, a2) then
        return
    end
    local v2 = HttpService:GenerateGUID(false)
    assert(Asset("Consumables", a1), (("Consumable \"%*\" does not exist."):format(a1)))
    local v3 = u1.fromLocal(a1, v2)
    Consumables_2:FireServer("Equip", a1, v2)
    v3:Start()
end

function u0.Unequip() -- Line: 546 -- upvalues: u105 (val), LocalPlayer (val)
    for i, j in u105 do
        if j.Executor == LocalPlayer and j.Equipped then
            j:Unequip()
        end
    end
end

Consumables_2:On("RequestEquip", function(a1) -- Line: 556 -- upvalues: u0 (val) -- types: a1: string
    u0.Equip(a1, false)
end)
if v1 then
    local v2 = TagReplicator.getReplicatorEntityFromFolder((ReplicatedStorage.StateReplicators:WaitForChild("ConsumableCooldownReplicator")))
end
TagReplicator.hook("Consumable", function(a1, a2) -- Line: 566 -- upvalues: u1 (val), Enum (val)
    local u5 = u1.fromReplicator(a2)
    local Maid = u5.Maid
    Maid:Mark(((a2:GetStateChangedSignal("State")):Connect(function(a1) -- Line: 570 -- upvalues: Enum (upval), u5 (val)
        if a1 == Enum.ConsumableState.Consuming then
            u5:Consume()
            return
        end
        if a1 == Enum.ConsumableState.Ready then
            u5:Start()
        end
    end)))
    Maid:Mark(((a2:GetStateChangedSignal("Equipped")):Connect(function(a1) -- Line: 578 -- upvalues: u5 (val)
        if not a1 then
            u5:Unequip()
        end
    end)))
    task.spawn(function() -- Line: 584 -- upvalues: a2 (val), Enum (upval), u5 (val)
        if (a2:Get("State")) == Enum.ConsumableState.Consuming then
            u5:Consume()
        end
    end)
    return u5
end)
return u0