-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.CameraPan
-- Decompile time: 5.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local BhristtSpring = require(ReplicatedStorage.Shared.Modules.BhristtSpring)
local WorldCursor = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.WorldCursor)
local CurrentCamera = workspace.CurrentCamera
local atom = Charm.atom
local untracked = Charm.untracked
local u40 = {MinX = -20, MaxX = 20, MinZ = -20, MaxZ = 10}
local u41 = false
local u42 = false
local u43 = nil
local u48 = BhristtSpring.new(1, 100, 1000)
local u53 = BhristtSpring.new(1, 100, 1000)
local u54 = 0
local u55 = 0
return {
    Enabled = false,
    Connections = {},
    Atoms = {
        CameraZoomOffset = atom(150),
        LastDragTick = atom(tick()),
        DownInputTick = atom(tick()),
        UpInputTick = atom(tick()),
    },
    CurrentCFrame = CFrame.new(),
    Constants = {MIN_ZOOM = 100, MAX_ZOOM = 200, STARTING_ZOOM = 150, CAM_BOUNDS = u40},
    Enable = function(a1) -- Line: 61
        -- upvalues: CurrentCamera (val), u54 (ref), u55 (ref), TweenService (val), u43 (ref), WorldCursor (val)
        -- upvalues: untracked (val), UserInputService (val), u48 (val), u53 (val), u41 (ref), u42 (ref)
        -- upvalues: RunService (val), u40 (val)
        if a1.Enabled then
            return
        end
        a1.Enabled = true
        a1.CurrentCFrame = CurrentCamera.CFrame
        local zero = Vector2.zero
        CurrentCamera.CameraType = Enum.CameraType.Scriptable
        CurrentCamera.CFrame = (CFrame.new(0, -1000, 0)) * CFrame.Angles(-1.5707963267948966, 0, 0)
        u54 = 0
        u55 = 0
        a1.Atoms.CameraZoomOffset(150)
        TweenService:Create(CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {FieldOfView = 10}):Play()

        local function enableDragging(a1_2) -- Line: 80 -- upvalues: u43 (upval), a1 (val) -- types: a1_2: userdata
            u43 = Vector2.new(a1_2.X, a1_2.Y)
            a1.Atoms.LastDragTick(tick())
            a1.Atoms.DownInputTick(tick())
        end

        local function disableDragging() -- Line: 88 -- upvalues: u43 (upval), WorldCursor (upval), a1 (val)
            u43 = nil
            if not WorldCursor.OverridenByUI then
                WorldCursor:ResumeInput()
            end
            a1.Atoms.UpInputTick(tick())
        end

        local function processInputMovement(a1_2) -- Line: 98
            -- upvalues: u43 (upval), untracked (upval), a1 (val), UserInputService (upval), u48 (upval), u53 (upval)
            if typeof(a1_2) == "Vector3" then
                a1_2 = Vector2.new(a1_2.X, a1_2.Y)
            end
            local v1 = a1_2 - u43
            u43 = a1_2
            local v2 = 25 + 15 * ((untracked(a1.Atoms.CameraZoomOffset) - 100) / 100)
            if UserInputService.TouchEnabled then
                v2 = v2 * 3
            end
            u48:AddVelocity(-v1.X * v2)
            u53:AddVelocity(-v1.Y * v2)
        end

        a1.Connections.InputBegan = UserInputService.InputBegan:Connect(function(a1_2, a2) -- Line: 117 -- upvalues: u43 (upval), a1 (val)
            if a2 then
                return
            end
            if a1_2.UserInputType == Enum.UserInputType.MouseButton2
                or a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
                local Position = a1_2.Position
                u43 = Vector2.new(Position.X, Position.Y)
                a1.Atoms.LastDragTick(tick())
                a1.Atoms.DownInputTick(tick())
            end
        end)
        a1.Connections.InputEnded = UserInputService.InputEnded:Connect(function(a1_2) -- Line: 130 -- upvalues: u43 (upval), WorldCursor (upval), a1 (val)
            if a1_2.UserInputType == Enum.UserInputType.MouseButton2
                or a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
                u43 = nil
                if not WorldCursor.OverridenByUI then
                    WorldCursor:ResumeInput()
                end
                a1.Atoms.UpInputTick(tick())
            end
        end)
        a1.Connections.InputChanged = UserInputService.InputChanged:Connect(function(a1_2, a2) -- Line: 140
            -- upvalues: zero (ref), a1 (val), untracked (upval), u43 (upval), u41 (upval), processInputMovement (val)
            if a1_2.UserInputType == Enum.UserInputType.Gamepad1 and a1_2.KeyCode == Enum.KeyCode.Thumbstick2 then
                zero = a1_2.Position
            end
            if a2 then
                return
            end
            if a1_2.UserInputType == Enum.UserInputType.MouseWheel then
                a1.Atoms.CameraZoomOffset((math.clamp((untracked(a1.Atoms.CameraZoomOffset)) - a1_2.Position.Z * 10, 100, 200)))
                return
            end
            if a1_2.UserInputType == Enum.UserInputType.MouseMovement then
                local v1 = Vector2.new(a1_2.Position.X, a1_2.Position.Y)
                if u43 then
                    local v2 = tick() - untracked(a1.Atoms.LastDragTick)
                    u41 = if 1 <= (u43 - v1).Magnitude then true else not not (v2 > 2)
                end
                if u41 and u43 then
                    processInputMovement(a1_2.Position)
                end
            end
        end)
        a1.Connections.TouchPan = UserInputService.TouchPan:Connect(function(a1_2, a2, a3, a4, a5) -- Line: 184 -- upvalues: u43 (upval), a1 (val), WorldCursor (upval)
            if a5 then
                return
            end
            if a4 ~= Enum.UserInputState.Begin then
                if a4 == Enum.UserInputState.End then
                    u43 = nil
                    if not WorldCursor.OverridenByUI then
                        WorldCursor:ResumeInput()
                    end
                    a1.Atoms.UpInputTick(tick())
                end
                return
            end
            local v1 = a1_2[1]
            if not v1 then
                return
            end
            u43 = Vector2.new(v1.X, v1.Y)
            a1.Atoms.LastDragTick(tick())
            a1.Atoms.DownInputTick(tick())
        end)
        local u71 = 0
        a1.Connections.TouchPinch = UserInputService.TouchPinch:Connect(function(a1_2, a2, a3, a4, a5) -- Line: 202
            -- upvalues: u71 (ref), a1 (val), untracked (upval), u42 (upval), WorldCursor (upval)
            if a5 then
                return
            end
            if a4 == Enum.UserInputState.Change and u71 ~= a2 then
                local v1 = (1 - a2) * 10
                a1.Atoms.CameraZoomOffset((math.clamp(untracked(a1.Atoms.CameraZoomOffset) + v1, 100, 200)))
                u71 = a2
                return
            end
            if a4 == Enum.UserInputState.Begin then
                u42 = true
                WorldCursor:PauseInput()
                return
            end
            if a4 == Enum.UserInputState.End then
                u42 = false
                WorldCursor:ResumeInput()
            end
        end)
        a1.Connections.TouchMoved = UserInputService.TouchMoved:Connect(function(a1, a2) -- Line: 223 -- upvalues: u42 (upval), u43 (upval), processInputMovement (val)
            if not a2 and not u42 then
                if u43 then
                    processInputMovement(a1.Position)
                end
                return
            end
        end)
        a1.Connections.RenderStepped = RunService.RenderStepped:Connect(function(a1_2) -- Line: 234
            -- upvalues: zero (ref), u48 (upval), u53 (upval), u54 (upval), u55 (upval), u40 (upval), untracked (upval)
            -- upvalues: a1 (val), CurrentCamera (upval)
            if 0.1 < (math.abs(zero.X)) or 0.1 < (math.abs(zero.Y)) then
                u48:AddVelocity(zero.X * 75)
                u53:AddVelocity(-zero.Y * 75)
            end
            u54 = u54 + u48.Offset * a1_2
            u55 = u55 + u53.Offset * a1_2
            u54 = math.clamp(u54, u40.MinX, u40.MaxX)
            u55 = math.clamp(u55, u40.MinZ, u40.MaxZ)
            local v1 = -1000 + untracked(a1.Atoms.CameraZoomOffset)
            CurrentCamera.CFrame = (CFrame.new(u54, v1, u55)) * CFrame.Angles(-1.5707963267948966, 0, 0)
        end)
    end,
    Disable = function(a1) -- Line: 253 -- upvalues: TweenService (val), CurrentCamera (val)
        if not a1.Enabled then
            return
        end
        a1.Enabled = false
        TweenService:Create(CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
        for i, j in a1.Connections do
            j:Disconnect()
        end
        CurrentCamera.CameraType = Enum.CameraType.Custom
        CurrentCamera.CFrame = a1.CurrentCFrame
    end,
}