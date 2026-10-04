-- Script path: ReplicatedStorage.Content.NewEnemies.Producer.Animator
-- Decompile time: 5.49 ms

local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u22 = require("@self/ProducerAnimatorStates")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Producer = ReplicatedStorage.Assets.Effects.Mob.Producer
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 23
    -- upvalues: StateManager (val), u22 (val), Animation (val), Producer (val), RunService (val), GameState (val)
    -- upvalues: Shaker (val), Lighting (val), TweenService (val), TimescaleUtilities (val), SpringClass (val)
    local v1
    local PrimaryPart = a1.Model.PrimaryPart
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.stateManager = StateManager.new()
    for i, j in u22 do
        a1.stateManager:addState(j)
    end
    a1.stateManager:changeState("Walk", a1)
    a1.animations = {}
    for k, n in Animations:GetChildren() do
        if n:IsA("Animation") then
            v1 = Animation.new({Preload = true, Target = AnimationController, Track = n, Entity = a1})
            a1.animations[n.Name] = v1
        end
    end
    a1._stateThread = task.spawn(function() -- Line: 47 -- upvalues: a1 (val)
        while task.wait() do
            if not a1:IsAlive() then
                break
            end
            if #a1.stateManager.queue > 0 then
                a1.stateManager:update()
            end
        end
    end)
    a1.Executables = {
        Death = function() -- Line: 56 -- upvalues: a1 (val)
            a1.stateManager:changeState("Death", a1)
        end,
        QueueState = function(a1_2, a2) -- Line: 59 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:enqueueState(a1_2, a1, a2)
        end,
        AngledHitscan = function(a1_2) -- Line: 62 -- upvalues: a1 (val), PrimaryPart (val) -- types: a1_2: table
            local v1 = (workspace:GetServerTimeNow()) - a1_2.timestamp
            a1:areaIndicator({
                cframe = (CFrame.new(PrimaryPart.Node.WorldPosition)) * a1_2.cframe.Rotation,
                radius = a1_2.range,
                angle = a1_2.angle,
                lifeTime = math.max(a1_2.lifetime - v1, 0),
            })
        end,
        Clapboard = function(a1_2) -- Line: 77
            -- upvalues: Producer (upval), Animation (upval), a1 (val), RunService (upval), GameState (upval)
            -- upvalues: Shaker (upval), Lighting (upval), TweenService (upval), TimescaleUtilities (upval)
            local v1 = math.max(a1_2.windup - ((workspace:GetServerTimeNow()) - a1_2.timestamp), 0)
            local v2 = v1 * 0.6
            local v3 = v1 - v2
            local u18 = Producer.Clapper:Clone()
            u18.Parent = workspace.CurrentCamera
            local AnimationController = u18:WaitForChild("AnimationController")
            local v4 = Animation.new({
                Preload = true,
                Target = AnimationController,
                Track = u18:WaitForChild("Anticipation"),
                Entity = a1,
            })
            local u42 = Animation.new({
                Preload = true,
                Target = AnimationController,
                Track = u18:WaitForChild("Action"),
                Entity = a1,
            })
            a1:Wait(v2)
            if v1 > 0 then
                while v4.Controller.Length == 0 do
                    task.wait()
                end
                v4:Play(0)
                v4:AdjustSpeed(v4.Controller.Length / v3)
            end
            local u73 = RunService.RenderStepped:Connect(function() -- Line: 115 -- upvalues: u18 (val)
                local CFrame_2 = workspace.CurrentCamera.CFrame
                u18:PivotTo((CFrame.lookAt((CFrame_2 * (CFrame.new(0, 0, -0.25))).Position, CFrame_2.Position)))
            end)
            local Sound = u18.PrimaryPart:WaitForChild("Sound")
            Sound.PlaybackSpeed = GameState.TimeScale
            Sound:Play()
            ;(u42.Controller:GetMarkerReachedSignal("Clap")):Connect(function() -- Line: 129 -- upvalues: Shaker (upval), Lighting (upval), TweenService (upval)
                Shaker:Shake({2, 30, 0, 2}, 0, 2)
                local ColorCorrection = Lighting:FindFirstChild("ColorCorrection")
                if ColorCorrection then
                    local v1 = ColorCorrection:Clone()
                    local Contrast = v1.Contrast
                    local Saturation = v1.Saturation
                    v1.Name = "ClonedColorCorrection"
                    v1.Contrast = -2
                    v1.Saturation = -1
                    v1.Parent = Lighting
                    ColorCorrection.Enabled = false
                    TweenService:Create(v1, TweenInfo.new(0.5), {Contrast = Contrast, Saturation = Saturation}):Play()
                    task.wait(0.5)
                    v1:Destroy()
                    ColorCorrection.Enabled = true
                end
            end)
            TimescaleUtilities.Delay(v3, function() -- Line: 156 -- upvalues: u42 (val), a1 (upval), u73 (val), u18 (val)
                u42:Play()
                a1:Wait(u42.Controller.Length * 0.9)
                u73:Disconnect()
                u18:Destroy()
            end)
        end,
        Spotlight = function(a1_2) -- Line: 163 -- upvalues: a1 (val), SpringClass (upval), RunService (upval) -- types: a1_2: vector
            local Radius = a1.Stats.Abilities.Spotlight.Radius
            if a1._debuffSpotlight then
                local v1 = Random.new():NextInteger(0, 1)
                local p = a1._debuffSpotlightSpr.p
                local Magnitude = (a1_2 - p).Magnitude
                local LookVector = ((CFrame.lookAt(p, a1_2)) * CFrame.Angles(0, math.rad((math.pow(-1, v1)) * 45), 0)).LookVector
                if LookVector ~= LookVector then
                    LookVector = Vector3.new(0, 0, 0)
                end
                a1._debuffSpotlightSpr.t = a1_2
                local _debuffSpotlightSpr = a1._debuffSpotlightSpr
                _debuffSpotlightSpr.v = _debuffSpotlightSpr.v + LookVector * (Magnitude * 10)
            else
                local u15 = a1:createSpotlight(a1_2, Radius, true)
                a1._debuffSpotlight = u15
                local u23 = SpringClass.new(Vector3.new(), 0.25, 10)
                u23.p = u15.Position
                u23.t = u15.Position
                local BeamStart = (u15:WaitForChild("BeamEnd")):WaitForChild("BeamStart")
                local u40 = SpringClass.new(Vector3.new(), 0.25, 5)
                u40.p = BeamStart.WorldPosition
                u40.t = BeamStart.WorldPosition
                a1._debuffSpotlightSpr = u23
                a1.Maid:Mark((RunService.RenderStepped:Connect(function() -- Line: 183 -- upvalues: u15 (ref), u23 (val), u40 (val), BeamStart (val)
                    if u15:IsDescendantOf(game) then
                        u15:PivotTo((CFrame.new(u23.p + Vector3.new(0, 0.009999999776482582, 0))))
                        u40.t = Vector3.new(u23.p.X, u40.p.Y, u23.p.Z)
                        BeamStart.WorldCFrame = CFrame.lookAt(u40.p, u23.p)
                    end
                end)))
            end
        end,
    }
    a1.OnDestroy:Connect(function() -- Line: 210 -- upvalues: a1 (val)
        if a1._spotlightPart then
            a1._spotlightPart:Destroy()
            a1._spotlightPart = nil
        end
        if a1._stateThread then
            task.cancel(a1._stateThread)
            a1._stateThread = nil
        end
    end)
