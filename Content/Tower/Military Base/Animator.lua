-- Script path: ReplicatedStorage.Content.Tower.Military Base.Animator
-- Decompile time: 4.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local u47 = nil
local u49 = Random.new()
local u50 = nil
local u51 = nil
local u52 = nil
local v1 = {}
v1.__index = v1

local function getPlacement() -- Line: 39 -- upvalues: Promise (val), PathPlacementCursorController (val)
    return Promise.new(function(a1, a2, a3) -- Line: 40 -- upvalues: PathPlacementCursorController (upval)
        local u3 = nil
        local u4 = nil
        PathPlacementCursorController:Start({uiEnabled = false})
        u3 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 53 -- upvalues: u3 (ref), u4 (ref), a2 (val)
            u3:Disconnect()
            u4:Disconnect()
            a2("Canceled")
        end)
        local v1 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2) -- Line: 57 -- upvalues: u3 (ref), u4 (ref), a1 (val)
            u3:Disconnect()
            u4:Disconnect()
            a1(a1_2, a2)
        end)
        a3(function() -- Line: 44 -- upvalues: u3 (ref), u4 (ref)
            u3:Disconnect()
            u4:Disconnect()
        end)
    end)
end

local function clean() -- Line: 66 -- upvalues: u52 (ref), u50 (ref), u51 (ref)
    if u52 then
        u52:Destroy()
        u52 = nil
    end
    if u50 then
        u50:Disconnect()
        u50 = nil
    end
    if u51 then
        u51:Disconnect()
        u51 = nil
    end
end

function v1.DropBomb(a1, a2) -- Line: 82
    -- upvalues: u47 (ref), u49 (val), ItemDrop (val), EffectsController (val)
    local u6 = u47.Bomb:Clone()
    u6.CFrame = CFrame.new(a2.start)
    u6.Parent = workspace
    local u12 = CFrame.new()
    local u22 = CFrame.Angles(u49:NextInteger(-1, 1), 0, 0)
    ;(ItemDrop.Drop(a2.start, a2.goal, u6, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 97 -- upvalues: u12 (val), u22 (val)
        CFrame.new()
        local v1 = (CFrame.lookAt(a2, (Vector3.new(a3.X, a2.Y, a3.Z)))) * u12:Lerp(u22, a1 / 2)
        return v1 - v1.Position
    end)):andThen(function() -- Line: 104 -- upvalues: a2 (val), u6 (val), EffectsController (upval)
        local goal = a2.goal
        u6:Destroy()
        EffectsController.Explosion({Position = goal.Position, Radius = a2.radius / 2})
    end)
end

function v1.Initialize(a1) -- Line: 116
    -- upvalues: u47 (ref), ReplicatedStorage (val), u52 (ref), u50 (ref), u51 (ref), RunService (val)
    -- upvalues: PathPlacementCursorController (val), Promise (val), CatRom (val), EasySound (val), GameState (val)
    u47 = (ReplicatedStorage.Assets.ExtraTowerModels:FindFirstChild(script.Parent.Name)):FindFirstChild(a1.Model.Name)
    if not u47 then
        u47 = (ReplicatedStorage.Assets.ExtraTowerModels:FindFirstChild(script.Parent.Name)):FindFirstChild("Default")
    end
    a1.AbilityCallbacks = {
        Airstrike = function() -- Line: 128
            -- upvalues: u52 (upval), u50 (upval), u51 (upval), ReplicatedStorage (upval), a1 (val), RunService (upval)
            -- upvalues: PathPlacementCursorController (upval), Promise (upval)
            if u52 then
                u52:Destroy()
                u52 = nil
            end
            if u50 then
                u50:Disconnect()
                u50 = nil
            end
            if u51 then
                u51:Disconnect()
                u51 = nil
            end
            u52 = ReplicatedStorage.Assets.Effects.Client.Airstrike_Crosshair:Clone()
            u52.Parent = workspace
            local u29 = CFrame.new()
            local Attribute = u52:GetAttribute("OriginalScale")
            u52.OuterRing:ScaleTo(a1.Stats.Attributes.AirstrikeRange / Attribute)
            u50 = RunService.RenderStepped:Connect(function(a1) -- Line: 141
                -- upvalues: PathPlacementCursorController (upval), u29 (ref), u52 (upval)
                local CurrentPosition = PathPlacementCursorController.CurrentPosition
                local Position = workspace.CurrentCamera.CFrame.Position
                u29 = CFrame.lookAt(CurrentPosition, (Vector3.new(Position.X, CurrentPosition.Y, Position.Z)))
                local Outer = u52.OuterRing.Outer
                Outer.CFrame = Outer.CFrame * CFrame.Angles(0, math.rad(a1 * 90), 0)
                u52.Arrow:PivotTo(u29 * (CFrame.new(0, 0, (math.sin(1 + (tick()) * 4)) / 4)))
                u52:PivotTo((CFrame.new(CurrentPosition)) * (CFrame.new(0, 0, 0.025)))
            end)
            local v1, v2, v3 = Promise.new(function(a1, a2, a3) -- Line: 40 -- upvalues: PathPlacementCursorController (upval)
                local u3 = nil
                local u4 = nil
                PathPlacementCursorController:Start({uiEnabled = false})
                u3 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 53 -- upvalues: u3 (ref), u4 (ref), a2 (val)
                    u3:Disconnect()
                    u4:Disconnect()
                    a2("Canceled")
                end)
                local v1 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2) -- Line: 57 -- upvalues: u3 (ref), u4 (ref), a1 (val)
                    u3:Disconnect()
                    u4:Disconnect()
                    a1(a1_2, a2)
                end)
                a3(function() -- Line: 44 -- upvalues: u3 (ref), u4 (ref)
                    u3:Disconnect()
                    u4:Disconnect()
                end)
            end):await()
            if u52 then
                u52:Destroy()
                u52 = nil
            end
            if u50 then
                u50:Disconnect()
                u50 = nil
            end
            if u51 then
                u51:Disconnect()
                u51 = nil
            end
            if not v1 then
                return false
            end
            return {pathName = v2, pointToEnd = v3, directionCFrame = u29}
        end,
    }
    a1.Executables = {
        StrikePosition = function(a1, a2, a3) -- Line: 180
            -- upvalues: CatRom (upval), u47 (upval), EasySound (upval), RunService (upval), GameState (upval)
            local u6 = CatRom.new(a1)
            local u11 = u47.B2:Clone()
            u11.Parent = workspace
            local Passby = u11.Root:FindFirstChild("Passby")
            if Passby and Passby:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    playbackSpeed = 1,
                    destroyOnEnd = true,
                    id = Passby.SoundId,
                    parent = Passby.Parent,
                })
            end
            local u28 = 0
            local u29 = nil
            local v1 = RunService.Heartbeat:Connect(function() -- Line: 198 -- upvalues: u28 (ref), a2 (ref), GameState (upval), a3 (val), u6 (val), u29 (ref), u11 (val)
                u28 = u28 + ((workspace:GetServerTimeNow()) - a2) * GameState.TimeScale
                if not (1 < u28 / a3) then
                    u11:PivotTo((u6:SolveUniformRotCFrame(u28 / a3)) * (CFrame.Angles(0, 3.141592653589793, 0)))
                    a2 = workspace:GetServerTimeNow()
                    return
                end
                u6:Destroy()
                u29:Disconnect()
                u11:Destroy()
            end)
        end,
        DropBomb = function(a1_2) -- Line: 217 -- upvalues: a1 (val) -- types: a1_2: table
            a1:DropBomb(a1_2)
        end,
    }
end

return v1