-- Script path: ReplicatedStorage.Content.NewEnemies.Krampus.Animator
-- Decompile time: 9.36 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Krampus = ReplicatedStorage.Assets.Effects.Mob:WaitForChild("Krampus")
local Children = Krampus.Shards:GetChildren()

function v1.Initialize(a1) -- Line: 24
    -- upvalues: Animation (val), TweenService (val), Krampus (val), EmitterManager (val), Shaker (val)
    -- upvalues: TimescaleUtilities (val), GameState (val), spr (val), ItemDrop (val), ReplicatedStorage (val)
    -- upvalues: SoundService (val), Children (val)
    local v1
    local Model = a1.Model
    a1.PositionOffset = -a1.PrimaryPart.Node.Position
    local u104 = Random.new()
    local u106 = false
    local u108 = nil
    local HumanoidRootPart = Model.HumanoidRootPart
    local CFrame = HumanoidRootPart.CFrame
    local u113 = {}
    for i, j in Model.Weapon.Staff_Rock_FX:GetChildren() do
        if j:IsA("ParticleEmitter") then
            table.insert(u113, j)
        end
    end
    local v2 = nil
    local v3 = nil
    for k, n in u113, v2, v3 do
        v1 = {}
        for m, i5 in n.Size.Keypoints do
            table.insert(v1, (NumberSequenceKeypoint.new(i5.Time, i5.Value * 0.5, i5.Envelope)))
        end
        n.Size = NumberSequence.new(v1)
    end
    local u45 = Animation.new({
        IgnorePriority = true,
        Track = Model.Animations.StaffIdle,
        Target = Model.AnimationController,
    })
    local u52 = Animation.new({
        IgnorePriority = true,
        Track = Model.Animations.JumpLoop,
        Target = Model.AnimationController,
    })

    function a1.FacePos(a1_2, a2) -- Line: 68
        -- upvalues: HumanoidRootPart (val), CFrame (val), TweenService (upval), a1 (val)
        local identity = CFrame.identity
        local v1 = if not a1_2 then CFrame - CFrame.Position + HumanoidRootPart.Position else CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
        local v2 = TweenService
        local HumanoidRootPart_2 = a1.Model.HumanoidRootPart
        v2:Create(
            HumanoidRootPart_2,
            TweenInfo.new(not (a2 == nil) and a2 or 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
            {CFrame = v1}
        ):Play()
    end

    local function spike(a1_2, a2, a3) -- Line: 92
        -- upvalues: Krampus (upval), TweenService (upval), EmitterManager (upval), Shaker (upval)
        -- upvalues: TimescaleUtilities (upval), a1 (val)
        local u7 = Krampus.GroundShards:Clone()
        u7.CFrame = CFrame.new(a1_2 + Vector3.new(0, a3, 0))
        local CFrame_2 = u7.CFrame
        u7.Size = Vector3.new(0, 0, 0)
        local v1 = Vector3.new(a2, a2 / 4, a2)
        u7.Parent = workspace.Trash
        TweenService:Create(u7, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {Size = v1}):Play()
        TweenService:Create(u7, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame_2}):Play()
        EmitterManager.Emit("IceExplosion", CFrame.new(a1_2))
        EmitterManager.Emit("IcicleExplosion", CFrame.new(a1_2))
        Shaker:Shake({1.3, 20.5, 0.1, 1}, 0.3, 0.2)
        TimescaleUtilities.Delay(0.6, function() -- Line: 117 -- upvalues: TweenService (upval), u7 (val), a1 (upval)
            TweenService:Create(u7, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 1}):Play()
            a1:Delay(0.4)
            u7:Destroy()
        end)
    end

    a1.Executables = {
        Death = function() -- Line: 129 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        SlamAnimation = function() -- Line: 136 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        SlamStaff = function() -- Line: 143 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.StaffSlam,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        EquipStaff = function() -- Line: 150 -- upvalues: u113 (val), Animation (upval), a1 (val), u45 (val)
            for i, j in u113 do
                j.Enabled = true
            end
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.StaffEquip,
                Target = a1.Model.AnimationController,
            }):Play()
            u45:Play()
        end,
        UnequipStaff = function() -- Line: 161 -- upvalues: u113 (val), Animation (upval), a1 (val), u45 (val)
            for i, j in u113 do
                j.Enabled = false
            end
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.StaffUnequip,
                Target = a1.Model.AnimationController,
            }):Play()
            u45:Stop()
        end,
        Rage = function() -- Line: 172 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Eyes.Transparency = 1
            for k, v in pairs((a1.Model.Accessory.Rage:GetChildren())) do
                if v:IsA("BasePart") then
                    v1 = TweenService
                    v2 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
                    v1:Create(v, v2, {Transparency = 0}):Play()
                end
            end
            a1:Delay(1.5)
            a1.Model.Helmet.Transparency = 1
            a1.Model.HumanoidRootPart.Break:Play()
            a1:Delay(1.3)
            a1.Model.HumanoidRootPart.Scream:Play()
            a1:Delay(3.8)
            task.spawn(function() -- Line: 209 -- upvalues: a1 (upval)
                local RageWalk = a1.Model.Animations.RageWalk
                local v1 = a1.Model.AnimationController:LoadAnimation(RageWalk)
                a1.WalkTrack:Stop()
                a1.WalkTrack = v1
                while a1.WalkTrack.Length == 0 do
                    task.wait()
                end
                a1:AdjustWalkSpeed()
            end)
        end,
        SpawnTarget = function(a1_2, a2) -- Line: 220 -- upvalues: GameState (upval), a1 (val), u108 (ref), Krampus (upval), spr (upval)
            local Scalar = GameState.Paths[a1.PathTeam][a1_2]:GetScalar(a2)
            u108 = Krampus.Target:Clone()
            u108.CFrame = CFrame.new(Scalar)
            local Size = u108.Size
            u108.Size = Vector3.new(0, 0, 0)
            u108.Transparency = 1
            u108.Parent = workspace.Trash
            spr.target(u108, 1, 1, {Transparency = 0, Size = Size})
        end,
        JumpStart = function() -- Line: 236 -- upvalues: Animation (upval), a1 (val), u52 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.JumpStart,
                Target = a1.Model.AnimationController,
            }):Play()
            u52:Play()
        end,
        JumpEnd = function() -- Line: 244 -- upvalues: Animation (upval), a1 (val), u52 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.JumpEnd,
                Target = a1.Model.AnimationController,
            }):Play()
            u52:Stop()
        end,
        Jump = function(a1_2, a2, a3, a4, a5) -- Line: 252 -- upvalues: a1 (val), GameState (upval), ItemDrop (upval), u108 (ref)
            local Position = a1.Model:GetPivot().Position
            local v1 = a1.LastPosition.Y - Position.Y
            local u31 = (GameState.Paths[a1.PathTeam][a1_2]:GetScalar(a2)) + Vector3.new(0, v1 + 3, 0)
            a1.PathName = a1_2
            ;(ItemDrop.Drop(Position, u31, a1.Model, a5, a3, a4, function(a1) -- Line: 266 -- upvalues: Position (val), u31 (val) -- types: a1: number
                local v1 = CFrame.lookAt(Position, u31)
                return v1 - v1.Position
            end)):andThen(function() -- Line: 272 -- upvalues: u108 (upval), a1 (upval)
                if u108 then
                    u108:Destroy()
                end
                local v1 = a1
                v1.PathDistance = v1.PathDistance * 2
                a1:RefreshPath()
                a1.LastPosition = a1.Position
            end)
        end,
        Slam = function(a1_2, a2, a3) -- Line: 282
            -- upvalues: ReplicatedStorage (upval), a1 (val), SoundService (upval), HumanoidRootPart (val)
            -- upvalues: TweenService (upval), TimescaleUtilities (upval), Shaker (upval), EmitterManager (upval)
            local u10 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u10.CFrame = (CFrame.new(a1.LastPosition)) + a1.Model.HumanoidRootPart.Node.WorldPosition
            u10.Orientation = Vector3.new(90, -90, 0)
            SoundService:PlayLocalSound(HumanoidRootPart.Stomp)
            u10.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a3 * a2, a3 * a2, 0.1)
            TweenService:Create(
                u10,
                TweenInfo.new(a2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a2, function() -- Line: 304 -- upvalues: u10 (val)
                u10:Destroy()
            end)
            Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            EmitterManager.Emit("WindExplosion", CFrame.new(a1_2), a3 * a2 / 4)
        end,
        Face = function(a1_2, a2) -- Line: 310 -- upvalues: a1 (val)
            a1.FacePos(a1_2, a2)
        end,
        Slash = function(a1_2, a2, a3) -- Line: 313 -- upvalues: spike (val), a1 (val)
            for k, v in pairs(a2) do
                if v ~= nil then
                    spike(v, a1_2, 0.5)
                end
                if v1 then
                    a1:Delay(v1)
                end
            end
        end,
        SnowstormStart = function() -- Line: 324 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.Snowstorm,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        SnowstormEnd = function() -- Line: 331 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.Snowstorm,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        SummonStart = function() -- Line: 338 -- upvalues: u106 (ref), Animation (upval), a1 (val)
            u106 = not u106
            if u106 then
                Animation.new({
                    IgnorePriority = true,
                    Track = a1.Model.Animations.SummonLeft,
                    Target = a1.Model.AnimationController,
                }):Play()
                return
            end
            Animation.new({
                IgnorePriority = true,
                Track = a1.Model.Animations.SummonRight,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        EvilGiftThrow = function(a1_2, a2, a3, a4) -- Line: 354
            -- upvalues: a1 (val), Krampus (upval), EmitterManager (upval), spr (upval), ItemDrop (upval)
            -- upvalues: Shaker (upval)
            local Position = a1.Model.HumanoidRootPart.Position
            local u12 = Krampus.EvilGift:Clone()
            u12:PivotTo((CFrame.new(Position)))
            u12.Parent = workspace.Trash
            local u21 = {scale = 0}
            EmitterManager.Emit("SnowExplosionSmall", CFrame.new(Position), 1)
            spr.target(u21, 1, 2, {scale = 0.5})
            ;((ItemDrop.Drop((u12:GetPivot()).Position, a1_2, u12, a4, a2, a3, function(a1) -- Line: 375 -- upvalues: u12 (val), u21 (val)
                u12:ScaleTo((math.clamp(u21.scale, 0.001, (1 / 0))))
                return CFrame.Angles(a1, 0, 0)
            end)):andThen(function(a1) -- Line: 380 -- upvalues: Shaker (upval), EmitterManager (upval), Position (val) -- types: a1: vector
                if not a1 then
                    return
                end
                Shaker:Shake({0.3, 20.5, 0.1, 0.2}, 0.5, 0.5)
                EmitterManager.Emit("GiftRPGExplosion", CFrame.lookAt(a1, Position))
                EmitterManager.Emit("CakeExplosion", CFrame.new(a1))
            end)):finally(function() -- Line: 389 -- upvalues: u12 (val)
                u12:Destroy()
            end)
        end,
        SnowstormIcicleDrop = function(a1, a2, a3) -- Line: 393
            -- upvalues: Children (upval), u104 (val), TweenService (upval), EmitterManager (upval), Shaker (upval)
            local v1 = Children[u104:NextInteger(1, #Children)]:Clone()
            local Size = v1.Size
            v1.Size = Vector3.new(0, 0, 0)
            TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Size * 0.4}):Play()
            v1:PivotTo((CFrame.new(a1)))
            EmitterManager.Emit("SnowExplosionSmall", CFrame.new(a1))
            EmitterManager.Emit("Storm", CFrame.new(a1), 0.5)
            v1.Parent = workspace.Trash
            local v2 = TweenService:Create(v1, TweenInfo.new(a3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = a2})
            v2:Play()
            v2.Completed:Wait()
            EmitterManager.Emit("IcicleExplosion", CFrame.new(a2))
            Shaker:Shake({1.3, 20.5, 0.1, 1}, 0.3, 0.2)
            v1:Destroy()
        end,
    }

    function a1.OnStepFunction(a1) -- Line: 427 -- upvalues: u108 (ref)
        if u108 then
            local v1 = u108
            v1.CFrame = v1.CFrame * CFrame.Angles(0, a1 * 2, 0)
        end
    end
end

return v1