-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.init.story
-- Decompile time: 1.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
controls = {canSeeAds = true}
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = controls,
    story = function(a1) -- Line: 17 -- upvalues: createElement (val), Parent (val)
        return createElement(Parent, {
            playtime = 2000,
            claimed = {true, false, true, false, false, false},
            onClaimed = function(a1) -- Line: 22 -- types: a1: number
                print("Claimed reward at index:", a1)
            end,
            onClose = function() -- Line: 25
                print("Closed")
            end,
            videoStates = {"claimed", "claim", "locked"},
            onVideoClaimed = function(a1) -- Line: 29 -- types: a1: number
                print("Claimed video reward at index:", a1)
            end,
            timeUntilVideoReset = 86400 - workspace:GetServerTimeNow() % 86400,
            canSeeAds = a1.controls.canSeeAds,
            rewardInfo = {
                "1x Low Tier Chest (??%)",
                "2x Low Tier Chest (??%)",
                "1x Mid Tier Chest (??%)",
                "2x Mid Tier Chest (??%)",
                "1x High Tier Chest (??%)",
            },
            onRewardInfoSelected = function(a1) -- Line: 42 -- types: a1: number
                print("Selected reward info at index:", a1)
            end,
        })
    end,
}