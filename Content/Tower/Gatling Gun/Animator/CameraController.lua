-- Script path: ReplicatedStorage.Content.Tower.Gatling Gun.Animator.CameraController
-- Decompile time: 5.14 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CameraSpring = require(script.Parent.CameraSpring)
local ControlModule = require((Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):WaitForChild("ControlModule"))
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u51 = Vector2.new(1, 0.77) * 0.008726646259971648
local u52 = {x = 0, y = 0, enabled = {}, previousPositions = {}}
u52.position = Vector3.new()
u52.springShove = CameraSpring:new(10, 80, 4, 4.2)
u52.RollValue = Vector3.new()
local CurrentCamera = workspace.CurrentCamera
local u69 = Maid.new()
local u72 = CameraSpring:new()

function u52.recoil(a1) -- Line: 38 -- upvalues: u72 (val) -- types: a1: number
    u72:shove((Vector3.new(Random.new():NextNumber(-0.03, 0.03), -0.05, a1)))
end

local function togglePlayers(a1) -- Line: 42 -- upvalues: Players (val) -- types: a1: boolean
    local v1 = a1
    for i, j in Players:GetPlayers() do
        if j.Character then
            for k, n in j.Character:GetDescendants() do
                if n:IsA("BasePart") then
                    n.LocalTransparencyModifier = if not v1 then 1 else 0
                end
                if n:IsA("Decal") then
                    n.Transparency = if not v1 then 1 else 0
                end
            end
        end
    end
end

function u52.toggle(a1, a2, a3) -- Line: 57
    -- upvalues: togglePlayers (val), ControlModule (val), Players (val), UserInputService (val), u52 (val)
    -- upvalues: RunService (val), u69 (val), CurrentCamera (val), spr (val), u72 (val), u51 (val)
    a1.enabled[a3] = a2
    if not a1.previousPositions[a3] then
        a1.previousPositions[a3] = {x = a1.x, y = a1.y, endPosition = Vector3.new()}
    end
    local v1 = a1.previousPositions[a3]
    v1.x = a1.x
    v1 = a1.previousPositions[a3]
    v1.y = a1.y
    togglePlayers(not a2)
    ControlModule:Enable()
    Players.LocalPlayer.CameraMinZoomDistance = 1
    task.defer(function() -- Line: 72 -- upvalues: Players (upval)
        Players.LocalPlayer.CameraMinZoomDistance = 0
    end)
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    u52.RollValue = Vector3.new()
    UserInputService.MouseIconEnabled = true
    RunService:UnbindFromRenderStep("GATLING_GUN_CAMERA")
    u69:Sweep()
    a3:_replicatePosition(a1.previousPositions[a3].endPosition)
    a3:_aim(a1.previousPositions[a3].endPosition)
    if a2 == false then
        return
    end
    ControlModule:Disable()
    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    UserInputService.MouseIconEnabled = false
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    local x = 0
    local y = 0
    if a1.previousPositions[a3] then
        x = a1.previousPositions[a3].x
        y = a1.previousPositions[a3].y
    end
    local u86 = RaycastParams.new()
    u86.FilterDescendantsInstances = {workspace.Ground, workspace.Cliff}
    u86.FilterType = Enum.RaycastFilterType.Include
    local CFrame = workspace.CurrentCamera.CFrame
    local u96 = {value = 0}
    spr.target(u96, 0.9, 2, {value = 1})
    local u104 = 0
    RunService:BindToRenderStep("GATLING_GUN_CAMERA", Enum.RenderPriority.Camera.Value, function(a1_2) -- Line: 118
        -- upvalues: u52 (upval), a3 (val), u104 (ref), x (ref), y (ref), u72 (upval), CurrentCamera (upval)
        -- upvalues: CFrame (val), u96 (val), u86 (val), a1 (val), UserInputService (upval)
        local CameraYInvertValue, GamepadCameraSensitivity, Position_2, Position_3, v1
        u52.RollValue = u52.springShove:update(a1_2)
        local Attribute = a3.Model.Weapon.Main:GetAttribute("CameraOffset") or Vector3.new()
        u104 = u104 + a1_2
        local v2 = (CFrame.Angles(0, x, 0)) * CFrame.Angles(y, 0, 0)
        local v3 = u72:update(a1_2)
        local v4 = a3.Model.PrimaryPart.CFrame * v2 * CFrame.new(v3) * CFrame.Angles(v3.Z, -v3.X, 0) * CFrame.new((Vector3.new(0, 1.600000023841858, 2.200000047683716))) * CFrame.new(Attribute) * CFrame.Angles(0, 0, -math.rad(u52.RollValue.X / 5))
        CurrentCamera.CFrame = CFrame:Lerp(v4, u96.value)
        local v5 = workspace:Raycast(CurrentCamera.CFrame.Position, CurrentCamera.CFrame.LookVector * 100, u86)
        local v6 = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 100
        if not v5 then
            Position_2 = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 100
        else
            if v5.Instance.Transparency == 1 then
                u86:AddToFilter({v5.Instance})
            end
            Position_2 = v5.Position
        end
        u52.position = Position_2
        u52.result = v5
        if 0.98 < u96.value then
            a3:_aim(Position_2)
        end
        if u104 > 0.05 then
            u104 = 0
            a3:_replicatePosition(Position_2)
        end
        a1.previousPositions[a3].endPosition = Position_2
        for i, j in UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
            if j.KeyCode == Enum.KeyCode.Thumbstick1 then
                Position_3 = j.Position
                if not (0.1 < Position_3.Magnitude) then
                    break
                end
                v1 = math.exp(Position_3.Magnitude)
                CameraYInvertValue = UserSettings().GameSettings:GetCameraYInvertValue()
                GamepadCameraSensitivity = UserSettings().GameSettings.GamepadCameraSensitivity
                x = (x - Position_3.X * GamepadCameraSensitivity * a1_2 * v1) % 6.283185307179586
                y = math.clamp(
                    y + Position_3.Y * GamepadCameraSensitivity * a1_2 * CameraYInvertValue * v1,
                    -0.6981317007977318,
                    0.5235987755982988
                )
                return
            end
        end
    end)
    u69:Mark((UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 189 -- upvalues: u52 (upval), x (ref), u51 (upval), y (ref)
        if not a2 then
            if a1.UserInputType == Enum.UserInputType.MouseMovement
                or a1.UserInputType == Enum.UserInputType.Touch then
                u52.springShove:shove((Vector3.new(a1.Delta.X * 0.3, 0, 0)))
                x = (x - a1.Delta.X * u51.X) % 6.283185307179586
                y = math.clamp(y - a1.Delta.Y * u51.Y, -0.6981317007977318, 0.5235987755982988)
                u52.x = x
                u52.y = y
            end
        end
    end)))
end

return u52