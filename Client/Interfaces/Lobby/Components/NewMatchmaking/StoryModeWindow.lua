-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryModeWindow
-- Decompile time: 73.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MatchmakingDropShadow = require(script.Parent.MatchmakingDropShadow)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local StoryModeRewardTile = require(script.Parent.StoryModeRewardTile)
local StoryTile = require(script.Parent.StoryTile)
local SuggestedTower = require(script.Parent.SuggestedTower)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useOnScreen = require(ReplicatedStorage.Client.Interfaces.Hooks.useOnScreen)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local u107 = Color3.fromRGB(12, 16, 20)
local u112 = Color3.fromRGB(22, 27, 33)
local u117 = Color3.fromRGB(84, 96, 108)
local u122 = Color3.fromRGB(184, 194, 205)
local u127 = Font.fromName("Montserrat", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
local u132 = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local text = MatchmakingStyle.colors.text
local u139 = Color3.fromRGB(60, 60, 60)

local function panelDecorations() -- Line: 123
    -- upvalues: createElement (val), MatchmakingStyle (val), u117 (val), u112 (val)
    return {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.card}),
        Stroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = u117,
            Thickness = MatchmakingStyle.strokeThickness.regular,
            Transparency = MatchmakingStyle.transparency.border,
        }),
        TopLight = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 53, 61)),
                (ColorSequenceKeypoint.new(1, u112)),
            }),
        }),
    }
end

local function PanelBackground(a1) -- Line: 144
    -- upvalues: panelDecorations (val), createElement (val), u117 (val), u112 (val)
    local v1 = panelDecorations()
    if a1.footerColor and a1.footerHeight then
        v1.Footer = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = a1.footerColor,
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.new(1, 0, 0, a1.footerHeight),
        }, {
            Divider = createElement("Frame", {
                BackgroundTransparency = 0.35,
                BorderSizePixel = 0,
                BackgroundColor3 = u117,
                Size = UDim2.new(1, 0, 0, 1),
            }),
        })
    end
    return createElement("CanvasGroup", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        GroupTransparency = 0,
        Name = "Background",
        ZIndex = 1,
        BackgroundColor3 = u112,
        BackgroundTransparency = a1.backgroundTransparency,
        GroupColor3 = Color3.new(1, 1, 1),
        Size = UDim2.fromScale(1, 1),
    }, v1)
end

local function MissionQueueLock(a1) -- Line: 181
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), ImageLabel (val), TextLabel (val)
    local v1 = useFontScale(MatchmakingStyle.getFontSize("body", a1.compact))
    local v2 = if not a1.compact then 62 else 54
    return createElement("Frame", {
        Active = true,
        BackgroundTransparency = 0.24,
        BorderSizePixel = 0,
        Selectable = false,
        ZIndex = 130,
        BackgroundColor3 = MatchmakingStyle.colors.overlay,
        Size = UDim2.fromScale(1, 1),
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.card}),
        LockPill = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 131,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = MatchmakingStyle.colors.surface,
            BackgroundTransparency = MatchmakingStyle.transparency.surface,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, if not a1.compact then -40 else -24, 0, v2),
        }, {
            Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
            Stroke = createElement("UIStroke", {
                Color = MatchmakingStyle.colors.borderMuted,
                Thickness = MatchmakingStyle.strokeThickness.thin,
                Transparency = MatchmakingStyle.transparency.border,
            }),
            Lock = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = 137052204118126,
                ZIndex = 132,
                disableSpinner = true,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(13, v2 / 2),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromOffset(28, 28),
            }),
            Reason = createElement(TextLabel, {
                BackgroundTransparency = 1,
                FontWeight = "Bold",
                Text = "Only the party leader can queue.",
                TextScaled = false,
                TextWrapped = true,
                ZIndex = 132,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(50, v2 / 2),
                Size = UDim2.new(1, -64, 0, v2 - 12),
                TextColor3 = MatchmakingStyle.colors.textStrong,
                TextSize = v1,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
        }),
    })
end

local function countCompletedSections(a1) -- Line: 244 -- types: a1: table
    local completedMissions
    local v1 = 0
    for i, j in a1 do
        if 0 < j.totalMissions then
            completedMissions = j.completedMissions
            if j.totalMissions <= completedMissions then
                v1 = v1 + 1
            end
        end
    end
    return v1
end

