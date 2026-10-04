-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker.init.story
-- Decompile time: 1.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useMemo = React.useMemo
local useCallback = React.useCallback
local useState = React.useState
return function(a1) -- Line: 12
    -- upvalues: createElement (val), useState (val), useMemo (val), Parent (val), useCallback (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13
        -- upvalues: useState (upval), useMemo (upval), createElement (upval), Parent (upval), useCallback (upval)
        local v1, u3 = useState(true)
        local v2, u7 = useState(false)
        local u11, u12 = useState(function() -- Line: 17
            return tick()
        end, {})
        local v3 = {u11}
        local v4 = useMemo(function() -- Line: 21 -- upvalues: u11 (val)
            return u11 + 10
        end, v3)
        local u21 = useMemo(function() -- Line: 25
            return {
                {tower = "Scout", skin = "Golden"},
                {tower = "Cowboy", skin = "Golden"},
                {tower = "Soldier", skin = "Golden"},
                {tower = "Accelerator", skin = "Vigilante"},
                {tower = "Farm", skin = "Arcade"},
            }
        end, {})
        return createElement(Parent, {
            Visible = v1 and not v2,
            startsAt = u11,
            endsAt = v4,
            loadOuts = useMemo(function() -- Line: 35 -- upvalues: u21 (val)
                local v1 = {}
                for i = 1, 3 do
                    table.insert(v1, {
                        description = "This is a loadout",
                        name = ("LoadOut %*"):format(i),
                        towers = table.clone(u21),
                    })
                end
                return v1
            end, {}),
            timerFinished = useCallback(function() -- Line: 54 -- upvalues: u7 (val), u12 (val)
                u7(true)
                task.delay(2, function() -- Line: 56 -- upvalues: u12 (upval), u7 (upval)
                    u12(tick())
                    u7(false)
                end)
            end, {}),
            loadOutPicked = useCallback(function(a1, a2) -- Line: 61 -- upvalues: u3 (val)
                u3(false)
                task.wait(2)
                u3(true)
            end, {}),
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 72 -- upvalues: u7 (val)
        u7:unmount()
    end
end