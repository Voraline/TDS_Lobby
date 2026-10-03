-- Script path: ReplicatedStorage.Content.NewEnemies.Void Brute.Animator
-- Decompile time: 4.01 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local VoidBrute = ReplicatedStorage.Assets.Effects.Mob.VoidBrute
local v1 = {}
v1.__index = v1

function v1:_attack(a2, a3) -- Line: 17
    -- upvalues: ItemDrop (val), VoidBrute (val), EmitterManager (val), TimescaleUtilities (val), Shaker (val)
    self.Model.PrimaryPart.Attack:Play()

    local function clusterBomb(a1) -- Line: 20
        -- upvalues: self (val), ItemDrop (upval), a2 (val), VoidBrute (upval), EmitterManager (upval)
        -- upvalues: TimescaleUtilities (upval), Shaker (upval)
        self:_area(
            0,
            self.Stats.ClusterRadius * 0.5,
            CFrame.new(a1),
            0.55,
            (TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.In))
        )
        local u24 = self.Model.Boulder_low:Clone()
        for i, j in u24.BoulderTrail:GetDescendants() do
            if j:IsA("Trail") then
                j.Enabled = true
            end
        end
        local Model = Instance.new("Model")
        u24.Parent = Model
        Model:ScaleTo(0.5)
        u24.Anchored = true
        u24.Parent = workspace.Trash
        u24.Transparency = 0
        local ProjectileData = self.Stats.ProjectileData
        ;(ItemDrop.Drop(a2, a1, u24, ProjectileData.dtMultiplier, ProjectileData.Gravity, ProjectileData.Velocity, function(a1, a2, a3) -- Line: 51
            return (CFrame.lookAt(a3, a2)).Rotation * CFrame.Angles(0, math.rad(a1) * 10, 0)
        end)):andThen(function() -- Line: 55
            -- upvalues: VoidBrute (upval), a1 (val), EmitterManager (upval), TimescaleUtilities (upval), self (upval)
            -- upvalues: Shaker (upval), u24 (val), Model (val)
            local v1 = VoidBrute.ClusterExplosion:Clone()
            v1.Position = a1
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 4)
            local v2 = self.Model.PrimaryPart.LittleExplosion:Clone()
            v2.PlaybackSpeed = 1 + math.random() * 0.3
            v2.Parent = v1
            v2:Play()
            Shaker:Shake({2, 10, 0.1, 1}, 0.1, 0.25, {radius = 50, position = self.Model.PrimaryPart.Position})
            u24:Destroy()
            Model:Destroy()
        end)
    end

    self:_area(0, self.Stats.AttackRadius * 0.5, CFrame.new(a2), 3, (TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)))
    TimescaleUtilities.Delay(0.1, function() -- Line: 85 -- upvalues: self (val)
        self.Model.Boulder_low.Transparency = 0
    end)
    self:WaitForAnimationFrame("Throw", "Throw")
    self.Model.PrimaryPart.Throw:Play()
    self.Model.Boulder_low.Transparency = 1
    local u49 = self.Model.Boulder_low:Clone()
    for i, j in u49.BoulderTrail:GetDescendants() do
        if j:IsA("Trail") then
            j.Enabled = true
        end
    end
    u49.Anchored = true
    u49.Parent = workspace.Trash
    u49.Transparency = 0
    local ProjectileData = self.Stats.ProjectileData
    ;(ItemDrop.Drop(self.Model.RockPositionValue.Value.WorldPosition, a2, u49, ProjectileData.dtMultiplier, ProjectileData.Gravity, ProjectileData.Velocity, function(a1, a2, a3) -- Line: 112
        return (CFrame.lookAt(a3, a2)).Rotation * CFrame.Angles(0, math.rad(a1) * 60, 0)
    end)):andThen(function() -- Line: 115
        -- upvalues: VoidBrute (upval), a2 (val), EmitterManager (upval), TimescaleUtilities (upval), self (val)
        -- upvalues: Shaker (upval), a3 (val), clusterBomb (val), u49 (val)
        local v1 = VoidBrute.BigRockExplosion:Clone()
        v1.Position = a2
        v1.Parent = workspace.Trash
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 4)
        local v2 = self.Model.PrimaryPart.BigExplosion:Clone()
        v2.PlaybackSpeed = 1 + math.random() * 0.3
        v2.Parent = v1
        v2:Play()
        Shaker:Shake({6, 10, 0.1, 1}, 0.1, 0.25, {radius = 50, position = self.Model.PrimaryPart.Position})
        task.spawn(function() -- Line: 132 -- upvalues: a3 (upval), clusterBomb (upval), TimescaleUtilities (upval)
            for i, j in a3 do
                clusterBomb(j)
                TimescaleUtilities.Wait(math.random() * 0.1)
            end
        end)
        u49:Destroy()
    end)
end

function v1:_area(a2, a3, a4, a5, a6) -- Line: 143
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    local u10 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2 > 0) then "full" else "normal", radius = a3}
    local v2 = false
    if a2 > 0 then
        v2 = 0
    end
    v1.initialAngle = v2
    v2 = false
    if a2 > 0 then
        v2 = a2
    end
    v1.desiredAngle = v2
    v1.color3 = Color3.fromRGB(255, 0, 64)
    v2 = false
    if a2 > 0 then
        v2 = a4
    end
    v1.cframe = v2
    local Position = false
    if a2 == 0 then
        Position = a4.Position
    end
    v1.position = Position
    v1.tweenInfo = a6 or TweenInfo.new(0.25)
    v1.lifeTime = a5
    create(u10, v1)
    self:Delay(a5 + 1, function() -- Line: 162 -- upvalues: AreaIndicatorStore (upval), u10 (val)
        AreaIndicatorStore.remove(u10)
    end)
end

function v1.Initialize(a1) -- Line: 167 -- upvalues: SoundService (val)
    for i, j in a1.Model.PrimaryPart:GetChildren() do
        if j:IsA("Sound") then
            j.SoundGroup = SoundService:FindFirstChild("Enemies")
        end
    end
    a1.Model.Boulder_low.Transparency = 1
    a1.Executables = {
        Attack = function(a1_2, a2) -- Line: 176 -- upvalues: a1 (val)
            a1:PlayAnimation("Throw")
            a1:Face(a1_2, TweenInfo.new(0.85), true)
            a1._throwTask = task.spawn(function() -- Line: 179 -- upvalues: a1 (upval), a1_2 (val), a2 (val)
                a1:_attack(a1_2, a2)
            end)
        end,
        Death = function() -- Line: 183 -- upvalues: a1 (val)
            a1.Model.PrimaryPart.Death:Play()
            if a1._throwTask then
                task.cancel(a1._throwTask)
            end
            a1:StopAnimation("Throw")
            a1:PlayAnimation("Death")
        end,
    }
    a1:LoadAnimations()
end

return v1