local function SelectionRail(a1) -- Line: 256
    -- upvalues: useRef (val), useOnScreen (val), useFontScale (val), MatchmakingStyle (val), createElement (val)
    -- upvalues: StoryTile (val), TextLabel (val), u122 (val), MatchmakingDropShadow (val), PanelBackground (val)
    local v1, v2
    local v3 = useRef(nil)
    local v4 = useRef(nil)
    local v5 = useOnScreen({enabled = a1.active, targetRef = v3, viewportRef = a1.viewportRef})
    local v6 = useFontScale(MatchmakingStyle.getFontSize("body", a1.compact))
    local v7 = useFontScale(MatchmakingStyle.getFontSize("header3", a1.compact))
    local v8 = useFontScale(MatchmakingStyle.getFontSize("subheader2", a1.compact))
    local v9 = if not a1.compact then 42 else 36
    local v10 = if not a1.compact then 38 else 32
    local v11 = if not a1.compact then 10 else 6
    local v12 = if not a1.compact then 8 else 6
    local v13 = {
        Layout = createElement("UIListLayout", {
            FillDirection = if not a1.horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
            HorizontalAlignment = if not a1.horizontal then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, v11),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    v13.Padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, v12),
        PaddingLeft = UDim.new(0, v12),
        PaddingRight = UDim.new(0, v12),
        PaddingTop = UDim.new(0, v12),
    })
    local v14 = nil
    local v15 = nil
    for i, j in a1.entries, v14, v15 do
        if not a1.horizontal then
            v2 = if not a1.compact then 82 else 68
            v1 = UDim2.new(1, -4, 0, if not j.condensed then v2 else v2 * 0.5)
        else
            v1 = UDim2.fromOffset(if not a1.compact then 226 else 204, if not a1.compact then 76 else 68)
        end
        v2 = ("Entry_%*"):format(j.id)
        v13[v2] = (createElement(StoryTile, {
            compact = a1.compact,
            condensed = j.condensed,
            image = j.image,
            layoutOrder = i,
            locked = j.locked,
            lockReason = j.lockReason,
            unlocksAt = j.unlocksAt,
            onActivated = function() -- Line: 312 -- upvalues: a1 (val), j (val)
                a1.onActivated(j.id)
            end,
            progressText = j.progressText,
            railOnScreen = v5,
            revealCycle = a1.revealCycle,
            revealKey = j.id,
            revealOrder = i,
            selected = j.selected,
            size = v1,
            subtitle = j.subtitle,
            title = j.title,
            viewportRef = v4,
        }))
    end
    if #a1.entries == 0 then
        v13.Empty = createElement(TextLabel, {
            FontWeight = "SemiBold",
            TextScaled = false,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -24, 0, 50),
            Text = ("No %* available."):format((string.lower(a1.name))),
            TextColor3 = u122,
            TextSize = v6,
        })
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        SelectionGroup = true,
        LayoutOrder = a1.layoutOrder,
        Position = a1.position,
        Size = a1.size,
        ref = v3,
    }, {
        DropShadow = createElement(MatchmakingDropShadow, {zIndex = 0}),
        Background = createElement(PanelBackground, {
            backgroundTransparency = 0.08,
            footerColor = Color3.fromRGB(35, 41, 48),
            footerHeight = v10,
        }),
        Header = createElement(TextLabel, {
            FontWeight = "Black",
            TextScaled = false,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromOffset(14, v9 / 2),
            Size = UDim2.new(1, -28, 0, 24),
            Text = a1.name,
            TextSize = v7,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        Scroll = createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarImageTransparency = 0.2,
            ScrollBarThickness = 5,
            Selectable = true,
            SelectionGroup = true,
            ZIndex = 2,
            AutomaticCanvasSize = if not a1.horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X,
            CanvasSize = UDim2.fromOffset(0, 0),
            ElasticBehavior = Enum.ElasticBehavior.Never,
            Position = UDim2.fromOffset(0, v9),
            ScrollBarImageColor3 = Color3.fromRGB(177, 188, 199),
            ScrollingDirection = if not a1.horizontal then Enum.ScrollingDirection.Y else Enum.ScrollingDirection.X,
            Size = UDim2.new(1, 0, 1, -(v9 + v10 + 2)),
            ref = v4,
        }, v13),
        FooterLabel = createElement(TextLabel, {
            FontWeight = "Bold",
            TextScaled = false,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.new(1, -18, 0, v10),
            Text = a1.footerText,
            TextColor3 = u122,
            TextSize = v8,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
    })
end

local function RewardSection(a1) -- Line: 408
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), StoryModeRewardTile (val)
    -- upvalues: TextLabel (val)
    local v1, v2
    local v3 = useFontScale(MatchmakingStyle.getFontSize("header2", a1.compact))
    local v4 = (if not a1.compact then 26 else 22) + MatchmakingStyle.spacing.small
    local v5 = if not a1.compact then 90 else 82
    local v6 = {
        Layout = createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(MatchmakingStyle.spacing.small, MatchmakingStyle.spacing.small),
            CellSize = UDim2.fromOffset(v5, v5),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 3), PaddingRight = UDim.new(0, 3)}),
    }
    for i, j in a1.entries do
        v1 = ("Reward_%*"):format(j.id)
        v6[v1] = (createElement(StoryModeRewardTile, {compact = a1.compact, entry = j, layoutOrder = i}))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.new(1, 0, 0, v4),
    }, {
        Header = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v2)}, {
            Label = createElement(TextLabel, {
                FontWeight = "Black",
                TextScaled = false,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Text = a1.title,
                TextSize = v3,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
        }),
        Grid = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = UDim2.fromOffset(0, v4),
            Size = UDim2.fromScale(1, 0),
        }, v6),
    })
