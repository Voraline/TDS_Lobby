-- Script path: ReplicatedStorage.Client.Controllers.Lobby.TowerPetsController.TowerPet
-- Decompile time: 36.40 ms

local Position, u112
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SharedTableRegistry = game:GetService("SharedTableRegistry")
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local Streaming = Network.Channel("Streaming")
local PlayerRegions = require(ReplicatedStorage.Shared.Modules.PlayerRegions)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local LegIK = require(script.Parent.LegIK)
local SpawnLocation = workspace:FindFirstChildWhichIsA("SpawnLocation")
local CustomAnimations = script.Parent.CustomAnimations
local u77 = {}
local u78 = {}
local u79 = {}
local u85 = script.Parent.RaycastThread:Clone()
u85.Parent = Players.LocalPlayer:WaitForChild("PlayerScripts")
local u92 = SharedTable.new()
SharedTableRegistry:SetSharedTable("TowerPetRaycast", u92)
if not SpawnLocation then
    Position = Vector3.new(0, 0, 0)
else
    Position = SpawnLocation:GetPivot().Position
    if not Position then
        Position = Vector3.new(0, 0, 0)
    end
end
if not SpawnLocation then
    u112 = 25
else
    u112 = math.max(SpawnLocation.Size.X, SpawnLocation.Size.Z) * 1.2
    if not u112 then
        u112 = 25
    end
end
local u113 = {}
u113.__index = u113

local function lerp(a1, a2, a3) -- Line: 59 -- types: a1: number, a2: number, a3: number
    return (1 - a3) * a1 + a3 * a2
end

local function getRaycastCollider() -- Line: 63
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.FilterDescendantsInstances = {workspace.CurrentCamera}
    v1.RespectCanCollide = true
    v1.CollisionGroup = "Player"
    return v1
end

local function getAndRequestAsset(a1, a2, a3) -- Line: 73
    -- upvalues: Streaming (val), Asset (val)
    local v1 = a3 or "Default"
    if a1 == "tower" then
        Streaming:FireServer("SelectTower", a2, v1, true)
        return Asset("TroopsModel", a2, v1)
    end
    if a1 == "unit" then
        Streaming:FireServer("SelectUnit", a2, v1)
        return Asset("NewUnitsModel", a2, v1)
    end
    error((("Invalid asset type: %*"):format(a1)))
end

