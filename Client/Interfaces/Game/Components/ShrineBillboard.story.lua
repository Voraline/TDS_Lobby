-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ShrineBillboard.story
-- Decompile time: 1.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ShrineBillboard = require(script.Parent.ShrineBillboard)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState

local function Story() -- Line: 11
    -- upvalues: useState (val), useEffect (val), createElement (val), ShrineBillboard (val)
    local v1, u3 = useState(true)
    local Reward_2, Reward = useState("Reward")
    local v2, u11 = useState(0)
    local v3, u15 = useState(0)
    useEffect(function() -- Line: 17 -- upvalues: Reward (val), u11 (val), u3 (val), u15 (val)
        local u0 = true
        task.spawn(function() -- Line: 20 -- upvalues: u0 (ref), Reward (upval), u11 (upval), u3 (upval), u15 (upval)
            local v1 = 0
            while u0 do
                v1 = v1 + 1
                Reward("Reward")
                u11(0)
                u3(true)
                u15(v1)
                task.wait(2)
                u3(false)
                task.wait(0.5)
                v1 = v1 + 1
                Reward("Progress")
                u3(true)
                u15(v1)
                for i = 1, 4 do
                    task.wait(0.85)
                    if not u0 then
                        return
                    end
                    u11(i)
                end
                u3(false)
                task.wait(1)
            end
        end)
        return function() -- Line: 53 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement(ShrineBillboard, {
        DurationWaves = 4,
        RewardAmount = 10,
        RewardCurrencyType = "Gems",
        RewardLabel = "Gems",
        AnimationKey = v3,
        CompletedWaves = v2,
        Mode = Reward_2,
        Visible = v1,
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {},
    story = function() -- Line: 74 -- upvalues: createElement (val), Story (val)
        return createElement(Story)
    end,
}