end

local function DetailStatus(a1) -- Line: 475
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), TextLabel (val), u122 (val)
    return createElement(TextLabel, {
        FontWeight = "SemiBold",
        TextScaled = false,
        TextWrapped = true,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.new(1, 0, 0, 54),
        Text = a1.text,
        TextColor3 = u122,
        TextSize = useFontScale(MatchmakingStyle.getFontSize("bodySmall", a1.compact)),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
end

local function MissionStar(a1) -- Line: 495
    -- upvalues: ReactFlow (val), useRef (val), useEffect (val), createElement (val), ImageLabel (val), text (val)
    -- upvalues: u139 (val), Tooltip (val)
    local index = a1.index
    local revealKey = a1.revealKey
    local visible = a1.visible
    local v1, u8, u9 = ReactFlow.useSpring({damper = 0.6, speed = 22, start = 0, target = 0})
    local u12 = useRef(nil)
    local v2 = {index, revealKey, visible}
    useEffect(function() -- Line: 514 -- upvalues: u9 (val), visible (val), u12 (val), revealKey (val), u8 (val), index (val)
        u9()
        if not visible then
            return
        end
        if u12.current == revealKey then
            u8({start = 1, target = 1}, true)
            return
        end
        u12.current = revealKey
        u8({start = 0, target = 0}, true)
        local u22 = task.delay((index - 1) * 0.07 + 0.22, function() -- Line: 535 -- upvalues: u8 (upval)
            u8({force = 125, target = 1})
        end)
        return function() -- Line: 542 -- upvalues: u22 (val), u9 (upval)
            task.cancel(u22)
            u9()
        end
    end, v2)
    return createElement("Frame", {
        Active = true,
        BackgroundTransparency = 1,
        Transparency = 1,
        ZIndex = 4,
        LayoutOrder = index,
        Size = UDim2.fromOffset(a1.size, a1.size),
    }, {
        Star = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = 17368097932,
            ZIndex = 4,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageColor3 = if not a1.earned then u139 else text,
            Position = v1:map(function(a1) -- Line: 561
                return UDim2.new(0.5, 0, 0.5, (math.round(10 * (1 - a1))))
            end),
            ScaleType = Enum.ScaleType.Fit,
            Size = v1:map(function(a1) -- Line: 565
                local v1 = 0.82 + 0.18 * a1
                return UDim2.fromScale(v1, v1)
            end),
        }),
        Tooltip = createElement(Tooltip, {
            Disabled = not visible,
            Header = ("Star %* Requirement"):format(index),
            Name = ("StoryMissionStar:%*:%*"):format(revealKey, index),
            Subject = a1.requirement,
        }),
    })
end

