-- Script path: ReplicatedStorage.Content.Tower.Mercenary Base.Animator
-- Decompile time: 4.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local v1 = {}
v1.__index = v1
local Support_Crosshair = ReplicatedStorage.Assets.Effects.Client.Support_Crosshair
local u46 = nil
local u47 = nil

local function getPlacement(a1) -- Line: 20
    -- upvalues: Promise (val), PathPlacementCursorController (val), GameState (val)
    return Promise.new(function(a1_2, a2, a3) -- Line: 21 -- upvalues: PathPlacementCursorController (upval), GameState (upval), a1 (val)
        PathPlacementCursorController.Canceled:Once(function() -- Line: 22 -- upvalues: a2 (val)
            a2("Canceled")
        end)
        PathPlacementCursorController.OnClicked:Once(function(a1_3, a2_2) -- Line: 25
            -- upvalues: GameState (upval), a1 (upval), a2 (val), PathPlacementCursorController (upval), a1_2 (val)
            local v1 = GameState.Paths[a1][a1_3]
            if not v1 or not v1.PathDistance then
                a2((("Invalid Path: GameState.Paths[%*][%*]"):format(a1, a1_3)))
            end
            local v2 = v1.PathDistance - a2_2
            PathPlacementCursorController:Stop()
            a1_2(a1_3, v2)
        end)
        PathPlacementCursorController:Start({uiEnabled = false, team = a1})
        a3(function() -- Line: 40 -- upvalues: PathPlacementCursorController (upval)
            PathPlacementCursorController:Stop()
        end)
    end)
end

local function clean() -- Line: 46 -- upvalues: u47 (ref), u46 (ref)
    if u47 then
        u47:Destroy()
        u47 = nil
    end
    if u46 then
        u46:Disconnect()
        u46 = nil
    end
end

