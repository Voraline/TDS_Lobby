-- Script path: ReplicatedStorage.Content.Tower.Trapper.Animator
-- Decompile time: 6.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local u27 = {}
u27.Spike = require(script:WaitForChild("SpikeAnimator", 1))
u27.Landmine = require(script:WaitForChild("LandmineAnimator", 1))
u27.BearTrap = require(script:WaitForChild("BearTrapAnimator", 1))
local v1 = {}
v1.__index = v1

local function setModelTransparency(a1, a2) -- Line: 20 -- types: a1: userdata, a2: number
    local v1 = true
    if not (a2 < 1) then
        v1 = false
    end
    for k, v in pairs(a1:GetDescendants()) do
        if not v:FindFirstAncestor("VFX") then
            if not v:IsA("BasePart") then
                if v:IsA("ParticleEmitter") then
                    v.Enabled = v1
                end
            elseif not v:GetAttribute("AlwaysInvisible") then
                v.Transparency = a2
            else
                v.Transparency = 1
            end
        end
    end
end

local function trapNameToModelName(a1, a2) -- Line: 38 -- types: a1: string, a2: number
    if a1 == "Spike" then
        if a2 < 2 then
            return "SingleSpike"
        end
        return "QuadSpike"
    end
    if a1 == "Landmine" then
        if a2 == 4 then
            return "C4"
        end
        return "Landmine"
    end
    if a1 == "BearTrap" then
        return "BearTrap"
    end
end

function v1.Initialize(a1) -- Line: 50 -- upvalues: Animation (val), UpgradesStore (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1._traps = {}
    local HandAttachment = if not a1.FBXModel then a1.Model.GunRig.Handle else a1.Model.PrimaryPart:FindFirstChild("HandAttachment", true)
    a1._handAttachment = HandAttachment
    a1._throwAnim = Animation.new({
        Preload = true,
        IgnorePriority = true,
        Target = AnimationController,
        Track = Animations:WaitForChild("Fire")["0"].Fire,
    })
    a1._throwAnim.Controller.Ended:Connect(function() -- Line: 65 -- upvalues: a1 (val)
        local v1 = a1
        local Level = a1:GetLevel()
        v1:_equipTrap(a1.Replicator:Get("CurrentTrap") or "Spike", Level)
    end)
    a1._equipAnim = Animation.new({
        IgnorePriority = true,
        Target = AnimationController,
        Track = Animations:WaitForChild("Fire")["0"].Equip,
    })
    a1.Executables = {
        EquipTrap = function(a1_2) -- Line: 75 -- upvalues: a1 (val) -- types: a1_2: string
            a1:_equipTrap(a1_2, (a1:GetLevel()))
        end,
        TriggerTrap = function(a1_2, ...) -- Line: 78 -- upvalues: a1 (val) -- types: a1_2: string
            local v1 = {...}
            local v2 = a1._traps[a1_2]
            if v2 and v2.onTriggered then
                v2:onTriggered((unpack(v1)))
            end
        end,
    }
    a1:_updateTraps(a1.Replicator:Get("Traps") or {})
    ;(a1.Replicator:GetStateChangedSignal("Traps")):Connect(function(a1_2) -- Line: 88 -- upvalues: a1 (val)
        a1:_updateTraps(a1_2 or {})
    end)
    local Level = a1:GetLevel()
    ;(a1.Replicator:GetStateChangedSignal("Upgrade")):Connect(function(a1_2) -- Line: 94 -- upvalues: a1 (val), Level (ref) -- types: a1_2: number
        local v1 = a1.Replicator:Get("CurrentTrap")
        local v2 = Level
        if (if v1 ~= "Spike" then if v1 ~= "Landmine" then if v1 ~= "BearTrap" then nil else "BearTrap" else if v2 ~= 4 then "Landmine" else "C4" else if not (v2 < 2) then "QuadSpike" else "SingleSpike") ~= (if v1 ~= "Spike" then if v1 ~= "Landmine" then if v1 ~= "BearTrap" then nil else "BearTrap" else if a1_2 ~= 4 then "Landmine" else "C4" else if not (a1_2 < 2) then "QuadSpike" else "SingleSpike") then
            a1:_equipTrap(v1, a1_2)
        end
        Level = a1_2
    end)
    ;(a1.Replicator:GetStateChangedSignal("Range")):Connect(function(a1_2) -- Line: 105 -- upvalues: UpgradesStore (upval), a1 (val) -- types: a1_2: number
        if UpgradesStore.getState().model == a1.Model then
            UpgradesStore.updateZone({range = a1_2 * 2})
        end
    end)
    a1.OnDestroy:Connect(function() -- Line: 113 -- upvalues: a1 (val)
        for k, v in pairs(a1._traps) do
            v:Destroy()
        end
        a1._traps = nil
    end)
end

function v1:_updateTraps(a2) -- Line: 122 -- upvalues: TweenService (val)
    local DecayTime, explosionRadiusMultiplier, name, position, stats, v1, v2, velocity
    for i, j in self._traps do
        if a2[i] == nil then
            j:Destroy()
            self._traps[i] = nil
        end
    end
    for k, v in pairs(a2) do
        v1 = self._traps[k]
        if v1 then
            v2 = v.lifespan / v.maxLifespan
            DecayTime = v1.root.DecayTime
            DecayTime.Enabled = true
            TweenService:Create(DecayTime.Progress.Bar, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                Size = UDim2.fromScale(v2, 1),
                BackgroundColor3 = (Color3.fromRGB(255, 136, 17)):Lerp(Color3.fromRGB(117, 0, 0), 1 - v2),
            }):Play()
        else
            name = v.name
            position = v.position
            velocity = v.velocity
            stats = v.stats
            explosionRadiusMultiplier = v.explosionRadiusMultiplier
            self:_placeTrap(name, k, position, velocity, stats, explosionRadiusMultiplier)
        end
    end
