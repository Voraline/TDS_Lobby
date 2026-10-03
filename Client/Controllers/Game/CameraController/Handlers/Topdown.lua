-- Script path: ReplicatedStorage.Client.Controllers.Game.CameraController.Handlers.Topdown
-- Decompile time: 7.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Raycast = require(ReplicatedStorage.Shared.Modules.Raycast)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local CurrentCamera = workspace.CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()

local function DescendantOf(a1, a2) -- Line: 29
    local result
    _, result = pcall(function() -- Line: 30 -- upvalues: a1 (val), a2 (val)
        return a1:IsDescendantOf(a2)
    end)
    return result
end

local u56 = {}
u56.__index = u56

function u56:CalculateApproximateCFrame() -- Line: 40
    self.TargetPosition = self.TargetPosition + (Vector3.new(self.Input.X, 0, self.Input.Y)) * self.Damp
    return CFrame.new(
        Vector3.new(self.TargetPosition.X, 7.5 * self.Zoom, self.TargetPosition.Z),
        (Vector3.new(self.TargetPosition.X, -10, self.TargetPosition.Z))
    )
end

function u56:FindSelection(a2) -- Line: 51
    local function setSelected(a1) -- Line: 54 -- upvalues: self (val)
        if self.Selected == a1 then
            self.Selected = nil
            return
        end
        self.Selected = a1
    end

    local function findUlteriorModel(a1) -- Line: 62
        local u2

        function u2(a1) -- Line: 65 -- upvalues: u2 (ref)
            if not a1.Parent then
                return
            end
            if a1.Parent:IsA("Model") then
                return u2(a1.Parent)
            end
            return a1
        end

        return (u2(a1))
    end

    local v1 = a2:CastMouse()
    if v1 and v1.Hit then
        local result, result_2, u10
        local Hit = v1.Hit

        function u10(a1) -- Line: 65 -- upvalues: u10 (ref)
            if not a1.Parent then
                return
            end
            if a1.Parent:IsA("Model") then
                return u10(a1.Parent)
            end
            return a1
        end

        local u14 = u10(Hit)
        if u14:IsA("Model") then
            if not u14.PrimaryPart then
                return
            end
        else
            u14 = v1.Hit:FindFirstAncestorWhichIsA("Model") or nil
            if not u14 then
                return
            end
        end
        local Towers = workspace.Towers
        _, result = pcall(function() -- Line: 30 -- upvalues: u14 (val), Towers (val)
            return u14:IsDescendantOf(Towers)
        end)
        if result then
            return setSelected(u14)
        end
        local Enemies = workspace.Enemies
        _, result_2 = pcall(function() -- Line: 30 -- upvalues: u14 (val), Enemies (val)
            return u14:IsDescendantOf(Enemies)
        end)
        if result_2 then
            return setSelected(u14)
        end
    end
    if self.Selected == nil then
        self.Selected = nil
        return
    end
    self.Selected = nil
end

