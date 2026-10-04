-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.GamemodeBrowser
-- Decompile time: 122.90 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local React = require(ReplicatedStorage.Shared.UI.React)
local GameModeData = require(ReplicatedStorage.Shared.Data.GameModeData)
local MatchmakingCard = require(script.Parent.MatchmakingCard)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingScroll = require(script.Parent.MatchmakingScroll)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local MatchmakingTrialContext = require(script.Parent.MatchmakingTrialContext)
local MostPopularBadge = require(script.Parent.MostPopularBadge)
local NavButton = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.NavButton)
local PlayerCountBadge = require(script.Parent.PlayerCountBadge)
local RadioCloseButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioCloseButton)
local ServerCountStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.ServerCountStore)
local StoryModeWindow = require(script.Parent.StoryModeWindow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useOnScreen = require(ReplicatedStorage.Client.Interfaces.Hooks.useOnScreen)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useContext = React.useContext
local useRef = React.useRef
local useState = React.useState

local function playStoryCutscene(a1, a2, a3) -- Line: 33
    -- upvalues: ReplicatedStorage (val)
    ((require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController).PlayStoryLocal(a1, a2)):finally(a3)):catch(warn)
end

local textMuted = MatchmakingStyle.colors.textMuted
local u125 = Color3.fromRGB(52, 218, 91)
local danger = MatchmakingStyle.colors.danger
local u128 = {
    Survival = {title = "Survival", subtitle = "Choose a classic defense experience."},
    Story = {title = "Story Mode", subtitle = "Battle through chapters, missions, and escalating difficulties."},
    PVP = {title = "Player vs. Player", subtitle = "Compete against other defenders."},
    Arcade = {title = "Arcade", subtitle = "Try fun maps with unique enemies and special rules."},
    Sandbox = {title = "Sandbox", subtitle = "Experiment with the whole game."},
}
local u134 = {"easy", "casual", "intermediate", "molten", "fallen", "frost"}
local u141 = {"hardcore", "voidcore"}
local u144 = {"sandbox-solo", "sandbox-duo", "sandbox-trio", "sandbox-quad", "sandbox-squads", "sandbox-mega"}
local u151 = {}
local v1 = {position = UDim2.fromScale(0, 0), size = UDim2.fromScale(0.295, 1)}
local v2 = {position = UDim2.fromScale(0.302, 0), size = UDim2.fromScale(0.228, 0.481)}
local v3 = {position = UDim2.fromScale(0.536, 0), size = UDim2.fromScale(0.228, 0.481)}
local v4 = {position = UDim2.fromScale(0.772, 0), size = UDim2.fromScale(0.228, 0.481)}
local v5 = {position = UDim2.fromScale(0.302, 0.493), size = UDim2.fromScale(0.347, 0.507)}
local v6 = {position = UDim2.fromScale(0.653, 0.493), size = UDim2.fromScale(0.347, 0.507)}
u151[1] = v1
u151[2] = v2
u151[3] = v3
u151[4] = v4
u151[5] = v5
u151[6] = v6

local function createHoverDetails(a1) -- Line: 217 -- upvalues: GameModeData (val) -- types: a1: string
    local v1 = GameModeData[((a1:gsub(" II$", "")):gsub("%s+", ""))]
    if not v1 then
        return nil
    end
    return {boss = v1.Boss, estimatedTime = v1.EstimatedTime, rewards = v1.Rewards}
end

local function getEntries(a1, a2) -- Line: 232 -- types: a1: table, a2: table
    local v1 = {}
    local v2 = nil
    local v3 = nil
    for i, j in a2, v2, v3 do
        for k, n in a1 do
            if n.id == j then
                table.insert(v1, n)
                break
            end
        end
    end
    return v1
end

local function getVerticalListHeight(a1, a2, a3) -- Line: 247 -- types: a1: number, a2: number, a3: boolean?
    if a1 == 0 then
        return 0
    end
    return (if not a3 then a2 else a2 + 42) + (math.max(a1 - 1, 0)) * (a2 + 12)
end

local function getCompactGridHeight(a1, a2, a3) -- Line: 260 -- types: a1: number, a2: number, a3: number
    local v1 = math.ceil(a1 / a2)
    if v1 == 0 then
        return 0
    end
    return v1 * a3 + math.max(v1 - 1, 0) * 12
end

local function getSectionHeaderHeight(a1) -- Line: 273 -- types: a1: boolean
    if a1 then
        return 64
    end
    return 72
end

local function getAspectFittedSize(a1, a2) -- Line: 277 -- types: a1: userdata, a2: number
    if not (a1.X <= 0) and not (a1.Y <= 0) then
        if a2 < a1.X / a1.Y then
            return Vector2.new(a1.Y * a2, a1.Y)
        end
        return Vector2.new(a1.X, a1.X / a2)
    end
    return Vector2.zero
end

local function getMosaicHeight(a1, a2, a3, a4) -- Line: 289 -- types: a1: number, a2: number, a3: boolean, a4: boolean
    if not a3 then
        if a4 then
            return (math.clamp(a1 / 2.7, 250, 340))
        end
        return (math.clamp(a1 / 2.55, 430, 680))
    end
    if not a4 then
        if a2 == 0 then
            return 0
        end
        return math.max(a2 - 1, 0) * 176 + 206
    end
    local v1 = math.ceil(a2 / 3)
    if v1 == 0 then
        return 0
    end
    return v1 * 112 + math.max(v1 - 1, 0) * 12
end

local function getSandboxSectionHeight(a1, a2, a3) -- Line: 310
    -- upvalues: u144 (val)
    local v1
    local v2 = #u144
    if not a2 then
        v1 = if not a3 then math.clamp(a1 / 2.55, 430, 680) else math.clamp(a1 / 2.7, 250, 340)
    elseif a3 then
        local v3 = math.ceil(v2 / 3)
        v1 = if v3 ~= 0 then v3 * 112 + math.max(v3 - 1, 0) * 12 else 0
    else
        v1 = if v2 ~= 0 then math.max(v2 - 1, 0) * 176 + 206 else 0
    end
    return (if not a3 then 72 else 64) + v1 + 18
end

local function getPvpCardHeight(a1, a2, a3) -- Line: 320 -- types: a1: number, a2: boolean, a3: boolean
    if a2 then
        if a3 then
            return 130
        end
        return 172
    end
    local v1 = if not a3 then math.clamp((a1 - 12) / 2 / 2.49 * 2 + 12, 370, 720) else math.clamp((a1 - 12) / 2 / 2.55 * 2 + 12, 280, 450)
    return (v1 - 12) / 2
end

local function SectionBadges(a1) -- Line: 332
    -- upvalues: useCharmSelector (val), ServerCountStore (val), MatchmakingModel (val), createElement (val)
    -- upvalues: MostPopularBadge (val), PlayerCountBadge (val)
    local category = a1.category
    local playerCount = a1.playerCount
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        ZIndex = 4,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -48, 0.5, 0),
        Size = UDim2.new(0.5, -24, 1, 0),
    }, {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        MostPopularBadge = createElement(MostPopularBadge, {
            LayoutOrder = 1,
            ZIndex = 4,
            category = category,
            compact = a1.compact,
            mostPopularCategory = a1.mostPopularCategory,
        }),
        PlayerCountBadge = createElement(PlayerCountBadge, {
            LayoutOrder = 2,
            ZIndex = 4,
            compact = a1.compact,
            playerCount = useCharmSelector(ServerCountStore.getState, function(a1) -- Line: 340 -- upvalues: playerCount (val), MatchmakingModel (upval), category (val)
                if playerCount ~= nil then
                    return playerCount
                end
                return (MatchmakingModel.getPopularCategoryCounts(a1.serverCount))[category]
            end, {category, playerCount}),
        }),
    })
end

