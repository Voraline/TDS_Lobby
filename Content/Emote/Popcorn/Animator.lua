-- Script path: ReplicatedStorage.Content.Emote.Popcorn.Animator
-- Decompile time: 1.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local v1 = {}

local function createAnimation(a1) -- Line: 14 -- upvalues: Create (val) -- types: a1: number
    return Create("Animation", {AnimationId = ("rbxassetid://%*"):format(a1)})
end

function v1.Initialize(a1) -- Line: 20 -- upvalues: Maid (val), createAnimation (val), RunService (val)
    local v1 = Maid.new()
    a1.Maid = v1
    local Animator = a1.Animator
    local Bucket = a1.Character.Instance:WaitForChild("Bucket")
    local u16 = Animator:LoadAnimation((createAnimation(15178564323)))
    local u22 = Animator:LoadAnimation((createAnimation(15178543623)))
    u22:Play(0)
    local u29 = a1.Started + u22.Length
    local u30 = 0
    for i, j in {
        (u22:GetMarkerReachedSignal("Appear")):Connect(function() -- Line: 37 -- upvalues: Bucket (val)
            Bucket.Handle.Transparency = 0
            return
        end),
        (u16:GetMarkerReachedSignal("Eat")):Connect(function() -- Line: 41 -- upvalues: Bucket (val)
            local Attribute, Emitter, v1, v2, v4, v5
            Emitter = Bucket.PopcornEffect.Emitter
            Emitter:Emit((Emitter:GetAttribute("EmitCount")) or 5)
            return
        end),
        (u16:GetMarkerReachedSignal("Sound")):Connect(function(a1_2) -- Line: 46 -- upvalues: a1 (val), Bucket (val)
            local v1, v2
            if not a1.Preview then
                Bucket.PopcornEffect[a1_2]:Play()
            end
            return
        end),
        (RunService.Heartbeat:Connect(function() -- Line: 52 -- upvalues: u22 (val), u16 (val), a1 (val), u29 (val), u30 (ref)
            local ServerTimeNow, v0, v1, v2, v3
            if not u22.IsPlaying and not u16.IsPlaying and not a1.Preview then
                v0 = math.floor((workspace:GetServerTimeNow()) - u29)
                if v0 ~= u30 and v0 % 4 == 0 then
                    u30 = v0
                    u16:Play()
                end
                return
            end
            return
        end)),
    } do
        v1:Mark(j)
    end
    v1:Mark(function() -- Line: 68 -- upvalues: u16 (val), u22 (val)
        u16:Stop()
        u22:Stop()
    end)
end

function v1.Destroy(a1) -- Line: 74
    if a1.Maid then
        a1.Maid:Sweep()
        a1.Maid = nil
    end
end

return v1