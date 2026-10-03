-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewEnemyHealth.NewEnemyHealthBar.story
-- Decompile time: 2.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect

local function render() -- Line: 13
    -- upvalues: useState (val), useEffect (val), React (val), table (val), createElement (val), Parent (val)
    -- upvalues: ReactFlow (val)
    local u3
    _, u3 = useState(100)
    useState(100)
    useState(0)
    useEffect(function() -- Line: 18 -- upvalues: u3 (val)
        local u2 = task.spawn(function() -- Line: 19 -- upvalues: u3 (upval)
            task.wait(3)
            for i = 0, 100, 10 do
                u3(100 - i)
                task.wait(1)
            end
        end)
        return function() -- Line: 33 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    local v1, u20 = React.useState({})
    local v2 = table.count(v1)
    local u29 = React.useCallback(function(a1) -- Line: 41 -- upvalues: u20 (val), table (upval)
        u20(function(a1_2) -- Line: 42 -- upvalues: table (upval), a1 (val)
            local v1 = table.clone(a1_2)
            v1[a1] = nil
            return v1
        end)
    end, {})
    local u34 = React.useCallback(function(a1) -- Line: 48 -- upvalues: u20 (val), table (upval), createElement (upval), Parent (upval)
        u20(function(a1_2) -- Line: 49 -- upvalues: table (upval), a1 (val), createElement (upval), Parent (upval)
            local v1 = table.clone(a1_2)
            v1[a1] = (createElement(Parent, {
                health = 100,
                maxHealth = 100,
                shieldHealth = 0,
                revealAnchorPoint = 0,
                enemyName = a1,
                markers = {rage = 0.7},
            }))
            return v1
        end)
    end, {})
    useEffect(function() -- Line: 65 -- upvalues: u34 (val), u29 (val)
        u34("Fallen King")
        task.delay(2, function() -- Line: 68 -- upvalues: u34 (upval)
            u34("Skeletal Sorcerer")
        end)
        task.delay(3, function() -- Line: 72 -- upvalues: u34 (upval)
            u34("Void Reaver")
        end)
        task.delay(3, function() -- Line: 76 -- upvalues: u34 (upval)
            u34("Void Reaver")
        end)
        task.delay(3, function() -- Line: 80 -- upvalues: u34 (upval)
            u34("ERGTBGREWAGREWGREWGREW")
        end)
        task.delay(8, function() -- Line: 84 -- upvalues: u29 (upval)
            u29("Fallen King")
        end)
    end, {})
    local createElement_2 = React.createElement
    local v3 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.2),
        Size = UDim2.fromScale(2, 1.2),
    }
    local v4 = {
        uIScale = createElement("UIScale", {Scale = math.clamp(math.map(v2, 2, 3, 1, 0.8), 0.5, 1) * 1.07}),
    }
    v4.iListLayout = React.createElement("UIListLayout", {
        Wraps = true,
        FillDirection = v2 > 3 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.03, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    v4.uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 2.26823})
    v4.fullBars = createElement(ReactFlow.DynamicList, nil, v1)
    return createElement_2("Frame", v3, v4)
end

return function(a1) -- Line: 135 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render, {})))
    return function() -- Line: 139 -- upvalues: u4 (val)
        u4:unmount()
    end
end