local function SectionHeader(a1) -- Line: 380
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), TextLabel (val), SectionBadges (val)
    -- upvalues: danger (val), u125 (val), textMuted (val)
    local v1 = if not a1.compact then 58 else 2
    local v2 = useFontScale(MatchmakingStyle.getFontSize("header1", a1.compact))
    local v3 = useFontScale(MatchmakingStyle.getFontSize("subheader1", a1.compact))
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, if not a1.compact then 72 else 64),
    }
    local v5 = {
        Title = createElement(TextLabel, {
            FontWeight = "Black",
            TextScaled = false,
            AnchorPoint = Vector2.zero,
            Position = UDim2.fromOffset(v1, 0),
            Size = UDim2.new(1, -v1 - 2, 0, 36),
            Text = a1.title,
            TextSize = v2,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        BadgeContainer = if not a1.category then nil else createElement(SectionBadges, {
            category = a1.category,
            compact = a1.compact,
            mostPopularCategory = a1.mostPopularCategory,
            playerCount = a1.playerCount,
        }),
    }
    local v6 = {
        FontWeight = "SemiBold",
        TextScaled = false,
        AnchorPoint = Vector2.zero,
        Position = UDim2.fromOffset(v1 + 1, 39),
        Size = UDim2.new(1, -v1 - 3, 0, 24),
    }
    local statusText = a1.statusText or a1.subtitle
    v6.Text = statusText
    v6.TextColor3 = if not a1.statusText then textMuted else if not a1.statusIsError then u125 else danger
    v6.TextSize = v3
    v6.TextTruncate = Enum.TextTruncate.AtEnd
    v6.TextXAlignment = Enum.TextXAlignment.Left
    v5.Subtitle = createElement(TextLabel, v6)
    return createElement("Frame", v4, v5)
end

local function ModeCardSlot(a1) -- Line: 436
    -- upvalues: useRef (val), useState (val), useOnScreen (val), useEffect (val), createElement (val)
    -- upvalues: MatchmakingCard (val), createHoverDetails (val), MatchmakingStyle (val)
    local v1 = useRef(nil)
    local active = a1.revealContext.active
    local cycle = a1.revealContext.cycle
    local id = a1.entry.id
    local revealedEntries = a1.revealContext.revealedEntries
    local viewportRef = a1.revealContext.viewportRef
    local v2 = useRef(cycle)
    local v3 = useRef(revealedEntries[id] == cycle)
    local u28 = useRef({active = active, cycle = cycle})
    u28.current.active = active
    u28.current.cycle = cycle
    local current = false
    if v2.current == cycle then
        current = v3.current
    end
    local v4, u44 = useState(if not v3.current then nil else cycle)
    local u50 = active
    if u50 then
        u50 = v4 ~= cycle
    end
    local u62 = useOnScreen({enabled = u50, targetRef = v1, viewportRef = viewportRef})
    local v5 = {u62, u50, cycle, revealedEntries, id, viewportRef}
    useEffect(function() -- Line: 462
        -- upvalues: u50 (val), u62 (val), u28 (val), cycle (val), revealedEntries (val), id (val), u44 (val)
        if u50 and u62 then
            local current = u28.current
            if current.active and current.cycle == cycle then
                revealedEntries[id] = cycle
                u44(cycle)
                return
            end
            return
        end
    end, v5)
    v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        LayoutOrder = a1.layoutOrder,
        Position = a1.position,
        Size = a1.size,
        ref = v1,
    }
    local v6 = {}
    local v7 = {
        selected = false,
        artworkDescriptor = a1.entry.artworkDescriptor,
        compact = a1.compact,
    }
    local compact = a1.compact and a1.entry.trialName == nil
    v7.denseChin = compact
    v7.hoverDetails = createHoverDetails(a1.entry.title)
    v7.image = a1.entry.image
    v7.imageOffset = a1.entry.imageOffset
    v7.imageScale = a1.entry.imageScale
    v7.locked = a1.entry.locked
    v7.lockReason = a1.entry.lockReason

    function v7.onActivated() -- Line: 502 -- upvalues: a1 (val)
        a1.revealContext.onActivated()
        if a1.onActivated then
            a1.onActivated(a1.entry)
        end
    end

    v7.parallaxSensitivity = MatchmakingStyle.motion.parallaxSensitivity
    v7.revealCycle = cycle
    v7.revealImmediately = current
    local revealOrder = a1.revealOrder or a1.layoutOrder or 1
    v7.revealOrder = revealOrder
    v7.revealed = v4 == cycle
    v7.size = UDim2.fromScale(1, 1)
    v7.subtitle = a1.entry.subtitle
    v7.tag = a1.entry.tag
    v7.timerEndsAt = a1.entry.timerEndsAt
    v7.title = a1.entry.title
    v6.Card = createElement(MatchmakingCard, v7)
    return createElement("Frame", v5, v6)
end

local u221 = memo(function(a1) -- Line: 523
    -- upvalues: useContext (val), MatchmakingTrialContext (val), createElement (val), ModeCardSlot (val)
    local v1 = useContext(MatchmakingTrialContext)
    if not v1 then
        return nil
    end
    return createElement(ModeCardSlot, {
        compact = a1.compact,
        entry = v1,
        layoutOrder = a1.layoutOrder,
        onActivated = a1.onActivated,
        position = a1.position,
        revealContext = a1.revealContext,
        revealOrder = a1.revealOrder,
        size = a1.size,
    })
end)

local function VerticalModeList(a1) -- Line: 551
    -- upvalues: createElement (val), u221 (val), ModeCardSlot (val)
    local rowHeight_2, v1, v2
    local v3 = if not a1.includeTrialMode then 0 else 1
    local v4 = {
        Layout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 12),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    if a1.includeTrialMode then
        v4.Mode_trial = createElement(u221, {
            layoutOrder = 1,
            revealOrder = 1,
            compact = a1.compact,
            onActivated = a1.onEntryActivated,
            revealContext = a1.revealContext,
            size = UDim2.new(1, 0, 0, if not a1.primaryFirst then a1.rowHeight else a1.rowHeight + 42),
        })
    end
    local v5 = nil
    local v6 = nil
    local v7 = a1
    for i, j in a1.entries, v5, v6 do
        v2 = i + v3
        rowHeight_2 = if not v7.primaryFirst then v7.rowHeight else if v2 ~= 1 then v7.rowHeight else v7.rowHeight + 42
        v1 = ("Mode_%*"):format(j.id)
        v4[v1] = (createElement(ModeCardSlot, {
            compact = v7.compact,
            entry = j,
            layoutOrder = v2,
            onActivated = v7.onEntryActivated,
            revealContext = v7.revealContext,
            revealOrder = v2,
            size = UDim2.new(1, 0, 0, rowHeight_2),
        }))
    end
    return createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, Size = v7.size}, v4)
end

local function CompactGridModeLayout(a1) -- Line: 597
    -- upvalues: createElement (val), u221 (val), ModeCardSlot (val)
    local v1, v2
    local v3 = math.max(math.floor(a1.columnCount), 1)
    local v4 = if not a1.includeTrialMode then 0 else 1
    local v5 = math.ceil((#a1.entries + v4) / v3)
    local v6 = if not (v5 > 0) then 0 else (a1.height - math.max(v5 - 1, 0) * 12) / v5
    local v7 = {
        Grid = createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(12, 12),
            CellSize = UDim2.new(1 / v3, -((v3 - 1) * 12) / v3, 0, v6),
            FillDirection = Enum.FillDirection.Horizontal,
            FillDirectionMaxCells = v3,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    if a1.includeTrialMode then
        v7.Mode_trial = createElement(u221, {
            layoutOrder = 1,
            revealOrder = 1,
            compact = a1.compact,
            onActivated = a1.onEntryActivated,
            revealContext = a1.revealContext,
            size = UDim2.fromScale(1, 1),
        })
    end
    for i, j in a1.entries do
        v1 = i + v4
        v2 = ("Mode_%*"):format(j.id)
        v7[v2] = (createElement(ModeCardSlot, {
            compact = a1.compact,
            entry = j,
            layoutOrder = v1,
            onActivated = a1.onEntryActivated,
            revealContext = a1.revealContext,
            revealOrder = v1,
            size = UDim2.fromScale(1, 1),
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, a1.height),
    }, v7)
end

local function MosaicModeLayout(a1) -- Line: 651
    -- upvalues: createElement (val), CompactGridModeLayout (val), VerticalModeList (val), ModeCardSlot (val)
    local v1, v2
    if a1.narrow then
        if a1.compact then
            return createElement(CompactGridModeLayout, {
                columnCount = 3,
                compact = true,
                entries = a1.entries,
                height = a1.height,
                onEntryActivated = a1.onEntryActivated,
                revealContext = a1.revealContext,
            })
        end
        return createElement(VerticalModeList, {
            compact = false,
            primaryFirst = true,
            rowHeight = 164,
            entries = a1.entries,
            onEntryActivated = a1.onEntryActivated,
            revealContext = a1.revealContext,
            size = UDim2.new(1, 0, 0, a1.height),
        })
    end
    local v3 = {}
    for i, j in a1.entries do
        v1 = a1.slots[i]
        if v1 then
            v2 = ("Mode_%*"):format(j.id)
            v3[v2] = (createElement(ModeCardSlot, {
                compact = a1.compact,
                entry = j,
                layoutOrder = i,
                onActivated = a1.onEntryActivated,
                position = v1.position,
                revealContext = a1.revealContext,
                revealOrder = i,
                size = v1.size,
            }))
        end
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, a1.height),
    }, v3)
