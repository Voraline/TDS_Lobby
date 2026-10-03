-- Script path: ReplicatedStorage.Shared.Modules.ClientAtoms
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
require(ReplicatedStorage.Client.Modules.TagReplicator)
local atom = Charm.atom
return {
    bosses = atom({}),
    enemyReplicators = atom({}),
    hideTowerRings = atom(false),
    cloneTowerAtom = atom({
        enabled = false,
        selected = "none",
        dontSelect = "none",
        ownedTowersOnly = false,
        blockOtherAbilities = false,
        allowHolograms = false,
        isCloning = false,
        costPercent = 0,
        dontSelectList = {},
    }),
    cloneTowerRangeRing = atom({
        position = Vector3.new(0, 0, 0),
        enabled = false,
        range = 0,
        towerBoundary = 0,
        color = Color3.fromRGB(255, 255, 255),
    }),
    pvpLeaderboardPlayers = atom({}),
    towerSelectorAtom = Charm.atom({enabled = false, tower = false}),
    elevatorAtom = Charm.atom(nil),
}