local function getPetDataFromModel(a1, a2, a3, a4) -- Line: 87
    -- upvalues: RunService (val), Streaming (val), Asset (val)
    local v1 = nil
    local v2 = "Idle"
    local v3 = true
    local v4 = false
    local v5 = {}
    if a1 == "Ace Pilot" then
        a3:WaitForChild("HumanoidRootPart", 3):Destroy()
        a3:FindFirstChild("FlightPos"):Destroy()
        a3.PrimaryPart = a3.Weapon.Main
        for i2, j in a3.Upgrades:GetChildren() do
            if j.Name ~= "0" then
                j:Destroy()
            end
        end
        v3 = false
        v4 = true
    elseif a1 == "Pursuit" then
        ((a3:WaitForChild("Upgrades")):WaitForChild("0")):WaitForChild("BasePad"):Destroy()
        local Heli = (a3:WaitForChild("Weapon")):WaitForChild("Heli")
        a3.PrimaryPart = Heli.PrimaryPart
        local Bones = Heli:FindFirstChild("Configuration").Bones
        local Value = Bones:WaitForChild("TailRotor").Value
        local Value_2 = (Bones:WaitForChild("TopRotor")).Value
        v5 = {
            Rotors = RunService.Stepped:Connect(function(a1) -- Line: 127 -- upvalues: a3 (ref), Value_2 (val), Value (val) -- types: a1: number
                if not a3.Parent then
                    return
                end
                local v1 = Value_2
                v1.Transform = v1.Transform * CFrame.Angles(0, a1 * 17.453292519943297, 0)
                v1 = Value
                v1.Transform = v1.Transform * CFrame.Angles(0, a1 * 17.453292519943297 * 1.5, 0)
            end),
        }
        v3 = false
        v4 = true
    else
        local v6
        if a1 == "Military Base" then
            a3:Destroy()
            v6 = a2 or "Default"
            Streaming:FireServer("SelectUnit", "Humvee 3", v6)
            a3 = Asset("NewUnitsModel", "Humvee 3", v6):Clone()
            local Particles = a3:FindFirstAncestor("Particles")
            if Particles then
                Particles:Destroy()
            end
            v1 = a3.HumanoidRootPart.Node.Position or Vector3.new(0, -0.5, 0)
            v2 = "Walk"
            v3 = false
        elseif a1 == "Elf Camp" then
            a3:Destroy()
            v6 = a2 or "Default"
            Streaming:FireServer("SelectUnit", "Elf", v6)
            a3 = Asset("NewUnitsModel", "Elf", v6):Clone()
            v2 = "Walk"
        elseif a1 == "Mercenary Base" then
            a3:Destroy()
            v6 = a2 or "Default"
            Streaming:FireServer("SelectUnit", "Rifleman", v6)
            a3 = Asset("NewUnitsModel", "Rifleman", v6):Clone()
            v1 = a3.HumanoidRootPart.Node.Position or Vector3.new(0, -0.5, 0)
            v2 = "Walk"
        elseif a1 == "Mecha Base" then
            a3:Destroy()
            v6 = "Default"
            Streaming:FireServer("SelectUnit", "Mark1", v6)
            a3 = Asset("NewUnitsModel", "Mark1", v6):Clone()
            v1 = Vector3.new(0, 0.5, 0)
            v2 = "Walk"
            v3 = false
        elseif a1 == "Commander" then
            local Weapon_2 = a3:FindFirstChild("Weapon")
            if Weapon_2 then
                local Stool = Weapon_2:FindFirstChild("Stool") or Weapon_2:FindFirstChild("Stand")
                if Stool then
                    Stool:Destroy()
                end
            end
        elseif a1 == "DJ Booth" then
            if a2 == "Neko" then
                local Weapon_3 = a3:WaitForChild("Weapon", 3)
                if Weapon_3 then
                    Weapon_3.Stage["Speaker Right"]:Destroy()
                    Weapon_3.Stage["Speaker Left"]:Destroy()
                    local Motor6D = Instance.new("Motor6D")
                    Motor6D.Parent = a3.HumanoidRootPart
                    Motor6D.Part0 = a3.HumanoidRootPart
                    Motor6D.Part1 = Weapon_3.Stage.StageLVL0
                    Motor6D.C0 = CFrame.new(0, -1.043, 0.214)
                    Weapon_3.Stage.StageLVL0.Anchored = false
                end
                v3 = false
            elseif a2 == "Ghost" then
                local Weapon_4 = a3:WaitForChild("Weapon", 3)
                if Weapon_4 then
                    for i, v in ipairs(Weapon_4:GetChildren()) do
                        if v.Name ~= "Guitar" then
                            v:Destroy()
                        end
                    end
                end
                v3 = false
            elseif a2 == "Mako" then
                a3.Upgrades["0"].Booth.Lv0Stage.Anchored = false
                a3.Weapon:Destroy()
                v3 = false
            elseif a2 ~= "Plushie" and a2 ~= "Garage Band" then
                a3:WaitForChild("Weapon", 3):Destroy()
            end
        end
    end
    return {
        Angle = 0,
        Owner = a4,
        Model = a3,
        Tower = a1,
        Skin = a2,
        Animation = v2,
        Offset = v1,
        Rigged = v3,
        Flying = v4,
        Connections = v5,
    }
end

local function playAnimation(a1, a2) -- Line: 229 -- types: a2: string
    local Animations = a1.Model:FindFirstChild("Animations")
    local v1 = Animations and Animations:FindFirstChild(a2)
    if v1 and a1.AnimationController then
        local v2 = v1
        if v2:IsA("Folder") then
            v2 = v1["0"]
        end
        local v3 = a1.AnimationController:LoadAnimation(v2)
        v3:Play()
        return v3
    end
end

local function updateTilt(a1) -- Line: 251
    local v = a1._positionSpring.v
    local Unit = v.Unit
    local Magnitude = v.Magnitude
    local v1 = a1.Root.CFrame.RightVector:Dot(Unit)
    if not (Magnitude > 1) then
        a1._tilting = false
        a1._tiltSpring.t = 0
    else
        a1._tilting = true
        a1._tiltSpring.t = math.clamp(v1 * (Magnitude / a1.Speed) * a1.MaxTiltAngle, -a1.MaxTiltAngle, a1.MaxTiltAngle)
    end
    return CFrame.Angles(0, 0, -math.rad(a1._tiltSpring.p))