end

local function TwoColumnModeLayout(a1) -- Line: 707
    -- upvalues: createElement (val), ModeCardSlot (val)
    local v1
    local v2 = {
        Grid = createElement("UIGridLayout", {
            FillDirectionMaxCells = 2,
            CellPadding = UDim2.fromOffset(12, 12),
            CellSize = UDim2.new(0.5, -6, 1, 0),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    for i, j in a1.entries do
        v1 = ("Mode_%*"):format(j.id)
        v2[v1] = (createElement(ModeCardSlot, {
            compact = a1.compact,
            entry = j,
            layoutOrder = i,
            onActivated = a1.onEntryActivated,
            revealContext = a1.revealContext,
            revealOrder = i,
            size = UDim2.fromScale(1, 1),
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, a1.height),
    }, v2)
end

local function SurvivalDocumentSection(a1) -- Line: 743
    -- upvalues: getEntries (val), u134 (val), u141 (val), createElement (val), SectionHeader (val), u128 (val)
    -- upvalues: MosaicModeLayout (val), u151 (val), VerticalModeList (val), TwoColumnModeLayout (val)
    local v1, v2, v3
    local v4 = getEntries(a1.entries, u134)
    local v5 = getEntries(a1.entries, u141)
    local v6 = if not a1.compact then 72 else 64
    local documentWidth = a1.documentWidth
    local v7 = #v4
    local narrow = a1.narrow
    local compact = a1.compact
    if not narrow then
        v1 = if not compact then math.clamp(documentWidth / 2.55, 430, 680) else math.clamp(documentWidth / 2.7, 250, 340)
    elseif compact then
        v3 = math.ceil(v7 / 3)
        v1 = if v3 ~= 0 then v3 * 112 + math.max(v3 - 1, 0) * 12 else 0
    else
        v1 = if v7 ~= 0 then math.max(v7 - 1, 0) * 176 + 206 else 0
    end
    local documentWidth_2 = a1.documentWidth
    local narrow_2 = a1.narrow
    local compact_2 = a1.compact
    if not narrow_2 then
        v3 = if not compact_2 then math.clamp((documentWidth_2 - 12) / 2 / 2.49 * 2 + 12, 370, 720) else math.clamp((documentWidth_2 - 12) / 2 / 2.55 * 2 + 12, 280, 450)
        v2 = (v3 - 12) / 2
    else
        v2 = if not compact_2 then 172 else 130
    end
    if not a1.narrow or a1.compact then
        v7 = v2
    else
        local v8 = #v5
        v7 = if v8 ~= 0 then v2 + (math.max(v8 - 1, 0)) * (v2 + 12) else 0
    end
    if a1.compact and not a1.narrow then
        v1 = math.clamp((math.max(a1.viewportHeight - 8, 420)) - v6 - 12 - 18 - v7, 190, 300)
    end
    local v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Name = "Section_Survival",
        Size = UDim2.new(1, 0, 0, v6 + v1 + 12 + v7 + 18),
        ref = a1.sectionRef,
    }
    local v10 = {
        Layout = createElement("UIListLayout", {Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder}),
    }
    v10.Header = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, v6 - 12)}, {
        Content = createElement(SectionHeader, {
            category = "Survival",
            compact = a1.compact,
            mostPopularCategory = a1.mostPopularCategory,
            playerCount = a1.playerCount,
            subtitle = u128.Survival.subtitle,
            title = u128.Survival.title,
        }),
    })
    v10.SurvivalModes = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.new(1, 0, 0, v1)}, {
        Content = createElement(MosaicModeLayout, {
            compact = a1.compact,
            entries = v4,
            height = v1,
            narrow = a1.narrow,
            onEntryActivated = a1.onModeActivated,
            revealContext = a1.revealContext,
            slots = u151,
        }),
    })
    local v11 = {BackgroundTransparency = 1, LayoutOrder = 3, Size = UDim2.new(1, 0, 0, v7)}
    local v12 = {}
    local v13 = if not a1.narrow or a1.compact then createElement(TwoColumnModeLayout, {
        compact = a1.compact,
        entries = v5,
        height = v7,
        onEntryActivated = a1.onModeActivated,
        revealContext = a1.revealContext,
    }) else createElement(VerticalModeList, {
        compact = false,
        entries = v5,
        onEntryActivated = a1.onModeActivated,
        revealContext = a1.revealContext,
        rowHeight = v2,
        size = UDim2.new(1, 0, 0, v7),
    })
    v12.Content = v13
    v10.HardcoreModes = createElement("Frame", v11, v12)
    return createElement("Frame", v9, v10)
end

local function StoryDocumentSection(a1) -- Line: 846
    -- upvalues: createElement (val), SectionHeader (val), u128 (val), StoryModeWindow (val)
    local v1 = if not a1.compact then 72 else 64
    local v2 = if not a1.compact then math.clamp(a1.viewportHeight - 150, 690, 900) else math.clamp(a1.viewportHeight - 100, 330, 500)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Name = "Section_Story",
        Size = UDim2.new(1, 0, 0, v1 + v2 + 18),
        ref = a1.sectionRef,
    }, {
        Header = createElement(SectionHeader, {
            category = "Story",
            compact = a1.compact,
            mostPopularCategory = a1.mostPopularCategory,
            playerCount = a1.playerCount,
            statusIsError = a1.statusIsError,
            statusText = a1.statusText,
            subtitle = u128.Story.subtitle,
            title = u128.Story.title,
        }),
        Window = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, v1),
            Size = UDim2.new(1, 0, 0, v2),
        }, {
            Content = createElement(StoryModeWindow, {
                active = a1.active,
                compact = a1.compact,
                getSuggestedTowerActionColor = a1.getSuggestedTowerActionColor,
                getSuggestedTowerActionText = a1.getSuggestedTowerActionText,
                isSuggestedTowerActionDisabled = a1.isSuggestedTowerActionDisabled,
                isPartyLeader = a1.isPartyLeader,
                loadMissionRewards = a1.loadMissionRewards,
                onCutsceneActivated = a1.onCutsceneActivated,
                onActivated = a1.onActivated,
                onEntryActivated = a1.onEntryActivated,
                onPlayActivated = a1.onPlayActivated,
                onSectionActivated = a1.onSectionActivated,
                onSuggestedTowerView = a1.onSuggestedTowerView,
                revealCycle = a1.revealCycle,
                sections = a1.sections,
                selectedEntryId = a1.selectedEntryId,
                selectedSectionId = a1.selectedSectionId,
                viewportRef = a1.viewportRef,
            }),
        }),
    })
end

