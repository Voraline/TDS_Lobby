-- Script path: ReplicatedStorage.Client.Controllers.Game.GameInputController
-- Decompile time: 19.25 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local TooltipStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.TooltipStore)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local TowerDisplayName = require(ReplicatedStorage.Shared.Modules.TowerDisplayName)
local UnitReplicator = require(ReplicatedStorage.Client.Modules.Replicators.UnitReplicator)
require(ReplicatedStorage.Client.Modules.Replicators.SpotLightReplicator)
local LocalPlayer = Players.LocalPlayer
local v1 = {
    init = function() -- Line: 24
        -- upvalues: ReplicatedStorage (val), LocalPlayer (val), TweenService (val), Network (val)
        -- upvalues: EffectsController (val), table (val), TooltipStore (val), UnitReplicator (val), Enum (val)
        -- upvalues: NPCReplicator (val), LegacyMiddleware (val), TowerReplicator (val), TowerDisplayName (val)
        -- upvalues: UserInputService (val), RunService (val), VRService (val)
        local upgradeHandler = require(ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Upgrade.upgradeHandler)
        local NewPlacementController = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
        local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
        local TowerSelectionCursorController = require(ReplicatedStorage.Client.Controllers.Game.TowerSelectionCursorController)
        local EnemySelectionCursorController = require(ReplicatedStorage.Client.Controllers.Game.EnemySelectionCursorController)
        local Primary = (require(ReplicatedStorage.Client.Modules.PlayerGui)).Primary
        local Charm = require(ReplicatedStorage.Packages.Charm)
        local UsernameFromId = require(ReplicatedStorage.Shared.Modules.UsernameFromId)
        local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
        local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
        local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
        local Mouse = LocalPlayer:GetMouse()
        local u77 = {}
        u77.Units = workspace:WaitForChild("ClientUnits")
        u77.Towers = workspace:WaitForChild("Towers")
        u77.Enemies = workspace:WaitForChild("NPCs")
        local u93 = {}

        function u93.Spring() -- Line: 55 -- upvalues: TweenService (upval)
            local v1, v2, v3, v4
            local Lighting = game.Lighting
            local Map = workspace:WaitForChild("Map")
            local Environment = Map:WaitForChild("Environment")
            local Flowers = Environment:WaitForChild("Flowers")
            local Portal = Environment:WaitForChild("Portal")
            Portal.PortalEffect.ParticleEmitter.Enabled = false
            Portal.PortalEffect.Attachment.Bolts.Enabled = false
            Portal.PortalEffect.Attachment.Fire.Enabled = false
            for k, v in pairs(Flowers:GetChildren()) do
                v1 = Random.new():NextNumber(3, 6)
                v2 = TweenService
                v3 = TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                v4 = {Transparency = 0, CFrame = v.CFrame + Vector3.new(0, 4, 0)}
                v2:Create(v, v3, v4):Play()
            end
            TweenService:Create(Lighting, TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ClockTime = 14}):Play()
            TweenService:Create(
                Portal.PortalEffect.Decal,
                TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Transparency = 1}
            ):Play()
            for k2, i in pairs(Map:GetDescendants()) do
                if i:IsA("BasePart")
                    and i.Material == Enum.Material.Sand
                    and i.Color == Color3.fromRGB(231, 231, 236) then
                    v1 = i:Clone()
                    v1.Material = Enum.Material.Grass
                    v1.Color = Color3.fromRGB(96, 209, 76)
                    v1.CFrame = i.CFrame * CFrame.new(0, -0.001, 0)
                    v1.Parent = i.Parent
                    v2 = TweenService
                    v3 = TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                    v2:Create(i, v3, {Transparency = 1}):Play()
                end
            end
        end

        ;(Network.Channel("SPECIAL_EFFECTS")):On("Effect", function(a1, ...) -- Line: 122 -- upvalues: u93 (val)
            local v1 = u93[a1]
            if v1 then
                v1(...)
            end
        end)
        ;(Network.Channel("SPECIAL_EFFECTS")):On("Cash", function(a1, a2) -- Line: 131 -- upvalues: EffectsController (upval)
            local HumanoidRootPart, v1
            for k, v in pairs(a1) do
                HumanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    v1 = HumanoidRootPart.CFrame * CFrame.new(
                        HumanoidRootPart.Size.X / 2 * Random.new():NextNumber(-1, 1),
                        HumanoidRootPart.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                        HumanoidRootPart.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                    )
                    EffectsController.Cash(a2, v1.p)
                end
            end
        end)

        local function clickedClonedTower() -- Line: 148 -- upvalues: Charm (val), ClientAtoms (val), table (upval)
            if not Charm.untracked(ClientAtoms.cloneTowerAtom).selected then
                return
            end
            ClientAtoms.cloneTowerAtom(function(a1) -- Line: 153 -- upvalues: table (upval)
                local v1 = table.clone(a1)
                v1.isCloning = true
                return v1
            end)
        end

        local u115 = RaycastParams.new()
        u115.FilterType = Enum.RaycastFilterType.Exclude

        local function castRay(a1, a2) -- Line: 165
            -- upvalues: u115 (val), LocalPlayer (upval), u77 (val)
            local Instance, v1, v2, v3, v4, v5
            if a2 ~= nil then end
            local v6 = u115
            v6.FilterDescendantsInstances = {}
            local UnitRay = LocalPlayer:GetMouse().UnitRay
            while true do
                v3 = nil
                v2 = workspace:Raycast(UnitRay.Origin, UnitRay.Direction * 500, v6)
                if v2 then
                    Instance = v2.Instance
                    v4 = Instance.Name == "Hitbox"
                    if Instance.Transparency == 1 and not v4 and not Instance:HasTag("CanHitRay") then
                        v6:AddToFilter(v2.Instance)
                        if not v2 then
                            break
                        end
                        continue
                    end
                    v5 = nil
                    v1 = nil
                    for i, j in u77, v5, v1 do
                        if a1 and i ~= "Towers" then
                            continue
                        end
                        if v2.Instance:IsDescendantOf(j) then
                            v3 = i
                            break
                        end
                    end
                    if v3 then
                        if v3 ~= "Enemies" or not v4 or Instance:HasTag("CanHitRay") then
                            break
                        end
                    end
                    v6:AddToFilter(v2.Instance)
                end
                if not v2 then
                    break
                end
            end
            return v2, v3
        end

        local function getModelRootFromInstance(a1) -- Line: 214 -- types: a1: userdata
            if a1:IsA("Model") then
                return a1
            end
            local Parent = a1
            while true do
                Parent = Parent.Parent
                if Parent then
                    if Parent:IsA("Model") then
                        if not Parent:FindFirstChild("HumanoidRootPart")
                            and not Parent:FindFirstChild("RootPart") then
                            if Parent then
                                continue
                            end
                            return nil
                        end
                        if not Parent:GetAttribute("Ignore") then
                            return Parent
                        end
                    end
                end
                if not Parent then
                    return nil
                end
            end
        end

        local HoverGui = Primary:WaitForChild("HoverGui")
        local u123 = false
        local u124 = nil

        local function updateStore(a1, a2) -- Line: 239
            -- upvalues: TooltipStore (upval), table (upval), u123 (ref)
            local v1 = TooltipStore.getState()
            local v2 = TooltipStore.getPosition()
            local v3 = false
            if a2.tooltipPosition ~= nil then
                v3 = a2.tooltipPosition ~= v2
            end
            if v1.tooltipType ~= a1
                or v3
                or a2.tooltipValue and v1.tooltipValue and not table.deepCompare(a2.tooltipValue, v1.tooltipValue) then
                a2.tooltipType = a1
                TooltipStore.update(a2)
            end
            u123 = true
        end

        local u126 = {}
        u126.Units = HoverGui:WaitForChild("Units")
        u126.Towers = HoverGui:WaitForChild("Towers")
        u126.Enemies = HoverGui:WaitForChild("Enemies")
        u126.Keybinds = HoverGui:WaitForChild("Keybinds")
        local u143 = {}

        function u143.Units(a1) -- Line: 270
            -- upvalues: UnitReplicator (upval), updateStore (val), ServerTicks (val), Enum (upval)
            local Frame = a1.Frame
            local Model = a1.Model
            local RootPointer = Model:FindFirstChild("RootPointer") and UnitReplicator.GetNPCFromFolder(Model:FindFirstChild("RootPointer").Value)
            if Frame and RootPointer then
                if not RootPointer.Health then
                    RootPointer.Replicator:RefreshValueObjects(RootPointer)
                end
                local v1 = RootPointer.Defense or 0
                if v1 ~= 0 then
                    v1 = v1 .. "%"
                end
                local Name = RootPointer.Name
                local OwnerName = RootPointer.OwnerName
                local v2 = OwnerName and not (OwnerName == "") and OwnerName .. "'s " .. Name or Name
                local v3 = {tooltipPosition = a1.Position}
                local v4 = {
                    IsEnemy = false,
                    Name = v2,
                    Health = RootPointer.Health,
                    MaxHealth = RootPointer.MaxHealth,
                }
                v4.TimeLeft = if not RootPointer.Lifespan then nil else if not RootPointer.MaxLifespan then nil else RootPointer.MaxLifespan - (ServerTicks.getTime() - RootPointer.Lifespan)
                v4.MaxTimeLeft = RootPointer.MaxLifespan
                v4.Shield = RootPointer.Shield or 0
                v4.Model = Model
                v4.NoHealth = RootPointer.NoHealth
                local v5 = {}
                local v6 = RootPointer.StatusEffectRenderer and RootPointer.StatusEffectRenderer:has(Enum.StatusEffect.HiddenDetection) or false
                v5.Hidden = v6
                v6 = RootPointer.StatusEffectRenderer and RootPointer.StatusEffectRenderer:has(Enum.StatusEffect.LeadDetection) or false
                v5.Lead = v6
                v6 = RootPointer.StatusEffectRenderer and RootPointer.StatusEffectRenderer:has(Enum.StatusEffect.FlyingDetection) or false
                v5.Flying = v6
                v6 = RootPointer.StatusEffectRenderer and RootPointer.StatusEffectRenderer:has(Enum.StatusEffect.FreezeImmune) or false
                v5.FreezeImmune = v6
                v4.Detections = v5
                v4.Stats = {
                    Damage = RootPointer.Damage,
                    ExplosionDamage = RootPointer.ExplosionDamage,
                    Cooldown = RootPointer.Cooldown,
                    Range = RootPointer.Range,
                    Defense = v1,
                }
                v3.tooltipValue = v4
                updateStore("Health", v3)
                return
            end
        end

        function u143.Enemies(a1) -- Line: 343
            -- upvalues: NPCReplicator (upval), Enum (upval), updateStore (val), u124 (ref), LegacyMiddleware (upval)
            local Frame = a1.Frame
            local Model = a1.Model
            local u10 = NPCReplicator.GetNPCFromFolder(Model:WaitForChild("RootPointer").Value)
            if Frame and u10 then
                if not u10.Health then
                    u10.Replicator:RefreshValueObjects(u10)
                end
                local Name = u10.Name
                local OwnerName = u10.OwnerName
                local v1 = OwnerName and not (OwnerName == "") and OwnerName .. "'s " .. Name or Name
                local v2 = u10.Defense or 0
                if v2 ~= 0 then
                    v2 = v2 .. "%"
                end
                local v3 = u10.StatusEffectRenderer:get(Enum.StatusEffect.Bleed)
                local v4 = u10.StatusEffectRenderer:get(Enum.StatusEffect.Bees)
                local v5 = {tooltipPosition = a1.Position}
                local v6 = {
                    IsEnemy = true,
                    Name = v1,
                    Health = u10.Health,
                    MaxHealth = u10.MaxHealth,
                    Shield = u10.Shield or 0,
                    Model = Model,
                }
                local v7 = {
                    Hidden = u10.StatusEffectRenderer:has(Enum.StatusEffect.Hidden),
                    Lead = u10.StatusEffectRenderer:has(Enum.StatusEffect.Lead),
                    Flying = u10.StatusEffectRenderer:has(Enum.StatusEffect.Flying),
                    Boss = u10.StatusEffectRenderer:has(Enum.StatusEffect.Boss),
                    Ghost = u10.StatusEffectRenderer:has(Enum.StatusEffect.Ghost),
                }
                local v8 = u10.StatusEffectRenderer:has(Enum.StatusEffect.Slimed) or u10.StatusEffectRenderer:has(Enum.StatusEffect.Slow)
                v7.Slowed = v8
                v7.EnergyImmune = u10.StatusEffectRenderer:has(Enum.StatusEffect.EnergyImmune)
                v7.FireImmune = u10.StatusEffectRenderer:has(Enum.StatusEffect.FireImmune)
                v7.FreezeImmune = u10.StatusEffectRenderer:has(Enum.StatusEffect.FreezeImmune)
                v7.StunImmune = u10.StatusEffectRenderer:has(Enum.StatusEffect.StunImmune)
                v7.HealthRegen = u10.StatusEffectRenderer:has(Enum.StatusEffect.HealthRegen)
                v7.Slime = u10.StatusEffectRenderer:has(Enum.StatusEffect.Slime)
                v7.Nimble = u10.StatusEffectRenderer:has(Enum.StatusEffect.Nimble)
                v7.Bloated = u10.StatusEffectRenderer:has(Enum.StatusEffect.Bloated)
                v7.Tank = u10.StatusEffectRenderer:has(Enum.StatusEffect.Tank)
                v7.Aggro = u10.StatusEffectRenderer:has(Enum.StatusEffect.Aggro)
                v7.MoltenCorpse = u10.StatusEffectRenderer:has(Enum.StatusEffect.MoltenCorpse)
                v7.Ignore = u10.StatusEffectRenderer:has(Enum.StatusEffect.Ignore)
                v7.Blessed = u10.StatusEffectRenderer:has(Enum.StatusEffect.Blessed)
                v7.HiddenExposed = u10.StatusEffectRenderer:has(Enum.StatusEffect.HiddenExposed)
                v7.Neuralyzed = u10.StatusEffectRenderer:has(Enum.StatusEffect.Neuralyzed)
                v6.Detections = v7
                v7 = {Defense = v2}
                v8 = v3 and ("x %*"):format(v3.stacks) or nil
                v7.Bleed = v8
                v8 = v4 and ("x %*"):format(v4.stacks) or nil
                v7.Bee = v8
                v6.Stats = v7
                v5.tooltipValue = v6
                updateStore("Health", v5)
                if u124 ~= Model then
                    LegacyMiddleware:RunFunction(Enum.HookType.OnEnemyHovered, nil, function() -- Line: 458 -- upvalues: u10 (val)
                        return u10
                    end)
                    u124 = Model
                end
                return
            end
        end

        function u143.Towers(a1) -- Line: 466
            -- upvalues: TowerReplicator (upval), TowerDisplayName (upval), LocalPlayer (upval), UsernameFromId (val)
            -- upvalues: updateStore (val)
            local Model = a1.Model
            local v1 = TowerReplicator.getTowerByModel(Model)
            if not v1 then
                return
            end
            local v2 = TowerDisplayName.resolve(v1.Name, v1, Model)
            local OwnerId = v1.OwnerId
            local v3 = OwnerId == LocalPlayer.UserId
            local v4 = nil
            if not v3 then
                v4 = v1.OwnerName or UsernameFromId(OwnerId)
            end
            updateStore("Tower", {
                tooltipPosition = a1.Position,
                tooltipValue = {
                    Name = v2,
                    Level = v1.Upgrade,
                    Owner = v4,
                    Model = Model,
                    Ammo = v1.Ammo,
                    MaxAmmo = v1.MaxAmmo,
                },
            })
        end

        local function cleanTowerCloneState() -- Line: 499
            -- upvalues: ClientAtoms (val), table (upval), UserInputService (upval)
            local v1 = ClientAtoms.cloneTowerAtom()
            if v1.enabled and v1.selected then
                ClientAtoms.cloneTowerAtom(function(a1) -- Line: 503 -- upvalues: table (upval), UserInputService (upval)
                    local v1 = table.clone(a1)
                    v1.selected = nil
                    UserInputService.MouseIcon = ""
                    return v1
                end)
            end
        end

        Scheduler.add("UserInput", RunService.Heartbeat, function() -- Line: 515
            -- upvalues: u123 (ref), u126 (val), Mouse (val), ClientAtoms (val), updateStore (val)
            -- upvalues: EnemySelectionCursorController (val), castRay (val), u143 (val), TooltipStore (upval)
            -- upvalues: getModelRootFromInstance (val), table (upval), TowerReplicator (upval), LocalPlayer (upval)
            -- upvalues: Enum (upval), UserInputService (upval)
            local v1
            debug.profilebegin("MouseHoverGui")
            u123 = false
            u126.Keybinds.Position = UDim2.fromOffset(Mouse.X + 25, Mouse.Y + 10)
            if ClientAtoms.towerSelectorAtom().enabled or EnemySelectionCursorController.isActive() then
                updateStore("None", {})
                return
            end
            local v2, v3 = castRay()
            local Instance = v2 and v2.Instance
            local Position = v2 and v2.Position
            if Instance and Position and v3 then
                v1 = u126[v3]
                if v1 then
                    local v4 = Instance:IsA("BasePart") and Instance.Name == "GridPart"
                    if v4 then
                        updateStore("None", {})
                        debug.profileend()
                        return
                    end
                    local v5 = u143[v3]
                    local v6 = TooltipStore.getState()
                    local v7 = ClientAtoms.cloneTowerAtom()
                    if v5 then
                        local u70 = getModelRootFromInstance(Instance)
                        if u70 then
                            if v7.enabled then
                                if v5 == u143.Towers then
                                    ClientAtoms.cloneTowerAtom(function(a1) -- Line: 566
                                        -- upvalues: table (upval), TowerReplicator (upval), u70 (val)
                                        -- upvalues: LocalPlayer (upval), Enum (upval), UserInputService (upval)
                                        local v1
                                        local v2 = table.clone(a1)
                                        local v3 = TowerReplicator.getTowerByModel(u70)
                                        local v4 = a1.allowHolograms == true
                                        local v5 = (v3 and (v3.OwnerId or v3.Replicator:Get("OwnerId"))) == LocalPlayer.UserId
                                        local v6 = true
                                        if a1.ownedTowersOnly == true then
                                            v6 = v5
                                        end
                                        local v7 = false
                                        if not v3 or type(a1.dontSelectList) ~= "table" then
                                            v1 = a1
                                        else
                                            local Name = v3.State and v3.State.Name or v3.Name
                                            if type(Name) ~= "string" then
                                                v1 = a1
                                            else
                                                local v8 = nil
                                                local v9 = nil
                                                v1 = a1
                                                for i, j in a1.dontSelectList, v8, v9 do
                                                    if type(i) == "number" and j == Name then
                                                        v7 = true
                                                        break
                                                    end
                                                    if type(i) == "string" and i == Name and j == true then
                                                        v7 = true
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        if not v3
                                            or v3.Model == v1.dontSelectModel
                                            or v3.Name == v1.dontSelect
                                            or v7
                                            or not v6 then
                                            v2.selected = nil
                                        elseif v4 then
                                            v2.selected = v3
                                        elseif v3.Replicator:Get(Enum.StatusEffect.Hologram) then
                                            v2.selected = nil
                                        else
                                            v2.selected = v3
                                        end
                                        UserInputService.MouseIcon = if not v2.selected then "" else "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
                                        return v2
                                    end)
                                end
                                return
                            end
                            coroutine.wrap(v5)({
                                Frame = v1,
                                Model = u70,
                                Position = UDim2.fromOffset(Mouse.X + 10, Mouse.Y),
                            })
                        end
                    elseif v6.tooltipType ~= "None" then
                        updateStore("None", {})
                    end
                end
                if not u123 then
                    updateStore("None", {})
                end
                debug.profileend()
                return
            end
            v1 = ClientAtoms.cloneTowerAtom()
            if v1.enabled and v1.selected then
                ClientAtoms.cloneTowerAtom(function(a1) -- Line: 503 -- upvalues: table (upval), UserInputService (upval)
                    local v1 = table.clone(a1)
                    v1.selected = nil
                    UserInputService.MouseIcon = ""
                    return v1
                end)
            end
            for k, v in pairs(u126) do
                if v.Visible and v.Name ~= "Keybinds" then
                    v.Visible = false
                end
            end
            if not u123 then
                updateStore("None", {})
            end
            debug.profileend()
        end)
        local u155 = tick()
        UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 674
            -- upvalues: TowerSelectionCursorController (val), EnemySelectionCursorController (val), VRService (upval)
            -- upvalues: ClientAtoms (val), Charm (val), table (upval), NewPlacementController (val)
            -- upvalues: PathPlacementCursorController (val), castRay (val), getModelRootFromInstance (val)
            -- upvalues: upgradeHandler (val)
            if a2 then
                return
            end
            if not TowerSelectionCursorController.isActive() and not EnemySelectionCursorController.isActive() then
                local v1 = true
                if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v1 = false
                    if a1.KeyCode == Enum.KeyCode.ButtonR2 then
                        v1 = not VRService.VREnabled
                    end
                end
                if not v1 then
                    return
                end
                if ClientAtoms.cloneTowerAtom().enabled == true then
                    if not Charm.untracked(ClientAtoms.cloneTowerAtom).selected then
                        return
                    end
                    ClientAtoms.cloneTowerAtom(function(a1) -- Line: 153 -- upvalues: table (upval)
                        local v1 = table.clone(a1)
                        v1.isCloning = true
                        return v1
                    end)
                    return
                end
                local Place = if not NewPlacementController.Active then if not PathPlacementCursorController.active then nil else PathPlacementCursorController.Place else NewPlacementController.Place
                if Place then
                    return Place:Fire()
                end
                local v2, v3 = castRay(true)
                if v3 == "Towers" then
                    local Instance = v2 and v2.Instance
                    local v4 = Instance and getModelRootFromInstance(Instance)
                    if ClientAtoms.towerSelectorAtom().enabled then
                        return
                    end
                    if v4 and upgradeHandler:getTroopModel() ~= v4 then
                        return upgradeHandler:selectTroop(v4, "ScreenGui")
                    end
                end
                return upgradeHandler:clearTroop()
            end
        end)
        UserInputService.TouchTapInWorld:Connect(function(a1, a2) -- Line: 720
            -- upvalues: u155 (ref), TowerSelectionCursorController (val), EnemySelectionCursorController (val)
            -- upvalues: NewPlacementController (val), PathPlacementCursorController (val), ClientAtoms (val)
            -- upvalues: Charm (val), table (upval), castRay (val), getModelRootFromInstance (val), upgradeHandler (val)
            if a2 then
                return
            end
            if not (tick() - u155 < 0.4) then
                u155 = tick()
            end
            if not TowerSelectionCursorController.isActive() and not EnemySelectionCursorController.isActive() then
                local v1
                local Place = if not NewPlacementController.Active then if not PathPlacementCursorController.active then nil else PathPlacementCursorController.Place else NewPlacementController.Place
                if v1 and ClientAtoms.cloneTowerAtom().enabled == true then
                    if not Charm.untracked(ClientAtoms.cloneTowerAtom).selected then
                        return
                    end
                    ClientAtoms.cloneTowerAtom(function(a1) -- Line: 153 -- upvalues: table (upval)
                        local v1 = table.clone(a1)
                        v1.isCloning = true
                        return v1
                    end)
                    return
                end
                if v1 and Place then
                    return Place:Fire()
                end
                local v2, v3 = castRay(true)
                if v3 == "Towers" then
                    local Instance = v2 and v2.Instance
                    local v4 = Instance and getModelRootFromInstance(Instance)
                    if v4 and upgradeHandler:getTroopModel() ~= v4 then
                        if ClientAtoms.towerSelectorAtom().enabled then
                            return
                        end
                        return upgradeHandler:selectTroop(v4, "ScreenGui")
                    end
                end
                return upgradeHandler:clearTroop()
            end
        end)
    end,
}
task.spawn(v1.init)
return v1