-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.VoteGame.story
-- Decompile time: 2.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local VoteGame = require(script.Parent.VoteGame)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState

local function u23() -- Line: 11 -- upvalues: useState (val), useEffect (val), createElement (val), VoteGame (val)
    local v1, u3 = useState({})
    local u4 = {11643, 49601674, 19004289, 16983447}
    useEffect(function() -- Line: 20 -- upvalues: u3 (val), u4 (val)
        local u1 = Random.new()
        local u2 = true
        local u5 = task.spawn(function() -- Line: 23 -- upvalues: u2 (ref), u1 (val), u3 (upval), u4 (upval)
            while u2 do
                task.wait(u1:NextInteger(1, 2))
                u3(function() -- Line: 27 -- upvalues: u1 (upval), u4 (upval)
                    local v1
                    local v2 = {}
                    for i = 1, (u1:NextInteger(1, 4)) do
                        v1 = u4[u1:NextInteger(1, #u4)]
                        if not table.find(v2, v1) then
                            table.insert(v2, v1)
                        end
                    end
                    print(v2)
                    return v2
                end)
            end
        end)
        return function() -- Line: 47 -- upvalues: u2 (ref), u5 (val)
            u2 = false
            task.cancel(u5)
        end
    end, {})
    return createElement(VoteGame, {
        maxVotes = 4,
        hasVoted = true,
        title = "Wave Vote",
        text = "NOT READY",
        players = u4,
        votedPlayers = v1,
    })
end

return function(a1) -- Line: 66 -- upvalues: ReactRoblox (val), createElement (val), u23 (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(u23)))
    return function() -- Line: 70 -- upvalues: u4 (val)
        u4:unmount()
    end
end