local function PvpDocumentSection(a1) -- Line: 929
    -- upvalues: createElement (val), CompactGridModeLayout (val), VerticalModeList (val), React (val)
    -- upvalues: ModeCardSlot (val), SectionHeader (val), u128 (val)
    local Fragment, v1, v2, v3, v4, v5, v6, v7
    local entries = a1.entries
    local v8 = if not a1.compact then 72 else 64
    local documentWidth = a1.documentWidth
    local narrow = a1.narrow
    local compact = a1.compact
    if not narrow then
        local v9 = if not compact then math.clamp((documentWidth - 12) / 2 / 2.49 * 2 + 12, 370, 720) else math.clamp((documentWidth - 12) / 2 / 2.55 * 2 + 12, 280, 450)
        v3 = (v9 - 12) / 2
    else
        v3 = if not compact then 172 else 130
    end
    if not a1.narrow then
        v4 = v3 * 2 + 12
    elseif not a1.compact then
        local v10 = #entries
        v4 = if v10 ~= 0 then v3 + (math.max(v10 - 1, 0)) * (v3 + 12) else 0
    else
        v5 = math.ceil(#entries / 2)
        v4 = if v5 ~= 0 then v5 * v3 + math.max(v5 - 1, 0) * 12 else 0
    end
    if not a1.narrow then
        if not a1.narrow then
            v6 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v4)}
            v7 = {
                Grid = createElement("UIGridLayout", {
                    FillDirectionMaxCells = 2,
                    CellPadding = UDim2.fromOffset(12, 12),
                    CellSize = UDim2.new(0.5, -6, 0.5, -6),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
            }
            Fragment = React.Fragment
            v1 = {}
            for i, j in entries do
                v2 = ("Mode_%*"):format(j.id)
                v1[v2] = (createElement(ModeCardSlot, {
                    compact = a1.compact,
                    entry = j,
                    layoutOrder = i,
                    onActivated = a1.onModeActivated,
                    revealContext = a1.revealContext,
                    revealOrder = i,
                    size = UDim2.fromScale(1, 1),
                }))
            end
            v7.Cards = createElement(Fragment, nil, v1)
            v5 = createElement("Frame", v6, v7)
        else
            v5 = createElement(VerticalModeList, {
                compact = false,
                entries = entries,
                onEntryActivated = a1.onModeActivated,
                revealContext = a1.revealContext,
                rowHeight = v3,
                size = UDim2.new(1, 0, 0, v4),
            })
        end
    elseif a1.compact then
        v5 = createElement(CompactGridModeLayout, {
            columnCount = 2,
            compact = true,
            entries = entries,
            height = v4,
            onEntryActivated = a1.onModeActivated,
            revealContext = a1.revealContext,
        })
    elseif not a1.narrow then
        v6 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v4)}
        v7 = {
            Grid = createElement("UIGridLayout", {
                FillDirectionMaxCells = 2,
                CellPadding = UDim2.fromOffset(12, 12),
                CellSize = UDim2.new(0.5, -6, 0.5, -6),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }
        Fragment = React.Fragment
        v1 = {}
        for k, n in entries do
            v2 = ("Mode_%*"):format(n.id)
            v1[v2] = (createElement(ModeCardSlot, {
                compact = a1.compact,
                entry = n,
                layoutOrder = k,
                onActivated = a1.onModeActivated,
                revealContext = a1.revealContext,
                revealOrder = k,
                size = UDim2.fromScale(1, 1),
            }))
        end
        v7.Cards = createElement(Fragment, nil, v1)
        v5 = createElement("Frame", v6, v7)
    else
        v5 = createElement(VerticalModeList, {
            compact = false,
            entries = entries,
            onEntryActivated = a1.onModeActivated,
            revealContext = a1.revealContext,
            rowHeight = v3,
            size = UDim2.new(1, 0, 0, v4),
        })
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        Name = "Section_PVP",
        Size = UDim2.new(1, 0, 0, v8 + v4 + 18),
        ref = a1.sectionRef,
    }, {
        Header = createElement(SectionHeader, {
            category = "PVP",
            compact = a1.compact,
            mostPopularCategory = a1.mostPopularCategory,
            playerCount = a1.playerCount,
            subtitle = u128.PVP.subtitle,
            title = u128.PVP.title,
        }),
        Content = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, v8),
            Size = UDim2.new(1, 0, 0, v4),
        }, {Layout = v5}),
    })
end

local function ArcadeDocumentSection(a1) -- Line: 1025
    -- upvalues: createElement (val), CompactGridModeLayout (val), VerticalModeList (val), ModeCardSlot (val)
    -- upvalues: u221 (val), SectionHeader (val), u128 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local entries = a1.entries
    local v13 = #entries
    local v14 = v13 + (if not a1.hasTrialMode then 0 else 1)
    v13 = if not a1.compact then 72 else 64
    local v15 = if not a1.compact then math.clamp(a1.documentWidth / 5.55, 190, 270) else math.clamp(a1.documentWidth / 5.55, 148, 190)
    local v16 = if not a1.compact then math.clamp((a1.documentWidth - 24) / 3 / 1.18, 238, 400) else math.clamp((a1.documentWidth - 24) / 3 / 1.18, 164, 220)
    if not a1.narrow then
        v10 = v15 + 12 + v16
    elseif a1.compact then
        local v17 = math.ceil(v14 / 2)
        v10 = if v17 ~= 0 then v17 * 130 + math.max(v17 - 1, 0) * 12 else 0
    else
        v10 = if v14 ~= 0 then math.max(v14 - 1, 0) * 176 + 206 else 0
    end
    if not a1.narrow then
        if not a1.narrow then
            v12 = if not a1.hasTrialMode then entries[1] else nil
            v2 = if not a1.hasTrialMode then 2 else 1
            v3 = {
                Grid = createElement("UIGridLayout", {
                    FillDirectionMaxCells = 3,
                    CellPadding = UDim2.fromOffset(12, 0),
                    CellSize = UDim2.new(0.3333333333333333, -8, 1, 0),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
            }
            v4 = #entries
            v1 = a1
            for i = v2, v4 do
                v6 = entries[i]
                v7 = ("Mode_%*"):format(v6.id)
                v8 = {
                    compact = v1.compact,
                    entry = v6,
                    layoutOrder = i - v2 + 1,
                    onActivated = v1.onModeActivated,
                    revealContext = v1.revealContext,
                }
                v9 = if not v1.hasTrialMode then 0 else 1
                v8.revealOrder = i + v9
                v8.size = UDim2.fromScale(1, 1)
                v3[v7] = (createElement(ModeCardSlot, v8))
            end
            v4 = {
                SecondaryModes = createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.fromOffset(0, v15 + 12),
                    Size = UDim2.new(1, 0, 0, v16),
                }, v3),
            }
            if v1.hasTrialMode then
                v4.Mode_trial = createElement(u221, {
                    revealOrder = 1,
                    compact = v1.compact,
                    onActivated = v1.onModeActivated,
                    position = UDim2.fromOffset(0, 0),
                    revealContext = v1.revealContext,
                    size = UDim2.new(1, 0, 0, v15),
                })
            elseif v12 then
                v5 = ("Mode_%*"):format(v12.id)
                v4[v5] = (createElement(ModeCardSlot, {
                    revealOrder = 1,
                    compact = v1.compact,
                    entry = v12,
                    onActivated = v1.onModeActivated,
                    position = UDim2.fromOffset(0, 0),
                    revealContext = v1.revealContext,
                    size = UDim2.new(1, 0, 0, v15),
                }))
            end
            v11 = createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, v10)}, v4)
        else
            v11 = createElement(VerticalModeList, {
                compact = false,
                primaryFirst = true,
                rowHeight = 164,
                entries = entries,
                includeTrialMode = a1.hasTrialMode,
                onEntryActivated = a1.onModeActivated,
                revealContext = a1.revealContext,
                size = UDim2.new(1, 0, 0, v10),
            })
            v1 = a1
        end
    elseif a1.compact then
        v11 = createElement(CompactGridModeLayout, {
            columnCount = 2,
            compact = true,
            entries = entries,
            height = v10,
            includeTrialMode = a1.hasTrialMode,
            onEntryActivated = a1.onModeActivated,
            revealContext = a1.revealContext,
        })
        v1 = a1
    elseif not a1.narrow then
        v12 = if not a1.hasTrialMode then entries[1] else nil
        v2 = if not a1.hasTrialMode then 2 else 1
        v3 = {
            Grid = createElement("UIGridLayout", {
                FillDirectionMaxCells = 3,
                CellPadding = UDim2.fromOffset(12, 0),
                CellSize = UDim2.new(0.3333333333333333, -8, 1, 0),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }
        v4 = #entries
        v1 = a1
        for j = v2, v4 do
            v6 = entries[j]
            v7 = ("Mode_%*"):format(v6.id)
            v8 = {
                compact = v1.compact,
                entry = v6,
                layoutOrder = j - v2 + 1,
                onActivated = v1.onModeActivated,
                revealContext = v1.revealContext,
            }
            v9 = if not v1.hasTrialMode then 0 else 1
            v8.revealOrder = j + v9
            v8.size = UDim2.fromScale(1, 1)
            v3[v7] = (createElement(ModeCardSlot, v8))
        end
        v4 = {
            SecondaryModes = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.fromOffset(0, v15 + 12),
                Size = UDim2.new(1, 0, 0, v16),
            }, v3),
        }
        if v1.hasTrialMode then
            v4.Mode_trial = createElement(u221, {
                revealOrder = 1,
                compact = v1.compact,
                onActivated = v1.onModeActivated,
                position = UDim2.fromOffset(0, 0),
                revealContext = v1.revealContext,
                size = UDim2.new(1, 0, 0, v15),
            })
        elseif v12 then
            v5 = ("Mode_%*"):format(v12.id)
            v4[v5] = (createElement(ModeCardSlot, {
                revealOrder = 1,
                compact = v1.compact,
                entry = v12,
                onActivated = v1.onModeActivated,
                position = UDim2.fromOffset(0, 0),
                revealContext = v1.revealContext,
                size = UDim2.new(1, 0, 0, v15),
            }))
        end
        v11 = createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, v10)}, v4)
    else
        v11 = createElement(VerticalModeList, {
            compact = false,
            primaryFirst = true,
            rowHeight = 164,
            entries = entries,
            includeTrialMode = a1.hasTrialMode,
            onEntryActivated = a1.onModeActivated,
            revealContext = a1.revealContext,
            size = UDim2.new(1, 0, 0, v10),
        })
        v1 = a1
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 4,
        Name = "Section_Arcade",
        Size = UDim2.new(1, 0, 0, v13 + v10 + 18),
        ref = v1.sectionRef,
    }, {
        Header = createElement(SectionHeader, {
            category = "Arcade",
            compact = v1.compact,
            mostPopularCategory = v1.mostPopularCategory,
            playerCount = v1.playerCount,
            subtitle = u128.Arcade.subtitle,
            title = u128.Arcade.title,
        }),
        Content = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, v13),
            Size = UDim2.new(1, 0, 0, v10),
        }, {Layout = v11}),
    })