function u56.Enter(a1, a2) -- Line: 107
    -- upvalues: CurrentCamera (val), Maid (val), Signal (val), Raycast (val), Scheduler (val), RunService (val)
    -- upvalues: math (val), UserInputService (val), Mouse (val), u56 (val)
    local Character = game.Players.LocalPlayer.Character
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    HumanoidRootPart.Anchored = true
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    local u13 = {lastThumbstickCoord = 0, Damp = 0.5, Zoom = 5}
    u13.Connections = Maid.new()
    u13.Clicked = Signal.new()
    u13.Input = Vector2.new(0, 0)
    u13.TargetPosition = Vector3.new(Character.PrimaryPart.Position.X, 0, Character.PrimaryPart.Position.Z)
    u13.Keys = {}
    u13.MouseCast = Raycast.new("Whitelist", {workspace.Towers, workspace.Enemies})

    local function wipeTargeted() -- Line: 142 -- upvalues: u13 (val)
        if u13.Selected then
            u13.Selected = nil
        end
    end

    u13.Connections:Mark((Character.Humanoid.Died:Connect(function() -- Line: 149 -- upvalues: a2 (val)
        a2:Halt()
    end)))
    u13.Connections:Mark((Scheduler.addDynamic("TopDown", RunService.RenderStepped, function(a1) -- Line: 153 -- upvalues: u13 (val), math (upval), CurrentCamera (upval)
        local result
        u13.Zoom = math.clamp(u13.Zoom + u13.lastThumbstickCoord, 4.5, 25)
        u13.Damp = math.clamp(u13.Damp + u13.lastThumbstickCoord, 0.25, 0.5)
        if not u13.Selected then
            CurrentCamera.CFrame = CurrentCamera.CFrame:lerp(u13:CalculateApproximateCFrame(), (math.min(a1 * 7.5, 1)))
            return
        end
        local Selected = u13.Selected
        local u42 = workspace
        _, result = pcall(function() -- Line: 30 -- upvalues: Selected (val), u42 (val)
            return Selected:IsDescendantOf(u42)
        end)
        if not result or not u13.Selected:IsA("Model") or not u13.Selected.PrimaryPart then
            u13.Selected = nil
            return
        end
        local v1 = Vector3.new(u13.Selected.PrimaryPart.CFrame.p.X, 7.5 * u13.Zoom, u13.Selected.PrimaryPart.CFrame.p.Z)
        CurrentCamera.CFrame = CurrentCamera.CFrame:lerp(CFrame.new(v1, u13.Selected.PrimaryPart.CFrame.p), (math.min(a1 * 15, 1)))
        u13.TargetPosition = Vector3.new(u13.Selected.PrimaryPart.Position.X, 0, u13.Selected.PrimaryPart.Position.Z)
    end)))
    u13.Connections:Mark((u13.Clicked:Connect(function() -- Line: 195 -- upvalues: u13 (val)
        u13:FindSelection(u13.MouseCast)
    end)))
    u13.Connections:Mark((UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 199 -- upvalues: u13 (val)
        if a2 then
            return
        end
        if a1.KeyCode == Enum.KeyCode.W and not u13.Keys.W then
            u13.Keys.W = true
            u13.Input = u13.Input + Vector2.new(1, 0)
            if not u13.Selected then
                return
            end
            u13.Selected = nil
            return
        end
        if a1.KeyCode == Enum.KeyCode.S and not u13.Keys.S then
            u13.Keys.S = true
            u13.Input = u13.Input + Vector2.new(-1, 0)
            if not u13.Selected then
                return
            end
            u13.Selected = nil
            return
        end
        if a1.KeyCode == Enum.KeyCode.A and not u13.Keys.A then
            u13.Keys.A = true
            u13.Input = u13.Input + Vector2.new(0, -1)
            if not u13.Selected then
                return
            end
            u13.Selected = nil
            return
        end
        if a1.KeyCode == Enum.KeyCode.D and not u13.Keys.D then
            u13.Keys.D = true
            u13.Input = u13.Input + Vector2.new(0, 1)
            if u13.Selected then
                u13.Selected = nil
            end
        end
    end)))
    u13.Connections:Mark((UserInputService.InputEnded:Connect(function(a1, a2) -- Line: 223 -- upvalues: u13 (val)
        if a1.KeyCode ~= Enum.KeyCode.W then
            if a1.KeyCode ~= Enum.KeyCode.S then
                if a1.KeyCode ~= Enum.KeyCode.A then
                    if a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                        u13.Keys.D = false
                        u13.Input = u13.Input - Vector2.new(0, 1)
                    end
                elseif u13.Keys.A then
                    u13.Keys.A = false
                    u13.Input = u13.Input - Vector2.new(0, -1)
                elseif a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                    u13.Keys.D = false
                    u13.Input = u13.Input - Vector2.new(0, 1)
                end
            elseif u13.Keys.S then
                u13.Keys.S = false
                u13.Input = u13.Input - Vector2.new(-1, 0)
            elseif a1.KeyCode ~= Enum.KeyCode.A then
                if a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                    u13.Keys.D = false
                    u13.Input = u13.Input - Vector2.new(0, 1)
                end
            elseif u13.Keys.A then
                u13.Keys.A = false
                u13.Input = u13.Input - Vector2.new(0, -1)
            elseif a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                u13.Keys.D = false
                u13.Input = u13.Input - Vector2.new(0, 1)
            end
        elseif u13.Keys.W then
            u13.Keys.W = false
            u13.Input = u13.Input - Vector2.new(1, 0)
        elseif a1.KeyCode ~= Enum.KeyCode.S then
            if a1.KeyCode ~= Enum.KeyCode.A then
                if a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                    u13.Keys.D = false
                    u13.Input = u13.Input - Vector2.new(0, 1)
                end
            elseif u13.Keys.A then
                u13.Keys.A = false
                u13.Input = u13.Input - Vector2.new(0, -1)
            elseif a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                u13.Keys.D = false
                u13.Input = u13.Input - Vector2.new(0, 1)
            end
        elseif u13.Keys.S then
            u13.Keys.S = false
            u13.Input = u13.Input - Vector2.new(-1, 0)
        elseif a1.KeyCode ~= Enum.KeyCode.A then
            if a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
                u13.Keys.D = false
                u13.Input = u13.Input - Vector2.new(0, 1)
            end
        elseif u13.Keys.A then
            u13.Keys.A = false
            u13.Input = u13.Input - Vector2.new(0, -1)
        elseif a1.KeyCode == Enum.KeyCode.D and u13.Keys.D then
            u13.Keys.D = false
            u13.Input = u13.Input - Vector2.new(0, 1)
        end
        if a1.KeyCode == Enum.KeyCode.Thumbstick1 then
            u13.Input = Vector2.new(0, 0)
        end
        if a1.KeyCode == Enum.KeyCode.Thumbstick2 then
            u13.lastThumbstickCoord = 0
        end
    end)))
    u13.Connections:Mark((UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 247 -- upvalues: math (upval), u13 (val)
        if a1.KeyCode == Enum.KeyCode.Thumbstick1 then
            local X = a1.Position.X
            local Y = a1.Position.Y
            if (math.abs(X)) < 0.2 then
                X = 0
            end
            if (math.abs(Y)) < 0.2 then
                Y = 0
            end
            u13.Input = Vector2.new(math.min(Y, 1), math.min(X, 1))
        end
        if a1.KeyCode == Enum.KeyCode.Thumbstick2 then
            u13.lastThumbstickCoord = a1.Position.Y / 10
        end
    end)))
    u13.Connections:Mark((UserInputService.TouchPan:Connect(function(a1, a2, a3, a4, a5) -- Line: 268 -- upvalues: u13 (val)
        if a5 then
            return
        end
        if a4 == Enum.UserInputState.End then
            u13.Input = Vector2.new(0, 0)
            return
        end
        u13.Input = Vector2.new(-a2.Y, a2.X) * 0.01
    end)))
    u13.Connections:Mark((UserInputService.TouchPinch:Connect(function(a1, a2, a3, a4, a5) -- Line: 280 -- upvalues: u13 (val), math (upval)
        if a4 == Enum.UserInputState.Change or a4 == Enum.UserInputState.End then
            local v1 = a2 - u13.lastTouchScale
            u13.Zoom = math.clamp(u13.Zoom * (1 + v1), 4.5, 25)
            u13.Damp = math.clamp(u13.Damp * (0.1 + v1), 0.25, 0.5)
        end
        u13.lastTouchScale = a2
    end)))
    u13.Connections:Mark((Mouse.WheelForward:Connect(function() -- Line: 291 -- upvalues: u13 (val), math (upval)
        u13.Zoom = math.clamp(u13.Zoom - 1.25, 4.5, 25)
        u13.Damp = math.clamp(u13.Damp + 0.025, 0.25, 0.5)
    end)))
    u13.Connections:Mark((Mouse.WheelBackward:Connect(function() -- Line: 296 -- upvalues: u13 (val), math (upval)
        u13.Zoom = math.clamp(u13.Zoom + 1.25, 4.5, 25)
        u13.Damp = math.clamp(u13.Damp - 0.025, 0.25, 0.5)
    end)))
    return (setmetatable(u13, u56))
end

function u56.Exit(a1) -- Line: 304 -- upvalues: CurrentCamera (val)
    a1.Connections:Sweep()
    CurrentCamera.CameraType = Enum.CameraType.Custom
    local HumanoidRootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    HumanoidRootPart.Anchored = false
end

return u56