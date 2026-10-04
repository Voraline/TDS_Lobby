-- Script path: ReplicatedStorage.Client.Controllers.Lobby.FlyOverController
-- Decompile time: 3.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local AC130 = ReplicatedStorage.Assets.Effects.Misc:WaitForChild("AC130")
local FlyOver = NewNetwork.Channel("FlyOver")

local function flyOver() -- Line: 16 -- upvalues: CatRom (val), AC130 (val), SoundService (val), RunService (val)
    local v1 = CFrame.Angles(0, math.random() * 3.141592653589793 * 2, 0)
    local v2 = CFrame.new((Vector3.new(-0.08399999886751175, 312.7409973144531, -0.06700000166893005))) * v1 * CFrame.new(0, 200, -1000)
    local v3 = CFrame.new((Vector3.new(-0.08399999886751175, 312.7409973144531, -0.06700000166893005))) * v1 * CFrame.new(0, 200, 1000)
    local u41 = CatRom.new({
        v2.Position,
        ((v2:Lerp(v3, 0.5)) + Vector3.new(0, -200, 0)).Position,
        v3.Position,
    })
    local u45 = u41:SolveLength() / 500
    local u49 = AC130:Clone()
    u49.Root.Passby.SoundGroup = SoundService.Ambience
    u49.Root.Passby.Playing = true
    u49.Root.Passby.Looped = true
    for i, j in u49:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanTouch = false
            j.CanQuery = false
        elseif j:IsA("Trail") then
            j.Lifetime = 0.5
            j.Enabled = true
        end
    end
    u49:ScaleTo(6)
    local u77 = 0
    local u78 = nil
    u78 = RunService.Heartbeat:Connect(function(a1) -- Line: 47 -- upvalues: u77 (ref), u45 (val), u49 (val), u41 (val), u78 (ref)
        u77 = u77 + a1
        local v1 = math.clamp(u77 / u45, 0, 1)
        u49:PivotTo((u41:SolveUniformCFrame(v1)) * (CFrame.Angles(0, 3.141592653589793, 0)))
        if v1 == 1 then
            u78:Disconnect()
            u49:Destroy()
        end
    end)
    u49.Parent = workspace
    return function() -- Line: 61 -- upvalues: u78 (ref), u49 (val)
        if u78.Connected then
            u78:Disconnect()
        end
        if u49.Parent == workspace then
            u49:Destroy()
        end
    end
end

FlyOver:onEvent("Fly", function() -- Line: 72 -- upvalues: flyOver (val)
    flyOver()
end)
return {flyOver = flyOver}