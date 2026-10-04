-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.init.story
-- Decompile time: 2.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 12
    -- upvalues: createElement (val), useState (val), useCallback (val), useEffect (val), Parent (val)
    -- upvalues: ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13
        -- upvalues: useState (upval), useCallback (upval), useEffect (upval), createElement (upval), Parent (upval)
        local u2, u3 = useState(0)
        local u6, u7 = useState(0)
        local v1, u11 = useState(true)
        local v2 = useCallback(function() -- Line: 18 -- upvalues: u11 (val)
            u11(false)
            task.wait(2)
            u11(true)
        end, {})
        local v3 = {u6}
        useEffect(function() -- Line: 24 -- upvalues: u7 (val), u6 (val)
            task.spawn(function() -- Line: 25 -- upvalues: u7 (upval), u6 (upval)
                task.wait(math.random(0, 1))
                u7(u6 + math.floor((math.random(10, 50000))))
            end)
        end, v3)
        v3 = {u2}
        useEffect(function() -- Line: 31 -- upvalues: u3 (val), u2 (val)
            task.spawn(function() -- Line: 32 -- upvalues: u3 (upval), u2 (upval)
                task.wait(math.random(0, 1))
                u3(u2 + math.floor((math.random(10, 50000))))
            end)
        end, v3)
        return createElement(Parent, {
            level = 1,
            exp = 0,
            maxExp = 100,
            Visible = v1,
            partyClicked = v2,
            buttonClicked = v2,
            coins = u2,
            gems = u6,
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 56 -- upvalues: u7 (val)
        u7:unmount()
    end
end