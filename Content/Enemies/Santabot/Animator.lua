-- Script path: ReplicatedStorage.Content.Enemies.Santabot.Animator
-- Decompile time: 8.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1
local Santabot = game:GetService("ReplicatedStorage").Assets.Effects.Mob:WaitForChild("Santabot")

function v1.Initialize(a1) -- Line: 21
    -- upvalues: Animation (val), Shaker (val), GameState (val), EffectsController (val), spr (val), ItemDrop (val)
    -- upvalues: EmitterManager (val), Santabot (val), TweenService (val), TimescaleUtilities (val)
    local u1 = false
    a1.Shooting = false
    local u4 = Random.new()
    local Model = a1.Model
    local u14 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.ThrowGift,
        Target = a1.Model.AnimationController,
    })
    local u23 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.RPG,
        Target = a1.Model.AnimationController,
    })
    local u32 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Minigun,
        Target = a1.Model.AnimationController,
    })
    local u41 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Cookie,
        Target = a1.Model.AnimationController,
    })
    local Present = a1.Model.Present
    local RocketLauncher = a1.Model.RocketLauncher
    local PresentRocket = a1.Model.PresentRocket
    local BigCookie = a1.Model.BigCookie
    local MinigunBarrels = a1.Model.MinigunBarrels
    local MinigunBase = a1.Model.MinigunBase
    Present.Transparency = 1
    RocketLauncher.Transparency = 1
    PresentRocket.Transparency = 1
    BigCookie.Transparency = 1
    MinigunBarrels.Transparency = 1
    MinigunBase.Transparency = 1
    local u60 = false

    function a1.Face(a1_2) -- Line: 67 -- upvalues: a1 (val)
        local RootPart = a1.Model.RootPart
        return CFrame.new(RootPart.CFrame.Position, (Vector3.new(a1_2.X, RootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 76 -- upvalues: a1 (val)
        local v1 = {
            a1.Model,
            workspace.Map.Boundaries,
            workspace.Towers,
            workspace.ClientUnits,
            workspace.CurrentCamera,
            workspace.Replicate,
        }
        for k, v in pairs(game.Players:GetChildren()) do
            table.insert(v1, v.Character)
        end
        return v1
    end

    function a1.EnabledRageEffect(a1_2) -- Line: 91 -- upvalues: a1 (val)
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v.Name == "Rage" and v:IsA("ParticleEmitter") then
                v.Enabled = a1_2
            end
        end
    end

    a1.Executables = {
        Death = function() -- Line: 100
            -- upvalues: u1 (ref), Animation (upval), a1 (val), Present (val), RocketLauncher (val), PresentRocket (val)
            -- upvalues: BigCookie (val), MinigunBarrels (val), MinigunBase (val), Shaker (upval), GameState (upval)
            -- upvalues: EffectsController (upval)
            local v1
            u1 = true
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            Present.Transparency = 1
            RocketLauncher.Transparency = 1
            PresentRocket.Transparency = 1
            BigCookie.Transparency = 1
            MinigunBarrels.Transparency = 1
            MinigunBase.Transparency = 1
            local v2 = tick()
            for k, v in pairs(a1.Model.UpperTorso.DeathParticle:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            while true do
                if not ((tick() - v2) * GameState.TimeScale < 6) then
                    break
                end
                v1 = a1.Model.HumanoidRootPart.CFrame * (CFrame.new(Random.new():NextNumber(-4, 4), Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3)))
                EffectsController.Explosion({
                    Position = v1.Position,
                    Radius = Random.new():NextNumber(1.5, 3.5),
                    Color = BrickColor.new(Color3.new(1, 0.666667, 0)),
                    Sound = 5264403010,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
                a1:Delay((Random.new():NextNumber(0.2, 0.4)))
            end
            for k2, i in pairs(a1.Model.UpperTorso.DeathParticle:GetChildren()) do
                if i:IsA("ParticleEmitter") and i.Name ~= "Smoke" then
                    i.Enabled = false
                end
            end
        end,
        Gift = function(a1_2) -- Line: 154
            -- upvalues: u14 (val), Present (val), a1 (val), spr (upval), ItemDrop (upval), EmitterManager (upval)
            -- upvalues: Santabot (upval), u4 (val), Shaker (upval)
            u14:Play()
            ;(u14.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1) -- Line: 157 -- upvalues: Present (upval)
                if a1 == "GiftShow" then
                    Present.Transparency = 0
                    return
                end
                Present.Transparency = 1
            end)
            a1:Delay(2.2)
            local u23 = Present:Clone()
            u23:FindFirstChildWhichIsA("Motor6D"):Destroy()
            u23.PivotOffset = CFrame.identity
            local Size = Present.Size
            local v1 = CFrame.new(Present.Position)
            local Position = v1.Position
            u23.Size = Vector3.new(0, 0, 0)
            u23:PivotTo(v1)
            u23.Parent = workspace.Trash
            u23.Whoosh:Play()
            spr.target(u23, 1, 2, {Size = Size})
            ;(ItemDrop.Drop(Position, Position + Vector3.new(0, 3, 0), u23, 5, -0.9, 3.7, function(a1) -- Line: 183
                return CFrame.Angles(a1, 0, 0)
            end)):andThen(function(a1_3) -- Line: 186
                -- upvalues: Position (val), u23 (val), EmitterManager (upval), a1_2 (val), Santabot (upval)
                -- upvalues: spr (upval), u4 (upval), ItemDrop (upval), Shaker (upval), a1 (upval)
                local Size, v1
                local u3 = Position + Vector3.new(0, 3, 0)
                u23:Destroy()
                EmitterManager.Emit("GiftRPGExplosion", CFrame.lookAt(u3, Position))
                EmitterManager.Emit("CakeBreak", CFrame.lookAt(u3, Position))
                for i, j in a1_2 do
                    local u38 = Santabot.GiftBomb:Clone()
                    Size = u38.Size
                    u38.Size = Vector3.new(0, 0, 0)
                    u38:PivotTo((CFrame.new(u3)))
                    u38.Parent = workspace.Trash
                    u38.Fuse:Play()
                    spr.target(u38, 1, 2, {Size = Size})
                    local u64 = u4:NextNumber()
                    v1 = u3
                    ;(ItemDrop.Drop(v1, j, u38, 5, -0.9, 3.1, function(a1) -- Line: 206 -- upvalues: u3 (ref), Position (upval), u64 (val)
                        local v1 = (CFrame.lookAt(u3, Position)) * CFrame.Angles(u64 + a1, 0, 0)
                        local v2 = (CFrame.lookAt(u3, Position)) * CFrame.Angles(u64 + a1, 0, 0)
                        return v2 - v2.Position
                    end)):andThen(function() -- Line: 213 -- upvalues: u38 (val), EmitterManager (upval), j (val), Shaker (upval)
                        u38:Destroy()
                        EmitterManager.Emit("CakeExplosion", CFrame.new(j))
                        Shaker:Shake({0.3, 20.5, 0.1, 0.2}, 0.5, 0.5)
                    end)
                    a1:Delay(0.05)
                end
            end)
        end,
        Gun = function() -- Line: 223
            -- upvalues: u60 (ref), u32 (val), Model (val), a1 (val), TweenService (upval), MinigunBase (val)
            -- upvalues: MinigunBarrels (val)
            u60 = true
            u32:Play()
            Model.MinigunAttachment.Start.Start:Play()
            local u20 = Model.MinigunAttachment.Start.Start.Ended:Connect(function() -- Line: 229 -- upvalues: Model (upval)
                Model.MinigunAttachment.Start.Spin:Play()
            end)
            ;(u32.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1) -- Line: 233 -- upvalues: u60 (upval), u32 (upval), u20 (val), Model (upval)
                if a1 == "Loop" and u60 then
                    u32.Controller.TimePosition = 3
                    return
                end
                if not u60 then
                    u20:Disconnect()
                    Model.MinigunAttachment.Start.Spin:Stop()
                    Model.MinigunAttachment.Start.Start:Stop()
                    Model.MinigunAttachment.Start.Slow:Play()
                end
            end)
            a1:Delay(0.83333333333)
            TweenService:Create(
                MinigunBase,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 0}
            ):Play()
            TweenService:Create(
                MinigunBarrels,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 0}
            ):Play()
        end,
        GunStop = function() -- Line: 258 -- upvalues: u60 (ref), a1 (val), TweenService (upval), MinigunBase (val), MinigunBarrels (val)
            u60 = false
            a1:Delay(0.5)
            TweenService:Create(
                MinigunBase,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1}
            ):Play()
            TweenService:Create(
                MinigunBarrels,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1}
            ):Play()
        end,
        Cookie = function() -- Line: 275 -- upvalues: u41 (val), a1 (val), BigCookie (val), EmitterManager (upval), Model (val)
            u41:Play()
            a1:Delay(1)
            BigCookie.Transparency = 0
            a1:Delay(2.23333333333)
            EmitterManager.Emit("CookieCrunch", Model.CookieAttachment.Start.WorldCFrame)
            BigCookie.Transparency = 1
        end,
        RPG = function(a1_2) -- Line: 284
            -- upvalues: u23 (val), a1 (val), TweenService (upval), PresentRocket (val), RocketLauncher (val)
            -- upvalues: Model (val), EmitterManager (upval), ItemDrop (upval), Shaker (upval)
            u23:Play()
            task.delay(1, function() -- Line: 288 -- upvalues: a1 (upval), a1_2 (val), TweenService (upval)
                local v1 = a1.Face(a1_2)
                TweenService:Create(
                    a1.Model.RootPart,
                    TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                    {CFrame = v1}
                ):Play()
            end)
            TweenService:Create(
                PresentRocket,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 0}
            ):Play()
            TweenService:Create(
                RocketLauncher,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 0}
            ):Play()
            a1:Delay(3.13333333333)
            PresentRocket.Transparency = 1
            local u53 = PresentRocket:Clone()
            u53.Transparency = 0
            u53:FindFirstChildWhichIsA("Motor6D"):Destroy()
            u53.Parent = workspace.Trash
            for k, v in pairs(u53.Fuse:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            local WorldPosition = Model.RocketAttachment.Start.WorldPosition
            Model.RocketAttachment.Start.Fire:Play()
            EmitterManager.Emit("GiftRPGExplosion", CFrame.new(WorldPosition))
            ;(ItemDrop.Drop(WorldPosition, a1_2, u53, 2, -0.9, 5, function(a1, a2, a3) -- Line: 328
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(1.5707963267948966, a1, 3.141592653589793)
                local v2 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(1.5707963267948966, a1, 3.141592653589793)
                return v2 - v2.Position
            end)):andThen(function() -- Line: 335 -- upvalues: u53 (val), EmitterManager (upval), a1_2 (val), Shaker (upval)
                u53:Destroy()
                EmitterManager.Emit("GiftRPGExplosionBig", CFrame.new(a1_2))
                Shaker:Shake({6.3, 20.5, 0.1, 1}, 0.5, 2)
            end)
            a1:Delay(0.96666666666)
            TweenService:Create(
                PresentRocket,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1}
            ):Play()
            TweenService:Create(
                RocketLauncher,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1}
            ):Play()
        end,
        Shoot = function(a1_2, a2, a3, a4) -- Line: 355
            -- upvalues: a1 (val), EmitterManager (upval), TweenService (upval), Santabot (upval), ItemDrop (upval)
            local Start = a1.Model.MinigunAttachment.Start
            local WorldPosition = Start.WorldPosition
            EmitterManager.Emit("SnowMinigunFire", Start.WorldCFrame)
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.RootPart,
                TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v1}
            ):Play()
            local u52 = Santabot:WaitForChild("Snowball"):Clone()
            local v2 = (CFrame.new(WorldPosition, a1_2)) - WorldPosition
            local u61 = CFrame.new(a1_2) * v2
            u52.CFrame = CFrame.new(WorldPosition, a1_2)
            u52.Parent = workspace.Trash
            ;(ItemDrop.Drop(WorldPosition, u61, u52, 5, -0.9, 3.7, function(a1) -- Line: 394
                return CFrame.Angles(a1, a1, 0)
            end)):andThen(function(a1) -- Line: 397 -- upvalues: u52 (val), EmitterManager (upval), u61 (val)
                u52:Destroy()
                EmitterManager.Emit("SnowExplosionSmall", u61)
            end)
        end,
    }
    local u73 = OverlapParams.new()
    u73.FilterType = Enum.RaycastFilterType.Include
    u73.MaxParts = 1
    u73.FilterDescendantsInstances = {workspace.Map:FindFirstChild("Destructibles", true)}
    local DestructibleParticles = game.ReplicatedStorage.Assets.Effects.Particles.DestructibleParticles
    a1.PositionOffset = a1.PositionOffset + Vector3.new(0, 1.2000000476837158, 0)

    function a1.OnStepFunction(a1_2) -- Line: 413
        -- upvalues: u1 (ref), a1 (val), u73 (val), DestructibleParticles (val), TimescaleUtilities (upval)
        if u1 then
            return
        end
        local PartBoundsInRadius = workspace:GetPartBoundsInRadius(a1.Model.PrimaryPart.Position, 4, u73)
        if PartBoundsInRadius and PartBoundsInRadius[1] then
            local v1 = DestructibleParticles:FindFirstChild(PartBoundsInRadius[1].Parent.Name)
            if v1 then
                local Attribute
                local u22 = v1:Clone()
                u22.Size = Vector3.new()
                u22:PivotTo((PartBoundsInRadius[1].Parent:GetModelCFrame()))
                u22.Parent = workspace.Trash
                for i, v in ipairs(u22:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        Attribute = v:GetAttribute("EmitCount")
                        v:Emit(Attribute)
                    elseif v:IsA("Sound") then
                        v:Play()
                    end
                end
                PartBoundsInRadius[1].Parent:Destroy()
                TimescaleUtilities.Delay(10, function() -- Line: 438 -- upvalues: u22 (val)
                    u22:Destroy()
                end)
                return
            end
            warn(string.format("Unknown particle for destructible %s", PartBoundsInRadius[1].Parent.Name))
            PartBoundsInRadius[1].Parent:Destroy()
        end
    end
end

return v1