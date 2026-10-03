-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.HorizontalUpgrade.story
-- Decompile time: 7.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local HorizontalUpgrade = require(script.Parent.HorizontalUpgrade)
local React = require(Shared.UI.React)
local ReactRoblox = require(Shared.UI.ReactRoblox)
local table = require(Shared.Modules.Utils.table)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding
local useEffect = React.useEffect

local function story(a1) -- Line: 27
    -- upvalues: useState (val), Icons (val), useBinding (val), useEffect (val), table (val), createElement (val)
    -- upvalues: HorizontalUpgrade (val)
    local v1, u4 = useState(true)
    local v2, u8 = useState("First Enemy")
    local u18, u19 = useState({
        {Icon = 5577896365, Value = 10},
        {Icon = 5577895610, Value = 200},
        {Icon = 5577896365, Value = 0.55},
    })
    local u41, u42 = useState({
        {Tooltip = "Default DPS", Value = 363.64, Icon = Icons.Attack},
        {Tooltip = "Burn DPS", Value = 32, Icon = Icons.FireImmune},
        {
            Tooltip = "Total DPS",
            Value = 395.64,
            Icon = Icons.ExplosionDamage,
            PulseColor3 = Color3.fromRGB(255, 85, 85),
            TextColor3 = Color3.fromRGB(255, 85, 85),
        },
    })
    local u45, u46 = useBinding({Level = 2, TotalCost = 1000, TotalDamage = 0})
    local u49, u50 = useBinding(60)
    local u53 = useBinding(100)
    local u57, u58 = useBinding(12000)
    local u59 = {
        {Text = "10 → 11", Icon = 5577896365},
        {Text = "Hidden Detection", Icon = 12270723919},
        {Text = "Call to Arms (22.5% Firerate Buff)"},
        {
            Text = "Another Upgrade",
            Expand = {"First Effect", "Second Effect", "Second Effect", "Second Effect"},
        },
        {
            Text = "Upgraded Bombs",
            Expand = {"Acid Bombs", "30% Damage Buff and this is a very long long text", "0.5 Tick"},
        },
    }
    local u74 = {
        {Text = "20 → 40", Icon = 5577895610},
        {Text = "Lead Detection", Icon = 12270724694},
        {Text = "Call to Arms (22.5% Firerate Buff)"},
        {Text = "Another Upgrade", Expand = {"Little Different"}},
    }
    local u83, u84 = useState({
        Level = 1,
        MaxLevel = 5,
        Name = "Tactical Blowback",
        Icon = 5587698246,
        Cost = 100,
        Affordable = true,
        Stats = u59,
    })
    local u87, u88 = useState({
        Level = 1,
        MaxLevel = 5,
        Name = "Tactical Blowback 2",
        Icon = 5587698246,
        Cost = 200,
        Affordable = true,
        Stats = u74,
    })
    local v3 = {}
    local v4 = {}
    local v5 = {}
    local v6 = {}
    local v7 = {}
    v3.Powers = v6
    v3.Abilities = v5
    v3.UnitIndicators = v4
    v3.UnitSelectors = v7
    table.insert(v4, {Interval = 15, StartTick = 0, LayoutOrder = 1})
    local v8, u101 = useState(1)
    table.insert(v5, {
        LayoutOrder = 2,
        Price = 1000,
        Icon = 17846960799,
        CoolDown = 10,
        Level = 5,
        Selected = v8,
        OnSelected = function(a1, a2) -- Line: 160 -- upvalues: u101 (val)
            print("Selected Ability", a2.Name)
            u101(a1)
        end,
        OnActivated = function() -- Line: 165
            print("Activated Ability")
        end,
        Options = {
            {Name = "Default", Icon = 17832548233, Level = 0},
            {Name = "Figure8", Icon = 17858292405, Level = 2},
        },
    })
    local v9, u114 = useState(1)
    table.insert(v6, {
        LayoutOrder = 3,
        Level = 3,
        Selected = v9,
        OnSelected = function(a1, a2) -- Line: 195 -- upvalues: u114 (val)
            print("Selected Power", a2.Name)
            u114(a1)
        end,
        Options = {
            {Name = "Fire", Icon = 15332760498, Level = 0, Value = 1},
            {Name = "Ice", Icon = 15332760300, Level = 2, Value = 2},
            {Name = "Poison", Icon = 15332760148, Level = 3, Value = 3},
            {Name = "Confuse", Icon = 15332760639, Level = 4, Value = 4},
        },
    })
    local u127, u128 = useState(3)
    local v10, u132 = useState(1)
    table.insert(v7, {
        LayoutOrder = 4,
        HideSelectedName = true,
        HideOptionNames = true,
        Interval = 15,
        StartTick = 0,
        Level = u127,
        Selected = v10,
        OnSelected = function(a1, a2) -- Line: 244 -- upvalues: u132 (val), u128 (val), u127 (val)
            print("Selected Unit", a2.Name)
            u132(a1)
            u128(u127 + 1)
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
    useEffect(function() -- Line: 298 -- upvalues: u45 (val), u46 (val), u49 (val), u53 (val), u50 (val)
        local u0 = true
        task.spawn(function() -- Line: 301 -- upvalues: u0 (ref), u45 (upval), u46 (upval), u49 (upval), u53 (upval), u50 (upval)
            local v1, v2, v3, v4
            task.wait(1)
            while u0 do
                v1 = table.clone(u45:getValue())
                v1.TotalDamage = v1.TotalDamage + math.random(1, 100)
                u46(v1)
                v2 = u49:getValue()
                v3 = u53:getValue()
                v4 = if v2 ~= v3 then math.min(v2 + math.random(1, 20), v3) else 0
                u50(v4)
                if u0 then
                    task.wait(0.5)
                end
            end
        end)
        return function() -- Line: 330 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})

    local function updateStats() -- Line: 336 -- upvalues: u45 (val), u46 (val), u58 (val), u57 (val)
        local v1 = table.clone((table.clone(u45:getValue())))
        v1.Level = v1.Level + 1
        v1.TotalCost = v1.TotalCost + math.random(1, 500)
        u46(v1)
        u58(u57:getValue() + 10000)
    end

    local function updateActiveStats() -- Line: 346
        -- upvalues: table (upval), u18 (val), u41 (val), u19 (val), u42 (val)
        local v1, v2, v3, v4, v5
        local v6 = {5577896365, 5577895610, 5577896808, 5591343189}

        local function generateValue() -- Line: 348
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

        local v7 = table.deepClone(u18)
        local v8 = table.deepClone(u41)
        for i = 1, 3 do
            v3 = math.random(1, 4)
            if v3 == 1 then
                v4 = v6[math.random(1, #v6)]
                v5 = math.random(0, 5)
                v1 = math.random(1, 4)
                if v1 == 1 then
                    v5 = v5 * 100
                elseif v1 == 2 then
                    v5 = v5 / 100
                elseif v1 == 3 then
                    v5 = v5 + 0.5
                end
                table.insert(v7, {Icon = v4, Value = v5})
            elseif not (v3 < 4) then
                v5 = v7[math.random(1, #v7)]
                v1 = math.random(0, 5)
                v2 = math.random(1, 4)
                if v2 == 1 then
                    v1 = v1 * 100
                elseif v2 == 2 then
                    v1 = v1 / 100
                elseif v2 == 3 then
                    v1 = v1 + 0.5
                end
                v5.Value = v1
            elseif #v7 > 1 then
                table.remove(v7, math.random(1, #v7))
            end
        end
        for i2, v in ipairs(v8) do
            v2 = (math.random(250, 5000)) / 10 * 100
            v.Value = math.round(v2) / 100
        end
        u19(v7)
        u42(v8)
    end

    v8 = {
        TowerName = "Shotgunner",
        TowerDisplayName = "Display Shotgunner",
        CanEditTower = true,
        ShowTowerAmmo = true,
        TowersSelection = true,
        TowersSelectionAmount = 5,
        TowersSelected = 3,
        Visible = v1,
        PlayerCash = useBinding(1000000),
        TowerTarget = v2,
        TowerDetections = {
            {Name = "Lead", Icon = 12270724694},
            {Name = "Hidden", Icon = 12270723919},
            {Name = "Flying", Icon = 12270724272},
        },
        TowerStats = u18,
        TowerDPSStats = u41,
        TowerActiveStats = u45,
        TowerSellValue = u57,
        TowerAmmo = u49,
        TowerMaxAmmo = u53,
        TopUpgradePath = u83,
    }
    v8.BottomUpgradePath = 2 < u83.Level and u87 or nil
    v8.TowerActions = v3

    function v8.OnSell() -- Line: 425 -- upvalues: u4 (val)
        print("Sell Tower")
        u4(false)
        task.delay(1, function() -- Line: 429 -- upvalues: u4 (upval)
            u4(true)
        end)
    end

    function v8.OnUpgrade(a1, a2) -- Line: 434
        -- upvalues: u83 (val), table (upval), u59 (val), u74 (val), u84 (val), u87 (val), u88 (val)
        -- upvalues: updateActiveStats (val), updateStats (val)
        local v1, v2, v3
        if not a1 then
            return print("You do not have enough money for this upgrade.")
        end
        if a2 then
            print("Upgrade Bottom Path")
            v1 = u87.Level % u87.MaxLevel + 1
            v2 = v1 == u87.MaxLevel
            v3 = table.deepCompare(u87.Stats, u74)
            u88({
                Affordable = true,
                Level = v1,
                MaxLevel = u87.MaxLevel,
                Name = if v1 % 2 ~= 0 then "Upgrade 2" else "Upgrade 1",
                Icon = if v1 % 2 ~= 0 then 5587698246 else 3032133716,
                Cost = if v1 ~= 1 then u87.Cost * 15 else 100,
                Stats = not v2 and (v3 and u59 or u74),
            })
        else
            print("Upgrade Main Path")
            v1 = u83.Level % u83.MaxLevel + 1
            v2 = v1 == u83.MaxLevel
            v3 = table.deepCompare(u83.Stats, u59)
            u84({
                Affordable = true,
                Level = v1,
                MaxLevel = u83.MaxLevel,
                Name = if v1 % 2 ~= 0 then "Upgrade 2" else "Upgrade 1",
                Icon = if v1 % 2 ~= 0 then 5587698246 else 3032133716,
                Cost = if v1 ~= 1 then u83.Cost * 15 else 100,
                Stats = not v2 and (v3 and u74 or u59),
            })
        end
        updateActiveStats()
        updateStats()
    end

    function v8.OnTarget(a1) -- Line: 487 -- upvalues: u8 (val) -- types: a1: string
        print("Selected Target", a1)
        u8(a1)
    end

    return createElement(HorizontalUpgrade, v8)
end

return function(a1) -- Line: 494 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 498 -- upvalues: u4 (val)
        u4:unmount()
    end
end