local function MissionStarRating(a1) -- Line: 581
    -- upvalues: createElement (val), MissionStar (val)
    local v1, v2
    if a1.maxStars <= 0 then
        return nil
    end
    local v3 = if not a1.compact then 3 else 2
    local v4 = a1.maxStars * (if not a1.compact then 38 else 30) + math.max(a1.maxStars - 1, 0) * v3
    local v5 = math.clamp(math.floor(a1.stars), 0, a1.maxStars)
    local v6 = {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = UDim.new(0, v3),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local maxStars_2 = a1.maxStars
    for i = 1, maxStars_2 do
        v2 = ("Star_%*"):format(i)
        v6[v2] = (createElement(MissionStar, {
            earned = i <= v5,
            index = i,
            requirement = v7.starRequirements[i] or "Requirement unavailable.",
            revealKey = v7.revealKey,
            size = v1,
            visible = v7.visible,
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 4,
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -18, 1, -14),
        Size = UDim2.fromOffset(v4, v1),
    }, v6)
end

local function StoryEntryDetail(a1) -- Line: 627
    -- upvalues: useAtom (val), ClientAtoms (val), useRef (val), useState (val), useFontScale (val)
    -- upvalues: MatchmakingStyle (val), useOnScreen (val), ReactFlow (val), useEffect (val), createElement (val)
    -- upvalues: MatchmakingDropShadow (val), PanelBackground (val), TextLabel (val), u122 (val), MissionQueueLock (val)
    -- upvalues: DetailStatus (val), RewardSection (val), SuggestedTower (val), u107 (val), ImageLabel (val)
    -- upvalues: TextMarquee (val), u127 (val), u132 (val), MissionStarRating (val), ActionButton (val)
    local u75, u76
    local u6 = useAtom(ClientAtoms.elevatorAtom) ~= nil
    local v1 = useRef(nil)
    local u12 = useRef(false)
    local u15 = useRef(false)
    local v2, u19 = useState(false)
    local v3 = useFontScale(MatchmakingStyle.getFontSize("header3", a1.compact))
    local v4 = useFontScale(MatchmakingStyle.getFontSize("header1", a1.compact))
    local v5 = useFontScale(MatchmakingStyle.getFontSize("subheader1", a1.compact))
    useFontScale(MatchmakingStyle.getFontSize("header2", a1.compact))
    local v6 = useFontScale(MatchmakingStyle.getFontSize("button", a1.compact))
    local v7 = {}
    local active_2 = a1.active
    if active_2 then
        active_2 = false
        if a1.entry ~= nil then
            active_2 = a1.section ~= nil
        end
    end
    v7.enabled = active_2
    v7.targetRef = v1
    v7.viewportRef = a1.viewportRef
    local v8 = useOnScreen(v7)
    v7, u75, u76 = ReactFlow.useSpring({damper = 0.6, speed = 22, start = 0, target = 0})
    local v9, u81, u82 = ReactFlow.useSpring({damper = 0.6, speed = 22, start = 0, target = 0})
    local id = if not a1.entry then "" else a1.entry.id
    local active = a1.active
    if active then
        active = v8
        if active then
            active = id ~= ""
        end
    end
    local u101 = ("%*:%*"):format(a1.revealCycle, id)
    local u104 = useRef(nil)
    useEffect(function() -- Line: 686 -- upvalues: u15 (val)
        u15.current = true
        return function() -- Line: 689 -- upvalues: u15 (upval)
            u15.current = false
        end
    end, {})
    local v10 = {u101, active}
    useEffect(function() -- Line: 694 -- upvalues: u76 (val), u82 (val), active (val), u104 (val), u101 (val), u75 (val), u81 (val)
        u76()
        u82()
        if not active then
            return
        end
        if u104.current == u101 then
            u75({start = 1, target = 1}, true)
            u81({start = 1, target = 1}, true)
            return
        end
        u104.current = u101
        u75({start = 0, target = 0}, true)
        u81({start = 0, target = 0}, true)
        local u28 = task.defer(function() -- Line: 724 -- upvalues: u75 (upval)
            u75({force = 125, target = 1})
        end)
        local u32 = task.delay(0.1, function() -- Line: 730 -- upvalues: u81 (upval)
            u81({force = 125, target = 1})
        end)
        return function() -- Line: 737 -- upvalues: u28 (val), u32 (val), u76 (upval), u82 (upval)
            task.cancel(u28)
            task.cancel(u32)
            u76()
            u82()
        end
    end, v10)
    if a1.entry and a1.section then
        local v11
        local entry = a1.entry
        local section = a1.section
        v10 = if entry.kind ~= "Mission" then nil else entry
        local u137 = if entry.kind ~= "Cutscene" then nil else entry
        local locked = entry.locked
        if not locked then
            locked = not a1.isPartyLeader
            if not locked then
                locked = false
                if u137 ~= nil then
                    locked = v2 or u6
                end
            end
        end

        local function onPlayActivated() -- Line: 787
            -- upvalues: u137 (val), a1 (val), u6 (val), u12 (val), u19 (val), u15 (val)
            if not u137 then
                a1.onPlayActivated()
                return
            end
            if not u6 and not u12.current then
                u12.current = true
                u19(true)
                a1.onCutsceneActivated(u137.chapterNumber, u137.cutsceneNumber, function() -- Line: 799 -- upvalues: u12 (upval), u15 (upval), u19 (upval)
                    u12.current = false
                    if u15.current then
                        u19(false)
                    end
                end)
                return
            end
        end

        local rewards = if not v10 then {} else a1.rewards
        local v12 = {}
        local v13 = {}
        for i, j in rewards do
            if not j.guaranteed then
                table.insert(v13, j)
            else
                table.insert(v12, j)
            end
        end
        local v14 = (if not a1.compact then 230 else 100) + 14 + MatchmakingStyle.spacing.medium
        local v15 = if not a1.compact then 14 else 10
        local v16 = if not v10 then nil else if not v10.suggestedTowers then nil else v10.suggestedTowers[1]
        local v17 = if not a1.compact then UDim2.fromOffset(278, 150) else UDim2.fromOffset(220, 118)
        local v18 = {
            Layout = createElement("UIListLayout", {
                Padding = UDim.new(0, MatchmakingStyle.spacing.medium),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }
        v18.Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 24), PaddingRight = UDim.new(0, 24)})
        if not v10 then
            if not v10 then
                if v10 then
                    if #v12 > 0 then
                        v18.GuaranteedRewards = createElement(RewardSection, {
                            layoutOrder = 2,
                            title = "Guaranteed Rewards",
                            compact = a1.compact,
                            entries = v12,
                        })
                    end
                    if #v13 > 0 then
                        v18.PotentialRewards = createElement(RewardSection, {
                            layoutOrder = 3,
                            title = "Potential Rewards",
                            compact = a1.compact,
                            entries = v13,
                        })
                    end
                    if #v12 == 0 and #v13 == 0 then
                        v18.RewardsStatus = createElement(DetailStatus, {
                            layoutOrder = 2,
                            text = "No mission rewards are available.",
                            compact = a1.compact,
                        })
                    end
                end
            elseif a1.rewardsFailed then
                v18.RewardsStatus = createElement(DetailStatus, {
                    layoutOrder = 2,
                    text = "Mission rewards are unavailable.",
                    compact = a1.compact,
                })
            elseif v10 then
                if #v12 > 0 then
                    v18.GuaranteedRewards = createElement(RewardSection, {
                        layoutOrder = 2,
                        title = "Guaranteed Rewards",
                        compact = a1.compact,
                        entries = v12,
                    })
                end
                if #v13 > 0 then
                    v18.PotentialRewards = createElement(RewardSection, {
                        layoutOrder = 3,
                        title = "Potential Rewards",
                        compact = a1.compact,
                        entries = v13,
                    })
                end
                if #v12 == 0 and #v13 == 0 then
                    v18.RewardsStatus = createElement(DetailStatus, {
                        layoutOrder = 2,
                        text = "No mission rewards are available.",
                        compact = a1.compact,
                    })
                end
            end
        elseif a1.rewardsLoading then
            v18.RewardsStatus = createElement(DetailStatus, {layoutOrder = 2, text = "Loading mission rewards...", compact = a1.compact})
        elseif not v10 then
            if v10 then
                if #v12 > 0 then
                    v18.GuaranteedRewards = createElement(RewardSection, {
                        layoutOrder = 2,
                        title = "Guaranteed Rewards",
                        compact = a1.compact,
                        entries = v12,
                    })
                end
                if #v13 > 0 then
                    v18.PotentialRewards = createElement(RewardSection, {
                        layoutOrder = 3,
                        title = "Potential Rewards",
                        compact = a1.compact,
                        entries = v13,
                    })
                end
                if #v12 == 0 and #v13 == 0 then
                    v18.RewardsStatus = createElement(DetailStatus, {
                        layoutOrder = 2,
                        text = "No mission rewards are available.",
                        compact = a1.compact,
                    })
                end
            end
        elseif a1.rewardsFailed then
            v18.RewardsStatus = createElement(DetailStatus, {layoutOrder = 2, text = "Mission rewards are unavailable.", compact = a1.compact})
        elseif v10 then
            if #v12 > 0 then
                v18.GuaranteedRewards = createElement(RewardSection, {
                    layoutOrder = 2,
                    title = "Guaranteed Rewards",
                    compact = a1.compact,
                    entries = v12,
                })
            end
            if #v13 > 0 then
                v18.PotentialRewards = createElement(RewardSection, {
                    layoutOrder = 3,
                    title = "Potential Rewards",
                    compact = a1.compact,
                    entries = v13,
                })
            end
            if #v12 == 0 and #v13 == 0 then
                v18.RewardsStatus = createElement(DetailStatus, {
                    layoutOrder = 2,
                    text = "No mission rewards are available.",
                    compact = a1.compact,
                })
            end
        end
        if v16 then
            v18.SuggestedTower = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, v17.Y.Offset),
            }, {
                Card = createElement(SuggestedTower, {
                    anchorPoint = Vector2.new(0, 0.5),
                    actionColor = a1.getSuggestedTowerActionColor(v16),
                    actionDisabled = a1.isSuggestedTowerActionDisabled(v16),
                    actionText = a1.getSuggestedTowerActionText(v16),
                    onView = a1.onSuggestedTowerView,
                    position = UDim2.fromScale(0, 0.5),
                    size = v17,
                    tower = v16,
                }),
            })
        end
        return createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = false,
            Position = a1.position,
            Size = a1.size,
            ref = v1,
        }, {
            DropShadow = createElement(MatchmakingDropShadow, {zIndex = 0}),
            Background = createElement(PanelBackground, {
                backgroundTransparency = 0.04,
                footerHeight = 72,
                footerColor = Color3.fromRGB(18, 22, 27),
            }),
            MissionBanner = createElement("Frame", {
                BorderSizePixel = 0,
                ClipsDescendants = true,
                ZIndex = 2,
                BackgroundColor3 = u107,
                Position = UDim2.fromOffset(14, 14),
                Size = UDim2.new(1, -28, 0, v11),
            }, {
                Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
                ChapterImage = createElement(ImageLabel, {
                    BackgroundTransparency = 1,
                    ZIndex = 1,
                    BackgroundColor3 = u107,
                    Image = section.image,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(0.58, 1),
                }, {
                    Blend = createElement("UIGradient", {
                        Rotation = 6,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.62, 0),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
                MapImage = createElement(ImageLabel, {
                    BackgroundTransparency = 1,
                    ZIndex = 1,
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundColor3 = u107,
                    Image = entry.mapImage,
                    Position = UDim2.fromScale(1, 0),
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(0.58, 1),
                }, {
                    Blend = createElement("UIGradient", {
                        Rotation = 6,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.38, 0),
                            (NumberSequenceKeypoint.new(1, 0)),
                        }),
                    }),
                }),
                Shade = createElement("Frame", {
                    BackgroundTransparency = 0.15,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    BackgroundColor3 = Color3.new(0, 0, 0),
                    Size = UDim2.fromScale(1, 1),
                }, {
                    Gradient = createElement("UIGradient", {
                        Rotation = 90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0.12),
                            NumberSequenceKeypoint.new(0.55, 0.65),
                            (NumberSequenceKeypoint.new(1, 0.08)),
                        }),
                    }),
                }),
                Title = createElement(TextMarquee, {
                    alwaysMarquee = true,
                    BackgroundTransparency = 1,
                    TextScaled = false,
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(0, 1),
                    FontFace = u127,
                    Position = v7:map(function(a1) -- Line: 986
                        return UDim2.new(0, 18, 1, math.round(10 * (1 - a1)) + -42)
                    end),
                    Size = UDim2.new(0.58, -18, 0, 42),
                    Text = entry.title,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = v4,
                    TextTransparency = v7:map(function(a1) -- Line: 999
                        return 1 - math.clamp(a1, 0, 1)
                    end),
                    TextXAlignment = Enum.TextXAlignment.Left,
                }, {
                    Stroke = createElement("UIStroke", {
                        LineJoinMode = Enum.LineJoinMode.Bevel,
                        Thickness = MatchmakingStyle.strokeThickness.thick,
                        Transparency = v7:map(function(a1) -- Line: 1008
                            return 1 - math.clamp(a1, 0, 1)
                        end),
                    }),
                }),
                Subtitle = createElement(TextMarquee, {
                    alwaysMarquee = true,
                    BackgroundTransparency = 1,
                    TextScaled = false,
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(0, 1),
                    FontFace = u132,
                    Position = v9:map(function(a1) -- Line: 1018
                        return UDim2.new(0, 18, 1, math.round(10 * (1 - a1)) + -12)
                    end),
                    Size = UDim2.new(0.58, -18, 0, 28),
                    Text = ("%* · %*"):format(section.title, entry.subtitle),
                    TextColor3 = u122,
                    TextSize = v5,
                    TextTransparency = v9:map(function(a1) -- Line: 1031
                        return 1 - math.clamp(a1, 0, 1)
                    end),
                    TextXAlignment = Enum.TextXAlignment.Left,
                }, {
                    Stroke = createElement("UIStroke", {
                        LineJoinMode = Enum.LineJoinMode.Bevel,
                        Thickness = MatchmakingStyle.strokeThickness.regular,
                        Transparency = v9:map(function(a1) -- Line: 1040
                            return 1 - math.clamp(a1, 0, 1)
                        end),
                    }),
                }),
                Stars = v10 and v10.starRequirements and createElement(MissionStarRating, {
                    compact = a1.compact,
                    maxStars = a1.maxStars,
                    revealKey = u101,
                    starRequirements = v10.starRequirements,
                    stars = v10.stars or 0,
                    visible = active,
                }),
            }),
            Content = createElement("ScrollingFrame", {
                Active = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScrollBarThickness = 5,
                Selectable = true,
                SelectionGroup = true,
                ZIndex = 2,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.fromOffset(0, 0),
                ElasticBehavior = Enum.ElasticBehavior.Never,
                Position = UDim2.fromOffset(v15, v14),
                ScrollBarImageColor3 = Color3.fromRGB(177, 188, 199),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Size = UDim2.new(1, -v15 * 2, 1, -(72 + v14)),
            }, v18),
            Play = createElement(ActionButton, {
                TextSizeIsScaled = true,
                ZIndex = 2,
                AnchorPoint = Vector2.new(1, 0.5),
                Disabled = locked,
                Label = if not u137 then "Play Level" else "Play Cutscene",
                OnActivated = function() -- Line: 1091 -- upvalues: a1 (val), onPlayActivated (val)
                    if a1.onActivated then
                        a1.onActivated()
                    end
                    onPlayActivated()
                end,
                Position = UDim2.new(1, -14, 1, -36),
                Size = UDim2.new(0.38, 0, 0, 44),
                TextSize = v6,
            }),
            PartyLeaderQueueLock = if a1.isPartyLeader then nil else createElement(MissionQueueLock, {compact = a1.compact}),
        })
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = a1.position,
        Size = a1.size,
        ref = v1,
    }, {
        DropShadow = createElement(MatchmakingDropShadow, {zIndex = 0}),
        Background = createElement(PanelBackground, {backgroundTransparency = 0.08}),
        Empty = createElement(TextLabel, {
            FontWeight = "Bold",
            Text = "Select an unlocked mission or cutscene to continue.",
            TextScaled = false,
            TextWrapped = true,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -40, 0, 70),
            TextColor3 = u122,
            TextSize = v3,
        }),
        PartyLeaderQueueLock = if a1.isPartyLeader then nil else createElement(MissionQueueLock, {compact = a1.compact}),
    })
