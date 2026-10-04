-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewClasses.EmotePreview3D
-- Decompile time: 6.18 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Shared.Modules
local Packages = ReplicatedStorage.Packages
local Handlers = Modules.Asset.Handlers
local CustomAccessories = require(Modules.CustomAccessories)
local NewEmotes = require(Handlers.NewEmotes)
local EmoteReplicator = require(ReplicatedStorage.Client.Modules.Replicators.EmoteReplicator)
local PreviewBase = require(script.Parent.PreviewBase)
local Promise = require(Packages.Promise)
local Sift = require(Packages.Sift)
local u41 = setmetatable({}, PreviewBase)
u41.__index = u41

function u41.new(a1) -- Line: 31 -- upvalues: Sift (val), PreviewBase (val), u41 (val) -- types: a1: userdata
    return (setmetatable(Sift.Dictionary.join(PreviewBase.new(a1), {Spawn = u41.Spawn, PlayEmote = u41.PlayEmote, StopEmote = u41.StopEmote}), u41))
end

function u41.Spawn(a1) -- Line: 44 -- upvalues: Promise (val), PreviewBase (val)
    return Promise.new(function(a1_2, a2) -- Line: 45 -- upvalues: a1 (val), PreviewBase (upval)
        local u2 = nil
        ;((a1:InitializeHumanoidModel():timeout(3)):andThen(function(a1) -- Line: 50 -- upvalues: u2 (ref)
            u2 = a1
        end)):catch(warn):await()
        if not u2 then
            a2("Failed to initialize humanoid model for EmotePreview3D")
            return
        end
        local Humanoid = u2:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            local Animator = Humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator")
            Animator.Parent = Humanoid
            a1.Animator = Animator
        end
        PreviewBase.TurnTowardsCamera(a1)
        a1_2(u2)
    end)
end

function u41.PlayEmote(a1, a2, a3) -- Line: 76
    -- upvalues: NewEmotes (val), Players (val), CustomAccessories (val), EmoteReplicator (val)
    if not a1.Animator then
        warn("Preview animator has not been initialized")
        return
    end
    if not NewEmotes(a2) then
        warn((("Emote \"%*\" does not exist"):format(a2)))
        return
    end
    a1:StopEmote()
    local model = a1.model
    local Humanoid = model:FindFirstChildOfClass("Humanoid")
    local PrimaryPart = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart")
    local LocalPlayer = Players.LocalPlayer
    local u32 = {}
    if Humanoid and PrimaryPart and LocalPlayer then
        local v1 = EmoteReplicator.new({
            Humanoid = Humanoid,
            Animator = a1.Animator,
            Root = PrimaryPart,
            Instance = model,
            Player = {
                Character = model,
                UserId = LocalPlayer.UserId,
                SetAttribute = function(a1, a2, a3) -- Line: 111 -- upvalues: u32 (val)
                    u32[a2] = a3
                end,
                GetAttribute = function(a1, a2) -- Line: 114 -- upvalues: u32 (val)
                    return u32[a2]
                end,
            },
            StopEmoting = function() end,
            AddAccessories = function(a1, a2) -- Line: 120 -- upvalues: CustomAccessories (upval), model (val)
                return CustomAccessories.AddAccessories(model, a2)
            end,
        }, a2)
        v1.Preview = true
        v1.PlaySoundInPreview = true
        v1.Fade = 0
        v1:Play(0, nil, nil, a3)
        a1.CurrentEmote = v1
        return
    end
    warn("Preview emote rig is missing required humanoid/root/player data")
end

function u41:StopEmote() -- Line: 134
    if self.CurrentEmote then
        self.CurrentEmote:Destroy()
        self.CurrentEmote = nil
    end
end

function u41:Destroy() -- Line: 141 -- upvalues: PreviewBase (val)
    self:StopEmote()
    PreviewBase.Destroy(self)
end

return u41