end

local function SandboxDocumentSection(a1) -- Line: 1165
    -- upvalues: getEntries (val), u144 (val), createElement (val), SectionHeader (val), u128 (val)
    -- upvalues: MosaicModeLayout (val), u151 (val)
    local v1, v2
    local v3 = getEntries(a1.entries, u144)
    local v4 = if not a1.compact then 72 else 64
    local documentWidth = a1.documentWidth
    local v5 = #v3
    local narrow = a1.narrow
    local compact = a1.compact
    if not narrow then
        v2 = if not compact then math.clamp(documentWidth / 2.55, 430, 680) else math.clamp(documentWidth / 2.7, 250, 340)
    elseif compact then
        local v6 = math.ceil(v5 / 3)
        v2 = if v6 ~= 0 then v6 * 112 + math.max(v6 - 1, 0) * 12 else 0
    else
        v2 = if v5 ~= 0 then math.max(v5 - 1, 0) * 176 + 206 else 0
    end
    local documentWidth_2 = a1.documentWidth
    local narrow_2 = a1.narrow
    local compact_2 = a1.compact
    local v7 = #u144
    if not narrow_2 then
        v1 = if not compact_2 then math.clamp(documentWidth_2 / 2.55, 430, 680) else math.clamp(documentWidth_2 / 2.7, 250, 340)
    elseif compact_2 then
        local v8 = math.ceil(v7 / 3)
        v1 = if v8 ~= 0 then v8 * 112 + math.max(v8 - 1, 0) * 12 else 0
    else
        v1 = if v7 ~= 0 then math.max(v7 - 1, 0) * 176 + 206 else 0
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 5,
        Name = "Section_Sandbox",
        Size = UDim2.new(1, 0, 0, (if not compact_2 then 72 else 64) + v1 + 18),
        ref = a1.sectionRef,
    }, {
        Header = createElement(SectionHeader, {
            category = "Sandbox",
            compact = a1.compact,
            mostPopularCategory = a1.mostPopularCategory,
            playerCount = a1.playerCount,
            subtitle = u128.Sandbox.subtitle,
            title = u128.Sandbox.title,
        }),
        Content = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, v4),
            Size = UDim2.new(1, 0, 0, v2),
        }, {
            Layout = createElement(MosaicModeLayout, {
                compact = a1.compact,
                entries = v3,
                height = v2,
                narrow = a1.narrow,
                onEntryActivated = a1.onModeActivated,
                revealContext = a1.revealContext,
                slots = u151,
            }),
        }),
    })
end

local function Navigation(a1) -- Line: 1215
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), MatchmakingModel (val)
    -- upvalues: NavButton (val)
    local v1, v2, v3, v4, v5
    local v6 = useFontScale(MatchmakingStyle.getFontSize("button", a1.compact))
    local v7 = {
        Layout = createElement("UIListLayout", {
            FillDirection = if not a1.compact then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, if not a1.narrow then if not a1.compact then 6 else 3 else 2),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v7.Padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, if not a1.compact then 6 else 4),
        PaddingLeft = UDim.new(0, if not a1.compact then 6 else 5),
        PaddingRight = UDim.new(0, if not a1.compact then 6 else 5),
        PaddingTop = UDim.new(0, if not a1.compact then 6 else 4),
    })
    local v8 = nil
    local v9 = nil
    for i, j in MatchmakingModel.NAV_ITEMS, v8, v9 do
        v5 = ("TabSlot_%*"):format(j.id)
        v1 = {BackgroundTransparency = 1, LayoutOrder = i}
        v2 = if not a1.narrow then if not a1.compact then UDim2.new(1, 0, 0, 74) else UDim2.fromOffset(72, 50) else UDim2.new(0.2, -4, 0, 50)
        v1.Size = v2
        v2 = {}
        v3 = {
            flipped = false,
            zIndex = 211,
            buttonSize = if not a1.narrow then if not a1.compact then 0.88 else 0.7 else 0.64,
            enabled = j.id == a1.activeTab,
            icon = j.icon,
            layoutOrder = i,
            onClick = function() -- Line: 1256 -- upvalues: a1 (val), j (val)
                a1.onActivated()
                a1.onTabActivated(j.id)
            end,
        }
        v4 = if not a1.compact then UDim2.new(1, -12, 0, 62) else UDim2.new(1, 0, 0, 46)
        v3.size = v4
        v3.textSize = v6
        v3.title = j.title
        v2.Button = createElement(NavButton, v3)
        v7[v5] = (createElement("Frame", v1, v2))
    end
    v9 = {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        SelectionGroup = true,
        ZIndex = 210,
        AnchorPoint = if not a1.compact then Vector2.zero else Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(24, 29, 35),
        BackgroundTransparency = MatchmakingStyle.transparency.surface,
    }
    local v10 = if not a1.compact then UDim2.new(0, 12, 0.1, 0) else UDim2.new(0.5, 0, 0, 8)
    v9.Position = v10
    v10 = if not a1.compact then UDim2.fromOffset(90, 464) else UDim2.new(1, -48, 0, 58)
    v9.Size = v10
    v10 = {}
    local compact = a1.compact and createElement("UISizeConstraint", {MaxSize = Vector2.new(430, 58)})
    v10.CompactSize = compact
    local v11 = {}
    local navigationCompact = if not a1.compact then MatchmakingStyle.cornerRadius.navigation else MatchmakingStyle.cornerRadius.navigationCompact
    v11.CornerRadius = navigationCompact
    v10.Corner = createElement("UICorner", v11)
    v10.Stroke = createElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = MatchmakingStyle.colors.border,
        Thickness = MatchmakingStyle.strokeThickness.thick,
        Transparency = MatchmakingStyle.transparency.stroke,
    })
    v10.Gradient = createElement("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 47, 50)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 17, 21))),
        }),
        Rotation = if not a1.compact then 90 else 0,
    })
    v10.Content = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, v7)
    return createElement("Frame", v9, v10)