end

return memo(function(a1) -- Line: 1111
    -- upvalues: MatchmakingModel (val), useState (val), useEffect (val), createElement (val), SelectionRail (val)
    -- upvalues: StoryEntryDetail (val)
    local completedMissions_3, v1, v2, v3
    local v4 = a1.active ~= false
    local v5 = a1.compact == true
    local v6 = a1.isPartyLeader ~= false
    local v7 = math.max(math.floor(a1.maxStars or 3), 0)
    local v8 = a1.revealCycle or 0
    local v9, v10 = MatchmakingModel.resolveStoryEntrySelection(a1.sections, a1.selectedSectionId, a1.selectedEntryId)
    local v11 = if not v10 then nil else if v10.kind ~= "Mission" then nil else v10
    local v12, u35 = useState(nil)
    local u43 = if not v11 then nil else ("%*:%*"):format(v11.chapterNumber, v11.missionNumber)
    local chapterNumber = if not v11 then nil else v11.chapterNumber
    local missionNumber = if not v11 then nil else v11.missionNumber
    local v13 = useEffect
    local v14 = {a1.loadMissionRewards, chapterNumber, missionNumber, u43}
    v13(function() -- Line: 1132 -- upvalues: a1 (val), u43 (val), chapterNumber (val), missionNumber (val), u35 (val)
        local loadMissionRewards = a1.loadMissionRewards
        if loadMissionRewards and u43 and chapterNumber and missionNumber then
            local u5 = false
            local u8 = task.spawn(function() -- Line: 1144
                -- upvalues: loadMissionRewards (val), chapterNumber (upval), missionNumber (upval), u5 (ref)
                -- upvalues: u43 (upval), u35 (upval)
                local success, result = pcall(loadMissionRewards, chapterNumber, missionNumber)
                if u5 then
                    return
                end
                if success then
                    u35({failed = false, key = u43, rewards = result})
                    return
                end
                local v1 = u43
                warn((("[NewMatchmaking] Failed to load Story Mode rewards for %*: %*"):format(v1, result)))
                u35({failed = true, key = u43, rewards = {}})
            end)
            return function() -- Line: 1170 -- upvalues: u5 (ref), u8 (val)
                u5 = true
                if coroutine.status(u8) ~= "dead" then
                    task.cancel(u8)
                end
            end
        end
    end, v14)
    local rewards = if not v11 then {} else v11.rewards
    local failed = false
    v14 = false
    if not u43 or not v12 then
        if u43 and a1.loadMissionRewards then
            v14 = #rewards == 0
        end
    elseif v12.key == u43 then
        rewards = v12.rewards
        failed = v12.failed
    elseif u43 and a1.loadMissionRewards then
        v14 = #rewards == 0
    end
    local v15 = {}
    local v16 = nil
    local v17 = nil
    for i, j in a1.sections, v16, v17 do
        v2 = {
            subtitle = "Missions cleared",
            id = j.id,
            image = j.image,
            locked = j.locked,
            lockReason = j.lockReason,
            progressText = ("%*/%*"):format(j.completedMissions, j.totalMissions),
        }
        v3 = false
        if v9 ~= nil then
            v3 = v9.id == j.id
        end
        v2.selected = v3
        v2.title = j.title
        table.insert(v15, v2)
    end
    local v18 = {}
    if v9 then
        local v19
        v17 = nil
        local v20 = nil
        for k, n in v9.entries, v17, v20 do
            v3 = {
                condensed = n.kind == "Cutscene",
                id = n.id,
                image = n.mapImage,
                locked = n.locked,
                lockReason = n.lockReason,
                unlocksAt = if n.kind ~= "Mission" then nil else n.unlocksAt,
            }
            v19 = false
            if v10 ~= nil then
                v19 = v10.id == n.id
            end
            v3.selected = v19
            v3.subtitle = if n.kind ~= "Mission" then nil else n.mapDisplayName
            v3.title = n.title
            table.insert(v18, v3)
        end
    end
    v16 = 0
    for m, i5 in a1.sections do
        if 0 < i5.totalMissions then
            completedMissions_3 = i5.completedMissions
            if i5.totalMissions <= completedMissions_3 then
                v16 = v16 + 1
            end
        end
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Size = UDim2.fromScale(1, 1),
    }, {
        Sections = createElement(SelectionRail, {
            horizontal = false,
            name = "Chapters",
            active = v4,
            compact = v5,
            entries = v15,
            footerText = if not v5 then ("Chapters completed  %*/%*"):format(v16, #a1.sections) else ("Completed %*/%*"):format(v16, #a1.sections),
            onActivated = function(a1_2) -- Line: 1268 -- upvalues: a1 (val)
                if a1.onActivated then
                    a1.onActivated()
                end
                a1.onSectionActivated(a1_2)
            end,
            position = UDim2.fromScale(0, 0),
            revealCycle = v8,
            size = UDim2.fromScale(if not v5 then 0.225 else 0.2, 1),
            viewportRef = a1.viewportRef,
        }),
        Missions = createElement(SelectionRail, {
            horizontal = false,
            name = "Missions",
            active = v4,
            compact = v5,
            entries = v18,
            footerText = if not v9 then if not v5 then "Missions completed  0/0" else "Completed  0/0" else if not v5 then ("Missions completed  %*/%*"):format(v9.completedMissions, v9.totalMissions) else ("Completed %*/%*"):format(v9.completedMissions, v9.totalMissions),
            onActivated = function(a1_2) -- Line: 1286 -- upvalues: a1 (val)
                if a1.onActivated then
                    a1.onActivated()
                end
                a1.onEntryActivated(a1_2)
            end,
            position = UDim2.fromScale(if not v5 then 0.235 else 0.21, 0),
            revealCycle = v8,
            size = UDim2.fromScale(v1, 1),
            viewportRef = a1.viewportRef,
        }),
        Detail = createElement(StoryEntryDetail, {
            active = v4,
            compact = v5,
            getSuggestedTowerActionColor = a1.getSuggestedTowerActionColor or function(a1) -- Line: 1243 -- types: a1: string
                return Color3.fromRGB(80, 255, 86)
            end,
            getSuggestedTowerActionText = a1.getSuggestedTowerActionText or function(a1) -- Line: 1247 -- types: a1: string
                return "View"
            end,
            isSuggestedTowerActionDisabled = a1.isSuggestedTowerActionDisabled or function(a1) -- Line: 1251 -- types: a1: string
                return false
            end,
            isPartyLeader = v6,
            entry = v10,
            maxStars = v7,
            onCutsceneActivated = a1.onCutsceneActivated,
            onActivated = a1.onActivated,
            onPlayActivated = a1.onPlayActivated,
            onSuggestedTowerView = a1.onSuggestedTowerView or function(a1) -- Line: 1241 -- types: a1: string
                return
            end,
            position = UDim2.fromScale(if not v5 then 0.47 else 0.42, 0),
            rewards = rewards,
            rewardsFailed = failed,
            rewardsLoading = v14,
            revealCycle = v8,
            section = v9,
            size = UDim2.fromScale(if not v5 then 0.53 else 0.58, 1),
            viewportRef = a1.viewportRef,
        }),
    })
end)