-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.Information
-- Decompile time: 66.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Modules = ReplicatedStorage.Client.Modules
local Hooks = Interfaces.Hooks
local Comma = require(Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local UltimateList = require(ReplicatedStorage.Packages.UltimateList)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useActiveSeasons = require(ReplicatedStorage.Client.Interfaces.Hooks.useActiveSeasons)
local Achievement = require(Interfaces.Lobby.Components.Achievements.Achievement)
local Button = require(Interfaces.Components.Button)
local EnemyGameModeDisplay = require(Interfaces.Lobby.Utility.EnemyGameModeDisplay)
local EnemyGameModeLookup = require(Interfaces.Lobby.Utility.EnemyGameModeLookup)
local FilterButton = require(Interfaces.Universal.Components.Inventory.FilterButton)
local FilterList = require(Interfaces.Universal.Components.Inventory.FilterList)
local InfoFrame = require(script.Parent.InfoFrame)
local BattlepassPreview = require(Interfaces.Lobby.Components.Battlepass.BattlepassPreview)
local SearchBar = require(Interfaces.Universal.Components.Inventory.SearchBar)
local Tooltip = require(Interfaces.Components.Tooltip)
local useContentEnemy = require(Hooks.useContentEnemy)
local useEnemyGameModes = require(Hooks.useEnemyGameModes)
local useMediaQuery = require(Hooks.useMediaQuery)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useMemo = React.useMemo
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local useState = React.useState
local useSpring = ReactFlow.useSpring
local DataSources = UltimateList.DataSources
local Dimensions = UltimateList.Dimensions
local Renderers = UltimateList.Renderers
local ScrollingFrame = UltimateList.Components.ScrollingFrame
local u124 = {{filterName = "Unlocked", active = false}, {filterName = "Locked", active = false}}
local u127 = {Unlocked = true, Locked = true}
local u128 = {}
local v1 = {
    active = false,
    filterName = Enum.Difficulty.ToString(Enum.Difficulty.VeryEasy),
}
local v2 = {active = false, filterName = Enum.Difficulty.ToString(Enum.Difficulty.Easy)}
local v3 = {
    active = false,
    filterName = Enum.Difficulty.ToString(Enum.Difficulty.Normal),
}
local v4 = {active = false, filterName = Enum.Difficulty.ToString(Enum.Difficulty.Hard)}
local v5 = {
    active = false,
    filterName = Enum.Difficulty.ToString(Enum.Difficulty.Insane),
}
u128[1] = {filterName = "Unlocked", active = false}
u128[2] = {filterName = "Locked", active = false}
u128[3] = {divider = true}
u128[4] = v1
u128[5] = v2
u128[6] = v3
u128[7] = v4
u128[8] = v5

local function cloneFilterList(a1) -- Line: 161 -- types: a1: table
    local v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = {
            filterName = j.filterName,
            active = j.active == true,
            divider = j.divider == true,
        }
        v2[i] = v1
    end
    return v2
end

local function getActiveFilters(a1) -- Line: 175 -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        if j.active and j.filterName then
            v1[j.filterName] = true
        end
    end
    return v1
end

local function updateFilterList(a1, a2, a3) -- Line: 187 -- types: a1: table, a2: string, a3: boolean
    local v1
    local v2 = {}
    for i, j in a1 do
        if j.filterName ~= a2 then
            v2[i] = j
        else
            v1 = {filterName = j.filterName, active = a3, divider = j.divider}
            v2[i] = v1
        end
    end
    return v2
end

local function reconcileFilterList(a1, a2) -- Line: 205 -- types: a1: table, a2: table
    local filterName, v1
    local v2 = {}
    for i, j in a2 do
        if j.filterName and j.active then
            v2[j.filterName] = true
        end
    end
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for k, n in a1, v4, v5 do
        v1 = {filterName = n.filterName}
        filterName = n.filterName and v2[n.filterName] == true
        v1.active = filterName
        v1.divider = n.divider
        v3[k] = v1
    end
    return v3
end

local function getEnemyFilterList(a1) -- Line: 226
    -- upvalues: cloneFilterList (val), u124 (val), EnemyGameModeLookup (val), table (val), EnemyGameModeDisplay (val)
    local v1 = cloneFilterList(u124)
    local v2 = EnemyGameModeLookup.getEvergreenModeNames()
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in a1, v4, v5 do
        if j.locked ~= true then
            for k, n in j.gameModes or {} do
                if EnemyGameModeLookup.isEventMode(n) then
                    v3[n] = true
                end
            end
        end
    end
    table.sort(v2, EnemyGameModeDisplay.sortModeNames)
    if #v2 > 0 then
        table.insert(v1, {divider = true})
    end
    for m, i5 in v2 do
        table.insert(v1, {active = false, filterName = i5})
    end
    local v6 = table.keys(v3)
    table.sort(v6, EnemyGameModeDisplay.sortModeNames)
    if #v6 > 0 then
        table.insert(v1, {divider = true})
    end
    for i6, i7 in v6 do
        table.insert(v1, {active = false, filterName = i7})
    end
    return v1
end

local function getDiscoveredProgress(a1) -- Line: 269 -- types: a1: table
    local v1 = 0
    for i, j in a1 do
        if j.locked ~= true then
            v1 = v1 + 1
        end
    end
    return {discovered = v1, total = #a1}
end

local function matchesSearch(a1, a2) -- Line: 284 -- types: a1: string?, a2: string
    if a2 == "" then
        return true
    end
    if not a1 then
        return false
    end
    return string.find(string.lower(a1), string.lower(a2), 1, true) ~= nil
end

local function mapDifficultyName(a1) -- Line: 296 -- upvalues: Enum (val) -- types: a1: table
    if not a1.difficulty then
        return nil
    end
    return Enum.Difficulty.ToString(a1.difficulty)
end

local function matchesStatusFilters(a1, a2) -- Line: 304 -- types: a1: table, a2: boolean
    local v1
    local v2 = true
    if a1.Unlocked ~= true then
        v2 = a1.Locked == true
    end
    if not v2 then
        return true
    end
    if a1.Unlocked ~= true then
        v1 = false
        if a1.Locked == true then
            v1 = a2
        end
    else
        v1 = not a2
        if not v1 then
            v1 = false
            if a1.Locked == true then
                v1 = a2
            end
        end
    end
    return v1
end

local function matchesValueFilters(a1, a2) -- Line: 313 -- upvalues: u127 (val) -- types: a1: table, a2: table
    local v1 = false
    for i in a1 do
        if not u127[i] then
            v1 = true
            break
        end
    end
    if not v1 then
        return true
    end
    for j, k in a2 do
        if k and a1[k] then
            return true
        end
    end
    return false
end

local u174 = memo(function(a1) -- Line: 336
    -- upvalues: useMemo (val), React (val), useSpring (val), ReactFlow (val), useEffect (val), createElement (val)
    -- upvalues: BattlepassPreview (val), Tooltip (val)
    local u32
    local u4 = useMemo(function() -- Line: 337
        return Random.new():NextNumber(-20, 20)
    end, {})
    local v1, u13 = React.useState(Color3.fromRGB(58, 58, 58))
    local icon = a1.icon
    local v2 = a1.selected == true
    local v3 = a1.locked == true
    local v4, u25 = useSpring({damper = 0.7, speed = 18, start = 0, target = 0})
    _, u32 = ReactFlow.useSpring({damper = 0.7, speed = 12, start = u4, target = u4})
    useEffect(function() -- Line: 360 -- upvalues: a1 (val), u25 (val), u32 (val), u4 (val)
        local u4_2 = task.delay(a1.index, function() -- Line: 361 -- upvalues: u25 (upval), u32 (upval), u4 (upval)
            u25({start = 0, target = 1})
            u32({target = 0, start = u4})
        end)
        return function() -- Line: 366 -- upvalues: u4_2 (val)
            task.cancel(u4_2)
        end
    end, {})
    local v5 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.new(1, 1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.layoutOrder,
    }
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v5.Position = position
    local size = a1.size or UDim2.fromScale(1, 1)
    v5.Size = size
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1.5, 1.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v8 = {uIScale = createElement("UIScale", {Scale = v4})}
    local v9 = {
        Size = UDim2.fromScale(0.65, 0.65),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4:map(function(a1) -- Line: 400
            return UDim2.fromScale(0.5, 1 - a1 + 0.5)
        end),
    }
    v9.color = v2 and Color3.fromRGB(219, 200, 113) or v1
    v9.locked = v3
    v9.lockedColor = Color3.new(0.15, 0.15, 0.15)
    v9.clicked = a1.clicked
    local v10 = {}
    local v11 = createElement
    local v12 = {BackgroundTransparency = 1, Text = "", Size = UDim2.fromScale(1, 1)}

    v12[React.Event.MouseEnter] = function() -- Line: 412 -- upvalues: u13 (val)
        u13(Color3.fromRGB(152, 152, 152))
    end

    v12[React.Event.MouseLeave] = function() -- Line: 415 -- upvalues: u13 (val)
        u13(Color3.fromRGB(58, 58, 58))
    end

    v10.fakeButton = v11("TextLabel", v12)
    v12 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
    }
    v12.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    local v13 = v3 and Color3.new(0.3, 0.3, 0.3) or Color3.new(1, 1, 1)
    v12.ImageColor3 = v13
    v12.ScaleType = Enum.ScaleType.Crop
    v13 = {}
    local corner = a1.corner and createElement("UICorner", {CornerRadius = UDim.new(0, a1.corner)})
    v13.corner = corner
    v10.iconImage = createElement("ImageLabel", v12, v13)
    v8.main = createElement(BattlepassPreview, v9, v10)
    v6.animationFrame = createElement("Frame", v7, v8)
    local v14 = a1.tooltipName and a1.tooltipKey and createElement(Tooltip, {Name = ("LogBookItem:%*"):format(a1.tooltipKey), Header = a1.tooltipName}) or nil
    v6.tooltip = v14
    return createElement("Frame", v5, v6)
end)
local u177 = memo(function(a1) -- Line: 450
    -- upvalues: useState (val), useMemo (val), table (val), DataSources (val), Dimensions (val), Renderers (val)
    -- upvalues: createElement (val), React (val), ScrollingFrame (val)
    local v1, u4 = useState(Vector2.zero)
    local u8 = math.max(a1.cellCount, 1)
    local u23 = math.max(1, (math.floor(((math.max(v1.X - 8, 0)) - 20 - (u8 - 1) * 10) / u8)))
    local u24 = u23 + 10
    local v2 = useMemo
    local v3 = {a1.items, u8}
    local u30 = v2(function() -- Line: 462 -- upvalues: a1 (val), u8 (val), table (upval)
        local v1, v2
        local v3 = {}
        local v4 = nil
        local v5 = nil
        for i, j in a1.items, v4, v5 do
            v1 = math.ceil(i / u8)
            v2 = v3[v1]
            if not v2 then
                v3[v1] = {key = ("row:%*"):format(v1), cells = {}}
            end
            table.insert(v2.cells, {
                key = ("%*:%*"):format(i, j.name),
                index = i,
                item = j,
                column = (i - 1) % u8 + 1,
            })
        end
        return v3
    end, v3)
    local v4 = {u30}
    local v5 = useMemo(function() -- Line: 488 -- upvalues: DataSources (upval), u30 (val)
        return DataSources.array(u30)
    end, v4)
    local u36 = #u30
    local u38 = #a1.items
    local v6 = {u23, u24, u36}
    local v7 = useMemo(function() -- Line: 494 -- upvalues: Dimensions (upval), u36 (val), u24 (val), u23 (val)
        return Dimensions.getter(function(a1, a2) -- Line: 495 -- upvalues: u36 (upval), u24 (upval), u23 (upval)
            local v1 = if a2 ~= u36 then 0 else 8
            return {
                position = UDim2.fromOffset(0, 8 + (a2 - 1) * u24),
                size = UDim2.new(1, 0, 0, u23 + v1),
            }
        end)
    end, v6)
    local v8 = useMemo
    local v9 = {a1.renderItem, u38, u23, u24}
    v8 = v8(function() -- Line: 506
        -- upvalues: Renderers (upval), createElement (upval), u24 (val), u23 (val), a1 (val), u38 (val), React (upval)
        return Renderers.byState(function(a1_2) -- Line: 507
            -- upvalues: createElement (upval), u24 (upval), u23 (upval), a1 (upval), u38 (upval), React (upval)
            local v1 = {}
            for i, j in a1_2.cells do
                v1[j.key] = (createElement("Frame", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset((j.column - 1) * u24 + 10, 0),
                    Size = UDim2.fromOffset(u23, u23),
                }, {item = a1.renderItem(j.item, j.index, u38, u23)}))
            end
            return createElement(React.Fragment, nil, v1)
        end)
    end, v9)
    return createElement(ScrollingFrame, {
        direction = "y",
        dataSource = v5,
        dimensions = v7,
        getKey = React.useCallback(function(a1) -- Line: 524 -- types: a1: table
            return a1.key
        end, {}),
        renderer = v8,
        onAbsoluteWindowSizeChanged = function(a1) -- Line: 534 -- upvalues: u4 (val) -- types: a1: userdata
            u4(a1)
        end,
        native = {
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BottomImage = "",
            ScrollBarThickness = 8,
            TopImage = "",
            BackgroundColor3 = Color3.fromRGB(12, 12, 12),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ScrollingDirection = Enum.ScrollingDirection.Y,
        },
    })
end)
return memo(function(a1) -- Line: 551
    -- upvalues: useMediaQuery (val), useSpring (val), useTransparencyModifier (val), useBinding (val), useState (val)
    -- upvalues: cloneFilterList (val), u124 (val), u128 (val), useContentEnemy (val), useEnemyGameModes (val)
    -- upvalues: useActiveSeasons (val), useMemo (val), getEnemyFilterList (val), getDiscoveredProgress (val)
    -- upvalues: useEffect (val), reconcileFilterList (val), table (val), getActiveFilters (val)
    -- upvalues: matchesValueFilters (val), Enum (val), createElement (val), Achievement (val), Comma (val)
    -- upvalues: InfoFrame (val), React (val), u177 (val), u174 (val), SearchBar (val), FilterButton (val)
    -- upvalues: FilterList (val), updateFilterList (val), Button (val), Icons (val)
    local u164, v1, v2, v3, v4
    local v5 = not useMediaQuery("large")
    local xlarge = useMediaQuery("xlarge")
    local v6, u11 = useSpring({start = 0, target = 0, damper = 0.8, speed = 16})
    local v7 = useTransparencyModifier(v6)
    local u18, u19 = useBinding(Vector2.new())
    local v8, u23 = useBinding(0)
    local v9, u27 = useBinding(0)
    local u30, u31 = useState("")
    local u34, u35 = useState(false)
    local u40, u41 = useState((cloneFilterList(u124)))
    local u46, u47 = useState((cloneFilterList(u128)))
    local onMapSelected = a1.onMapSelected
    local onEnemySelected = a1.onEnemySelected
    local onLockedEnemySelected = a1.onLockedEnemySelected
    local v10 = a1.page == "Selection"
    local selectedMap = a1.selectedMap
    local selectedEnemy = a1.selectedEnemy
    local flair = a1.flair
    local enemies = a1.enemies
    local maps = a1.maps
    local page = a1.page
    local tab = a1.tab
    local achievements = a1.achievements
    local sortedAchievements = a1.sortedAchievements
    local u66 = useContentEnemy(a1.selectedEnemy)
    local u69 = useEnemyGameModes(a1.selectedEnemy)
    local u71 = useActiveSeasons()
    local v11 = if not v5 then 4 else 3
    local v12 = if not v5 then if not xlarge then 3 else 4 else 2
    local v13 = if a1.tab ~= "Maps" then v11 else v12
    local v14 = if tab ~= "Maps" then u40 else u46
    local u105 = true
    if tab ~= "Enemies" then
        u105 = tab == "Maps"
    end
    local v15 = {enemies}
    local u115 = useMemo(function() -- Line: 598 -- upvalues: getEnemyFilterList (upval), enemies (val)
        return (getEnemyFilterList(enemies))
    end, v15)
    local v16 = {enemies}
    local v17 = useMemo(function() -- Line: 601 -- upvalues: getDiscoveredProgress (upval), enemies (val)
        return (getDiscoveredProgress(enemies))
    end, v16)
    local v18 = {maps}
    v15 = useMemo(function() -- Line: 604 -- upvalues: getDiscoveredProgress (upval), maps (val)
        return (getDiscoveredProgress(maps))
    end, v18)
    v16 = if tab ~= "Maps" then v17 else v15
    local v19 = {u105}
    useEffect(function() -- Line: 609 -- upvalues: u105 (val), u35 (val)
        if not u105 then
            u35(false)
        end
    end, v19)
    v19 = {u115}
    useEffect(function() -- Line: 615 -- upvalues: u41 (val), reconcileFilterList (upval), u115 (val)
        u41(function(a1) -- Line: 616 -- upvalues: reconcileFilterList (upval), u115 (upval)
            return (reconcileFilterList(u115, a1))
        end)
    end, v19)
    v18, u164 = useSpring({damper = 0.5, speed = 14, start = 0, target = 0})
    local v20 = {flair, achievements, sortedAchievements, u71}
    local u196 = useMemo(function() -- Line: 628 -- upvalues: table (upval), sortedAchievements (val), achievements (val), u71 (val), flair (val)
        return table.reduce(sortedAchievements, function(a1, a2) -- Line: 629 -- upvalues: achievements (upval), table (upval), u71 (upval), flair (upval)
            local amount, completed, flair_2, insert, v1
            local v2 = achievements[a2.name]
            local value = a2.value
            local season = value.season and not table.find(u71, value.season)
            if not value.hidden and not season then
                flair_2 = a2.value.flair or a2.name
                insert = table.insert
                v1 = {
                    name = a2.name,
                    title = value.title,
                    description = value.description,
                    completed = v2 == true,
                }
                completed = false
                if v2 ~= true then
                    completed = v2 and v2.completed
                end
                v1.claimable = completed
                amount = false
                if v2 ~= true then
                    amount = v2 and v2.amount
                end
                v1.progress = amount
                v1.maxProgress = value.objective.amount
                v1.rewards = value.rewards
                v1.equipped = flair == flair_2
                insert(a1, v1)
                return a1
            end
            if not v2 then
                return a1
            end
            if v2 ~= true and not v2.completed then
                return a1
            end
            flair_2 = a2.value.flair or a2.name
            insert = table.insert
            v1 = {
                name = a2.name,
                title = value.title,
                description = value.description,
                completed = v2 == true,
            }
            completed = false
            if v2 ~= true then
                completed = v2 and v2.completed
            end
            v1.claimable = completed
            amount = false
            if v2 ~= true then
                amount = v2 and v2.amount
            end
            v1.progress = amount
            v1.maxProgress = value.objective.amount
            v1.rewards = value.rewards
            v1.equipped = flair == flair_2
            insert(a1, v1)
            return a1
        end, {})
    end, v20)
    local v21 = {enemies, u30, u40}
    local v22 = useMemo(function() -- Line: 663
        -- upvalues: getActiveFilters (upval), u40 (val), enemies (val), u30 (val), matchesValueFilters (upval)
        -- upvalues: table (upval)
        local displayName, gameModes, v1, v2, v3, v4
        local v5 = getActiveFilters(u40)
        local v6 = next(v5) ~= nil
        local v7 = {}
        local v8 = nil
        local v9 = nil
        for i, j in enemies, v8, v9 do
            v4 = j.locked == true
            gameModes = j.gameModes or {}
            if u30 ~= "" then
                displayName = j.displayName or j.name
                v3 = u30
                v1 = if v3 == "" then true else if displayName then string.find(string.lower(displayName), string.lower(v3), 1, true) ~= nil else false
                if v1 then
                    if not v6 then
                        table.insert(v7, j)
                    else
                        v2 = true
                        if v5.Unlocked ~= true then
                            v2 = v5.Locked == true
                        end
                        if not v2 then
                            v1 = true
                        elseif v5.Unlocked ~= true then
                            v1 = false
                            if v5.Locked == true then
                                v1 = v4
                            end
                        else
                            v1 = not v4
                            if not v1 then
                                v1 = false
                                if v5.Locked == true then
                                    v1 = v4
                                end
                            end
                        end
                        if v1 and matchesValueFilters(v5, gameModes) then
                            table.insert(v7, j)
                        end
                    end
                end
            elseif not v6 then
                table.insert(v7, j)
            else
                v2 = true
                if v5.Unlocked ~= true then
                    v2 = v5.Locked == true
                end
                if not v2 then
                    v1 = true
                elseif v5.Unlocked ~= true then
                    v1 = false
                    if v5.Locked == true then
                        v1 = v4
                    end
                else
                    v1 = not v4
                    if not v1 then
                        v1 = false
                        if v5.Locked == true then
                            v1 = v4
                        end
                    end
                end
                if v1 and matchesValueFilters(v5, gameModes) then
                    table.insert(v7, j)
                end
            end
        end
        return v7
    end, v21)
    local v23 = {maps, u30, u46}
    v20 = useMemo(function() -- Line: 692
        -- upvalues: getActiveFilters (upval), u46 (val), maps (val), Enum (upval), u30 (val)
        -- upvalues: matchesValueFilters (upval), table (upval)
        local name, v1, v2, v3, v4, v5
        local v6 = getActiveFilters(u46)
        local v7 = next(v6) ~= nil
        local v8 = {}
        local v9 = nil
        local v10 = nil
        for i, j in maps, v9, v10 do
            v4 = j.locked == true
            v5 = if j.difficulty then Enum.Difficulty.ToString(j.difficulty) else nil
            if u30 ~= "" then
                name = j.name
                v3 = u30
                v1 = if v3 == "" then true else if name then string.find(string.lower(name), string.lower(v3), 1, true) ~= nil else false
                if not v1 then
                    v2 = u30
                    v1 = if v2 == "" then true else if v5 then string.find(string.lower(v5), string.lower(v2), 1, true) ~= nil else false
                    if v1 then
                        if not v7 then
                            table.insert(v8, j)
                        else
                            v2 = true
                            if v6.Unlocked ~= true then
                                v2 = v6.Locked == true
                            end
                            if not v2 then
                                v1 = true
                            elseif v6.Unlocked ~= true then
                                v1 = false
                                if v6.Locked == true then
                                    v1 = v4
                                end
                            else
                                v1 = not v4
                                if not v1 then
                                    v1 = false
                                    if v6.Locked == true then
                                        v1 = v4
                                    end
                                end
                            end
                            if v1 and matchesValueFilters(v6, {v5}) then
                                table.insert(v8, j)
                            end
                        end
                    end
                elseif not v7 then
                    table.insert(v8, j)
                else
                    v2 = true
                    if v6.Unlocked ~= true then
                        v2 = v6.Locked == true
                    end
                    if not v2 then
                        v1 = true
                    elseif v6.Unlocked ~= true then
                        v1 = false
                        if v6.Locked == true then
                            v1 = v4
                        end
                    else
                        v1 = not v4
                        if not v1 then
                            v1 = false
                            if v6.Locked == true then
                                v1 = v4
                            end
                        end
                    end
                    if v1 and matchesValueFilters(v6, {v5}) then
                        table.insert(v8, j)
                    end
                end
            elseif not v7 then
                table.insert(v8, j)
            else
                v2 = true
                if v6.Unlocked ~= true then
                    v2 = v6.Locked == true
                end
                if not v2 then
                    v1 = true
                elseif v6.Unlocked ~= true then
                    v1 = false
                    if v6.Locked == true then
                        v1 = v4
                    end
                else
                    v1 = not v4
                    if not v1 then
                        v1 = false
                        if v6.Locked == true then
                            v1 = v4
                        end
                    end
                end
                if v1 and matchesValueFilters(v6, {v5}) then
                    table.insert(v8, j)
                end
            end
        end
        return v8
    end, v23)
    local v24 = {u196}
    v21 = useMemo(function() -- Line: 725 -- upvalues: table (upval), u196 (val), createElement (upval), Achievement (upval), a1 (val)
        return table.reduce(u196, function(a1_2, a2, a3) -- Line: 726 -- upvalues: createElement (upval), Achievement (upval), a1 (upval)
            local v1 = ("achievement:%*"):format(a3)
            a1_2[v1] = (createElement(Achievement, {
                size = UDim2.fromScale(1, 1),
                name = a2.name,
                title = a2.title,
                description = a2.description,
                progress = a2.progress,
                maxProgress = a2.maxProgress,
                rewards = a2.rewards,
                completed = a2.completed,
                claimable = a2.claimable,
                equipped = a2.equipped,
                onEquip = function() -- Line: 738 -- upvalues: a1 (upval), a2 (val)
                    if a1.onFlairEquip then
                        a1.onFlairEquip(a2.name or a2.title or "")
                    end
                end,
                onClaim = function() -- Line: 743 -- upvalues: a1 (upval), a2 (val)
                    if a1.onAchievementClaim then
                        a1.onAchievementClaim(a2.name or a2.title or "")
                    end
                end,
                layoutOrder = a3,
            }))
            return a1_2
        end, {})
    end, v24)
    local v25 = {u69}
    v23 = useMemo(function() -- Line: 754 -- upvalues: u164 (val), u11 (val), u69 (val)
        u164({start = 1, target = 0})
        u11({start = 1, target = 0})
        return u69
    end, v25)
    v24 = useMemo
    local v26 = {tab, u66, a1.selectedEnemy}
    v24 = v24(function() -- Line: 760 -- upvalues: u66 (val), Comma (upval), createElement (upval), InfoFrame (upval), u18 (val)
        if not u66 then
            return {}
        end
        local v1 = {}
        local v2 = {
            ["Health: "] = Comma(u66.Health or u66.MaxHealth or "N/A"),
            ["Speed: "] = u66.Speed,
        }
        v1.stats = createElement(InfoFrame, {layoutOrder = 0, title = "Enemy Stats: ", viewportSize = u18, info = v2})
        local Description = if not u66.Description then "No logbook description available." else if u66.Description == "" then "No logbook description available." else u66.Description
        v1.description = createElement(InfoFrame, {layoutOrder = 1, title = "Description: ", viewportSize = u18, info = {[""] = Description}})
        return v1
    end, v26)
    v25 = createElement
    local v27 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 1),
    }
    v27.Size = UDim2.fromScale(if tab ~= "Achievements" then 0.593 else 1, 0.906)
    local v28 = {
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)}),
        uICorner = createElement("UICorner"),
    }
    v28.uIAspectRatioConstraint = if tab == "Achievements" then nil else createElement("UIAspectRatioConstraint", {AspectRatio = 0.982})
    v28.background = createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.977, 0.977),
    }, {uICorner1 = createElement("UICorner")})
    local v29 = createElement
    local v30 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -16, 1, -16),
        Visible = v10,
    }
    local v31 = {}
    if tab ~= "Achievements" then
        v1 = nil
    else
        v1 = createElement
        v2 = {
            BottomImage = "",
            ScrollBarThickness = 8,
            TopImage = "",
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(12, 12, 12),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = v9:map(function(a1) -- Line: 855
                return UDim2.fromOffset(0, a1)
            end),
        }
        v3 = {}
        local createElement_2 = React.createElement
        v4 = {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, 10),
        }

        v4[React.Change.AbsoluteContentSize] = function(a1) -- Line: 864 -- upvalues: u27 (val)
            u27(a1.AbsoluteContentSize.Y + 20)
        end

        v3.list = createElement_2("UIListLayout", v4)
        v3.padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 15),
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
        })
        v3.items = createElement(React.Fragment, nil, v21)
        v1 = v1("ScrollingFrame", v2, v3)
    end
    v31.achievements = v1
    v31.selection = if not u105 then nil else createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        listViewport = createElement("Frame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Position = UDim2.fromOffset(0, 58),
            Size = UDim2.new(1, 0, 1, -58),
        }, {
            list = createElement(u177, {
                cellCount = v13,
                items = if tab ~= "Maps" then v22 else v20,
                renderItem = function(a1, a2, a3, a4) -- Line: 894
                    -- upvalues: tab (val), selectedMap (val), selectedEnemy (val), createElement (upval), u174 (upval)
                    -- upvalues: page (val), onMapSelected (val), onEnemySelected (val), onLockedEnemySelected (val)
                    return createElement(u174, {
                        corner = if tab ~= "Maps" then nil else 6,
                        page = page,
                        index = a2 / math.max(a3, 1) * 0.15,
                        layoutOrder = a2,
                        locked = a1.locked,
                        icon = a1.icon,
                        selected = if tab ~= "Maps" then selectedEnemy and selectedEnemy.name == a1.name else selectedMap and selectedMap.name == a1.name,
                        position = UDim2.fromOffset(a4 / 2, a4 / 2),
                        size = UDim2.fromOffset(a4, a4),
                        tooltipKey = ("%*:%*"):format(tab, a1.name),
                        tooltipName = tab ~= "Maps" and a1.displayName or a1.name,
                        clicked = function() -- Line: 914
                            -- upvalues: tab (upval), onMapSelected (upval), a1 (val), onEnemySelected (upval)
                            -- upvalues: onLockedEnemySelected (upval)
                            if tab == "Maps" then
                                onMapSelected(a1)
                                return
                            end
                            if not a1.locked then
                                onEnemySelected(a1)
                                return
                            end
                            if onLockedEnemySelected then
                                onLockedEnemySelected()
                            end
                        end,
                    })
                end,
            }),
        }),
        controls = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 6,
            Position = UDim2.new(0, 18, 0, 14),
            Size = UDim2.new(1, -36, 0, 26),
        }, {
            searchBar = createElement(SearchBar, {
                placeholderText = "[ Search ]",
                onSearch = function(a1) -- Line: 935 -- upvalues: u31 (val)
                    u31(a1)
                end,
                position = UDim2.new(0.25, -17, 0.5, 0),
                size = UDim2.new(0.5, -34, 1, 0),
            }),
            filter = createElement(FilterButton, {
                onClick = function() -- Line: 944 -- upvalues: u35 (val), u34 (val)
                    u35(not u34)
                end,
                position = UDim2.new(0.5, -13, 0.5, 0),
                size = UDim2.fromOffset(26, 26),
            }),
            count = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                ZIndex = 7,
                AnchorPoint = Vector2.new(1, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.new(1, -8, 0.5, 0),
                Size = UDim2.new(0.5, -8, 1, 0),
                Text = ("%* / %* found"):format(v16.discovered, v16.total),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Right,
            }, {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20})}),
        }),
    })
    v31.filterList = if not u105 then nil else createElement(FilterList, {
        zIndex = 7,
        width = 220,
        maxHeight = 280,
        scale = 1,
        scrollBarThickness = 8,
        enabled = u34 and v10,
        list = v14,
        position = UDim2.new(0.5, 0, 0, 48),
        anchorPoint = Vector2.new(1, 0),
        clickedOutside = function() -- Line: 986 -- upvalues: u35 (val)
            u35(false)
        end,
        filterItemChanged = function(a1, a2) -- Line: 989 -- upvalues: tab (val), u47 (val), updateFilterList (upval), u41 (val)
            if tab == "Maps" then
                u47(function(a1_2) -- Line: 991 -- upvalues: updateFilterList (upval), a1 (val), a2 (val)
                    return (updateFilterList(a1_2, a1, a2))
                end)
                return
            end
            u41(function(a1_2) -- Line: 995 -- upvalues: updateFilterList (upval), a1 (val), a2 (val)
                return (updateFilterList(a1_2, a1, a2))
            end)
        end,
    })
    v28.selectionScroll = v29("Frame", v30, v31)
    v29 = createElement
    v30 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.977, 0.977),
        Visible = not v10,
    }

    v30[React.Change.AbsoluteSize] = function(a1) -- Line: 1014 -- upvalues: u19 (val)
        u19(a1.AbsoluteSize)
    end

    v31 = {
        back = createElement(Button, {
            IconScale = 0.8,
            TextFontSize = 24,
            Text = "Back",
            Icon = Icons.Previous,
            TextSize = UDim2.new(0, 80, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.273, 0.082),
            Position = UDim2.fromScale(0.846, 0.059),
            Color = Color3.fromRGB(150, 150, 150),
            Clicked = a1.onBack,
        }, {uIScale = createElement("UIScale", {Scale = 1})}),
    }
    v1 = createElement
    v2 = {
        BottomImage = "",
        ScrollBarThickness = 8,
        TopImage = "",
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.118),
        Size = UDim2.fromScale(1, 0.882),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = v8:map(function(a1) -- Line: 1051
            return UDim2.new(0, 0, 0, a1)
        end),
    }
    v3 = {items = createElement(React.Fragment, nil, v24)}
    local v32 = createElement
    v4 = {
        Padding = UDim.new(0, 5),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v4[React.Change.AbsoluteContentSize] = function(a1) -- Line: 1061 -- upvalues: u23 (val)
        u23(a1.AbsoluteContentSize.Y + 32)
    end

    v3.uIListLayout = v32("UIListLayout", v4)
    v3.uIPadding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 24),
        PaddingTop = UDim.new(0, 16),
    })
    v31.list = v1("ScrollingFrame", v2, v3)
    v31.imageLabel = createElement("ImageLabel", {
        BorderSizePixel = 0,
        Image = a1.selectedEnemy and a1.selectedEnemy.icon or "rbxassetid://15913919212",
        ScaleType = Enum.ScaleType.Fit,
        BackgroundColor3 = Color3.fromRGB(10, 13, 24),
        BackgroundTransparency = v7(0.5),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v6:map(function(a1) -- Line: 1081
            return UDim2.fromScale(0.065 - a1 * 0.1, 0.06)
        end),
        Rotation = v18:map(function(a1) -- Line: 1084
            return -a1 * 78
        end),
        Size = UDim2.fromScale(0.0959, 0.0941),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageTransparency = v7(0),
    }, {
        uIScale = createElement("UIScale", {
            Scale = v6:map(function(a1) -- Line: 1092
                return 1 - a1 * 0.5
            end),
        }),
        uICorner2 = createElement("UICorner"),
        uIStroke1 = createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Transparency = v7(0)}),
    })
    v1 = createElement
    v2 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
    }
    v2.Text = a1.selectedEnemy and a1.selectedEnemy.displayName or "None"
    v2.TextColor3 = Color3.fromRGB(255, 255, 255)
    v2.TextXAlignment = Enum.TextXAlignment.Left
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v2.Size = UDim2.fromScale(0.463, 0.0485)
    v2.Position = v6:map(function(a1) -- Line: 1121
        return UDim2.fromScale(0.126, 0.012 - a1 * 0.05)
    end)
    v2.TextTransparency = v7(0)
    v31.enemyName = v1("TextLabel", v2, {
        uIStroke2 = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(11, 15, 22), Transparency = v7(0.6)}),
    })
    v31.appearList = createElement("TextLabel", {
        RichText = true,
        TextScaled = false,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = v23,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = u18:map(function(a1) -- Line: 1143 -- types: a1: userdata
            return a1.Y / 30
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v6:map(function(a1) -- Line: 1154
            return UDim2.fromScale(0.126, 0.0672 + a1 * 0.05)
        end),
        Size = UDim2.fromScale(0.5, 0.0382),
        TextTransparency = v7(0),
    }, {uIStroke3 = createElement("UIStroke", {Thickness = 2, Transparency = v7(0.63)})})
    v28.enemyInformation = v29("Frame", v30, v31)
    return v25("Frame", v27, v28)
end)