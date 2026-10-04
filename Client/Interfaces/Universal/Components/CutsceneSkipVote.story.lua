-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.CutsceneSkipVote.story
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutsceneSkipVote = require(script.Parent.CutsceneSkipVote)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {hasVoted = false, requiredVotes = 3, votes = 1},
    story = function(a1) -- Line: 17 -- upvalues: useState (val), useEffect (val), createElement (val), CutsceneSkipVote (val)
        local v1, u4 = useState(false)
        local v2 = useEffect
        local v3 = {
            a1.controls.hasVoted,
            a1.controls.requiredVotes,
            a1.controls.votes,
        }
        v2(function() -- Line: 20 -- upvalues: u4 (val)
            u4(false)
        end, v3)
        return createElement("Frame", {BackgroundColor3 = Color3.fromRGB(12, 16, 24), Size = UDim2.fromScale(1, 1)}, {
            skipVote = createElement(CutsceneSkipVote, {
                visible = true,
                hasVoted = a1.controls.hasVoted or v1,
                onVote = function() -- Line: 36 -- upvalues: u4 (val)
                    u4(true)
                end,
                requiredVotes = a1.controls.requiredVotes,
                votes = math.min(a1.controls.votes + (if not v1 then 0 else if a1.controls.hasVoted then 0 else 1), a1.controls.requiredVotes),
            }),
        })
    end,
}