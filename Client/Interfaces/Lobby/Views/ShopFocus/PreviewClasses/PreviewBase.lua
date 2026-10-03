-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewClasses.PreviewBase
-- Decompile time: 1.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Shared.Modules
local Packages = ReplicatedStorage.Packages
require(Modules.Animation)
local Maid = require(Modules.Maid)
local Promise = require(Packages.Promise)
local u17 = {}
u17.__index = u17

function u17.new(a1) -- Line: 27 -- upvalues: Maid (val), u17 (val) -- types: a1: userdata
    return (setmetatable({model = a1, maid = Maid.new()}, u17))
end

function u17.InitializeHumanoidModel(a1) -- Line: 38 -- upvalues: Promise (val), u17 (val) -- types: a1: table
    return Promise.new(function(a1_2, a2) -- Line: 39 -- upvalues: a1 (val), u17 (upval)
        local Lobby = workspace:FindFirstChild("Lobby")
        local ShopFocus = Lobby and Lobby:FindFirstChild("ShopFocus")
        if not ShopFocus then
            a2("'ShopFocus' not found in workspace.Lobby for ShopFocus")
            return
        end
        local Main = ShopFocus:FindFirstChild("Main")
        if not Main then
            a2("Spawn part not found in 'ShopFocus' for ShopFocus")
            return
        end
        local model = a1.model
        local PrimaryPart = model.PrimaryPart
        if not PrimaryPart then
            a2("Model has no PrimaryPart for ShopFocus")
            return
        end
        local Humanoid = model:FindFirstChildOfClass("Humanoid")
        if not Humanoid then
            a2("Model has no Humanoid for ShopFocus")
            return
        end
        local v1 = Vector3.new(Main.Position.X, Main.Position.Y + Main.Size.Y / 2 + (Humanoid.HipHeight + PrimaryPart.Size.Y / 2), Main.Position.Z)
        PrimaryPart.Anchored = true
        model:PivotTo((CFrame.new(v1)))
        model.Parent = workspace
        u17.TurnTowardsCamera(a1)
        a1_2(model)
    end)
end

function u17.TurnTowardsCamera(a1) -- Line: 87 -- types: a1: table
    local CurrentCamera = workspace.CurrentCamera
    local model = a1.model
    if not CurrentCamera then
        return
    end
    local Position = model:GetPivot().Position
    local Position_2 = CurrentCamera.CFrame.Position
    local v1 = Vector3.new(Position_2.X, Position.Y, Position_2.Z)
    if (v1 - Position).Magnitude < 0.001 then
        return
    end
    model:PivotTo((CFrame.lookAt(Position, v1)))
end

function u17.Turn(a1, a2) end

function u17:Destroy() -- Line: 114 -- types: self: table
    self.model:Destroy()
    self.maid:Sweep()
end

return u17