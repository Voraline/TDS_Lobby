-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewClasses.CratePreview3D
-- Decompile time: 2.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local NewCrates = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewCrates)
local PreviewBase = require(script.Parent.PreviewBase)
local Promise = require(Packages.Promise)
local Sift = require(Packages.Sift)
local u27 = setmetatable({}, PreviewBase)
u27.__index = u27

local function setModelAnchored(a1, a2) -- Line: 21 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = a2
        end
    end
end

local function getPrimaryPart(a1) -- Line: 29 -- types: a1: userdata
    if a1.PrimaryPart then
        return a1.PrimaryPart
    end
    local BasePart = a1:FindFirstChildWhichIsA("BasePart", true)
    if BasePart then
        a1.PrimaryPart = BasePart
    end
    return BasePart
end

function u27.new(a1) -- Line: 42
    -- upvalues: NewCrates (val), Sift (val), PreviewBase (val), u27 (val)
    local v1 = NewCrates(a1)
    assert(v1 and v1.Model, (("Crate model not found for \"%*\""):format(a1)))
    local v2 = v1.Model:Clone()
    v2.Name = ("%* Crate Preview"):format(a1)
    return (setmetatable(Sift.Dictionary.join(PreviewBase.new(v2), {crateName = a1, Spawn = u27.Spawn, Destroy = u27.Destroy}), u27))
end

function u27.Spawn(a1) -- Line: 58 -- upvalues: Promise (val), setModelAnchored (val), PreviewBase (val)
    return Promise.new(function(a1_2, a2) -- Line: 59 -- upvalues: a1 (val), setModelAnchored (upval), PreviewBase (upval)
        local PrimaryPart
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
        if not model.PrimaryPart then
            local BasePart = model:FindFirstChildWhichIsA("BasePart", true)
            if BasePart then
                model.PrimaryPart = BasePart
            end
            PrimaryPart = BasePart
        else
            PrimaryPart = model.PrimaryPart
        end
        if not PrimaryPart then
            a2("Model has no BasePart for ShopFocus")
            return
        end
        setModelAnchored(model, true)
        model:ScaleTo(1.3)
        local v1 = (Vector3.new(Main.Position.X, Main.Position.Y + Main.Size.Y / 2 + PrimaryPart.Size.Y / 2, Main.Position.Z)) - PrimaryPart.Position
        model:PivotTo((model:GetPivot()) + v1)
        model.Parent = workspace
        PreviewBase.TurnTowardsCamera(a1)
        a1_2(model)
    end)
end

function u27.Destroy(a1) -- Line: 100 -- upvalues: PreviewBase (val)
    PreviewBase.Destroy(a1)
end

return u27