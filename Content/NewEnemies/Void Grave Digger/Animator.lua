-- Script path: ReplicatedStorage.Content.NewEnemies.Void Grave Digger.Animator
-- Decompile time: 4.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1
local GraveDigger = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Mob"):WaitForChild("GraveDigger")

function v1.Initialize(a1) -- Line: 25
    -- upvalues: StateManager (val), Animation (val), LightningBolt (val), TimescaleUtilities (val), Shaker (val)
    -- upvalues: EffectsController (val), EmitterManager (val), GraveDigger (val), TweenService (val), ItemDrop (val)
    a1._dead = false
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Handle = a1.Model:WaitForChild("Handle")
    local u18 = Random.new()
    local u19 = {WorldAxis = Vector3.new(0, 0, 1)}
    u19.WorldPosition = a1.Model.HumanoidRootPart.Position + Vector3.new(0, 30, 0)
    a1._stateManager = StateManager.new()
    a1._animations = {}
    a1._beams = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end

    function a1._lightningEffect(a1_2, a2) -- Line: 50
        -- upvalues: u19 (val), a1 (val), LightningBolt (upval), Handle (val)
        u19.WorldPosition = a2 or a1.Model.HumanoidRootPart.Position + Vector3.new(0, 30, 0)
        if not a1_2 then
            for i, v in ipairs(a1._beams) do
                v:DestroyDissipate()
            end
            table.clear(a1._beams)
            return
        end
        for i2, i3 in ipairs(a1._beams) do
            i3:Destroy()
        end
        table.clear(a1._beams)
        local v1 = LightningBolt.new(u19, Handle.Attachment, 14)
        v1.Thickness = 0.25
        v1.Color = Color3.fromRGB(223, 154, 240)
        v1.MaxRadius = 1
        v1.PulseSpeed = 20
        v1.Frequency = 2
        v1.AnimationSpeed = 20
        table.insert(a1._beams, v1)
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 82 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "Summon",
            onEnter = function() -- Line: 88 -- upvalues: a1 (val), TimescaleUtilities (upval), Shaker (upval)
                local v1 = a1._animations.GraveIntro:Play()
                TimescaleUtilities.Wait(v1.Length * 0.85)
                Shaker:Shake({5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a1.Model.PrimaryPart.Position})
                a1._lightningEffect(true)
                if a1._stateManager.currentState.name == "Summon" then
                    a1._animations.GraveLoop:Play()
                end
            end,
            onLeave = function() -- Line: 106 -- upvalues: a1 (val)
                a1._lightningEffect(false)
            end,
        },
        {
            name = "Stomp",
            onEnter = function(a1_2) -- Line: 113
                -- upvalues: a1 (val), TimescaleUtilities (upval), EffectsController (upval), EmitterManager (upval)
                -- upvalues: Shaker (upval)
                a1._animations.Stomp:Play()
                TimescaleUtilities.Wait(0.8)
                if a1._stateManager.currentState.name == "Stomp" then
                    local WorldPosition = a1.Model.HumanoidRootPart.Node.WorldPosition
                    EffectsController.GroundSmash(CFrame.new(WorldPosition), a1_2)
                    EmitterManager.Emit("VoidGraverSmash", CFrame.new(WorldPosition), a1_2)
                    Shaker:Shake({5, 10, 0, 1.5}, 0.5, 1, {position = WorldPosition, radius = a1_2 * 8})
                end
            end,
        },
        {
            name = "Shovel",
            onEnter = function(a1_2, a2, a3) -- Line: 132 -- upvalues: a1 (val), TimescaleUtilities (upval)
                local v1 = workspace:GetServerTimeNow() - a3
                a1._animations.Dig:Play()
                a1:_face(a1_2)
                TimescaleUtilities.Wait(1.35 - v1)
                if a1._stateManager.currentState.name == "Shovel" and #a2 > 0 then
                    for k, v in pairs(a2) do
                        a1:_throwRock(v.Position, v.Velocity)
                    end
                end
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 148 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })

    function a1._throwRock(a1, a2, a3) -- Line: 154
        -- upvalues: u18 (val), GraveDigger (upval), TweenService (upval), TimescaleUtilities (upval), ItemDrop (upval)
        -- upvalues: Handle (val), EmitterManager (upval), Shaker (upval)
        local u6 = u18:NextNumber()
        local u14 = GraveDigger:WaitForChild("DirtBlockVoid"):Clone()
        local v1 = u18:NextNumber(1.5, 2.5)
        u14.Transparency = 0
        u14.Size = Vector3.new(0, 0, 0)
        for i, v in ipairs(u14:GetDescendants()) do
            if v:IsA("Trail") then
                v.Enabled = true
            end
        end
        u14.Parent = workspace.CurrentCamera
        TweenService:Create(u14, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(v1, v1, v1)}):Play()
        TweenService:Create(u14.SurfaceAppearance, TweenInfo.new(0.1), {EmissiveStrength = 5}):Play()
        TimescaleUtilities.Delay(0.15, function() -- Line: 178 -- upvalues: TweenService (upval), u14 (val)
            TweenService:Create(
                u14.SurfaceAppearance,
                TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {EmissiveStrength = 0.2}
            ):Play()
        end)
        coroutine.wrap(function() -- Line: 188
            -- upvalues: ItemDrop (upval), Handle (upval), a2 (val), u14 (val), a3 (val), u6 (val)
            -- upvalues: EmitterManager (upval), u18 (upval), Shaker (upval), TimescaleUtilities (upval)
            -- upvalues: TweenService (upval)
            local v1 = u14
            ;(ItemDrop.Drop(Handle.Attachment.WorldPosition, a2, v1, 8, -0.7, a3, function(a1, a2, a3) -- Line: 196 -- upvalues: u6 (upval)
                CFrame.new()
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u6 + a1, u6 + a1, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 202
                -- upvalues: EmitterManager (upval), u14 (upval), u18 (upval), Shaker (upval), a2 (upval)
                -- upvalues: TimescaleUtilities (upval), TweenService (upval)
                local Attribute
                EmitterManager.Emit("VoidExplosion", CFrame.new(u14.Position), 5)
                local v1 = u18:NextNumber(1, 3)
                Shaker:Shake({3, 5, 0, 1.5}, 0.5, 1, {radius = 30, position = a2})
                for k, v in pairs(u14.Attachment:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        Attribute = v:GetAttribute("EmitCount")
                        v:Emit(Attribute or 8)
                    end
                end
                TimescaleUtilities.Wait(v1)
                TweenService:Create(u14, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = Vector3.new(0, 0, 0)}):Play()
                TimescaleUtilities.Wait(1)
                u14:Destroy()
            end)
        end)()
    end

    function a1:_face(a2) -- Line: 234 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            CFrame = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z))),
        }):Play()
    end

    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 249 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        SummonOutro = function() -- Line: 253 -- upvalues: a1 (val)
            if a1._stateManager.currentState.name == "Summon" then
                a1._animations.GraveOutro:Play()
                a1._animations.GraveLoop:Stop()
                a1._animations.GraveIntro:Stop()
                a1._lightningEffect(false)
            end
        end,
    }
end

return v1