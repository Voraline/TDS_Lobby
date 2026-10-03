-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.EnemyHealth.story
-- Decompile time: 2.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local EnemyHealth = require(script.Parent.EnemyHealth)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local u29 = {"Wox", "Fallen King", "Nuclear Monster", "Molten Boss", "Glitch"}

local function HealthContainer(a1) -- Line: 20
    -- upvalues: u29 (val), useState (val), createElement (val), EnemyHealth (val), useEffect (val), useScale (val)
    -- upvalues: React (val)
    local v1, v2, v3, v4, v5
    local v6 = {}
    local u121 = {}
    for i, v in ipairs(u29) do
        v4, v5 = useState(100)
        v1 = nil
        v2 = nil
        if i == #u29 then
            v1 = 30
            v2 = true
        end
        v3 = {
            MaxHealth = 100,
            Name = v,
            DisplayName = if v ~= "Wox" then nil else "Woxxy",
            Health = v4,
            Visible = v4 > 0,
            Compact = v2,
            LayoutOrder = i,
            Shield = v1,
        }
        v6[v] = (createElement(EnemyHealth, v3))
        if not v1 then
            u121[v] = {v4, v5}
        end
    end
    useEffect(function() -- Line: 52 -- upvalues: u121 (val)
        local u0 = true
        task.spawn(function() -- Line: 55 -- upvalues: u0 (ref), u121 (upval)
            local v1, v2, v3, v4
            local v5 = Random.new()
            local v6 = {}
            while u0 do
                task.wait(v5:NextNumber(0.5, 1))
                v2 = false
                for k, v in pairs(u121) do
                    v3, v4 = unpack(v)
                    v1 = v6[k] or v3
                    if not (v1 <= 0) then
                        v1 = v1 - v5:NextInteger(10, 20)
                        v4(v1)
                        v6[k] = v1
                        v2 = true
                    end
                end
                if not v2 then
                    u0 = false
                end
            end
        end)
        return function() -- Line: 84 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    local v7 = useScale(1.8)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 160 * v7),
        Size = UDim2.fromOffset(768, 64),
    }, {
        uIListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 20 * v7),
        }),
        enemyHealth = React.createElement(React.Fragment, {}, v6),
    })
end

return function(a1) -- Line: 109 -- upvalues: createElement (val), HealthContainer (val), ReactRoblox (val)
    local v1 = createElement(HealthContainer, {})
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 114 -- upvalues: u8 (val)
        u8:unmount()
    end
end