end

return memo(function(a1) -- Line: 1311
    -- upvalues: MatchmakingModel (val), useState (val), useRef (val), getAspectFittedSize (val), MatchmakingStyle (val)
    -- upvalues: u144 (val), GuiService (val), MatchmakingScroll (val), TweenService (val), useEffect (val)
    -- upvalues: createElement (val), React (val), StoryDocumentSection (val), ReplicatedStorage (val)
    -- upvalues: SurvivalDocumentSection (val), PvpDocumentSection (val), ArcadeDocumentSection (val)
    -- upvalues: SandboxDocumentSection (val), Navigation (val), RadioCloseButton (val)
    local v1, v2
    local storySections = a1.storySections
    local v3, v4 = MatchmakingModel.resolveStoryEntrySelection(storySections, nil, nil)
    local u10 = a1.initialTab or "Survival"
    local v5, u14 = useState(u10)
    local v6, u18 = useState(false)
    local v7, u22 = useState(nil)
    local u28, u29 = useState(if not v4 then nil else v4.id)
    local u36, u37 = useState(if not v3 then nil else v3.id)
    local v8 = useRef(nil)
    local u43 = useRef(nil)
    local u46 = useRef(nil)
    local v9 = useRef(nil)
    local v10 = useRef(nil)
    local u55 = useRef(nil)
    local u58 = useRef(nil)
    local u61 = useRef(nil)
    local v11 = useRef(nil)
    local v12 = useRef(nil)
    local u70 = useRef(true)
    local v13 = useRef({})
    local u74 = {
        Arcade = v8,
        PVP = v9,
        Sandbox = v10,
        Story = v11,
        Survival = v12,
    }
    local compact = a1.compact
    local viewportSize = a1.viewportSize
    local v14 = if not compact then getAspectFittedSize(viewportSize, MatchmakingStyle.aspectRatios.regular) else viewportSize
    local v15 = v14.X < 650
    local v16 = if not compact then math.max(v14.X - 154, 320) else math.max(v14.X - 106, 1)
    local Y = viewportSize.Y
    local v17 = #u144
    if not v15 then
        v1 = if not compact then math.clamp(v16 / 2.55, 430, 680) else math.clamp(v16 / 2.7, 250, 340)
    elseif compact then
        v2 = math.ceil(v17 / 3)
        v1 = if v2 ~= 0 then v2 * 112 + math.max(v2 - 1, 0) * 12 else 0
    else
        v1 = if v17 ~= 0 then math.max(v17 - 1, 0) * 176 + 206 else 0
    end
    local v18 = math.max(if not compact then 30 else 58, Y - ((if not compact then 72 else 64) + v1 + 18))

    local function cancelScrollTween() -- Line: 1361 -- upvalues: u58 (val), u61 (val)
        local current = u58.current
        u58.current = nil
        if current then
            current:Disconnect()
        end
        local current_2 = u61.current
        u61.current = nil
        if current_2 then
            current_2:Cancel()
        end
    end

    local function activateMode(a1_2, a2) -- Line: 1375
        -- upvalues: u58 (val), u61 (val), GuiService (upval), u43 (val), u46 (val), u14 (val), a1 (val)
        local current = u58.current
        u58.current = nil
        if current then
            current:Disconnect()
        end
        local current_2 = u61.current
        u61.current = nil
        if current_2 then
            current_2:Cancel()
        end
        local SelectedObject = GuiService.SelectedObject
        local current_3 = u43.current
        u46.current = if not SelectedObject then nil else if not current_3 then nil else if not SelectedObject:IsDescendantOf(current_3) then nil else SelectedObject
        u14(a1_2)
        a1.onModeActivated(a1_2, a2, u46.current ~= nil)
    end

    local function scrollToSection(a1, a2) -- Line: 1388
        -- upvalues: u55 (val), u74 (val), MatchmakingScroll (upval), compact (val), u14 (val), u58 (val), u61 (val)
        -- upvalues: TweenService (upval), MatchmakingStyle (upval)
        local current = u55.current
        local current_2 = u74[a1].current
        if current and current.Parent and current_2 and current_2.Parent then
            local v1 = if not compact then 0 else 78
            local v2 = MatchmakingScroll.getCenteredTargetCanvasY(
                current.CanvasPosition.Y,
                current.AbsolutePosition.Y,
                current_2.AbsolutePosition.Y,
                current_2.AbsoluteSize.Y,
                current.AbsoluteCanvasSize.Y,
                current.AbsoluteWindowSize.Y,
                v1
            )
            u14(a1)
            local current_3 = u58.current
            u58.current = nil
            if current_3 then
                current_3:Disconnect()
            end
            local current_4 = u61.current
            u61.current = nil
            if current_4 then
                current_4:Cancel()
            end
            local v3 = Vector2.new(current.CanvasPosition.X, v2)
            if a2 and not ((math.abs(current.CanvasPosition.Y - v2)) <= 0.5) then
                local u84 = TweenService:Create(
                    current,
                    TweenInfo.new(MatchmakingStyle.motion.navigationScrollDuration, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {CanvasPosition = v3}
                )
                u61.current = u84
                u58.current = u84.Completed:Connect(function() -- Line: 1426 -- upvalues: u61 (upval), u84 (val), u58 (upval)
                    if u61.current ~= u84 then
                        return
                    end
                    u61.current = nil
                    local current = u58.current
                    u58.current = nil
                    if current then
                        current:Disconnect()
                    end
                end)
                u84:Play()
                return true
            end
            current.CanvasPosition = v3
            return true
        end
        return false
    end

    local function isDocumentLayoutReady() -- Line: 1443
        -- upvalues: u55 (val), viewportSize (val), MatchmakingModel (upval), u74 (val)
        local current = u55.current
        if not (viewportSize.X <= 0)
            and not (viewportSize.Y <= 0)
            and current
            and current.Parent
            and not (current.AbsoluteWindowSize.Y <= 0)
            and not (current.AbsoluteCanvasSize.Y <= 0) then
            local Y, current_2
            local v1 = nil
            local v2 = nil
            local v3 = nil
            for i, j in MatchmakingModel.SECTION_ORDER, v2, v3 do
                current_2 = u74[j].current
                if current_2 and current_2.Parent and not (current_2.AbsoluteSize.Y <= 0) then
                    Y = current_2.AbsolutePosition.Y
                    if v1 and Y <= v1 then
                        return false
                    end
                    continue
                end
                return false
            end
            return true
        end
        return false
    end

    local function applyInitialScroll() -- Line: 1474
        -- upvalues: u70 (val), isDocumentLayoutReady (val), u10 (val), u55 (val), u74 (val), MatchmakingScroll (upval)
        -- upvalues: compact (val), u14 (val), u58 (val), u61 (val)
        if u70.current and isDocumentLayoutReady() then
            local v1
            local v2 = u10
            local current = u55.current
            local current_2 = u74[v2].current
            if not current or not current.Parent or not current_2 then
                v1 = false
            elseif current_2.Parent then
                local v3 = if not compact then 0 else 78
                local v4 = MatchmakingScroll.getCenteredTargetCanvasY(
                    current.CanvasPosition.Y,
                    current.AbsolutePosition.Y,
                    current_2.AbsolutePosition.Y,
                    current_2.AbsoluteSize.Y,
                    current.AbsoluteCanvasSize.Y,
                    current.AbsoluteWindowSize.Y,
                    v3
                )
                u14(v2)
                local current_3 = u58.current
                u58.current = nil
                if current_3 then
                    current_3:Disconnect()
                end
                local current_4 = u61.current
                u61.current = nil
                if current_4 then
                    current_4:Cancel()
                end
                current.CanvasPosition = Vector2.new(current.CanvasPosition.X, v4)
                v1 = true
            else
                v1 = false
            end
            if v1 then
                u70.current = false
            end
            return
        end
    end

    local function updateActiveSection(a1) -- Line: 1484
        -- upvalues: u61 (val), u14 (val), compact (val), MatchmakingModel (upval), u74 (val)
        local current, v1
        if u61.current then
            return
        end
        if (math.max(a1.AbsoluteCanvasSize.Y - a1.AbsoluteWindowSize.Y, 0)) - a1.CanvasPosition.Y <= 2 then
            u14("Sandbox")
            return
        end
        local v2 = a1.AbsolutePosition.Y + (if not compact then 0 else 78) + (a1.AbsoluteWindowSize.Y - v1) / 2
        local u51 = MatchmakingModel.SECTION_ORDER[1]
        for i, j in MatchmakingModel.SECTION_ORDER do
            current = u74[j].current
            if not current or not (current.AbsolutePosition.Y <= v2) then
                break
            end
            u51 = j
        end
        u14(function(a1) -- Line: 1511 -- upvalues: u51 (ref)
            if a1 == u51 then
                return a1
            end
            return u51
        end)
    end

    local function interruptScrollForInput(a1, a2) -- Line: 1516
        -- upvalues: u58 (val), u61 (val), updateActiveSection (val)
        local UserInputType = a2.UserInputType
        local v1 = string.find(UserInputType.Name, "Gamepad", 1, true) ~= nil
        if UserInputType ~= Enum.UserInputType.Touch
            and UserInputType ~= Enum.UserInputType.MouseButton1
            and UserInputType ~= Enum.UserInputType.MouseWheel
            and not v1 then
            return
        end
        local current = u58.current
        u58.current = nil
        if current then
            current:Disconnect()
        end
        local current_2 = u61.current
        u61.current = nil
        if current_2 then
            current_2:Cancel()
        end
        updateActiveSection(a1)
    end

    useEffect(function() -- Line: 1532
        -- upvalues: u70 (val), isDocumentLayoutReady (val), u10 (val), u55 (val), u74 (val), MatchmakingScroll (upval)
        -- upvalues: compact (val), u14 (val), u58 (val), u61 (val)
        local u0 = false
        task.defer(function() -- Line: 1534
            -- upvalues: u0 (ref), u70 (upval), isDocumentLayoutReady (upval), u10 (upval), u55 (upval), u74 (upval)
            -- upvalues: MatchmakingScroll (upval), compact (upval), u14 (upval), u58 (upval), u61 (upval)
            if not u0 and u70.current then
                local v1
                if not isDocumentLayoutReady() then
                    return
                end
                local v2 = u10
                local current = u55.current
                local current_2 = u74[v2].current
                if not current or not current.Parent or not current_2 then
                    v1 = false
                elseif current_2.Parent then
                    local v3 = if not compact then 0 else 78
                    local v4 = MatchmakingScroll.getCenteredTargetCanvasY(
                        current.CanvasPosition.Y,
                        current.AbsolutePosition.Y,
                        current_2.AbsolutePosition.Y,
                        current_2.AbsoluteSize.Y,
                        current.AbsoluteCanvasSize.Y,
                        current.AbsoluteWindowSize.Y,
                        v3
                    )
                    u14(v2)
                    local current_3 = u58.current
                    u58.current = nil
                    if current_3 then
                        current_3:Disconnect()
                    end
                    local current_4 = u61.current
                    u61.current = nil
                    if current_4 then
                        current_4:Cancel()
                    end
                    current.CanvasPosition = Vector2.new(current.CanvasPosition.X, v4)
                    v1 = true
                else
                    v1 = false
                end
                if v1 then
                    u70.current = false
                end
            end
        end)
        return function() -- Line: 1540 -- upvalues: u0 (ref)
            u0 = true
        end
    end, {})
    useEffect(function() -- Line: 1545 -- upvalues: cancelScrollTween (val)
        return cancelScrollTween
    end, {})
    v17 = useEffect
    local v19 = {a1.active}
    v17(function() -- Line: 1549 -- upvalues: a1 (val), u46 (val), u43 (val), GuiService (upval)
        if not a1.active then
            return
        end
        local current = u46.current
        if not current then
            return
        end
        local u4 = false
        local u7 = task.defer(function() -- Line: 1560 -- upvalues: u4 (ref), u43 (upval), current (val), GuiService (upval)
            local current_2
            for i = 1, 12 do
                if u4 then
                    return
                end
                current_2 = u43.current
                if current.Parent and current_2 and current_2.Active and current_2.Visible then
                    GuiService.SelectedObject = current
                    return
                end
                if not current.Parent then
                    return
                end
                task.wait()
            end
        end)
        return function() -- Line: 1579 -- upvalues: u4 (ref), u7 (val)
            u4 = true
            if coroutine.status(u7) ~= "dead" then
                task.cancel(u7)
            end
        end
    end, v19)

    local function confirmStorySelection() -- Line: 1587
        -- upvalues: MatchmakingModel (upval), storySections (val), u36 (val), u28 (val), u18 (val), u22 (val)
        -- upvalues: u58 (val), u61 (val), GuiService (upval), u43 (val), u46 (val), u14 (val), a1 (val)
        local v1, v2 = MatchmakingModel.resolveStoryEntrySelection(storySections, u36, u28)
        if v1 and v2 and v2.kind == "Mission" then
            u18(false)
            u22(nil)
            local v3 = MatchmakingModel.createStoryModeEntry(v1, v2)
            local current = u58.current
            u58.current = nil
            if current then
                current:Disconnect()
            end
            local current_2 = u61.current
            u61.current = nil
            if current_2 then
                current_2:Cancel()
            end
            local SelectedObject = GuiService.SelectedObject
            local current_3 = u43.current
            u46.current = if not SelectedObject then nil else if not current_3 then nil else if not SelectedObject:IsDescendantOf(current_3) then nil else SelectedObject
            u14("Story")
            a1.onModeActivated("Story", v3, u46.current ~= nil)
            return
        end
        u18(true)
        u22("Choose an unlocked mission before continuing.")
    end

    v2 = (viewportSize - v14) / 2
    local fromOffset = UDim2.fromOffset
    local v20 = if not compact then 22 else 78
    v19 = fromOffset(v2.X + (if not compact then 116 else 82), v2.Y + v20)
    local v21 = if not (0 < viewportSize.X) then UDim2.fromScale(1, 1) else if not (0 < viewportSize.Y) then UDim2.fromScale(1, 1) else UDim2.fromOffset(viewportSize.X, viewportSize.Y)
    local v22 = {
        active = a1.active,
        cycle = a1.revealCycle,
        onActivated = a1.onActivated,
        revealedEntries = v13.current,
        viewportRef = u55,
    }
    local v23 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Name = "GamemodeBrowser",
        Selectable = false,
        Active = a1.active,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v21,
        Visible = a1.active,
        ref = u43,
    }
    local v24 = {}
    local v25 = {
        Active = true,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.fromOffset(0, 0),
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        Name = "MatchmakingSections",
        ScrollBarImageColor3 = Color3.fromRGB(184, 195, 206),
        ScrollBarImageTransparency = 0.12,
        ScrollBarThickness = 7,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Selectable = false,
        SelectionGroup = true,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 1,
        ref = u55,
    }

    v25[React.Change.AbsoluteCanvasSize] = function() -- Line: 1650 -- upvalues: applyInitialScroll (val)
        task.defer(applyInitialScroll)
    end

    v25[React.Change.CanvasPosition] = updateActiveSection
    v25[React.Event.InputBegan] = interruptScrollForInput
    v25[React.Event.InputChanged] = interruptScrollForInput
    v24.Sections = createElement("ScrollingFrame", v25, {
        Document = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = v19,
            Size = UDim2.fromOffset(v16, 0),
        }, {
            Layout = createElement("UIListLayout", {
                Padding = UDim.new(0, if not compact then 26 else 20),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            Padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, v18)}),
            Story = createElement(StoryDocumentSection, {
                active = a1.active,
                compact = compact,
                isPartyLeader = a1.isPartyLeader,
                loadMissionRewards = a1.loadStoryMissionRewards,
                mostPopularCategory = a1.mostPopularCategory,
                onActivated = a1.onActivated,
                onCutsceneActivated = function(a1, a2, a3) -- Line: 1678 -- upvalues: u18 (val), u22 (val), ReplicatedStorage (upval)
                    u18(false)
                    u22(nil)
                    ;((require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController).PlayStoryLocal(a1, a2)):finally(a3)):catch(warn)
                end,
                onEntryActivated = function(a1) -- Line: 1683 -- upvalues: MatchmakingModel (upval), storySections (val), u36 (val), u29 (val), u22 (val)
                    local v1 = MatchmakingModel.resolveStoryEntrySelection(storySections, u36, nil)
                    local v2 = if not v1 then nil else MatchmakingModel.findStoryEntry(v1, a1)
                    if v2 and not v2.locked then
                        u29(v2.id)
                        u22(nil)
                        return
                    end
                end,
                onPlayActivated = confirmStorySelection,
                onSectionActivated = function(a1) -- Line: 1700 -- upvalues: MatchmakingModel (upval), storySections (val), u37 (val), u29 (val), u22 (val)
                    local v1 = MatchmakingModel.findSection(storySections, a1)
                    if v1 and not v1.locked then
                        local v2
                        _, v2 = MatchmakingModel.resolveStoryEntrySelection(storySections, v1.id, nil)
                        u37(v1.id)
                        u29(if not v2 then nil else v2.id)
                        u22(nil)
                        return
                    end
                end,
                playerCount = if not a1.playerCounts then nil else a1.playerCounts.Story,
                revealCycle = a1.revealCycle,
                sectionRef = v11,
                sections = storySections,
                selectedEntryId = u28,
                selectedSectionId = u36,
                getSuggestedTowerActionColor = a1.getSuggestedTowerActionColor,
                getSuggestedTowerActionText = a1.getSuggestedTowerActionText,
                isSuggestedTowerActionDisabled = a1.isSuggestedTowerActionDisabled,
                onSuggestedTowerView = a1.onSuggestedTowerView,
                statusIsError = v6,
                statusText = v7,
                viewportRef = u55,
                viewportHeight = viewportSize.Y,
            }),
            Survival = createElement(SurvivalDocumentSection, {
                compact = compact,
                documentWidth = v16,
                entries = a1.modeGroups.Survival,
                mostPopularCategory = a1.mostPopularCategory,
                narrow = v15,
                onModeActivated = function(a1_2) -- Line: 1736
                    -- upvalues: u58 (val), u61 (val), GuiService (upval), u43 (val), u46 (val), u14 (val), a1 (val)
                    local current = u58.current
                    u58.current = nil
                    if current then
                        current:Disconnect()
                    end
                    local current_2 = u61.current
                    u61.current = nil
                    if current_2 then
                        current_2:Cancel()
                    end
                    local SelectedObject = GuiService.SelectedObject
                    local current_3 = u43.current
                    u46.current = if not SelectedObject then nil else if not current_3 then nil else if not SelectedObject:IsDescendantOf(current_3) then nil else SelectedObject
                    u14("Survival")
                    a1.onModeActivated("Survival", a1_2, u46.current ~= nil)
                end,
                playerCount = if not a1.playerCounts then nil else a1.playerCounts.Survival,
                revealContext = v22,
                sectionRef = v12,
                viewportHeight = viewportSize.Y,
            }),
            PVP = createElement(PvpDocumentSection, {
                compact = compact,
                documentWidth = v16,
                entries = a1.modeGroups.PVP,
                mostPopularCategory = a1.mostPopularCategory,
                narrow = v15,
                onModeActivated = function(a1_2) -- Line: 1750
                    -- upvalues: u58 (val), u61 (val), GuiService (upval), u43 (val), u46 (val), u14 (val), a1 (val)
                    local current = u58.current
                    u58.current = nil
                    if current then
                        current:Disconnect()
                    end
                    local current_2 = u61.current
                    u61.current = nil
                    if current_2 then
                        current_2:Cancel()
                    end
                    local SelectedObject = GuiService.SelectedObject
                    local current_3 = u43.current
                    u46.current = if not SelectedObject then nil else if not current_3 then nil else if not SelectedObject:IsDescendantOf(current_3) then nil else SelectedObject
                    u14("PVP")
                    a1.onModeActivated("PVP", a1_2, u46.current ~= nil)
                end,
                playerCount = if not a1.playerCounts then nil else a1.playerCounts.PVP,
                revealContext = v22,
                sectionRef = v9,
            }),
            Arcade = createElement(ArcadeDocumentSection, {
                compact = compact,
                documentWidth = v16,
                entries = a1.modeGroups.Arcade,
                hasTrialMode = a1.hasTrialMode,
                mostPopularCategory = a1.mostPopularCategory,
                narrow = v15,
                onModeActivated = function(a1_2) -- Line: 1764
                    -- upvalues: u58 (val), u61 (val), GuiService (upval), u43 (val), u46 (val), u14 (val), a1 (val)
                    local current = u58.current
                    u58.current = nil
                    if current then
                        current:Disconnect()
                    end
                    local current_2 = u61.current
                    u61.current = nil
                    if current_2 then
                        current_2:Cancel()
                    end
                    local SelectedObject = GuiService.SelectedObject
                    local current_3 = u43.current
                    u46.current = if not SelectedObject then nil else if not current_3 then nil else if not SelectedObject:IsDescendantOf(current_3) then nil else SelectedObject
                    u14("Arcade")
                    a1.onModeActivated("Arcade", a1_2, u46.current ~= nil)
                end,
                playerCount = if not a1.playerCounts then nil else a1.playerCounts.Arcade,
                revealContext = v22,
                sectionRef = v8,
            }),
            Sandbox = createElement(SandboxDocumentSection, {
                compact = compact,
                documentWidth = v16,
                entries = a1.modeGroups.Sandbox,
                mostPopularCategory = a1.mostPopularCategory,
                narrow = v15,
                onModeActivated = function(a1_2) -- Line: 1777
                    -- upvalues: u58 (val), u61 (val), GuiService (upval), u43 (val), u46 (val), u14 (val), a1 (val)
                    local current = u58.current
                    u58.current = nil
                    if current then
                        current:Disconnect()
                    end
                    local current_2 = u61.current
                    u61.current = nil
                    if current_2 then
                        current_2:Cancel()
                    end
                    local SelectedObject = GuiService.SelectedObject
                    local current_3 = u43.current
                    u46.current = if not SelectedObject then nil else if not current_3 then nil else if not SelectedObject:IsDescendantOf(current_3) then nil else SelectedObject
                    u14("Sandbox")
                    a1.onModeActivated("Sandbox", a1_2, u46.current ~= nil)
                end,
                playerCount = if not a1.playerCounts then nil else a1.playerCounts.Sandbox,
                revealContext = v22,
                sectionRef = v10,
            }),
        }),
    })
    v25 = {
        BackgroundTransparency = 1,
        ZIndex = 200,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v26 = {
        AspectRatio = not compact and createElement("UIAspectRatioConstraint", {AspectRatio = MatchmakingStyle.aspectRatios.regular}),
        Navigation = createElement(Navigation, {
            activeTab = v5,
            compact = compact,
            narrow = v15,
            onActivated = a1.onActivated,
            onTabActivated = function(a1) -- Line: 1801 -- upvalues: scrollToSection (val)
                scrollToSection(a1, true)
            end,
        }),
    }
    local v27 = {
        ZIndex = 220,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -14, 0, if not compact then 14 else 8),
    }
    local v28 = if not compact then UDim2.fromOffset(48, 48) else UDim2.fromOffset(44, 44)
    v27.Size = v28

    function v27.onActivated() -- Line: 1810 -- upvalues: a1 (val)
        a1.onActivated()
        a1.onClose()
    end

    v26.Close = createElement(RadioCloseButton, v27)
    v24.Window = createElement("Frame", v25, v26)
    return createElement("Frame", v23, v24)
end)