-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade.init.story
-- Decompile time: 2.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local useState = React.useState
local createElement = React.createElement

local function UpgradeContainer(a1) -- Line: 9 -- upvalues: useState (val), createElement (val), Parent (val)
    local u3, u4 = useState(0)

    local function updateLevel(a1) -- Line: 12 -- upvalues: u4 (val), u3 (val) -- types: a1: number
        return function() -- Line: 13 -- upvalues: u4 (upval), u3 (upval), a1 (val)
            u4((math.clamp(u3 + a1, 0, 6)))
        end
    end

    local v1 = createElement
    local v2 = Parent
    local v3 = {
        Tower = "Scout",
        Level = u3,
        OnAbility = function(a1) -- Line: 22 -- types: a1: string
            warn("use ability", a1)
            return true
        end,
    }
    local u10 = 1

    function v3.OnUpgrade() -- Line: 13 -- upvalues: u4 (val), u3 (val), u10 (val)
        u4((math.clamp(u3 + u10, 0, 6)))
    end

    local u12 = -1

    function v3.OnSell() -- Line: 13 -- upvalues: u4 (val), u3 (val), u12 (val)
        u4((math.clamp(u3 + u12, 0, 6)))
    end

    return (v1(v2, v3))
end

return function(a1) -- Line: 34 -- upvalues: createElement (val), UpgradeContainer (val), ReactRoblox (val)
    local v1 = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {container = createElement(UpgradeContainer, {})})
    local u17 = ReactRoblox.createRoot(a1)
    u17:render(v1)
    return function() -- Line: 45 -- upvalues: u17 (val)
        u17:unmount()
    end
end