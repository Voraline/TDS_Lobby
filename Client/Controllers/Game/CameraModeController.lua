-- Script path: ReplicatedStorage.Client.Controllers.Game.CameraModeController
-- Decompile time: 4.85 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Modules = ReplicatedStorage.Shared.Modules
local Enum = require(Modules.Enum)
local MapManager = require(Modules.MapManager)
local SharedUniversalFunctions = require(Modules.SharedUniversalFunctions)
local u35 = CFrame.Angles(-1.5707963267948966, 0, 0)
local CameraMode = Enum.CameraMode
local u41 = ReplicatedStorage:GetAttribute("CAMERA_HEIGHT") or 70
local u42 = false
local u43 = {_players = {}, _spectate = 1, _camera = nil, _cameraMode = CameraMode.Default}
u43._movementDirection = Vector3.new(0, 0, 0)
u43._offset = Vector3.new(0, 0, 0)
u43._mapBounds = nil

local function getCurrentCharacter() -- Line: 38 -- upvalues: Players (val)
    return Players.LocalPlayer.Character
end

local function getCameraSubject(a1) -- Line: 42 -- types: a1: userdata
    return a1:FindFirstChild("Humanoid")
end

local function getMapBounds(a1) -- Line: 46 -- upvalues: SharedUniversalFunctions (val) -- types: a1: userdata
    if not a1 then
        return nil
    end
    local Paths = a1:WaitForChild("Paths")
    local Magnitude = workspace:FindFirstChild("Ground"):GetExtentsSize().Magnitude
    local Position = SharedUniversalFunctions.getBoundingBox(Paths, nil, true).Position
    return Region3.new(Position - Vector3.new(Magnitude / 2, 0, Magnitude / 2), Position + Vector3.new(Magnitude / 2, 0, Magnitude / 2))
end

function u43.getCurrentCamera() -- Line: 64 -- upvalues: u43 (val)
    return u43._camera
end

function u43.getCameraMode() -- Line: 68 -- upvalues: u43 (val)
    return u43._cameraMode
end

function u43.updateCameraMode(a1) -- Line: 72 -- upvalues: u43 (val), CameraMode (val)
    local v1 = u43.getCameraMode()
    local v2 = u43.getCurrentCamera()
    if v1 == a1 then
        return
    end
    u43._cameraMode = a1
    if a1 == CameraMode.Spectate then
        u43._spectate = 1
        return
    end
    if a1 == CameraMode.Default and v2 then
        v2.CameraType = Enum.CameraType.Custom
    end
end

function u43.nextSpectatePlayer() -- Line: 91 -- upvalues: u43 (val)
    u43._spectate = u43._spectate + 1
    local _spectate = u43._spectate
    if #u43._players < _spectate then
        u43._spectate = 1
    end
end

function u43.previousSpectatePlayer() -- Line: 98 -- upvalues: u43 (val)
    u43._spectate = u43._spectate - 1
    if u43._spectate < 1 then
        u43._spectate = #u43._players
    end
end

function u43.toggleMode(a1) -- Line: 105 -- upvalues: u43 (val), CameraMode (val)
    if u43.getCameraMode() == a1 then
        u43.updateCameraMode(CameraMode.Default)
        return
    end
    u43.updateCameraMode(a1)
end