end

local function updateIK(a1, a2) -- Line: 274 -- types: a2: number
    local v1 = a1._positionSpring.v * 10
    local Unit = v1.Unit
    local v2 = v1.Magnitude / a1.Speed
    local v3 = v2 / a1.Speed

    local function footPlant(a1_2) -- Line: 282 -- upvalues: a1 (val), Unit (val) -- types: a1_2: boolean
        local _leftLegIK = a1_2 and a1._leftLegIK or a1._rightLegIK
        local v1 = _leftLegIK._Hip.Part0.CFrame * _leftLegIK._HipC0Cache
        local Y = _leftLegIK._Hip.Part1.Size.Y
        local Position = (v1 * CFrame.new(0, -a1.Height, 0)).Position
        local v2 = CFrame.new(Position, Position + Unit)
        local Angles = CFrame.Angles
        local _left = a1_2 and a1._left or a1._right
        return (v2 * Angles(-_left, 0, 0) * CFrame.new(0, 0, -Y)).Position
    end

    if not (v2 > 1) then
        a1._walking = false
        a1._leftLegIK:Reset(a2)
        a1._rightLegIK:Reset(a2)
        a1._up = (1 - a2) * a1._up + a2 * 0
    else
        a1._walking = true
        a1._right = (a1._right + v3 * a2 * a1.Speed) % 6.283185307179586
        a1._left = (a1._left + v3 * a2 * a1.Speed) % 6.283185307179586
        a1._up = (a1._up + v3 * a2 * (a1.Speed * 2)) % 6.283185307179586
        local v4 = footPlant(true)
        local v5 = footPlant(false)
        a1._leftLegIK:Solve(v4)
        a1._rightLegIK:Solve(v5)
    end
    a1._bob = -math.sin(a1._up) * (a1.Height / 8)
end

local function update(a1, a2, a3) -- Line: 320
    -- upvalues: u92 (val), u85 (val), updateTilt (val), updateIK (val)
    local v1 = a1._ownerRoot.CFrame * CFrame.Angles(0, -1.5707963267948966 + a1.Angle, 0) * CFrame.new(a1.Offset)
    local _positionSpring = a1._positionSpring
    local Position = if not a1.Showing then (a1._ownerRoot.CFrame * CFrame.Angles(0, -1.5707963267948966 + a1.Angle, 0)).Position else v1.Position
    _positionSpring.t = Position
    local p = a1._positionSpring.p
    local u42 = Vector3.new(p.X, a1._ownerRoot.Position.Y, p.Z)
    SharedTable.update(u92, a1._guid, function(a1) -- Line: 336 -- upvalues: u42 (val)
        local v1 = a1 or {}
        v1.startPosition = u42
        v1.direction = Vector3.new(0, -30, 0)
        return v1
    end)
    local Y_2 = a1._ownerRoot.Position.Y
    if not a1._flying then
        if u85.Parent then
            u85:SendMessage("Raycast", "TowerPetRaycast", a1._guid, a3)
        end
        Y_2 = u92[a1._guid].hitPosition and u92[a1._guid].hitPosition.Y or a1._ownerRoot.Position.Y
    end
    a1._rotation = a1._rotation:Lerp(a1._ownerRoot.CFrame.Rotation, a2 * 4)
    local v2 = (CFrame.new((Vector3.new(a1._positionSpring.p.X, Y_2 + a1.Height, a1._positionSpring.p.Z)))) * a1._rotation
    local identity = a1._up and CFrame.new(0, a1._bob, 0) or CFrame.identity
    local v3 = updateTilt(a1)
    if a1._hasIK and not a1._flying and a1._leftLegIK and a1._rightLegIK then
        updateIK(a1, a2)
    end
    if a1._flying then
        identity = CFrame.new(0, math.sin((tick()) * 2) * 0.5, 0)
    end
    if not a1._rigged and a1._animation then
        a1._animation:AdjustSpeed(a1._positionSpring.v.Magnitude / a1.Speed)
    end
    return v2 * identity * v3
end

