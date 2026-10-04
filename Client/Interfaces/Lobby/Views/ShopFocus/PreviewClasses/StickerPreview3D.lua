-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewClasses.StickerPreview3D
-- Decompile time: 1.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Shared.Modules
local Packages = ReplicatedStorage.Packages
require(Modules.Animation)
require(Modules.Maid)
local PreviewBase = require(script.Parent.PreviewBase)
local Promise = require(Packages.Promise)
local Sift = require(Packages.Sift)
local u28 = setmetatable({}, PreviewBase)
u28.__index = u28

function u28.new(a1) -- Line: 23 -- upvalues: Sift (val), PreviewBase (val), u28 (val) -- types: a1: userdata
    return (setmetatable(Sift.Dictionary.join(PreviewBase.new(a1), {Spawn = u28.Spawn}), u28))
end

function u28.Spawn(a1) -- Line: 31 -- upvalues: Promise (val), PreviewBase (val)
    return Promise.new(function(a1_2, a2) -- Line: 32 -- upvalues: a1 (val), PreviewBase (upval)
        local v1 = (a1:InitializeHumanoidModel():timeout(3)):catch(warn)
        if not v1 then
            a2("Failed to initialize humanoid model for StickerPreview3D")
            return
        end
        PreviewBase.TurnTowardsCamera(a1)
        a1_2(v1)
    end)
end

function u28.Destroy(a1) -- Line: 47 -- upvalues: PreviewBase (val)
    PreviewBase.Destroy(a1)
end

return u28