function u43._init() -- Line: 115
    -- upvalues: u42 (ref), u43 (val), getMapBounds (val), MapManager (val), Players (val), UserInputService (val)
    -- upvalues: RunService (val), CameraMode (val), u41 (val), u35 (val)
    assert(not u42, "CameraModeController is already initialized")
    u42 = true
    u43._camera = workspace.CurrentCamera
    ;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 121 -- upvalues: u43 (upval)
        u43._camera = workspace.CurrentCamera
    end)
    task.spawn(function() -- Line: 125 -- upvalues: u43 (upval), getMapBounds (upval), MapManager (upval)
        u43._mapBounds = getMapBounds(MapManager.GetLoadedMapRaw())
    end)
    MapManager.MapChanged:Connect(function(a1) -- Line: 129 -- upvalues: u43 (upval), getMapBounds (upval) -- types: a1: userdata
        u43._mapBounds = getMapBounds(a1)
    end)
    for i, v in ipairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer then
            table.insert(u43._players, v)
        end
    end
    Players.PlayerAdded:Connect(function(a1) -- Line: 139 -- upvalues: u43 (upval) -- types: a1: userdata
        table.insert(u43._players, a1)
    end)
    Players.PlayerRemoving:Connect(function(a1) -- Line: 143 -- upvalues: u43 (upval) -- types: a1: userdata
        local v1 = table.find(u43._players, a1)
        if v1 then
            table.remove(u43._players, v1)
        end
    end)
    UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 150 -- upvalues: u43 (upval) -- types: a1: userdata
        if a2 then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseWheel then
            local v1 = if not (0 < a1.Position.Z) then 1 else -1
            local v2 = u43
            v2._offset = v2._offset + Vector3.new(0, 0, v1)
        end
    end)
    UserInputService.TouchPinch:Connect(function(a1, a2, a3, a4, a5) -- Line: 161 -- upvalues: u43 (upval)
        if a5 then
            return
        end
        local v1 = if not (a3 > 0) then 1 else -1
        local v2 = u43
        v2._offset = v2._offset + Vector3.new(0, 0, v1)
    end)
    RunService.RenderStepped:Connect(function(a1) -- Line: 170
        -- upvalues: u43 (upval), Players (upval), CameraMode (upval), UserInputService (upval), u41 (upval)
        -- upvalues: u35 (upval)
        local v1 = u43.getCameraMode()
        local v2 = u43.getCurrentCamera()
        if not v2 then
            return
        end
        local Character = Players.LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        if v1 ~= CameraMode.BirdsEye then
            if Humanoid and Character:GetAttribute("MovementLocked") then
                Character:SetAttribute("MovementLocked", false)
            end
        elseif Humanoid and not Character:GetAttribute("MovementLocked") then
            Character:SetAttribute("MovementLocked", true)
        end
        if v1 == CameraMode.Default then
            local Humanoid_2 = Character:FindFirstChild("Humanoid")
            if Humanoid_2 and v2.CameraSubject ~= Humanoid_2 then
                v2.CameraSubject = Humanoid_2
                return
            end
            return
        end
        if v1 ~= CameraMode.BirdsEye then
            if v1 == CameraMode.Spectate then
                local v3 = u43._players[u43._spectate]
                if v2.CameraType ~= Enum.CameraType.Scriptable then
                    v2.CameraType = Enum.CameraType.Scriptable
                end
                if not v3 then
                    u43._spectate = 1
                    return
                end
                local Character_2 = v3.Character and v3.Character:FindFirstChild("Humanoid")
                v2.CameraSubject = Character_2 or nil
            end
            return
        end
        if v2.CameraType ~= Enum.CameraType.Scriptable then
            v2.CameraType = Enum.CameraType.Scriptable
        end
        local _mapBounds = u43._mapBounds
        local _offset = u43._offset
        if not _mapBounds then
            return
        end
        local v4 = (Humanoid and Humanoid.MoveDirection or Vector3.new(0, 0, 0)) * 100 * a1
        local v5 = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
        local v6 = if not v5 then 1 else 0.5
        local v7 = _offset + (Vector3.new(v4.X, v4.Z, 0)) * v6
        u43._offset = v7
        local v8 = u41 + v7.Z
        local Position = _mapBounds.CFrame.Position
        v2.CFrame = (CFrame.new((Vector3.new(Position.X + v7.X, Position.Y + v8, Position.Z + v7.Y)))) * u35
    end)
end

task.spawn(function() -- Line: 238 -- upvalues: u43 (val)
    u43._init()
end)
return u43