end

function v1:_placeTrap(a2, a3, a4, a5, a6, a7) -- Line: 154
    -- upvalues: setModelTransparency (val), ItemDrop (val)
    local Position = self.Model.PrimaryPart.Position
    local v1 = self._throwAnim.Length or 1
    local v2 = 1
    local ThrowTime = self.Replicator:Get("ThrowTime") or self.Stats.Attributes.ThrowTime
    local u35 = self:_createTrap(a2, a3, a4, a6, a7)
    self._traps[a3] = u35
    self:_face(a4)
    self._throwAnim:Play()
    if v1 then
        v2 = 1 / (ThrowTime * 2.25 / v1)
    end
    self._throwAnim:AdjustSpeed(v2)
    self:Delay(ThrowTime, function() -- Line: 180
        -- upvalues: self (val), a3 (val), u35 (val), setModelTransparency (upval), ItemDrop (upval), a5 (val)
        -- upvalues: Position (val)
        if self.Model.Parent == nil or not self._traps[a3] then
            return
        end
        u35:enableModel()
        local v1 = setModelTransparency
        local Weapon = self.Model.Weapon
        local name = u35.trapData.name
        local level = u35.trapData.level
        v1(
            Weapon[if name ~= "Spike" then if name ~= "Landmine" then if name ~= "BearTrap" then nil else "BearTrap" else if level ~= 4 then "Landmine" else "C4" else if not (level < 2) then "QuadSpike" else "SingleSpike"],
            1
        )
        local WorldPosition = if not self.FBXModel then self._handAttachment.Position else self._handAttachment.WorldPosition
        local Drop = ItemDrop.Drop
        local Position_2 = u35:getFinalCFrame().Position
        local root = if not self.FBXModel then u35.model else u35.root
        ;(Drop(WorldPosition, Position_2, root, 6, -1.5, a5 / 10, function(a1, a2, a3) -- Line: 206 -- upvalues: Position (upval), u35 (upval)
            local v1 = CFrame.lookAt(a2, (Vector3.new(Position.X, a2.Y, Position.Z)))
            return (v1 - v1.Position) * u35:getRotationMod()
        end)):andThen(function() -- Line: 210 -- upvalues: u35 (upval)
            local Main = u35.model:FindFirstChild("Main")
            if Main then
                Main.CFrame = u35:getFinalCFrame()
                u35:landEffect()
            end
        end)
    end)
end

function v1:_equipTrap(a2, a3) -- Line: 220
    -- upvalues: setModelTransparency (val)
    local v1 = if a2 ~= "Spike" then if a2 ~= "Landmine" then if a2 ~= "BearTrap" then nil else "BearTrap" else if a3 ~= 4 then "Landmine" else "C4" else if not (a3 < 2) then "QuadSpike" else "SingleSpike"
    if self._throwAnim.IsPlaying then
        self._throwAnim:Stop()
    end
    local v2 = self.Model.Weapon[v1]
    setModelTransparency(v2, 0)
    local v3 = self
    for k, v in pairs(self.Model.Weapon:GetChildren()) do
        if v:IsA("Folder") then
            if v ~= v2 then
                setModelTransparency(v, 1)
            end
        elseif v:IsA("Model") and v ~= v2 then
            setModelTransparency(v, 1)
        end
    end
    v3._equipAnim:Play()
    v3._equipAnim:AdjustSpeed(v3.Stats.Attributes.ThrowTime / v3.Replicator:Get("ThrowTime"))
end

function v1:_createTrap(a2, a3, a4, a5, a6) -- Line: 244
    -- upvalues: u27 (val)
    local v1 = {
        name = a2,
        position = a4,
        level = self:GetLevel(),
        towerModel = self.Model,
        fbxModel = self.FBXModel ~= nil,
        trapStats = a5,
        explosionRadiusMultiplier = a6,
    }
    local v2 = u27[a2].new(v1)
    self._traps[a3] = v2
    return v2
end

function v1:_face(a2) -- Line: 266 -- types: self: table, a2: vector
    local PrimaryPart = self.Model.PrimaryPart
    PrimaryPart.CFrame = CFrame.new(PrimaryPart.CFrame.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
end

return v1