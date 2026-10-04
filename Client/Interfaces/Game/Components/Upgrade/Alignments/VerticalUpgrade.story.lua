-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade.Alignments.VerticalUpgrade.story
-- Decompile time: 3.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent.Parent)
local useState = React.useState
local createElement = React.createElement

local function generateUnits(a1) -- Line: 9 -- types: a1: number
    local v1 = {}
    for i = 1, a1 or 1 do
        table.insert(v1, {})
    end
    return v1
end

local function UpgradeContainer(a1) -- Line: 19 -- upvalues: useState (val), createElement (val), Parent (val)
    local u3, u4 = useState(3)

    local function updateLevel(a1) -- Line: 22 -- upvalues: u4 (val), u3 (val) -- types: a1: number
        return function() -- Line: 23 -- upvalues: u4 (upval), u3 (upval), a1 (val)
            u4((math.clamp(u3 + a1, 0, 6)))
        end
    end

    local v1 = createElement
    local v2 = Parent
    local v3 = {
        Tower = "Commander",
        Alignment = "Vertical",
        GlobalOptionsCoolDown = 30,
        Level = u3,
        GlobalOptionsStart = workspace:GetServerTimeNow(),
        Options = {
            {
                Name = "Bomb 1",
                Icon = 28591139,
                Selected = 1,
                Cooldown = 30,
                MaxCooldown = 30,
                Level = u3,
                Values = {
                    {Name = "Fire", Icon = 28591139, Level = 0, Value = 1},
                    {Name = "Ice", Icon = 28591139, Level = 2, Value = 2},
                    {Name = "Poison", Icon = 28591139, Level = 3, Value = 3},
                    {Name = "Confuse", Icon = 28591139, Level = 4, Value = 4},
                },
            },
        },
        OnOption = function(a1, a2) -- Line: 75
            print("update to", a1, a2)
        end,
        OnAbility = function(a1) -- Line: 79 -- types: a1: string
            warn("use ability", a1)
            return true
        end,
    }
    local u22 = 1

    function v3.OnUpgrade() -- Line: 23 -- upvalues: u4 (val), u3 (val), u22 (val)
        u4((math.clamp(u3 + u22, 0, 6)))
    end

    local u24 = -1

    function v3.OnSell() -- Line: 23 -- upvalues: u4 (val), u3 (val), u24 (val)
        u4((math.clamp(u3 + u24, 0, 6)))
    end

    return (v1(v2, v3))
end

return function(a1) -- Line: 91 -- upvalues: createElement (val), UpgradeContainer (val), ReactRoblox (val)
    local v1 = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {container = createElement(UpgradeContainer, {})})
    local u17 = ReactRoblox.createRoot(a1)
    u17:render(v1)
    return function() -- Line: 102 -- upvalues: u17 (val)
        u17:unmount()
    end
end