-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.ActionPanel.story
-- Decompile time: 1.90 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local ActionPanel = require(script.Parent.ActionPanel)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect

local function story() -- Line: 20 -- upvalues: useState (val), createElement (val), ActionPanel (val)
    local v1 = {}
    local v2 = {}
    local v3 = {}
    local v4 = {}
    local v5 = {}
    v1.Powers = v4
    v1.Abilities = v3
    v1.UnitIndicators = v2
    v1.UnitSelectors = v5
    table.insert(v2, {Interval = 15, StartTick = 0, LayoutOrder = 1})
    local v6, u12 = useState(1)
    table.insert(v3, {
        LayoutOrder = 2,
        Price = 1000,
        Icon = 17846960799,
        CoolDown = 10,
        Level = 5,
        Selected = v6,
        OnSelected = function(a1, a2) -- Line: 59 -- upvalues: u12 (val)
            print("Selected Ability", a2.Name)
            u12(a1)
        end,
        OnActivated = function() -- Line: 64
            print("Activated Ability")
        end,
        Options = {
            {Name = "Default", Icon = 17832548233, Level = 0},
            {Name = "Figure8", Icon = 17858292405, Level = 2},
        },
    })
    local v7, u25 = useState(1)
    table.insert(v4, {
        LayoutOrder = 3,
        Level = 3,
        Selected = v7,
        OnSelected = function(a1, a2) -- Line: 94 -- upvalues: u25 (val)
            print("Selected Power", a2.Name)
            u25(a1)
        end,
        Options = {
            {Name = "Fire", Icon = 15332760498, Level = 0, Value = 1},
            {Name = "Ice", Icon = 15332760300, Level = 2, Value = 2},
            {Name = "Poison", Icon = 15332760148, Level = 3, Value = 3},
            {Name = "Confuse", Icon = 15332760639, Level = 4, Value = 4},
        },
    })
    local u38, u39 = useState(3)
    local v8, u43 = useState(1)
    table.insert(v5, {
        LayoutOrder = 4,
        HideSelectedName = true,
        HideOptionNames = true,
        Interval = 15,
        StartTick = 0,
        Level = u38,
        Selected = v8,
        OnSelected = function(a1, a2) -- Line: 140 -- upvalues: u43 (val), u39 (val), u38 (val)
            print("Selected Unit", a2.Name)
            u43(a1)
            u39(u38 + 1)
        end,
        Options = {
            {
                Name = "Rifleman",
                Icon = 17190812977,
                Level = 0,
                Value = "Rifleman",
                Tooltip = {
                    Header = "Rifleman",
                    Subject = "Unit",
                    Content = {{Text = "Shoot at enemies in bursts of rounds!"}},
                },
            },
            {Name = "Grenadier", Icon = 17190813281, Level = 2, Value = "Grenadier"},
            {Name = "Riot Guard", Icon = 17190812760, Level = 4, Value = "Riot Guard"},
            {Name = "Field Medic", Icon = 17190813144, Level = 5, Value = "Field Medic"},
        },
    })
    return createElement(ActionPanel, {
        Size = UDim2.new(0, 64, 0.3, -32),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Actions = v1,
    })
end

return function(a1) -- Line: 201 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 205 -- upvalues: u4 (val)
        u4:unmount()
    end
end