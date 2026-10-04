-- Script path: ReplicatedStorage.Content.Emote.The Z Step.Animator
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local v1 = {}
local u22 = {25954372, 25954392, 25954407}
local u27 = Random.new()
local u31 = NumberRange.new(1, 4)

local function getSound(a1) -- Line: 14 -- upvalues: u22 (val), u27 (val) -- types: a1: number?
    local v1
    repeat
        v1 = u22[u27:NextInteger(1, #u22)]
    until v1 ~= a1 or #u22 < 2
    return v1
end

function v1.Initialize(a1) -- Line: 24
    -- upvalues: u27 (val), u31 (val), RunService (val), getSound (val), Create (val), SoundService (val)
    local Character = a1.Character
    local Root = Character.Root
    local Humanoid = Character.Humanoid
    local u4 = nil
    local u15 = (tick()) + u27:NextInteger(u31.Min, u31.Max)
    if a1.Preview then
        return
    end
    a1.walkToPoint = RunService.Heartbeat:Connect(function() -- Line: 37
        -- upvalues: a1 (val), Humanoid (val), Root (val), u15 (ref), u4 (ref), getSound (upval), Create (upval)
        -- upvalues: SoundService (upval), u27 (upval), u31 (upval)
        if a1.Local then
            Humanoid:MoveTo(Root.Position + Root.CFrame.LookVector * 10)
        end
        if u15 < tick() then
            u4 = getSound(u4)
            local u36 = Create("Sound", {
                Name = "ZombieSound",
                Volume = 1,
                Looped = false,
                SoundId = ("rbxassetid://%*"):format(u4),
                SoundGroup = SoundService.Emotes,
                Pitch = u27:NextNumber(0.9, 1.2),
                Parent = Root,
            })
            u36.Ended:Connect(function() -- Line: 54 -- upvalues: u36 (val)
                u36:Destroy()
            end)
            u15 = tick() + u36.TimeLength + u27:NextInteger(u31.Min, u31.Max)
            u36:Play()
        end
    end)
end

function v1:Destroy() -- Line: 64
    if self.Local then
        self.Character.Humanoid:MoveTo(self.Character.Root.Position)
    end
    if self.walkToPoint then
        self.walkToPoint:Disconnect()
        self.walkToPoint = nil
    end
end

return v1