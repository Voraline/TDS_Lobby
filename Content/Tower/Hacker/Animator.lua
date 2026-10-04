-- Script path: ReplicatedStorage.Content.Tower.Hacker.Animator
-- Decompile time: 25.20 ms

local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local AudioUtil = require(ReplicatedStorage.Shared.Modules.AudioUtil)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local Sift = require(ReplicatedStorage.Packages.Sift)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local HackerAssets = ReplicatedStorage.Assets.HackerAssets

local function watchValue(a1, a2) -- Line: 36 -- upvalues: RunService (val)
    local u2 = nil
    local u3 = false
    local u4 = false
    local u5 = nil

    local function disconnect() -- Line: 42 -- upvalues: u4 (ref), u5 (ref)
        u4 = true
        if u5 then
            u5:Disconnect()
        end
    end

    local function update() -- Line: 49 -- upvalues: u4 (ref), a1 (val), u3 (ref), u2 (ref), a2 (val), disconnect (val)
        if u4 then
            return
        end
        local v1 = a1()
        if u3 and v1 == u2 then
            return
        end
        u3 = true
        u2 = v1
        a2(v1, disconnect)
    end

    task.defer(update)
    local v1 = RunService.Heartbeat:Connect(update)
    return disconnect
end

local u140 = {
    Default = 1,
    ["Camera Operator"] = 1,
    Fallen = 0.6,
    Triumphant = 0.6,
    ["Reindeer Mech"] = 1,
    ["Pool Day"] = 1,
}
local u147 = {}

