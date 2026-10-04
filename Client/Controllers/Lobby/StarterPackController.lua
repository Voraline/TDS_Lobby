-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StarterPackController
-- Decompile time: 3.23 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local StarterPackStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.StarterPackStore)
local u26 = {}
local StarterPackSign = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Templates")):WaitForChild("StarterPackSign")
u26.EndTime = 0
u26.Renderered = false
u26.Interface = nil
u26.Asset = nil

function u26.Start() -- Line: 22 -- upvalues: u26 (val), StarterPackSign (val), Players (val), CollectionService (val)
    if u26.Asset then
        return
    end
    local v1 = StarterPackSign:Clone()
    local Board = v1:FindFirstChild("Board")
    assert(Board and Board:IsA("BasePart"), "StarterPackSign is missing its Board part")
    v1.Parent = workspace
    local SurfaceGui = Instance.new("SurfaceGui")
    SurfaceGui.Name = "StarterPackBundlePortal"
    SurfaceGui.Adornee = Board
    SurfaceGui.Face = Enum.NormalId.Front
    SurfaceGui.ResetOnSpawn = false
    SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    SurfaceGui.PixelsPerStud = 25
    SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SurfaceGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    CollectionService:AddTag(SurfaceGui, "StarterPackBundlePortal")
    u26.Asset = v1
    u26.Interface = SurfaceGui
end

function u26.Stop() -- Line: 48 -- upvalues: u26 (val), CollectionService (val)
    if u26.Interface then
        CollectionService:RemoveTag(u26.Interface, "StarterPackBundlePortal")
        u26.Interface:Destroy()
        u26.Interface = nil
    end
    if u26.Asset then
        u26.Asset:Destroy()
        u26.Asset = nil
    end
end

function u26.Update() -- Line: 61 -- upvalues: u26 (val)
    if not (0 < u26.EndTime - workspace:GetServerTimeNow()) then
        if u26.Renderered then
            u26.Renderered = false
            u26.Stop()
        end
        return
    end
    if u26.Renderered then
        return
    end
    u26.Renderered = true
    u26.Start()
end

function u26.init() -- Line: 78 -- upvalues: u26 (val), StarterPackStore (val), Charm (val)
    local v1 = StarterPackStore.getEndTime()
    if not (v1 <= 0) then
        u26.EndTime = v1
    else
        u26.EndTime = 0
    end
    u26.Update()
    Charm.subscribe(StarterPackStore.getEndTime, function(a1) -- Line: 79 -- upvalues: u26 (upval) -- types: a1: number
        if a1 <= 0 then
            u26.EndTime = 0
            u26.Update()
            return
        end
        u26.EndTime = a1
        u26.Update()
    end)
    while task.wait(0.5) do
        u26.Update()
    end
end

task.spawn(u26.init)
return u26