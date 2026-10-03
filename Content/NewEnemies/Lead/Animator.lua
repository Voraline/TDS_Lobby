-- Script path: ReplicatedStorage.Content.NewEnemies.Lead.Animator
-- Decompile time: 1.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

local function removeArmorPiece(a1, a2) -- Line: 8 -- types: a1: userdata, a2: string
    local Armor = a1:FindFirstChild("Armor")
    local v1 = Armor and Armor:FindFirstChild(a2)
    if v1 and v1:IsA("BasePart") then
        v1:Destroy()
    end
end

function v1.Initialize(a1) -- Line: 16 -- upvalues: EasySound (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local Break = if not PrimaryPart then nil else PrimaryPart:FindFirstChild("Break")
    if Break and not Break:IsA("Sound") then
        Break = nil
    end
    a1.Executables = {
        RemoveArmorPiece = function(a1_2) -- Line: 24
            -- upvalues: a1 (val), PrimaryPart (val), Break (ref), EasySound (upval)
            local Armor = a1.Model:FindFirstChild("Armor")
            local v1 = Armor and Armor:FindFirstChild(a1_2)
            if v1 and v1:IsA("BasePart") then
                v1:Destroy()
            end
            if PrimaryPart and Break then
                if Break.Parent ~= PrimaryPart then
                    Break.Parent = PrimaryPart
                end
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Enemies",
                    id = Break.SoundId,
                    parent = PrimaryPart,
                    volume = Break.Volume,
                    playbackSpeed = Break.PlaybackSpeed,
                })
            end
        end,
        PlayLeadBlockSound = function() -- Line: 41 -- upvalues: PrimaryPart (val), Break (ref), EasySound (upval)
            if PrimaryPart and Break then
                if Break.Parent ~= PrimaryPart then
                    Break.Parent = PrimaryPart
                end
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Enemies",
                    id = Break.SoundId,
                    parent = PrimaryPart,
                    volume = Break.Volume,
                    playbackSpeed = Break.PlaybackSpeed,
                })
            end
        end,
    }
end

return v1