function v1.Initialize(a1) -- Line: 58
    -- upvalues: u47 (ref), u46 (ref), Support_Crosshair (val), RunService (val), PathPlacementCursorController (val)
    -- upvalues: Promise (val), GameState (val), CatRom (val), ReplicatedStorage (val), EasySound (val), Animation (val)
    a1.AbilityCallbacks = {
        ["Air-Drop"] = function() -- Line: 60
            -- upvalues: u47 (upval), u46 (upval), Support_Crosshair (upval), RunService (upval)
            -- upvalues: PathPlacementCursorController (upval), a1 (val), Promise (upval), GameState (upval)
            if u47 then
                u47:Destroy()
                u47 = nil
            end
            if u46 then
                u46:Disconnect()
                u46 = nil
            end
            u47 = Support_Crosshair:Clone()
            u47.Parent = workspace.CurrentCamera
            local u20 = CFrame.new()
            local u21 = 0
            u46 = RunService.RenderStepped:Connect(function(a1) -- Line: 70 -- upvalues: PathPlacementCursorController (upval), u20 (ref), u21 (ref), u47 (upval)
                local CurrentPosition = PathPlacementCursorController.CurrentPosition
                local Position = workspace.CurrentCamera.CFrame.Position
                u20 = CFrame.lookAt(CurrentPosition, (Vector3.new(Position.X, CurrentPosition.Y, Position.Z)))
                local v1 = CFrame.new(CurrentPosition)
                u21 = u21 + a1
                local v2 = u21 * 2
                u47:PivotTo(v1)
                u47.OuterRing:PivotTo(v1 * (CFrame.Angles(0, v2, 0)))
                u47.Arrow:PivotTo(u20 * (CFrame.new(0, math.sin(v2) * 0.5, 0)))
            end)
            local Team = a1.Team
            local v1, v2, v3 = Promise.new(function(a1, a2, a3) -- Line: 21 -- upvalues: PathPlacementCursorController (upval), GameState (upval), Team (val)
                PathPlacementCursorController.Canceled:Once(function() -- Line: 22 -- upvalues: a2 (val)
                    a2("Canceled")
                end)
                PathPlacementCursorController.OnClicked:Once(function(a1_2, a2_2) -- Line: 25
                    -- upvalues: GameState (upval), Team (upval), a2 (val), PathPlacementCursorController (upval)
                    -- upvalues: a1 (val)
                    local v1 = GameState.Paths[Team][a1_2]
                    if not v1 or not v1.PathDistance then
                        a2((("Invalid Path: GameState.Paths[%*][%*]"):format(Team, a1_2)))
                    end
                    local v2 = v1.PathDistance - a2_2
                    PathPlacementCursorController:Stop()
                    a1(a1_2, v2)
                end)
                PathPlacementCursorController:Start({uiEnabled = false, team = Team})
                a3(function() -- Line: 40 -- upvalues: PathPlacementCursorController (upval)
                    PathPlacementCursorController:Stop()
                end)
            end):await()
            if u47 then
                u47:Destroy()
                u47 = nil
            end
            if u46 then
                u46:Disconnect()
                u46 = nil
            end
            if not v1 then
                return false
            end
            return {pathName = v2, dist = v3, directionCFrame = u20}
        end,
    }
    a1.Executables = {
        SpawnPlane = function(a1_2, a2, a3) -- Line: 106
            -- upvalues: CatRom (upval), ReplicatedStorage (upval), a1 (val), EasySound (upval), RunService (upval)
            -- upvalues: GameState (upval)
            local u6 = CatRom.new(a1_2)
            local C130 = ReplicatedStorage.Assets.Effects.Misc.C130
            local u22 = (C130:FindFirstChild(a1.Model.Name) or C130.Default):Clone()
            local Root = u22:WaitForChild("Root")
            local hatch = Root:FindFirstChild("hatch")
            local u31 = {}
            for i, j in Root:GetChildren() do
                if j:IsA("Motor6D") and string.match(j.Name, "^turbine") then
                    table.insert(u31, j)
                end
            end
            u22.Parent = workspace
            local Passby = Root:FindFirstChild("Passby")
            if Passby then
                EasySound.Play({
                    audioGroup = "Towers",
                    playbackSpeed = 1,
                    destroyOnEnd = true,
                    id = Passby.SoundId,
                    parent = Root,
                    volume = Passby.Volume or 1,
                })
            end
            local u61 = 0.8726646259971648 / (a3 * 0.3)
            local u62 = 0
            local u63 = nil
            local v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 139
                -- upvalues: GameState (upval), u62 (ref), a2 (ref), a3 (val), u6 (val), hatch (val), u61 (val)
                -- upvalues: u63 (ref), u22 (val), u31 (val)
                local TimeScale = GameState.TimeScale
                u62 = u62 + ((workspace:GetServerTimeNow()) - a2) * TimeScale
                local v1 = u62 / a3
                local v2 = u6:SolveUniformRotCFrame(v1)
                if hatch then
                    local C0 = hatch.C0
                    if v1 <= 0.3 then
                        hatch.C0 = C0 * CFrame.Angles(0, 0, u61 * a1 * TimeScale)
                    elseif v1 > 0.7 and v1 <= 1 then
                        hatch.C0 = C0 * CFrame.Angles(0, 0, -u61 * a1)
                    end
                end
                if v1 > 1 then
                    u6:Destroy()
                    u63:Disconnect()
                    u22:Destroy()
                    return
                end
                for i, v in ipairs(u31) do
                    v.C0 = v.C0 * CFrame.Angles(0, 0, 15.707963267948966 * a1 * TimeScale)
                end
                u22:PivotTo(v2 * (CFrame.Angles(0, 3.141592653589793, 0)))
                a2 = workspace:GetServerTimeNow()
            end)
        end,
    }
    Animation.new({
        Track = a1.Model:WaitForChild("Animations").Idle[0],
        Target = a1.Model:WaitForChild("AnimationController"),
    }):Play()
end

return v1