function u147.Default(a1) -- Line: 80
    return {
        Beam = {
            ["0"] = {
                id = 139641729362294,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
        },
        Drone = {
            id = 78429066268308,
            looped = true,
            volume = 0.3,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 35,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Static = {
            id = 71067900135403,
            looped = true,
            volume = 0.8,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 25,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Convert = {id = 78215271275872, volume = 0.3, soundGroupName = "Towers"},
        TowerSpawn = {id = 72300358731924, volume = 0.9, soundGroupName = "Towers"},
        Levels = {
            ["0"] = {
                phone = {
                    id = 79639094922428,
                    looped = true,
                    volume = 0.16,
                    soundGroupName = "Towers",
                    parent = a1.PrimaryPart,
                    emitter = {
                        RollOffMaxDistance = 18,
                        RollOffMinDistance = 6,
                        RollOffMode = Enum.RollOffMode.InverseTapered,
                    },
                },
            },
            ["5a"] = {
                wrist = {
                    id = 83642289299486,
                    looped = true,
                    volume = 0.16,
                    soundGroupName = "Towers",
                    parent = a1.PrimaryPart,
                    emitter = {
                        RollOffMaxDistance = 18,
                        RollOffMinDistance = 6,
                        RollOffMode = Enum.RollOffMode.InverseTapered,
                    },
                },
            },
            ["5b"] = {
                wrist = {
                    id = 103961456640115,
                    looped = true,
                    volume = 0.16,
                    soundGroupName = "Towers",
                    parent = a1.PrimaryPart,
                    emitter = {
                        RollOffMaxDistance = 18,
                        RollOffMinDistance = 6,
                        RollOffMode = Enum.RollOffMode.InverseTapered,
                    },
                },
            },
        },
    }
end

function u147.Fallen(a1) -- Line: 171
    return {
        Beam = {
            ["0"] = {
                id = 131598497404223,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
        },
        Drone = {
            id = 78587634279834,
            looped = true,
            volume = 0.3,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 35,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Static = {
            id = 71067900135403,
            looped = true,
            volume = 0.8,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 25,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Convert = {id = 139451716470473, volume = 0.3, soundGroupName = "Towers"},
        TowerSpawn = {id = 88275867898676, volume = 0.9, soundGroupName = "Towers"},
        Levels = {
            ["0"] = {
                stars = {
                    id = 78587634279834,
                    looped = true,
                    volume = 0.16,
                    soundGroupName = "Towers",
                    parent = a1.PrimaryPart,
                    emitter = {
                        RollOffMaxDistance = 18,
                        RollOffMinDistance = 6,
                        RollOffMode = Enum.RollOffMode.InverseTapered,
                    },
                },
            },
        },
    }
end

u147["Reindeer Mech"] = function(a1) -- Line: 233
    return {
        Beam = {
            ["0"] = {
                id = 96403774525292,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
            ["3"] = {
                id = 82929186711604,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
            ["5a"] = {
                id = 119241559180360,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
            ["5b"] = {
                id = 116674940092005,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
        },
        Drone = {
            id = 78429066268308,
            looped = true,
            volume = 0.3,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 35,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Static = {
            id = 71067900135403,
            looped = true,
            volume = 0.8,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 25,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Convert = {id = 136190738422478, volume = 0.3, soundGroupName = "Towers"},
        TowerSpawn = {id = 72300358731924, volume = 0.9, soundGroupName = "Towers"},
    }
end

u147["Camera Operator"] = function(a1) -- Line: 299
    return {
        Beam = {
            ["0"] = {
                id = 79826033022326,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
        },
        Drone = {
            id = 78429066268308,
            looped = true,
            volume = 0.3,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 35,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Static = {
            id = 71067900135403,
            looped = true,
            volume = 0.8,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 25,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Convert = {id = 78215271275872, volume = 0.3, soundGroupName = "Towers"},
        TowerSpawn = {id = 72300358731924, volume = 0.9, soundGroupName = "Towers"},
        Levels = {
            ["5b"] = {
                phone = {
                    id = 79639094922428,
                    looped = true,
                    volume = 0.16,
                    soundGroupName = "Towers",
                    parent = a1.PrimaryPart,
                    emitter = {
                        RollOffMaxDistance = 18,
                        RollOffMinDistance = 6,
                        RollOffMode = Enum.RollOffMode.InverseTapered,
                    },
                },
            },
        },
    }
end

u147["Pool Day"] = function(a1) -- Line: 361
    return {
        Beam = {
            ["0"] = {
                id = 133333244329511,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
            ["5a"] = {
                id = 136965139130933,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
            ["5b"] = {
                id = 136965139130933,
                looped = true,
                volume = 0.3,
                soundGroupName = "Towers",
                parent = a1.PrimaryPart,
            },
        },
        Drone = {
            id = 123725627033001,
            looped = true,
            volume = 0.3,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 35,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Static = {
            id = 138796654663847,
            looped = true,
            volume = 0.8,
            soundGroupName = "Towers",
            emitter = {
                RollOffMaxDistance = 25,
                RollOffMinDistance = 6,
                RollOffMode = Enum.RollOffMode.InverseTapered,
            },
        },
        Convert = {id = 78767752008021, volume = 0.3, soundGroupName = "Towers"},
        TowerSpawn = {id = 135102143458405, volume = 0.9, soundGroupName = "Towers"},
        Levels = {
            ["0"] = {
                phone = {
                    id = 92303747784433,
                    looped = true,
                    volume = 0.16,
                    soundGroupName = "Towers",
                    parent = a1.PrimaryPart,
                    emitter = {
                        RollOffMaxDistance = 18,
                        RollOffMinDistance = 6,
                        RollOffMode = Enum.RollOffMode.InverseTapered,
                    },
                },
            },
        },
    }
end

u147.Triumphant = u147.Fallen
local u154 = {}

function u154.Default(a1, a2) -- Line: 442 -- upvalues: TimescaleUtilities (val), TweenService (val)
    a2.Value = 0
    TimescaleUtilities.Delay(0.2, function() -- Line: 444 -- upvalues: TweenService (upval), a2 (val), a1 (val)
        local v1, v2, v3, v4
        TweenService:Create(a2, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Value = 1}):Play()
        for i, j in a1:GetChildren() do
            if string.find(j.Name, "Prop") then
                v3 = TweenService
                v4 = TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                v3:Create(j, v4, {Transparency = 0.3}):Play()
                for k, n in j.TailTexture:GetChildren() do
                    if n:IsA("Decal") then
                        v1 = TweenService
                        v2 = TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                        v1:Create(n, v2, {Transparency = 0.6}):Play()
                    end
                end
            end
        end
    end)
end

u154["Camera Operator"] = function(a1, a2) -- Line: 478 -- upvalues: TimescaleUtilities (val), TweenService (val)
    a2.Value = 0
    TimescaleUtilities.Delay(0.2, function() -- Line: 480 -- upvalues: TweenService (upval), a2 (val), a1 (val)
        local v1, v2, v3, v4
        TweenService:Create(a2, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Value = 1}):Play()
        for i, j in a1:GetChildren() do
            if string.find(j.Name, "Prop") then
                v3 = TweenService
                v4 = TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                v3:Create(j, v4, {Transparency = 0.3}):Play()
                for k, n in j.TailTexture:GetChildren() do
                    if n:IsA("Decal") then
                        v1 = TweenService
                        v2 = TweenInfo.new(8, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
                        v1:Create(n, v2, {Transparency = 0.6}):Play()
                    end
                end
            end
        end
    end)
end

function u154.Fallen(a1, a2) -- Line: 514 -- upvalues: TweenService (val)
    a2.Value = 0
    TweenService:Create(a2, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Value = 1}):Play()
end

function u154.Trumphant(a1, a2) -- Line: 525 -- upvalues: TweenService (val)
    a2.Value = 0
    TweenService:Create(a2, TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Value = 1}):Play()
end

local v1 = {}
v1.__index = v1

local function changeTowerCloneAtom(a1) -- Line: 540 -- upvalues: ClientAtoms (val), table (val)
    ClientAtoms.cloneTowerAtom(function(a1_2) -- Line: 541 -- upvalues: table (upval), a1 (val)
        local v1 = table.clone(a1_2)
        for k, v in pairs(a1) do
            v1[k] = v
        end
        return v1
    end)
end

local function clickedAtom() -- Line: 550 -- upvalues: ClientAtoms (val)
    return ClientAtoms.cloneTowerAtom().isCloning
end

function v1.Initialize(a1) -- Line: 554
    -- upvalues: HackerAssets (val), u147 (val), Maid (val), Sound (val), Notification (val), TimescaleUtilities (val)
    -- upvalues: EmitterManager (val), Sift (val), EasySound (val), table (val), AudioUtil (val), TagReplicator (val)
    -- upvalues: TweenService (val)
    local u6 = HackerAssets:WaitForChild(a1.Model.Name)
    a1._sounds = {}
    a1._levelSounds = {}
    a1._activeLevelPlayers = {}
    for i, j in u147[a1.Model.Name](a1.Model) do
        if i == "Levels" then
            a1._levelSounds = j
        else
            a1._sounds[i] = j
        end
    end
    a1._raycastParams = RaycastParams.new()
    a1._raycastParams.FilterType = Enum.RaycastFilterType.Include
    a1._raycastParams.FilterDescendantsInstances = {
        workspace:WaitForChild("Ground"),
        workspace:WaitForChild("Cliff"),
        workspace:WaitForChild("Map"),
        workspace.Terrain,
    }
    a1._cloningMaid = Maid.new()
    a1.Executables = {
        ErrorMessage = function(a1, a2) -- Line: 580 -- upvalues: Sound (upval), Notification (upval)
            if a1 ~= game.Players.LocalPlayer then
                return
            end
            Sound("Error"):Play(true)
            Notification.Create({Text = a2, Color = Color3.fromRGB(236, 0, 0)})
        end,
        Drone = function(...) -- Line: 591 -- upvalues: a1 (val)
            a1:_playAnimation("Ability")
            a1:_drone(...)
        end,
        WireFraud = function(a1_2) -- Line: 595 -- upvalues: TimescaleUtilities (upval), a1 (val), EmitterManager (upval)
            if a1_2 and a1_2.Parent then
                local Pivot = a1_2:GetPivot()
                TimescaleUtilities.Delay(0.15, function() -- Line: 601 -- upvalues: a1 (upval), Pivot (val), EmitterManager (upval), TimescaleUtilities (upval)
                    local v1 = a1._assets.CashReward.Part:Clone()
                    v1.Parent = workspace.Trash
                    v1.CFrame = Pivot
                    EmitterManager.manualEmit(v1)
                    TimescaleUtilities.CleanUp(v1, 3)
                end)
                return
            end
        end,
        Corrupt = function(a1_2) -- Line: 609 -- upvalues: Sift (upval), a1 (val), EasySound (upval)
            if a1_2 and a1_2.Parent then
                local Attribute, Attribute_2, Feet, PrimaryPart, RigidConstraint, WeldConstraint, v1
                local v2 = Sift.Dictionary.merge(a1._sounds.Convert, {position = a1_2:GetPivot().Position})
                EasySound.Play(v2)
                local v3 = a1_2
                for i, j in a1._assets.Corrupt:GetChildren() do
                    v1 = j:Clone()
                    Attribute = v1:GetAttribute("WeldTo")
                    PrimaryPart = if not Attribute then v3.PrimaryPart else if not v3:FindFirstChild(Attribute) then v3.PrimaryPart else v3[Attribute]
                    Feet = v1:FindFirstChild("Feet", true)
                    if Feet then
                        Feet.CFrame = v3.PrimaryPart.Node.CFrame
                    end
                    for k, n in v3:GetDescendants() do
                        if n:IsA("BasePart") then
                            n.Material = Enum.Material.ForceField
                            Attribute_2 = a1._assets.Beams.Beam:GetAttribute("Color") or Color3.new(1, 1, 1)
                            n.Color = Attribute_2
                            n.LocalTransparencyModifier = -2
                        elseif n:IsA("SurfaceAppearance") then
                            n:Destroy()
                        end
                    end
                    if PrimaryPart then
                        if not PrimaryPart:IsA("Bone") then
                            v1.CFrame = PrimaryPart.CFrame
                            v1.Parent = PrimaryPart
                            WeldConstraint = Instance.new("WeldConstraint")
                            WeldConstraint.Part0 = v1
                            WeldConstraint.Part1 = PrimaryPart
                            WeldConstraint.Parent = v1
                        else
                            v1.CFrame = PrimaryPart.WorldCFrame
                            RigidConstraint = Instance.new("RigidConstraint")
                            RigidConstraint.Parent = v1
                            RigidConstraint.Attachment0 = v1:FindFirstChild("Attachment")
                            RigidConstraint.Attachment1 = PrimaryPart
                        end
                    end
                end
                return
            end
        end,
        TowerCloneEffect = function(a1_2) -- Line: 665
            -- upvalues: a1 (val), EmitterManager (upval), Sift (upval), EasySound (upval), TimescaleUtilities (upval)
            local ExtentsSize = a1_2:GetExtentsSize()
            local v1 = a1._assets.TowerClone.Part:Clone()
            v1.Anchored = true
            v1.CanCollide = false
            v1.Parent = workspace.Trash
            v1.Size = ExtentsSize
            v1.CFrame = a1_2.PrimaryPart.CFrame
            EmitterManager.manualEmit(v1)
            local v2 = Sift.Dictionary.merge(a1._sounds.Convert, {parent = a1_2.PrimaryPart})
            local u33 = EasySound.Play(v2)
            local v3 = Sift.Dictionary.merge(a1._sounds.Static, {parent = a1_2.PrimaryPart})
            local u46 = EasySound.Play(v3)
            a1_2.Destroying:Once(function() -- Line: 687 -- upvalues: EasySound (upval), u33 (val), u46 (val)
                EasySound.Destroy(u33)
                EasySound.Destroy(u46)
            end)
            TimescaleUtilities.CleanUp(v1, 3)
        end,
    }
    a1.AbilityCallbacks = {
        ["Hologram Tower"] = function() -- Line: 695 -- upvalues: a1 (val), Sound (upval)
            a1:_cancelCloning()
            local v1, v2 = a1:_getTowerToClone()
            if v1 and v2 then
                Sound("Place"):Play(true)
                return {towerToClone = v1.Model, towerPosition = v2}
            end
            return nil
        end,
    }
    a1._beamTargets = {}
    a1._beams = {}
    a1._assets = {}
    a1.Maid:Mark(function() -- Line: 716 -- upvalues: a1 (val)
        for i, j in a1._beams do
            j:Destroy()
        end
    end)

    local function getAssetsByPathAndLevel(a1, a2) -- Line: 722 -- upvalues: u6 (val)
        local v1, v2, v3
        local v4 = {}
        local v5, v6 = a2, a1
        for i, j in u6:GetChildren() do
            v2 = nil
            v3 = if not v5 or not (v5 > 0) then nil else string.char(96 + v5)
            for k = 0, v6 do
                if not v3 then
                    v1 = tostring(k)
                    if j:FindFirstChild(v1) then
                        v2 = j[tostring(k)]
                    end
                else
                    v1 = ("%*%*"):format(k, v3)
                    if not j:FindFirstChild(v1) then
                        v1 = tostring(k)
                        if j:FindFirstChild(v1) then
                            v2 = j[tostring(k)]
                        end
                    else
                        v2 = j[("%*%*"):format(k, v3)]
                    end
                end
            end
            if v2 then
                v4[j.Name] = v2
            end
        end
        return v4
    end

    local function updateModelAssets() -- Line: 743 -- upvalues: a1 (val), getAssetsByPathAndLevel (val)
        a1._assets = getAssetsByPathAndLevel(a1.Upgrade, a1.Path)
    end

    local function updateSounds() -- Line: 747
        -- upvalues: a1 (val), EasySound (upval), table (upval), AudioUtil (upval)
        local v1 = if not a1.Path or not (0 < a1.Path) then nil else string.char(96 + a1.Path)
        local Upgrade = a1.Upgrade
        local v2 = ("%*%*"):format(Upgrade, v1)
        if v1 == nil then
            v2 = tostring(Upgrade)
        end
        local _currentBeamLevel = a1._sounds.Beam[v2] and v2 or a1._currentBeamLevel or "0"
        local v3 = a1._sounds.Beam[_currentBeamLevel]
        if not a1._beamSound or a1._beamSound and v3 and "rbxassetid://" .. v3.id ~= a1._beamSound.AudioContent then
            if a1._beamSound then
                EasySound.Destroy(a1._beamSound)
                a1._beamSound = nil
            end
            a1._beamSound = EasySound.Create(v3)
            a1._currentBeamLevel = _currentBeamLevel
        end
        if a1._levelSounds[v2] then
            local v4
            if a1._previousLevel then
                for i, j in a1._activeLevelPlayers do
                    j:Stop()
                    EasySound.Destroy(j)
                end
            end
            table.clear(a1._activeLevelPlayers)
            for k, n in a1._levelSounds[v2] do
                v4 = EasySound.Create(n)
                table.insert(a1._activeLevelPlayers, v4)
                AudioUtil.playSound(v4)
            end
            a1._previousLevel = v2
        end
    end

    a1._assets = getAssetsByPathAndLevel(a1.Upgrade, a1.Path)
    updateSounds()
    a1.Maid:Mark(function() -- Line: 797 -- upvalues: EasySound (upval), a1 (val)
        EasySound.Destroy(a1._beamSound)
        a1._beamSound = nil
    end)
    a1.OnUpgrade:Connect(function() -- Line: 802 -- upvalues: a1 (val), getAssetsByPathAndLevel (val), updateSounds (val)
        a1._assets = getAssetsByPathAndLevel(a1.Upgrade, a1.Path)
        updateSounds()
        for i, j in a1._beams do
            j:Destroy()
        end
        a1._beams = {}
        a1._beamTargets = {}
    end)
    local u88 = {}

    local function updateClonedTowers(a1) -- Line: 814
        -- upvalues: u88 (val), TagReplicator (upval), getAssetsByPathAndLevel (val)
        local Attribute, v1
        local v2 = nil
        local v3 = nil
        for i, j in a1, v2, v3 do
            if not u88[j] then
                u88[j] = true
                v1 = TagReplicator.getReplicatorEntityFromFolder(j:WaitForChild("TowerReplicator"))
                if v1 then
                    Attribute = getAssetsByPathAndLevel(v1:WaitForState("LevelUsed"), (v1:WaitForState("PathUsed"))).DroneBeams.Model:GetAttribute("Color") or Color3.new(1, 1, 1)
                    for k, n in j:GetDescendants() do
                        if n:IsA("BasePart") then
                            n.Color = Attribute
                            n.Material = Enum.Material.ForceField
                        elseif n:IsA("SurfaceAppearance") then
                            n:Destroy()
                        end
                    end
                end
            end
        end
    end

    ;(a1.Replicator:GetStateChangedSignal("ClonedTowers")):Connect(updateClonedTowers)
    updateClonedTowers(a1.Replicator:Get("ClonedTowers") or {})
    a1._playingBeam = false
    a1:Thread(function() -- Line: 848 -- upvalues: a1 (val), TweenService (upval), AudioUtil (upval), table (upval)
        local v1 = a1.Replicator:Get("MultipleTargets") or {}
        local v2 = a1:ScanReplace(v1)
        local Position = nil
        if #v2 > 0 then
            v1 = v2[1]
            if v1 and v1:IsA("Model") and v1.PrimaryPart then
                Position = v1.PrimaryPart.Position
            end
        end
        if Position and Position ~= Vector3.new(0, 0, 0) then
            v1 = a1:Face(Position, nil, false)
            a1.Model.PrimaryPart.CFrame = v1
        end
        if not (#v2 > 0) then
            if #v2 == 0 and a1._playingBeam then
                TweenService:Create(
                    a1._beamSound,
                    TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Volume = 0, PlaybackSpeed = 0.1}
                ):Play()
                a1._playingBeam = false
            end
        elseif not a1._playingBeam then
            a1._playingBeam = true
            TweenService:Create(
                a1._beamSound,
                TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Volume = 0.87, PlaybackSpeed = 1}
            ):Play()
            AudioUtil.playSound(a1._beamSound)
        elseif #v2 == 0 and a1._playingBeam then
            TweenService:Create(
                a1._beamSound,
                TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Volume = 0, PlaybackSpeed = 0.1}
            ):Play()
            a1._playingBeam = false
        end
        for i in a1._beamTargets do
            if not table.find(v2, i) then
                a1._beamTargets[i] = nil
                if a1._beams[i] then
                    a1._beams[i]:Destroy()
                    a1._beams[i] = nil
                end
            end
        end
        for j, k in v2 do
            a1._beamTargets[k] = k
        end
        a1:_updateBeams()
    end)
end

function v1:_updateBeams() -- Line: 905
    local v1
    for i in self._beamTargets do
        if not self._beams[i] then
            v1 = self._assets.Beams.Beam:Clone()
            v1.Parent = workspace.Trash
            self._beams[i] = v1
        end
    end
    for j, k in self._beams do
        if j.PrimaryPart and j.Parent and k.Parent and k.From.Parent and self.UpgradeFolder.BeamStart.Value then
            k.From.CFrame = self.UpgradeFolder.BeamStart.Value.WorldCFrame
            k.To.CFrame = j.PrimaryPart.CFrame
        end
    end
end

function v1:_playAnimation(a2, a3) -- Line: 927 -- types: self: table, a2: string
    return self:Animate(a2, nil, {a3 or 0.1})
end

function v1:_cancelCloning() -- Line: 931 -- upvalues: ClientAtoms (val), table (val)
    self._cloningMaid:Sweep()
    self._isCloning = false
    local u6 = {
        enabled = false,
        ownedTowersOnly = false,
        blockOtherAbilities = false,
        allowHolograms = false,
        isCloning = false,
        costPercent = 0,
        dontSelectList = {},
    }
    ClientAtoms.cloneTowerAtom(function(a1) -- Line: 541 -- upvalues: table (upval), u6 (val)
        local v1 = table.clone(a1)
        for k, v in pairs(u6) do
            v1[k] = v
        end
        return v1
    end)
    ClientAtoms.cloneTowerRangeRing({
        position = Vector3.new(0, 0, 0),
        enabled = true,
        range = 0,
        color = Color3.fromRGB(255, 255, 255),
    })
    self:ToggleReposition({enabled = false})
end

function v1:_drone(a2, a3) -- Line: 958
    -- upvalues: Maid (val), CatRom (val), u154 (val), Sift (val), EasySound (val), AudioUtil (val), Animation (val)
    -- upvalues: RunService (val), GameState (val), spr (val), u140 (val)
    local u5 = Maid.new()
    a2.Destroying:Connect(function() -- Line: 961 -- upvalues: u5 (ref)
        u5:Sweep()
        u5 = nil
    end)
    local u11 = 0
    local u17 = math.rad((math.random(-360, 360)))
    local v1 = a2.PrimaryPart.CFrame * CFrame.Angles(0, u17, 0)
    local v2 = workspace
    local v3 = self.Model.PrimaryPart.Position + Vector3.new(math.random(-4, 4), 20, (math.random(-4, 4)))
    local _raycastParams = self._raycastParams
    v2 = v2:Raycast(v3, Vector3.new(-0, -100, -0), _raycastParams)
    if not v2 then
        return
    end
    local u52 = self._assets.DroneModel.Model:Clone()
    for i, j in u52:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
        end
    end
    local ExtentsSize = u52:GetExtentsSize()
    u52.Parent = workspace.Trash
    u52.PrimaryPart.CFrame = (CFrame.new(v2.Position)) * CFrame.new(0, ExtentsSize.Y / 2, 0)
    u5:Mark(u52)
    local v4 = (v1:Lerp(u52.PrimaryPart.CFrame * CFrame.new(0, 20, 0), 0.5)) + Vector3.new(math.random(-8, 8), 0, (math.random(-8, 8)))
    local v5 = {}
    local v6 = u52.PrimaryPart.CFrame + Vector3.new(0, 1, 0) * ExtentsSize.Y / 2
    local v7 = u52.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
    local v8 = v1 * CFrame.new(0, 8, 3)
    v5[1] = v6
    v5[2] = v7
    v5[3] = v4
    v5[4] = v8
    v5[5] = v1 * CFrame.new(0, a2:GetExtentsSize().Y, 2)
    local u147 = CatRom.new(v5, 0.5, 0)
    local u152 = u147:SolveUniformLength() / a3
    local u153 = 0
    local u154_2 = 0
    local CFrameValue = Instance.new("CFrameValue")
    CFrameValue.Value = u52.PrimaryPart.CFrame
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 1
    if u154[self.Model.Name] then
        u154[self.Model.Name](u52, NumberValue)
    end
    local u176 = false

    local function droneBeam() -- Line: 1022 -- upvalues: u176 (ref), self (val), u52 (val), u5 (ref), a2 (val)
        if u176 then
            return
        end
        u176 = true
        local v1 = self._assets.DroneBeams.Model:Clone()
        v1.Parent = workspace.Trash
        v1.From.Transparency = 1
        v1.To.Transparency = 1
        local BeamValue = u52.PrimaryPart:FindFirstChild("BeamValue")
        if not BeamValue
            or not BeamValue:IsA("ObjectValue")
            or not BeamValue.Value
            or not BeamValue.Value:IsA("Attachment") then
            v1.From.CFrame = u52.PrimaryPart.Beam.WorldCFrame
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = v1.From
            WeldConstraint.Part1 = u52.PrimaryPart
            WeldConstraint.Parent = v1.From
            u5:Mark(WeldConstraint)
        else
            v1.From.CFrame = BeamValue.Value.WorldCFrame
            local RigidConstraint = Instance.new("RigidConstraint")
            RigidConstraint.Parent = v1.From
            RigidConstraint.Attachment0 = v1.From:FindFirstChildWhichIsA("Attachment")
            RigidConstraint.Attachment1 = BeamValue.Value
            u5:Mark(RigidConstraint)
        end
        local PrimaryPart = a2.PrimaryPart
        v1.To.CFrame = PrimaryPart.CFrame
        local WeldConstraint_2 = Instance.new("WeldConstraint")
        WeldConstraint_2.Part0 = v1.To
        WeldConstraint_2.Part1 = PrimaryPart
        WeldConstraint_2.Parent = v1.To
        u5:Mark(v1)
        u5:Mark(WeldConstraint_2)
    end

    local u191 = v1 * CFrame.new(0, a2:GetExtentsSize().Y, 2)
    local v9 = Sift.Dictionary.merge(self._sounds.Drone, {parent = u52.PrimaryPart})
    local u203 = EasySound.Create(v9)
    u5:Mark(function() -- Line: 1074 -- upvalues: EasySound (upval), u203 (ref)
        EasySound.Destroy(u203)
        u203 = nil
    end)
    AudioUtil.playSound(u203)
    local Animation_2 = u52:FindFirstChild("Animation")
    local AnimationController = u52:FindFirstChild("AnimationController")
    if AnimationController and Animation_2 then
        Animation.new({Track = Animation_2, Target = AnimationController}):Play()
    end
    local Position = u52.PrimaryPart.Position
    local v10 = RunService.Heartbeat:Connect(function(a1) -- Line: 1091
        -- upvalues: GameState (upval), u154_2 (ref), NumberValue (val), u153 (ref), u152 (val), droneBeam (val)
        -- upvalues: u191 (ref), a2 (val), u17 (val), u52 (val), u147 (val), Position (ref), spr (upval)
        -- upvalues: CFrameValue (val), u11 (ref), u140 (upval), self (val), u203 (ref)
        local v1 = a1 * GameState.TimeScale
        u154_2 = u154_2 + v1 * NumberValue.Value
        u153 = u153 + v1 / u152 * NumberValue.Value
        if u153 >= 1 then
            u153 = 1
            droneBeam()
            u191 = u191:Lerp(CFrame.new(
                (a2.PrimaryPart.CFrame * CFrame.new(0, a2:GetExtentsSize().Y, 2) * CFrame.Angles(0, u17, 0)).Position,
                a2.PrimaryPart.CFrame.Position + Vector3.new(0, 2.9000000953674316, 0)
            ), v1)
        end
        if u52 and u52.PrimaryPart and u52.PrimaryPart:FindFirstChild("Props") then
            local Angles, C0, v2
            for i, j in u52.PrimaryPart.Props:GetChildren() do
                C0 = j.C0
                Angles = CFrame.Angles
                v2 = math.rad(u154_2 * 5)
                j.C0 = C0 * Angles(0, v2, 0)
            end
        end
        local v3 = math.noise(u154_2 * 1, 0, 0) * 0.4
        local v4 = math.noise(0, u154_2 * 1, 0) * 0.5
        local v5 = math.noise(0, 0, u154_2 * 1.25) * 0.48
        local v6 = (CFrame.new(v3, v4, v5)) * CFrame.Angles(-v5 * 0.5, 0, v3 * 0.5)
        local v7 = u147:SolveRotCFrame(u153)
        if u153 >= 1 then
            v7 = u191
        end
        local v8 = Position - v7.Position
        local v9 = v7 * (CFrame.Angles(-v8.Z * 5, 0, v8.X * 5))
        spr.target(CFrameValue, 0.478, 1.25, {Value = v9})
        Position = v7.Position
        if u52 and u52.PrimaryPart then
            u11 = ((u52.PrimaryPart.Position - Position) / v1).Magnitude * u140[self.Model.Name] or 1
            u203.Volume = math.lerp(u203.Volume, math.clamp(u11 / 45, 0, 1), v1 * 2)
            u203.PlaybackSpeed = math.clamp(math.lerp(u203.PlaybackSpeed, u11 / 120 + 0.25, v1 / 1.25), 0, 1.6)
            u52.PrimaryPart.CFrame = CFrameValue.Value * v6
            return
        end
    end)
    u5:Mark(v10)
    u5:Mark(CFrameValue)
    u5:Mark(NumberValue)
end

function v1:_doPlacement(a2) -- Line: 1165
    -- upvalues: SharedControllerFunctions (val), HackerAssets (val), Asset (val), SharedGameConstants (val)
    -- upvalues: PathPlacementCursorController (val), RunService (val), GameState (val), ClientAtoms (val)
    local BoundarySize
    local u4 = SharedControllerFunctions.getPlacement()
    self._cloningMaid:Mark(function() -- Line: 1168 -- upvalues: u4 (val)
        u4:cancel()
    end)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Include
    v1.FilterDescendantsInstances = {workspace:WaitForChild("Ground"), (workspace:WaitForChild("Cliff"))}
    local u28 = HackerAssets.TowerCloningPlacement:Clone()
    u28.Parent = workspace.Terrain
    self._cloningMaid:Mark(u28)
    local u36 = nil
    local u37 = 0
    local v2 = Asset("Troops", a2.Name)
    local v3 = a2.Model:GetExtentsSize() / 2
    if not v2 then
        BoundarySize = math.max(v3.X, v3.Z) + 0.2
    else
        BoundarySize = v2.Properties.BoundarySize
        if not BoundarySize then
            BoundarySize = SharedGameConstants.DEFAULT_BOUNDARY_SIZE
        end
    end
    u28.CFrame = CFrame.new(PathPlacementCursorController.CurrentPosition)
    self._cloningMaid:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 1192
        -- upvalues: GameState (upval), u37 (ref), u36 (ref), PathPlacementCursorController (upval), u28 (val)
        -- upvalues: ClientAtoms (upval), a2 (val), BoundarySize (val)
        local v1 = a1 * GameState.TimeScale
        u37 = u37 + 90 * v1
        u36 = PathPlacementCursorController.CurrentPosition
        u28.CFrame = (CFrame.new(u36, (Vector3.new(u36.X, 0, u36.Z)))) * CFrame.Angles(1.5707963267948966, math.rad(u37), 0) * CFrame.new(0, math.sin((tick())) + 3.5, 0)
        local cloneTowerRangeRing = ClientAtoms.cloneTowerRangeRing
        local v2 = {enabled = true, position = u36, range = a2.Range, towerBoundary = BoundarySize}
        local v3 = PathPlacementCursorController.CantPlace and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
        v2.color = v3
        cloneTowerRangeRing(v2)
    end)))
    local v4 = u4:await()
    self:_cancelCloning()
    if not v4 then
        return nil
    end
    local v5 = u36
    return a2, v5
end

function v1:_getTowerToClone() -- Line: 1223
    -- upvalues: ContextActionService (val), ClientAtoms (val), table (val), watchValue (val), clickedAtom (val)
    -- upvalues: PlayerReplicator (val), GameRules (val), Sound (val), Notification (val), TypedPromise (val)
    -- upvalues: RunService (val)
    self._isCloning = true
    local v1 = ContextActionService
    local v2 = "CancelCloning" .. self.UID
    local Q = Enum.KeyCode.Q
    local ButtonB = Enum.KeyCode.ButtonB
    v1:BindAction(v2, function() -- Line: 1226 -- upvalues: self (val)
        self:_cancelCloning()
    end, false, Q, ButtonB)
    self._cloningMaid:Mark(function() -- Line: 1230 -- upvalues: ContextActionService (upval), self (val)
        ContextActionService:UnbindAction("CancelCloning" .. self.UID)
    end)
    self:DeselectTowers()
    local u21 = {
        enabled = true,
        ownedTowersOnly = false,
        blockOtherAbilities = false,
        allowHolograms = false,
        isCloning = false,
        dontSelect = self.Name,
    }
    u21.dontSelectList = {}
    u21.dontSelectModel = self.Model
    u21.costPercent = self.Stats.Attributes.CostClone
    ClientAtoms.cloneTowerAtom(function(a1) -- Line: 541 -- upvalues: table (upval), u21 (val)
        local v1 = table.clone(a1)
        for k, v in pairs(u21) do
            v1[k] = v
        end
        return v1
    end)
    local u32 = false
    local u33 = nil

    function v2() end

    self._cloningMaid:Mark((watchValue(clickedAtom, function(a1, a2) -- Line: 1252
        -- upvalues: ClientAtoms (upval), u33 (ref), table (upval), PlayerReplicator (upval), GameRules (upval)
        -- upvalues: Sound (upval), Notification (upval), u32 (ref)
        if a1 then
            local v1 = ClientAtoms.cloneTowerAtom()
            u33 = v1.selected
            if u33 == "none" then
                local u7 = {isCloning = false}
                ClientAtoms.cloneTowerAtom(function(a1) -- Line: 541 -- upvalues: table (upval), u7 (val)
                    local v1 = table.clone(a1)
                    for k, v in pairs(u7) do
                        v1[k] = v
                    end
                    return v1
                end)
                return
            end
            if u33 then
                local Cash = PlayerReplicator.GetLocalPlayerRaw().Cash
                local v2 = u33.TotalSpent * (v1.costPercent or 100) / 100
                local InfiniteCash = GameRules.Get("InfiniteCash")
                if Cash < v2 and not InfiniteCash then
                    Sound("Error"):Play(true)
                    Notification.Create({
                        Text = "You don't have enough cash to clone this tower!",
                        Color = Color3.fromRGB(236, 0, 0),
                    })
                    local u43 = {isCloning = false}
                    ClientAtoms.cloneTowerAtom(function(a1) -- Line: 541 -- upvalues: table (upval), u43 (val)
                        local v1 = table.clone(a1)
                        for k, v in pairs(u43) do
                            v1[k] = v
                        end
                        return v1
                    end)
                    u32 = true
                    a2()
                    u33 = nil
                    return
                end
            end
            u32 = true
            a2()
        end
    end)))
    local u48 = TypedPromise.new(function(a1, a2, a3) -- Line: 1296 -- upvalues: RunService (upval), u32 (ref)
        local u3 = nil
        a3(function() -- Line: 1299 -- upvalues: u3 (ref)
            if u3 then
                u3:Disconnect()
            end
        end)
        local v1 = RunService.RenderStepped:Connect(function() -- Line: 1305 -- upvalues: u32 (upval), u3 (ref), a1 (val)
            if u32 then
                u3:Disconnect()
                a1()
            end
        end)
    end)
    self._cloningMaid:Mark(function() -- Line: 1313 -- upvalues: u48 (val)
        if u48 then
            u48:cancel()
        end
    end)
    u48:await()
    if u32 and u33 then
        ContextActionService:UnbindAction("CancelCloning" .. self.UID)
        local u64 = {enabled = false}
        ClientAtoms.cloneTowerAtom(function(a1) -- Line: 541 -- upvalues: table (upval), u64 (val)
            local v1 = table.clone(a1)
            for k, v in pairs(u64) do
                v1[k] = v
            end
            return v1
        end)
        self:ToggleReposition({enabled = true, range = 10, towerData = u33})
        return (self:_doPlacement(u33))
    end
    if not u33 then
        self:_cancelCloning()
    end
    return nil
end

return v1