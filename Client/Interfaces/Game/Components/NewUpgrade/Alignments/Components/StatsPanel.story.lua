-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.StatsPanel.story
-- Decompile time: 4.84 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local StatsPanel = require(script.Parent.StatsPanel)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect

local function story() -- Line: 20 -- upvalues: useState (val), useEffect (val), createElement (val), StatsPanel (val)
    local u0 = {5577896365, 5577895610, 5577896808, 5591343189}
    local v1, u11 = useState({
        {Icon = 5577896365, Value = 10},
        {Icon = 5577896365, Value = 0.05},
        {Icon = 5577896365, Value = 1000},
    })
    useEffect(function() -- Line: 28 -- upvalues: u0 (val), u11 (val)
        local u0_2 = true

        local function generateValue() -- Line: 31
            local v1 = math.random(0, 5)
            local v2 = math.random(1, 4)
            if v2 == 1 then
                return v1 * 100
            end
            if v2 == 2 then
                return v1 / 100
            end
            if v2 == 3 then
                v1 = v1 + 0.5
            end
            return v1
        end

        local function cloneTable(a1) -- Line: 46
            local v1 = {}
            for k, v in pairs(a1) do
                v1[k] = (table.clone(v))
            end
            return v1
        end

        task.spawn(function() -- Line: 54 -- upvalues: u0_2 (ref), u0 (upval), u11 (upval), cloneTable (val)
            local v1, v2
            task.wait(1)
            while u0_2 do
                v1 = math.random(1, 4)
                if v1 == 1 then
                    local u14 = u0[math.random(1, #u0)]
                    local u25 = math.random(0, 5)
                    v2 = math.random(1, 4)
                    if v2 == 1 then
                        u25 = u25 * 100
                    elseif v2 == 2 then
                        u25 = u25 / 100
                    elseif v2 == 3 then
                        u25 = u25 + 0.5
                    end
                    u11(function(a1) -- Line: 63 -- upvalues: cloneTable (upval), u14 (val), u25 (val)
                        local v1 = cloneTable(a1)
                        table.insert(v1, {Icon = u14, Value = u25})
                        return v1
                    end)
                elseif not (v1 < 4) then
                    u11(function(a1) -- Line: 78 -- upvalues: cloneTable (upval)
                        local v1 = math.random(1, #a1)
                        local v2 = cloneTable(a1)
                        local v3 = v2[v1]
                        local v4 = math.random(0, 5)
                        local v5 = math.random(1, 4)
                        if v5 == 1 then
                            v4 = v4 * 100
                        elseif v5 == 2 then
                            v4 = v4 / 100
                        elseif v5 == 3 then
                            v4 = v4 + 0.5
                        end
                        v3.Value = v4
                        return v2
                    end)
                else
                    u11(function(a1) -- Line: 69 -- upvalues: cloneTable (upval)
                        if #a1 > 1 then
                            a1 = cloneTable(a1)
                            table.remove(a1, math.random(1, #a1))
                        end
                        return a1
                    end)
                end
                if (math.random(1, 3)) < 2 then
                    task.wait(1)
                end
            end
        end)
        return function() -- Line: 92 -- upvalues: u0_2 (ref)
            u0_2 = false
        end
    end, {})
    return createElement(StatsPanel, {
        Size = UDim2.fromOffset(95, 0),
        Position = UDim2.fromScale(0.5, 0.4),
        AnchorPoint = Vector2.new(0.5, 0),
        Stats = v1,
    })
end

return function(a1) -- Line: 106 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 110 -- upvalues: u4 (val)
        u4:unmount()
    end
end