end

function v1.areaIndicator(a1, a2) -- Line: 223
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    AreaIndicatorStore.create(HttpService:GenerateGUID(false), {
        type = "normal",
        initialAngle = 0,
        radius = a2.radius,
        desiredAngle = a2.angle,
        tweenInfo = TweenInfo.new(0.25),
        lifeTime = a2.lifeTime,
        color3 = Color3.fromRGB(255, 0, 64),
        cframe = a2.cframe,
    })
end

function v1:createSpotlight(a2, a3, a4) -- Line: 242
    -- upvalues: Producer (val), TweenService (val)
    local v1 = a3 * 2 * 1.33
    local v2 = Vector3.new(0.001, v1, v1)
    local v3 = if not a4 then Producer.ProducerSpotlight:Clone() else Producer.DebuffSpotlight:Clone()
    v3.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
    local LightRay = v3.LightRay
    local Width0 = LightRay.Width0
    LightRay.Width0 = 0
    LightRay.Width1 = 0
    v3.Parent = workspace.CurrentCamera
    v3.CFrame = (CFrame.new(a2 + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, 0, 1.5707963267948966)
    TweenService:Create(v3, TweenInfo.new(1), {Size = v2}):Play()
    TweenService:Create(LightRay, TweenInfo.new(1), {Width0 = Width0, Width1 = v1}):Play()
    local CanvasGroup = v3.SurfaceGui.CanvasGroup
    CanvasGroup.Transparency = 1
    TweenService:Create(CanvasGroup, TweenInfo.new(3), {GroupTransparency = 0}):Play()
    self.Maid:Mark(v3)
    return v3
end

return v1