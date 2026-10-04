-- Script path: ReplicatedStorage.Content.NewEnemies.Void Reaver.Animator.VoidReaverAnimatorStates
-- Decompile time: 24.98 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u70 = CFrame.new(0, 0.1, 0)
local VoidReaver = ReplicatedStorage.Assets.Effects.Mob.VoidReaver
local u76 = Random.new()

local function randomVector() -- Line: 22 -- upvalues: u76 (val)
    return u76:NextUnitVector()
end

local v1 = {
    name = "Cursed Blade",
    onEnter = function(a1, a2, a3) -- Line: 36
        -- upvalues: VoidReaver (val), TweenService (val), u70 (val), EmitterManager (val), TimescaleUtilities (val)
        a1:_playSound("cursed_blade")
        local v1 = a1.Stats.Moveset["Cursed Blade"]
        a1:_playAnimation("Cursed Blade")
        a1:Face(a2, TweenInfo.new(0.35), true)
        local u26 = VoidReaver.CursedBlade:Clone()
        local SurfaceGui = u26.UI.SurfaceGui
        SurfaceGui.Frame.GroupTransparency = 1
        SurfaceGui.Frame.UIScale.Scale = 0.3
        TweenService:Create(SurfaceGui.Frame, TweenInfo.new(0.35), {GroupTransparency = 0}):Play()
        TweenService:Create(SurfaceGui.Frame.UIScale, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1}):Play()
        u26:PivotTo(a3 * u70)
        u26.Parent = workspace.Trash
        a1:Delay(v1.SwingDelayDamage, function() -- Line: 59
            -- upvalues: EmitterManager (upval), u26 (val), TimescaleUtilities (upval), TweenService (upval)
            -- upvalues: SurfaceGui (val)
            EmitterManager.manualEmit(u26)
            TimescaleUtilities.Wait(0.3)
            TweenService:Create(
                SurfaceGui.Frame,
                TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {GroupTransparency = 1}
            ):Play()
            TweenService:Create(
                SurfaceGui.Frame.UIScale,
                TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Scale = 0.6}
            ):Play()
        end)
        TimescaleUtilities.CleanUp(u26, 3)
        return {a1}
    end,
}
local v2 = {
    name = "Void Judgement",
    onEnter = function(a1, a2) -- Line: 84
        -- upvalues: VoidReaver (val), u70 (val), spr (val), TweenService (val), TimescaleUtilities (val)
        -- upvalues: EmitterManager (val)
        a1:_playSound("void_judgement")
        local u8 = a1.Stats.Moveset["Void Judgement"]
        local v1 = a1:_playAnimation("Void Judgement")
        v1:AdjustSpeed(v1.Controller.Length / (u8.BeamChargeTime * 1.454))
        local v2 = Vector3.new(0, 0, 0)
        for i, j in a2 do
            v2 = v2 + j
        end
        v2 = v2 / #a2
        a1:Face(v2, TweenInfo.new(0.35), true)
        a1:_chargeSwordEffect(true)
        a1:Delay(2, function() -- Line: 101 -- upvalues: a1 (val)
            a1:_chargeSwordEffect(false)
        end)
        for k, n in a2 do
            task.spawn(function() -- Line: 106
                -- upvalues: VoidReaver (upval), u8 (val), n (val), u70 (upval), spr (upval), TweenService (upval)
                -- upvalues: TimescaleUtilities (upval), a1 (val), EmitterManager (upval)
                local v1, v2
                local v3 = VoidReaver.VoidJudgement:Clone()
                v3:ScaleTo((math.max(u8.BeamRadius, 8)))
                v3:PivotTo((CFrame.new(n)) * u70)
                local Main = v3.Main
                local SurfaceGui = v3.Main.SurfaceGui
                SurfaceGui.Frame.UIScale.Scale = 2
                SurfaceGui.Frame.Indicator.ImageTransparency = 1
                SurfaceGui.Frame.Shadow.ImageTransparency = 1
                spr.target(SurfaceGui.Frame.UIScale, 0.6, 0.8, {Scale = 1})
                TweenService:Create(
                    SurfaceGui.Frame.Indicator,
                    TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageTransparency = 0.1}
                ):Play()
                TweenService:Create(
                    SurfaceGui.Frame.Shadow,
                    TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageTransparency = 0.5}
                ):Play()
                v3.Parent = workspace.Trash
                TimescaleUtilities.CleanUp(v3, 10)
                a1:Delay(u8.BeamChargeTime)
                a1:Delay(1, function() -- Line: 138 -- upvalues: TweenService (upval), SurfaceGui (val), spr (upval)
                    TweenService:Create(
                        SurfaceGui.Frame.Indicator,
                        TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                        {ImageTransparency = 1}
                    ):Play()
                    TweenService:Create(
                        SurfaceGui.Frame.Shadow,
                        TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                        {ImageTransparency = 1}
                    ):Play()
                    spr.stop(SurfaceGui.Frame.UIScale)
                    TweenService:Create(
                        SurfaceGui.Frame.UIScale,
                        TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                        {Scale = 0.7}
                    ):Play()
                end)
                if not a1:IsAlive() then
                    return
                end
                EmitterManager.manualEmit(Main)
                for i, j in Main.Beams:GetChildren() do
                    v2 = TweenService
                    v1 = TweenInfo.new(0.45)
                    v2:Create(j, v1, {Width0 = 0, Width1 = 0}):Play()
                end
            end)
        end
        return {a1}
    end,
}
local v3 = {
    name = "Unnerving Gaze",
    onEnter = function(a1, a2) -- Line: 180
        -- upvalues: VoidReaver (val), EmitterManager (val), GameState (val), u70 (val), spr (val), RunService (val)
        -- upvalues: TimescaleUtilities (val), Bezier (val)
        a1:_playSound("unnerving_gaze")
        local u8 = a1.Stats.Moveset["Unnerving Gaze"]
        local v1 = a1:_playAnimation("Unnerving Gaze Intro")
        v1:AdjustSpeed(v1.Controller.Length / u8.ChargeUpTime)

        local function smashEffect(a1, a2) -- Line: 188 -- upvalues: VoidReaver (upval), EmitterManager (upval)
            local v1 = VoidReaver.SmashExplosion:Clone()
            v1:ScaleTo(a2 or 4)
            v1:PivotTo((CFrame.new(a1)) * (CFrame.new(0, 0.01, 0)))
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
        end

        a1.Maid:Mark((v1.Controller.Stopped:Once(function() -- Line: 196
            -- upvalues: a1 (val), smashEffect (val), GameState (upval), VoidReaver (upval), u70 (upval), spr (upval)
            -- upvalues: RunService (upval), TimescaleUtilities (upval), u8 (val), EmitterManager (upval), a2 (val)
            -- upvalues: Bezier (upval)
            local v1, v2, v3, v4
            a1:_playAnimation("Unnerving Gaze Outro")
            smashEffect(a1.Model.SwordPoint.Value.WorldPosition)
            local WorldPosition = a1.Model.SwordPoint.Value.WorldPosition

            local function randomOffset() -- Line: 203
                return (Vector3.new(Random.new():NextNumber(-6, 6), Random.new():NextNumber(2, 14), (Random.new():NextNumber(-6, 6))))
            end

            local function portalEffect(a1_2, a2) -- Line: 211
                -- upvalues: GameState (upval), a1 (upval), VoidReaver (upval), u70 (upval), spr (upval)
                -- upvalues: RunService (upval), TimescaleUtilities (upval), u8 (upval), EmitterManager (upval)
                local v1 = GameState.Paths[a1.PathTeam][tonumber(a2)]
                local Scalar = v1:GetScalar(a1_2)
                local Scalar_2 = v1:GetScalar(a1_2 + 0.1)
                if not Scalar then
                    return
                end
                a1:_playSound("portal_spawn", true)
                local u29 = VoidReaver.Portal:Clone()
                u29:PivotTo((CFrame.new(Scalar, Scalar_2)) * u70)
                u29:ScaleTo(0.01)
                local u43 = {progress = 0.01}
                spr.target(u43, 0.5, 0.8, {progress = 1})
                u29.Parent = workspace.Trash
                local u60 = RunService.Heartbeat:Connect(function(a1) -- Line: 235 -- upvalues: u29 (val), u43 (val)
                    u29:ScaleTo(u43.progress)
                end)
                local v2 = u60
                a1.Maid:Mark(v2)
                TimescaleUtilities.Delay(4, function() -- Line: 241 -- upvalues: u60 (ref)
                    u60:Disconnect()
                end)
                a1:Delay(u8.PortalDelaySpawn, function() -- Line: 245 -- upvalues: VoidReaver (upval), Scalar (val), EmitterManager (upval), u29 (val)
                    local v1 = VoidReaver.EyeExplosion:Clone()
                    v1:ScaleTo(5)
                    v1:PivotTo((CFrame.new(Scalar)) * (CFrame.new(0, 2, 0)))
                    v1.Parent = workspace.Trash
                    EmitterManager.manualEmit(v1)
                    u29:Destroy()
                end)
            end

            for i, j in a2 do
                local Position = j.Position
                local PathDistance = j.PathDistance
                local PathName = j.PathName
                local u36 = VoidReaver.Trail:Clone()
                v1 = {}
                v2 = WorldPosition:Lerp(Position + Vector3.new(0, 15, 0) + -randomOffset(), 0.25)
                v3 = WorldPosition:Lerp(Position + Vector3.new(0, 15, 0) + randomOffset(), 0.6)
                v1[1] = WorldPosition
                v1[2] = v2
                v1[3] = v3
                v1[4] = Position
                local u66 = Bezier.new(unpack(v1))
                local u67 = 0
                v3 = Random.new():NextNumber(0.02, 0.06)
                local BeamSpeedTime = u8.BeamSpeedTime
                u36.Parent = workspace.Trash
                local u79 = nil
                v4 = RunService.Heartbeat:Connect(function(a1) -- Line: 276
                    -- upvalues: u67 (ref), BeamSpeedTime (val), GameState (upval), u66 (val), u36 (val)
                    -- upvalues: smashEffect (upval), Position (val), u79 (ref), portalEffect (val), PathDistance (val)
                    -- upvalues: PathName (val)
                    u67 = u67 + a1 / BeamSpeedTime * GameState.TimeScale
                    u36.Position = (u66:Get(u67, 1))
                    if u67 >= 1 then
                        smashEffect(Position, 8)
                        u79:Disconnect()
                        portalEffect(PathDistance, PathName)
                    end
                end)
                a1:Delay(v3)
            end
        end)))
    end,
}
local v4 = {
    name = "Void Rupture",
    onEnter = function(a1, a2) -- Line: 297
        -- upvalues: EmitterManager (val), TweenService (val), TimescaleUtilities (val), VoidReaver (val), u70 (val)
        local ImageTransparency, SurfaceGui, v1, v2, v3
        a1:_playSound("rupture_intro")
        local Controller = a1:_playAnimation("Void Rupture").Controller
        local u138 = {}
        a1._currentEffects = u138
        local u12 = 0
        local v4 = (Controller:GetMarkerReachedSignal("Swing")):Connect(function() -- Line: 309
            -- upvalues: u12 (ref), u138 (val), EmitterManager (upval), TweenService (upval), TimescaleUtilities (upval)
            u12 = u12 + 1
            if u138[u12] then
                local v1, v2
                EmitterManager.manualEmit(u138[u12])
                local SurfaceGui = u138[u12].Indicator.SurfaceGui
                TweenService:Create(
                    SurfaceGui.CanvasGroup.UIScale,
                    TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    {Scale = 0.1}
                ):Play()
                for i, j in SurfaceGui:GetDescendants() do
                    if j:IsA("ImageLabel") then
                        v1 = TweenService
                        v2 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                        v1:Create(j, v2, {ImageTransparency = 1}):Play()
                    end
                end
                TimescaleUtilities.CleanUp(u138[u12], 4)
            end
        end)
        local v5 = nil
        local v6 = nil
        local v7 = a1
        for i, j in a2, v5, v6 do
            v1 = VoidReaver.VoidRupture["Slash" .. i]:Clone()
            u138[i] = v1
            if i ~= 1 then
                Controller:GetMarkerReachedSignal("Face"):Wait()
            end
            v7:Face(j.targetPosition, TweenInfo.new(0.55), true)
            v1:PivotTo(j.face * u70)
            SurfaceGui = v1.Indicator.SurfaceGui
            SurfaceGui.CanvasGroup.UIScale.Scale = 0.1
            TweenService:Create(
                SurfaceGui.CanvasGroup.UIScale,
                TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Scale = 1}
            ):Play()
            for k, n in SurfaceGui:GetDescendants() do
                if n:IsA("ImageLabel") then
                    ImageTransparency = n.ImageTransparency
                    n.ImageTransparency = 1
                    v2 = TweenService
                    v3 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    v2:Create(n, v3, {ImageTransparency = ImageTransparency}):Play()
                end
            end
            v1.Parent = workspace.Trash
        end
        v7.Maid:Mark(v4)
    end,
}
local v5 = {
    name = "ChargeSwing",
    onEnter = function(a1) -- Line: 376
        -- upvalues: Maid (val), u76 (val), TimescaleUtilities (val), VoidReaver (val), Bezier (val), RunService (val)
        -- upvalues: GameState (val), TweenService (val)
        a1:_playSound("rupture_charge_up")
        local u7 = a1.Stats.Moveset["Void Rupture"]
        a1:_chargeSwordEffect(true, 2)
        a1._chargeSwing = a1:_playAnimation("SwordCharge")
        a1._chargingMaid = Maid.new()
        a1.Maid:Mark(a1._chargingMaid)
        local u25 = {}
        local u26 = 0
        a1.charging = true

        local function getPositionForBeam() -- Line: 393 -- upvalues: a1 (val), u76 (upval)
            return {
                a1.Position + Vector3.new(0, 50, 0) + u76:NextUnitVector() * 60,
                a1.Position + Vector3.new(0, 20, 0) - u76:NextUnitVector() * 30,
                a1.Position + Vector3.new(0, 10, 0) + u76:NextUnitVector() * 10,
                a1.Model.SwordPoint.Value.WorldPosition,
            }
        end

        a1._chargingMaid:Mark(function() -- Line: 402 -- upvalues: a1 (val), u25 (val), TimescaleUtilities (upval)
            a1:_chargeSwordEffect(false)
            local v1 = nil
            local v2 = nil
            for i, j in u25, v1, v2 do
                for k, n in j.trail:GetDescendants() do
                    if n:IsA("Trail") then
                        n.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(j.trail, 3)
            end
        end)
        a1._chargingMaid:Mark((task.spawn(function() -- Line: 415
            -- upvalues: u26 (ref), VoidReaver (upval), u25 (val), getPositionForBeam (val), Bezier (upval)
            -- upvalues: TimescaleUtilities (upval), u7 (val)
            local new, positions, v1, v2, v3
            for i = 1, 20 do
                u26 = u26 + 1
                v1 = VoidReaver.Trail:Clone()
                v2 = u25
                v3 = {
                    t = 0,
                    trail = v1,
                    positions = getPositionForBeam(),
                    randomTime = Random.new():NextNumber(0.5, 1.25),
                }
                v2[i] = v3
                v2 = u25[i]
                new = Bezier.new
                positions = u25[i].positions
                v2.bez = new(unpack(positions))
                v1.Position = u25[i].positions[1]
                v1.Parent = workspace.Trash
                TimescaleUtilities.Wait(u7.ChargeUpTime / 20)
            end
        end)))
        a1._chargingMaid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 435 -- upvalues: u25 (val), GameState (upval), getPositionForBeam (val), Bezier (upval)
            local v1
            local v2 = #u25
            for i = 1, v2 do
                v1 = u25[i]
                if v1 then
                    v1.t = v1.t + a1 / v1.randomTime * GameState.TimeScale
                    if 1 < v1.t then
                        v1.t = 0
                        v1.positions = getPositionForBeam()
                        v1.bez = Bezier.new(unpack(v1.positions))
                        for j, k in v1.trail:GetDescendants() do
                            if k:IsA("Trail") then
                                k.Enabled = false
                                task.delay(0.01, function() -- Line: 451 -- upvalues: k (val)
                                    k.Enabled = true
                                end)
                            end
                        end
                    end
                    v1.trail.Position = v1.bez:Get(v1.t, 1)
                end
            end
        end)))
        local u58 = a1:_shake({
            mag = 1.1,
            rough = 20,
            posInfluence = 0.1,
            rotInfluence = 0.3,
            fadeOut = 0.7,
            fadeIn = u7.ChargeUpTime * 0.85,
            cancelTime = u7.ChargeUpTime + 0.1,
        })
        a1._chargingMaid:Mark(function() -- Line: 472 -- upvalues: u58 (val)
            u58:Stop(0.1)
        end)
        a1:_animateVignette({
            transparency = 1,
            tweenInfo = TweenInfo.new(0),
            color = Color3.fromRGB(255, 255, 255),
        })
        local u88 = TweenService:Create(
            workspace.CurrentCamera,
            TweenInfo.new(u7.ChargeUpTime + 0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
            {FieldOfView = 50}
        )
        u88:Play()
        a1._chargingMaid:Mark(function() -- Line: 496 -- upvalues: u88 (val)
            u88:Cancel()
        end)
        a1:_animateVignette({
            transparency = 0,
            tweenInfo = TweenInfo.new(u7.ChargeUpTime + 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            color = Color3.fromRGB(0, 0, 0),
        })
        a1.Replicator:Set("ChargeEffect", {
            enabled = true,
            animationLookFor = "SwordCharge",
            info = {
                waitTime = u7.ChargeUpTime,
                infoIn = TweenInfo.new(u7.ChargeUpTime + 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                infoOut = TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            },
        })
        local u136 = TimescaleUtilities.Delay(u7.ChargeUpTime + 0.5, function() -- Line: 524 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            a1._chargingMaid:Sweep()
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {FieldOfView = 90}
            ):Play()
            TimescaleUtilities.Delay(0.2, function() -- Line: 535 -- upvalues: TweenService (upval)
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(6, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {FieldOfView = 70}
                ):Play()
            end)
            a1:_animateVignette({
                transparency = 0,
                tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                color = Color3.fromRGB(255, 255, 255),
            })
            TimescaleUtilities.Delay(0.05, function() -- Line: 551 -- upvalues: a1 (upval)
                a1:_animateVignette({
                    transparency = 1,
                    tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(255, 255, 255),
                })
            end)
            a1.Replicator:Set("ChargeEffect", {enabled = false})
        end)
        a1._chargingMaid:Mark(function() -- Line: 568 -- upvalues: u136 (val)
            pcall(function() -- Line: 569 -- upvalues: u136 (upval)
                task.cancel(u136)
            end)
        end)
        return {a1}
    end,
    onLeave = function(a1) -- Line: 577
        if a1._chargeSwing then
            a1._chargeSwing:Stop()
        end
    end,
}
local v6 = {
    name = "VoidRuptureFailed",
    onEnter = function(a1, a2) -- Line: 586 -- upvalues: TweenService (val), TimescaleUtilities (val)
        a1:_playSound("rupture_cancel")
        a1:_stopSound("rupture_intro")
        if a1._chargingMaid then
            a1._chargingMaid:Sweep()
        end
        pcall(function() -- Line: 594 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            local SurfaceGui, v1, v2
            local v3 = nil
            local v4 = nil
            for i, j in a1._currentEffects, v3, v4 do
                if j then
                    SurfaceGui = j.Indicator.SurfaceGui
                    TweenService:Create(
                        SurfaceGui.CanvasGroup.UIScale,
                        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                        {Scale = 0.1}
                    ):Play()
                    for k, n in SurfaceGui:GetDescendants() do
                        if n:IsA("ImageLabel") then
                            v1 = TweenService
                            v2 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                            v1:Create(n, v2, {ImageTransparency = 1}):Play()
                        end
                    end
                    TimescaleUtilities.CleanUp(j, 4)
                end
            end
        end)
        a1._currentEffects = nil
        a1:_stopAnimation("Void Rupture")
        a1:_shake({
            mag = 1.1,
            rough = 10,
            fadeIn = 0,
            posInfluence = 0.2,
            rotInfluence = 0.1,
            cancelTime = 0,
            fadeOut = 2,
        })
        a1.Replicator:Set("ChargeEffect", {enabled = false})
        if a2 then
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {FieldOfView = 60}
            ):Play()
            TimescaleUtilities.Delay(0.1, function() -- Line: 653 -- upvalues: TweenService (upval)
                TweenService:Create(
                    workspace.CurrentCamera,
                    TweenInfo.new(4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {FieldOfView = 70}
                ):Play()
            end)
            a1:_animateVignette({
                transparency = 0,
                tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                color = Color3.fromRGB(116, 66, 255),
            })
            TimescaleUtilities.Delay(0.05, function() -- Line: 669 -- upvalues: a1 (val)
                a1:_animateVignette({
                    transparency = 1,
                    tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    color = Color3.fromRGB(255, 255, 255),
                })
            end)
        else
            a1:_knockAnimation(true)
        end
        if a1._chargeSwing then
            a1._chargeSwing:Stop()
        end
        if a1._chargingMaid then
            a1._chargingMaid:Sweep()
        end
        return {a1}
    end,
}
local v7 = {
    name = "VoidRuptureSwing",
    onEnter = function(a1) -- Line: 703
        -- upvalues: VoidReaver (val), TweenService (val), RunService (val), TimescaleUtilities (val), Create (val)
        -- upvalues: Lighting (val), EmitterManager (val)
        a1:_playSound("rupture_outro")
        a1:_stopSound("rupture_charge_up")
        a1:_playAnimation("Sword Spin")
        a1._chargeSwing:Stop()

        local function sword(a1_2) -- Line: 710
            -- upvalues: VoidReaver (upval), TweenService (upval), a1 (val), RunService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local u5 = VoidReaver.SwordSpin:Clone()
            u5:ScaleTo(4)
            u5.sword.Color = a1_2
            u5.sword.Transparency = 1
            u5.Parent = workspace.Trash
            TweenService:Create(u5.sword, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = -3}):Play()
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 0
            a1.Maid:Mark(NumberValue)
            TweenService:Create(NumberValue, TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Value = 360}):Play()
            local u60 = RunService.Heartbeat:Connect(function() -- Line: 735 -- upvalues: u5 (val), a1 (upval), NumberValue (val)
                u5:PivotTo((a1.Model:GetPivot()) * CFrame.Angles(0, math.rad(-NumberValue.Value), 0) * CFrame.new(0, 6, 27) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966) * (CFrame.Angles(0, 1.5707963267948966, 0)))
            end)
            a1:Delay(0.35, function() -- Line: 745 -- upvalues: TweenService (upval), u5 (val), TimescaleUtilities (upval)
                TweenService:Create(u5.sword, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 1}):Play()
                TimescaleUtilities.CleanUp(u5, 1)
            end)
            a1:Delay(0.45, function() -- Line: 754 -- upvalues: u60 (ref)
                u60:Disconnect()
            end)
            local v1 = u60
            a1.Maid:Mark(v1)
        end

        local v1 = Create("ColorCorrectionEffect", {
            Contrast = 20,
            Saturation = -1,
            Brightness = 0,
            Name = "VoidRuptureSwingCC",
            TintColor = Color3.fromRGB(227, 16, 255),
            Parent = Lighting,
        })
        TweenService:Create(Lighting, TweenInfo.new(0.03), {ExposureCompensation = 1}):Play()
        TimescaleUtilities.Delay(0.03, function() -- Line: 774 -- upvalues: TweenService (upval), Lighting (upval)
            TweenService:Create(
                Lighting,
                TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {ExposureCompensation = 0}
            ):Play()
        end)
        TweenService:Create(v1, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Contrast = 0,
            Saturation = 0,
            Brightness = 0,
            TintColor = Color3.fromRGB(255, 255, 255),
        }):Play()
        TimescaleUtilities.CleanUp(v1, 5)
        local u69 = {}
        local v2 = Color3.fromRGB(255, 0, 234)
        local v3 = Color3.fromRGB(141, 48, 255)
        local v4 = Color3.fromRGB(255, 255, 255)
        u69[1] = v2
        u69[2] = v3
        u69[3] = v4
        u69[4] = Color3.fromRGB(0, 0, 0)
        a1:Delay(0.5, function() -- Line: 801
            -- upvalues: VoidReaver (upval), a1 (val), EmitterManager (upval), TimescaleUtilities (upval), u69 (val)
            -- upvalues: sword (val)
            task.spawn(function() -- Line: 802 -- upvalues: VoidReaver (upval), a1 (upval), EmitterManager (upval), TimescaleUtilities (upval)
                local v1 = VoidReaver.SpinEffect:Clone()
                v1:PivotTo((a1.Model:GetPivot()) * (CFrame.new(0, 1, 0)))
                EmitterManager.manualEmit(v1)
                v1.Parent = workspace.Trash
                TimescaleUtilities.CleanUp(v1, 3)
            end)
            for i, j in u69 do
                a1:Delay((i - 1) * 0.03, function() -- Line: 811 -- upvalues: sword (upval), j (val)
                    sword(j)
                end)
            end
        end)
        return {a1}
    end,
}
local v8 = {
    name = "RageMode",
    onEnter = function(a1) -- Line: 823 -- upvalues: TweenService (val), TimescaleUtilities (val), ItemDrop (val), u76 (val)
        a1:_playSound("rage_mode")
        local Controller = a1:_playAnimation("Rage").Controller
        a1._didRage = true
        for i, j in a1.Model.RageBeams.Value:GetChildren() do
            j.Enabled = true
        end
        a1:Delay(0.02, function() -- Line: 834 -- upvalues: a1 (val)
            a1.Replicator:Set("ChargeEffect", {
                enabled = true,
                animationLookFor = "Rage",
                tvStatic = true,
                info = {
                    waitTime = 2,
                    infoIn = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                    infoOut = TweenInfo.new(15, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                },
            })
        end)
        a1:Delay(2.5, function() -- Line: 851 -- upvalues: a1 (val)
            a1.Replicator:Set("ChargeEffect", {
                enabled = true,
                animationLookFor = "Rage",
                tvStatic = false,
                info = {
                    waitTime = 2,
                    infoIn = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                    infoOut = TweenInfo.new(15, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                },
            })
            a1:Delay(1, function() -- Line: 867 -- upvalues: a1 (upval)
                a1.Replicator:Set("ChargeEffect", {enabled = false, tvStatic = false})
            end)
        end)
        ;(Controller:GetMarkerReachedSignal("Effect1")):Once(function() -- Line: 875 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            local v1, v2
            for i, j in a1.Model.RageObjects:GetChildren() do
                v1 = TweenService
                v2 = TweenInfo.new(0.2)
                v1:Create(j, v2, {Transparency = 0}):Play()
                TimescaleUtilities.Wait(0.4)
            end
        end)
        ;(Controller:GetMarkerReachedSignal("Effect2")):Once(function() -- Line: 884 -- upvalues: a1 (val), ItemDrop (upval), u76 (upval)
            local Helmet = a1.Model.Helmet
            local v1 = Helmet:Clone()
            Helmet.Transparency = 1
            v1.Parent = workspace.Trash
            v1.Anchored = true
            for i, j in v1:GetDescendants() do
                if j:IsA("Motor6D") then
                    j:Destroy()
                end
            end
            ItemDrop.Drop(Helmet.Position, Helmet.Position + Vector3.new(0, -12, 0) + (u76:NextUnitVector()) * Vector3.new(1, 0, 1) * 20, v1, 7, -2, 4, function(a1, a2, a3) -- Line: 909
                return CFrame.Angles(math.rad(a1 * 10), -math.rad(a1 * 12), (math.rad(a1 * 50)))
            end)
        end)
        return {a1}
    end,
}
local v9 = {
    name = "FinalStand",
    onEnter = function(a1) -- Line: 925 -- upvalues: TweenService (val), RunService (val)
        local u4 = a1:_playAnimation("Run")
        a1._finalStand = true
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = 0
        a1:Delay(1.5, function() -- Line: 932 -- upvalues: TweenService (upval), NumberValue (val)
            TweenService:Create(NumberValue, TweenInfo.new(1), {Value = 1}):Play()
        end)
        local u15 = nil
        local v1 = RunService.Heartbeat:Connect(function() -- Line: 937 -- upvalues: a1 (val), u15 (ref), u4 (val), NumberValue (val)
            if not a1:IsAlive() then
                u15:Disconnect()
                return
            end
            u4.Controller:AdjustWeight(NumberValue.Value)
            u4.Controller:AdjustSpeed(a1.Speed / u4.Controller.Length / 2)
        end)
        a1.Maid:Mark((a1._connectStompSound(a1.animations.Run)))
        for i, j in a1.Model.PrimaryPart:GetChildren() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = true
            end
        end
        a1:_knockAnimation(false)
        return {a1}
    end,
}
local v10 = {
    name = "FinalStandSimple",
    onEnter = function(a1) -- Line: 963 -- upvalues: TweenService (val), RunService (val)
        local u4 = a1:_playAnimation("Run")
        a1._finalStand = true
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = 0
        a1:Delay(1.5, function() -- Line: 970 -- upvalues: TweenService (upval), NumberValue (val)
            TweenService:Create(NumberValue, TweenInfo.new(1), {Value = 1}):Play()
        end)
        local u15 = nil
        local v1 = RunService.Heartbeat:Connect(function() -- Line: 975 -- upvalues: a1 (val), u15 (ref), u4 (val), NumberValue (val)
            if not a1:IsAlive() then
                u15:Disconnect()
                return
            end
            u4.Controller:AdjustWeight(NumberValue.Value)
            u4.Controller:AdjustSpeed(a1.Speed / u4.Controller.Length / 2)
        end)
        for i, j in a1.Model.PrimaryPart:GetChildren() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = true
            end
        end
        return {a1}
    end,
}
local v11 = {
    name = "Death",
    onEnter = function(a1) -- Line: 997 -- upvalues: TweenService (val), TimescaleUtilities (val), VoidReaver (val)
        TweenService:Create(
            workspace.CurrentCamera,
            TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {FieldOfView = 60}
        ):Play()
        TimescaleUtilities.Delay(0.1, function() -- Line: 1006 -- upvalues: TweenService (upval)
            TweenService:Create(
                workspace.CurrentCamera,
                TweenInfo.new(4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                {FieldOfView = 70}
            ):Play()
        end)
        a1:_animateVignette({
            transparency = 0,
            tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            color = Color3.fromRGB(116, 66, 255),
        })
        TimescaleUtilities.Delay(0.05, function() -- Line: 1022 -- upvalues: a1 (val)
            a1:_animateVignette({
                transparency = 1,
                tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                color = Color3.fromRGB(255, 255, 255),
            })
        end)
        a1:_playSound("death")
        a1:_emissiveTween(false)
        for i, j in a1.Model.PrimaryPart:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = false
            end
        end
        for k, n in a1.animations do
            n:Stop()
        end
        a1.WalkTrack:Stop()
        a1:_playAnimation("FinalDeath")
        a1:Delay(0.1, function() -- Line: 1048 -- upvalues: a1 (val)
            for i, j in a1.Model.RageBeams.Value:GetChildren() do
                j.Enabled = false
            end
        end)
        a1:Delay(4, function() -- Line: 1054 -- upvalues: VoidReaver (upval), a1 (val), TweenService (upval)
            local v1, v2
            local u4 = VoidReaver.DeathEffect:Clone()
            u4.CFrame = a1.Model.RootPart.Node.WorldCFrame * CFrame.new(0, 0, -5) * CFrame.Angles(0, 1.5707963267948966, 0)
            u4.Parent = workspace.Trash
            for i, j in u4:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                    v1 = TweenService
                    v2 = TweenInfo.new(6)
                    v1:Create(j, v2, {TimeScale = 1}):Play()
                end
            end
            for k, n in a1.Model:GetDescendants() do
                if n:IsA("BasePart") then
                    v1 = TweenService
                    v2 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                    v1:Create(n, v2, {LocalTransparencyModifier = 1}):Play()
                end
            end
            a1:Delay(3, function() -- Line: 1078 -- upvalues: u4 (val)
                for i, j in u4:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
            end)
            a1:_playSound("death_scream")
        end)
    end,
}
return {
    {
        name = "Idle",
        onEnter = function(a1) -- Line: 1093
            return {a1}
        end,
    },
    {
        name = "Walk",
        onEnter = function(a1) -- Line: 28
            return {a1}
        end,
        onLeave = function(a1) end,
    },
    v11,
    v1,
    v2,
    v3,
    v4,
    v5,
    v7,
    v6,
    {
        name = "VoidRuptureFailedEnd",
        onEnter = function(a1) -- Line: 696
            a1:_knockAnimation(false)
        end,
    },
    v8,
    v9,
    v10,
}