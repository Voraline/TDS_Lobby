-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewEmotes
-- Decompile time: 2.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local SoundService = game:GetService("SoundService")
local u22 = RunService:IsServer()
local u25 = RunService:IsRunning()
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Emote = Content("Emote")
local u51 = {}
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Client = (Assets:WaitForChild("Effects")):WaitForChild("Client")
local Emotes = SoundService:WaitForChild("Emotes")

local function resolveSound(a1) -- Line: 41
    local SoundId = a1.SoundId
    if SoundId == nil then
        SoundId = a1.Sound
    end
    if SoundId ~= 0 and SoundId ~= "0" and SoundId ~= "" and SoundId ~= "rbxassetid://0" then
        return SoundId
    end
    return nil
end

return function(a1) -- Line: 54
    -- upvalues: u51 (val), Assets (val), Emote (val), u25 (val), u22 (val), ServerStorage (val), Create (val)
    -- upvalues: Enum (val), Emotes (val), Client (val), table (val)
    if a1 == "XmasGift" then
        a1 = "Gift"
    end
    local v1 = u51[a1]
    if v1 then
        return v1
    end
    local Emotes_2 = Assets:WaitForChild("Emotes")
    local v2 = nil
    local v3 = nil
    local v4 = Emote:FindFirstChild(a1)
    local u25_2 = v4
    if u25_2 then
        u25_2 = Emotes_2:FindFirstChild(a1)
    end
    if v4 and u25_2 then
        local v5, v6, v7
        local Children = u25_2:FindFirstChild("Accessories") and u25_2.Accessories:GetChildren() or {}
        if not v4:IsA("Folder") then
            local Effects_2 = u25_2:FindFirstChild("Effects")
            v6 = require(v4)
            v7 = Effects_2 and require(Effects_2)
        else
            v6 = require(v4:WaitForChild("Data"))
            local Effects = v4:FindFirstChild("Effects")
            v7 = Effects and require(Effects)
            if u25 then
                if not u22 then
                    local Animator = v4:FindFirstChild("Animator")
                    v2 = Animator and require(Animator)
                else
                    local v8 = a1
                    v5 = ((ServerStorage:WaitForChild("Animators")):WaitForChild("Emotes")):FindFirstChild(v8)
                    v3 = v5 and require(v5)
                end
            end
        end
        local AnimationId = if v6.Track then Create("Animation", {AnimationId = ("rbxassetid://%*"):format(v6.Track or v6.AnimationId)}) else v6.AnimationId and Create("Animation", {AnimationId = ("rbxassetid://%*"):format(v6.Track or v6.AnimationId)})
        local v9 = v6.Interaction or Enum.EmoteInteractType.None
        task.defer(function() -- Line: 118 -- upvalues: u25_2 (val), Emotes (upval), a1 (ref), Client (upval)
            for i, v in ipairs(u25_2:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundGroup = Emotes
                end
            end
            if a1 == "Firework" then
                for i2, i3 in ipairs((Client:WaitForChild("Firework")):GetDescendants()) do
                    if i3:IsA("Sound") then
                        i3.SoundGroup = Emotes
                    end
                end
            end
        end)
        local SoundId = v6.SoundId
        if SoundId == nil then
            SoundId = v6.Sound
        end
        local v10 = if SoundId == 0 then nil else if SoundId == "0" then nil else if SoundId == "" then nil else if SoundId ~= "rbxassetid://0" then SoundId else nil
        local merge = table.merge
        v5 = {
            Name = a1,
            Track = AnimationId,
            Interaction = v9,
            Accessories = Children,
            WalkSpeed = v6.WalkSpeed or 0,
            JumpPower = v6.JumpPower or 0,
            Sound = v10,
        }
        local Rarity = v6.Rarity or Enum.SkinRarity.Common
        v5.Rarity = Rarity
        local Category = v6.Category or Enum.TowerCategory.Starter
        v5.Category = Category
        v5.Controller = v3
        v5.Animator = v2
        v5.Effects = v7
        local v11 = merge(v5, v6)
        v11.Sound = v10
        u51[a1] = v11
        return v11
    end
    return nil
end