function u113.new(a1) -- Line: 380
    -- upvalues: u113 (val), Maid (val), Players (val), HttpService (val), SpringClass (val), LegIK (val), u78 (val)
    -- upvalues: u77 (val), u92 (val), playAnimation (val), CustomAnimations (val)
    local Owner = a1.Owner
    local Angle = a1.Angle
    local Model = a1.Model
    local u7 = setmetatable({}, u113)
    u7.Maid = Maid.new()
    u7.Owner = Owner
    u7.Player = Players:GetPlayerFromCharacter(Owner)
    u7._ownerRoot = Owner:WaitForChild("HumanoidRootPart")
    if not workspace:FindFirstChild("Pets") then
        local Folder = Instance.new("Folder")
        Folder.Name = "Pets"
        Folder.Parent = workspace
    end
    if not workspace.Pets:FindFirstChild(Owner.Name) then
        local Folder_2 = Instance.new("Folder")
        Folder_2.Name = Owner.Name
        Folder_2.Parent = workspace.Pets
    end
    u7._guid = HttpService:GenerateGUID(false)
    if a1.Connections then
        u7.Connections = a1.Connections
        for i, j in a1.Connections do
            u7.Maid:Mark(j)
        end
    end
    u7.Skin = a1.Skin
    u7.Tower = a1.Tower
    u7.Model = Model
    u7.Model.PrimaryPart.CFrame = u7._ownerRoot.CFrame
    u7.Model.Parent = workspace.Pets:FindFirstChild(Owner.Name)
    local PrimaryPart = u7.Model.PrimaryPart or u7.Model:WaitForChild("HumanoidRootPart")
    u7.Root = PrimaryPart
    u7.Root.Anchored = true
    local AnimationController = a1.AnimationController or u7.Model:FindFirstChild("AnimationController")
    u7.AnimationController = AnimationController
    u7.Speed = 14
    u7.Height = 1.35
    u7.Showing = true
    u7.Angle = Angle
    u7.Offset = Vector3.new(0, 0, 3.5)
    if a1.Offset then
        u7.Offset = u7.Offset + a1.Offset
    end
    u7.MinTiltUnit = 0.2
    u7.MaxTiltAngle = 40
    u7._tilting = false
    u7._walking = false
    u7._rotation = CFrame.identity
    u7._positionSpring = SpringClass.new(u7._ownerRoot.Position, 1, u7.Speed)
    u7._tiltSpring = SpringClass.new(0, 1, u7.Speed)
    u7._bob = 0
    u7._left = 0
    u7._right = 3.141592653589793
    u7._up = 0.7853981633974483
    if a1.Rigged ~= false then
        u7._leftLegIK = LegIK.new(u7.Model, "Left")
        u7._rightLegIK = LegIK.new(u7.Model, "Right")
    end
    local _leftLegIK = u7._leftLegIK and u7._rightLegIK
    u7._hasIK = _leftLegIK
    u7._flying = a1.Flying == true
    if u7.Root:FindFirstChild("GridPart") then
        u7.Root.GridPart:Destroy()
    end
    for k, v in pairs(u7.Model:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
    if not u78[u7.Player] then
        u78[u7.Player] = {}
    end
    local v1 = u78[u7.Player]
    v1[u7] = true
    u77[u7] = true
    u7.Maid:Mark(function() -- Line: 479 -- upvalues: u7 (val), u77 (upval), u78 (upval), u92 (upval)
        if u7.Model then
            u7.Model:Destroy()
            u7.Model = nil
        end
        u77[u7] = nil
        local v1 = u78[u7.Player]
        v1[u7] = nil
        if not next(u78[u7.Player]) then
            u78[u7.Player] = nil
        end
        SharedTable.update(u92, u7._guid, function() -- Line: 491
            return nil
        end)
    end)
    if a1.AnimationClass and a1.AnimationController then
        a1.AnimationController:LoadAnimation(a1.AnimationClass):Play()
    end
    if a1.Animation then
        u7._animation = playAnimation(u7, a1.Animation)
    end
    if CustomAnimations:FindFirstChild((("%*-Pet"):format(u7.Tower))) then
        u7._customAnimCleanUp = require(CustomAnimations:FindFirstChild((("%*-Pet"):format(u7.Tower))))(u7.Model)
    end
    u7:Hide()
    return u7
end

function u113.fromAsset(a1, a2, a3) -- Line: 514
    -- upvalues: Promise (val), Streaming (val), Asset (val), getPetDataFromModel (val), u113 (val)
    return Promise.new(function(a1_2, a2_2, a3_2) -- Line: 515
        -- upvalues: a2 (val), a3 (val), Streaming (upval), Asset (upval), getPetDataFromModel (upval), a1 (val)
        -- upvalues: u113 (upval)
        local u3 = false
        a3_2(function() -- Line: 517 -- upvalues: u3 (ref)
            u3 = true
        end)
        local v1 = a2
        local v2 = a3 or "Default"
        Streaming:FireServer("SelectTower", v1, v2, true)
        local v3 = Asset("TroopsModel", v1, v2):Clone()
        if u3 then
            v3:Destroy()
            return
        end
        v1 = getPetDataFromModel(a2, a3, v3, a1)
        v2 = u113.new(v1)
        if u3 then
            v2:Destroy()
            return
        end
        a1_2(v2)
    end)
end

function u113:Destroy() -- Line: 539
    if self._customAnimCleanUp then
        self._customAnimCleanUp()
        self._customAnimCleanUp = nil
    end
    self.Maid:Sweep()
    setmetatable(self, nil)
end

function u113:Show() -- Line: 548 -- upvalues: CustomAnimations (val)
    if self.Showing then
        return
    end
    self.Showing = true
    if self.Model then
        self.Model.Parent = workspace.Pets:FindFirstChild(self.Owner.Name)
    end
    self._positionSpring.p = self._ownerRoot.Position
    self._positionSpring.v = Vector3.new()
    if CustomAnimations:FindFirstChild((("%*-Pet"):format(self.Tower))) then
        self._customAnimCleanUp = require(CustomAnimations:FindFirstChild((("%*-Pet"):format(self.Tower))))(self.Model)
    end
    self.Model.PrimaryPart.CFrame = self._ownerRoot.CFrame
end

function u113:Hide() -- Line: 570
    if not self.Showing then
        return
    end
    if self._customAnimCleanUp then
        self._customAnimCleanUp()
        self._customAnimCleanUp = nil
    end
    self.Showing = false
    if not self.Model then
        return
    end
    if not self.Showing and self.Model then
        self.Model.Parent = nil
        return
    end
end

task.spawn(function() -- Line: 591
    -- upvalues: Players (val), PlayerRegions (val), u78 (val), Position (val), u112 (val), u79 (ref)
    local Character, Character_2, v1, v2, v3, v4, v5, v6, v7
    local LocalPlayer = Players.LocalPlayer
    while task.wait(0.1) do
        Character = LocalPlayer.Character
        if Character and Character.Parent == workspace then
            v3 = PlayerRegions.findPlayersNearPlayer(LocalPlayer, 25, 15)
            v4 = {}
            table.insert(v3, LocalPlayer)
            v5 = #v3
            for i = 1, v5 do
                v6 = v3[i]
                Character_2 = v6 and v6.Character and v6.Character.PrimaryPart
                if Character_2 and v6 and u78[v6] and not ((Character_2.Position - Position).Magnitude < u112) then
                    v7 = u78[v6]
                    v1 = nil
                    v2 = nil
                    for j in v7, v1, v2 do
                        if not j.Showing and j.Show then
                            j:Show()
                        end
                        v4[j] = true
                    end
                end
            end
            for k in u79 do
                if not v4[k] and k.Showing and k.Hide then
                    k:Hide()
                end
            end
            u79 = v4
        end
    end
end)
Players.PlayerRemoving:Connect(function(a1) -- Line: 637
    if not workspace:FindFirstChild("Pets") then
        return
    end
    if workspace.Pets:FindFirstChild(a1.Name) then
        workspace.Pets:FindFirstChild(a1.Name):Destroy()
    end
end)
Scheduler.add("TowerPetsAnimator", RunService.Stepped, function(a1, a2) -- Line: 647 -- upvalues: u79 (ref), update (val)
    debug.profilebegin("TowerPetsStep")
    local v1 = nil
    local v2 = {}
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i in u79, v4, v5 do
        if i.Model then
            if not v1 then
                v1 = RaycastParams.new()
                v1.FilterType = Enum.RaycastFilterType.Exclude
                v1.FilterDescendantsInstances = {workspace.CurrentCamera}
                v1.RespectCanCollide = true
                v1.CollisionGroup = "Player"
            end
            v2[#v2 + 1] = i.Root
            v3[#v3 + 1] = (update(i, a2, v1))
        end
    end
    workspace:BulkMoveTo(v2, v3, Enum.BulkMoveMode.FireCFrameChanged)
    debug.profileend()
end)
return u113