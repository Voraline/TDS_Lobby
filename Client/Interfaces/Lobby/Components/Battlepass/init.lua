-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
-- Decompile time: 19.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Seasons = require(ReplicatedStorage.Shared.Data.Seasons)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local BattlepassButton = require(script.BattlepassButton)
local IconButton = require(Components.IconButton)
local BattlepassItem = require(script.BattlepassItem)
local BattlepassProgress = require(script.BattlepassProgress)
local BattlepassTrack = require(script.BattlepassTrack)
local BattlepassTrackIcon = require(script.BattlepassTrackIcon)
local BattlepassWindow = require(script.BattlepassWindow)
local useCache = require(Hooks.useCache)
local useCountdown = require(Hooks.useCountdown)
local usePersist = require(Hooks.usePersist)
local useReactBindings = require(Hooks.useReactBindings)
local useSound = require(Hooks.useSound)
local useMemo = React.useMemo
local useState = React.useState
local useEffect = React.useEffect
local joinBindings = React.joinBindings
local createElement = React.createElement
local memo = React.memo
local Tween = ReactFlow.Tween
local Spring = ReactFlow.Spring
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation

local function withSound(a1, a2) -- Line: 48 -- types: a2: function?
    return function() -- Line: 49 -- upvalues: a1 (val), a2 (val)
        a1()
        if a2 then
            a2()
        end
    end
end

local function withSeasonRecord(a1) -- Line: 60
    -- upvalues: memo (val), useCache (val), useMemo (val), createElement (val), table (val)
    return memo(function(a1_2) -- Line: 61
        -- upvalues: useCache (upval), useMemo (upval), createElement (upval), a1 (val), table (upval)
        local u2 = a1_2.name or ""
        local data = a1_2.data
        if not data then
            data = useCache("Seasons", {})
        end
        local v1 = {data, u2}
        local v2 = useMemo(function() -- Line: 65 -- upvalues: data (val), u2 (val)
            return data[u2]
        end, v1)
        if not v2 then
            return
        end
        return createElement(a1, table.merge({}, a1_2, {record = v2, premium = if not v2 then false else v2.battlepass}))
    end)
end

local function formatTimer(a1) -- Line: 84 -- types: a1: number
    local v1 = math.floor(a1 / 604800)
    local v2 = math.floor(a1 % 604800 / 86400)
    local v3 = math.floor(a1 % 86400 / 3600)
    local v4 = math.floor(a1 % 3600 / 60)
    local v5 = math.floor(a1 % 60)
    if v1 > 0 then
        return string.format("%d weeks, %d days", v1, v2)
    end
    if v2 > 0 then
        return string.format("%d days, %d hours", v2, v3)
    end
    if v3 > 0 then
        return string.format("%d hours, %d mins", v3, v4)
    end
    if v4 > 0 then
        return string.format("%d mins, %d secs", v4, v5)
    end
    return string.format("%d secs", v5)
end

local u90 = memo(function(a1) -- Line: 107 -- upvalues: createElement (val), BattlepassTrackIcon (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0157, 0.657),
        Size = UDim2.fromScale(0.165, 0.451),
    }, {
        regular = createElement(BattlepassTrackIcon, {
            text = "Regular",
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(1, 0.483),
            Transparency = a1.Transparency,
            icon = a1.regularIcon or "Blue",
            clicked = a1.regularClicked,
        }),
        premium = createElement(BattlepassTrackIcon, {
            text = "Premium",
            stars = true,
            Position = UDim2.fromScale(0, 0.53),
            Size = UDim2.fromScale(1, 0.483),
            Transparency = a1.Transparency,
            icon = a1.premiumIcon or "Golden",
            clicked = a1.premiumClicked,
        }),
    })
end)
return withSeasonRecord((memo(function(a1) -- Line: 140
    -- upvalues: useSound (val), useState (val), useSpring (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Tween (val), Spring (val), useMemo (val), Seasons (val), usePersist (val), useEffect (val), table (val)
    -- upvalues: useCountdown (val), joinBindings (val), formatTimer (val), useTween (val), useReactBindings (val)
    -- upvalues: createElement (val), BattlepassWindow (val), IconButton (val), BattlepassButton (val)
    -- upvalues: BattlepassProgress (val), u90 (val), BattlepassTrack (val), BattlepassItem (val)
    local name = a1.name
    local record = a1.record
    local u5 = a1.Visible ~= false
    local Click = useSound("Click")
    local v1, u12 = useState(nil)
    local v2, u16 = useState(false)
    local v3, u20 = useState(0)
    local v4, u24 = useState(0)
    local v5, u36 = useSpring({
        damper = 0.5,
        speed = 30,
        start = UDim2.fromScale(0, 0),
        target = UDim2.fromScale(0, 0),
    })
    local v6, u48 = useSpring({
        damper = 0.5,
        speed = 15,
        start = UDim2.fromScale(0.0734, 0.162),
        target = UDim2.fromScale(0.0734, 0.162),
    })
    local v7, u89 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.15)}),
            position = Spring({speed = 20, damper = 0.5, target = UDim2.fromScale(0.5, 0.5)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
            position = Spring({speed = 20, damper = 0.5, target = UDim2.fromScale(0.5, 0.65)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.65)})
    local v8 = {name}
    local u95 = useMemo(function() -- Line: 183 -- upvalues: Seasons (upval), name (val), u20 (val), u24 (val)
        local v1 = Seasons.Seasons[name]
        u20(v1 and v1.startsAt and v1.startsAt.UnixTimestamp or 0)
        u24(v1 and v1.endsAt and v1.endsAt.UnixTimestamp or 0)
        return v1
    end, v8)
    local u107, u108 = usePersist({"battlepass-xp", name}, record and record.experience or 0)
    local v9 = {u5}
    useEffect(function() -- Line: 196 -- upvalues: u5 (val), u108 (val)
        if u5 then
            u108()
        end
    end, v9)
    local u121, u122 = useState(function() -- Line: 202 -- upvalues: u95 (val), u107 (val)
        local v1 = 0
        for i, j in u95.tiers do
            if j.experience <= u107 then
                v1 = i
            end
        end
        return v1
    end)
    local v10 = {u95}
    local u127 = useMemo(function() -- Line: 214 -- upvalues: u95 (val)
        local v1 = 0
        for i, j in u95.tiers do
            v1 = math.max(v1, j.experience)
        end
        return v1
    end, v10)
    local v11 = {u121, u95}
    local u133 = useMemo(function() -- Line: 224 -- upvalues: u95 (val), u121 (val)
        if not u95 then
            return {}
        end
        local v1 = math.min(u121 + 1, #u95.tiers)
        local v2 = u95.tiers[u121]
        local v3 = u95.tiers[v1]
        if v2 == v3 then
            v2 = u95.tiers[u121 - 1]
        end
        return {tier = v2, nextTier = v3}
    end, v11)
    local v12 = {u107, u133}
    local u139 = useMemo(function() -- Line: 244 -- upvalues: u133 (val)
        local nextTier = u133.nextTier
        local tier = u133.tier
        local experience = tier and tier.experience or 0
        local experience_2 = nextTier and nextTier.experience or 0
        local v1 = {min = experience}
        v1.max = nextTier and experience_2 - experience or experience
        return v1
    end, v12)
    local v13 = {u95}
    v11 = useMemo(function() -- Line: 257 -- upvalues: u95 (val), table (upval), Click (val), u12 (val)
        local insert, v1, v2
        local v3 = {}
        local v4 = nil
        if not u95 then
            return v3
        end
        local v5 = nil
        local v6 = nil
        for i, j in u95.tiers, v5, v6 do
            local u90 = nil
            local u91 = nil
            for k, n in j.rewards do
                if not n.premium then
                    u91 = n
                else
                    u90 = n
                end
            end
            if not v4 then
                if u91 or u90 then
                    v4 = u91 or u90
                end
            end
            insert = table.insert
            v1 = {level = i}
            v2 = u91
            if v2 then
                v2 = {data = u91}
                local u50 = Click

                local function u51() -- Line: 285 -- upvalues: u12 (upval), u91 (ref)
                    u12(u91)
                end

                function v2.clicked() -- Line: 49 -- upvalues: u50 (val), u51 (val)
                    u50()
                    if u51 then
                        u51()
                    end
                end
            end
            v1.regular = v2
            v2 = u90
            if v2 then
                v2 = {data = u90}
                local u59 = Click

                local function u60() -- Line: 292 -- upvalues: u12 (upval), u90 (ref)
                    u12(u90)
                end

                function v2.clicked() -- Line: 49 -- upvalues: u59 (val), u60 (val)
                    u59()
                    if u60 then
                        u60()
                    end
                end
            end
            v1.premium = v2
            insert(v3, v1)
        end
        u12(v4)
        return v3
    end, v13)
    local v14 = (joinBindings({useCountdown(v3), (useCountdown(v4))})):map(function(a1) -- Line: 307 -- upvalues: formatTimer (upval)
        local v1, v2 = unpack(a1)
        if v1 > 0 then
            return (("Starts in %*"):format((formatTimer(v1))))
        end
        if v2 > 0 then
            return (("Ends in %*"):format((formatTimer(v2))))
        end
        return "Battlepass has ended!"
    end)
    local u174, u175 = useTween({
        info = TweenInfo.new(0, Enum.EasingStyle.Sine),
        start = u107,
        target = u107,
    })
    local v15 = {v1}
    useEffect(function() -- Line: 327 -- upvalues: u36 (val)
        u36({force = UDim2.fromScale(0, 5)})
    end, v15)
    v15 = {v14}
    useReactBindings(function() -- Line: 331 -- upvalues: u48 (val)
        u48({force = UDim2.fromScale(0, -0.5)})
    end, v15, {})
    v15 = {u174}
    local v16 = {u95}
    useReactBindings(function(a1) -- Line: 336 -- upvalues: u95 (val), u122 (val)
        local v1 = 0
        for i, j in u95.tiers do
            if j.experience <= a1 then
                v1 = i
            end
        end
        u122(v1)
    end, v15, v16)
    v15 = {record, u107}
    useEffect(function() -- Line: 349 -- upvalues: record (val), u107 (val), u174 (val), u127 (val), u175 (val), u16 (val)
        if not record then
            return
        end
        local v1 = u107
        local v2 = u174:getValue()
        v1 = math.min(u127, v1)
        v2 = math.min(u127, v2)
        if v1 < v2 then
            u175({target = v1, info = TweenInfo.new(0)})
            return
        end
        if v1 == v2 then
            return
        end
        local u31 = math.min(1, (math.max(0.2, (math.abs(v1 - v2)) * 0.005)))
        u175({target = v1, info = TweenInfo.new(u31, Enum.EasingStyle.Sine)})
        u16(true)
        local u42 = nil
        u42 = task.spawn(function() -- Line: 378 -- upvalues: u31 (val), u16 (upval), u42 (ref)
            task.wait(u31)
            u16(false)
            u42 = nil
        end)
        return function() -- Line: 384 -- upvalues: u42 (ref)
            if u42 then
                task.cancel(u42)
            end
        end
    end, v15)
    v15 = {u5}
    useEffect(function() -- Line: 395 -- upvalues: u89 (val), u5 (val)
        u89(if not u5 then "disable" else "enable")
    end, v15)
    v15 = {
        title = u95.name,
        subTitle = v14,
        subTitlePosition = v6,
        render = u95.cover,
        Transparency = v7.transparency,
        Position = v7.position,
        Visible = v7.transparency:map(function(a1) -- Line: 406
            return a1 < 1
        end),
    }
    v16 = {}
    local v17 = createElement
    local v18 = IconButton
    local v19 = {
        AnchorPoint = Vector2.new(1, 0),
        Size = UDim2.fromScale(0.044, 0.069),
        Position = UDim2.fromScale(0.982, 0.035),
        Color = Color3.fromRGB(255, 60, 60),
        Transparency = v7.transparency,
    }
    local close = a1.close

    function v19.Clicked() -- Line: 49 -- upvalues: Click (val), close (val)
        Click()
        if close then
            close()
        end
    end

    v16.close = v17(v18, v19)
    v17 = createElement
    v18 = BattlepassButton
    v19 = {
        text = "Gift Pass",
        icon = 78029059209884,
        background = 136115219080104,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.18, 0.07),
        Position = UDim2.fromScale(0.099, 0.941),
        transparency = v7.transparency,
    }
    local gift = a1.gift

    function v19.clicked() -- Line: 49 -- upvalues: Click (val), gift (val)
        Click()
        if gift then
            gift()
        end
    end

    v16.gift = v17(v18, v19)
    v17 = createElement
    v18 = BattlepassButton
    v19 = {
        text = "Skip Level",
        Size = UDim2.fromScale(0.111, 0.082),
        Position = UDim2.fromScale(0.808, 0.364),
        transparency = v7.transparency,
    }
    local skip = a1.skip

    function v19.clicked() -- Line: 49 -- upvalues: Click (val), skip (val)
        Click()
        if skip then
            skip()
        end
    end

    v16.skip = v17(v18, v19)
    v17 = createElement
    v18 = BattlepassButton
    v19 = {
        text = "Skip All",
        Size = UDim2.fromScale(0.111, 0.082),
        Position = UDim2.fromScale(0.929, 0.364),
        transparency = v7.transparency,
    }
    local skipAll = a1.skipAll

    function v19.clicked() -- Line: 49 -- upvalues: Click (val), skipAll (val)
        Click()
        if skipAll then
            skipAll()
        end
    end

    v16.skipAll = v17(v18, v19)
    v16.progress = createElement(BattlepassProgress, {
        Size = UDim2.fromScale(0.726, 0.093),
        Position = UDim2.fromScale(0.016, 0.317),
        Transparency = v7.transparency,
        level = u121,
        emitter = v2,
        progress = u174:map(function(a1) -- Line: 455 -- upvalues: u139 (val)
            return (math.min(u139.max, a1 - u139.min))
        end),
        maxProgress = u139.max,
    })
    v19 = {Transparency = v7.transparency}
    local regularClicked = a1.regularClicked

    function v19.regularClicked() -- Line: 49 -- upvalues: Click (val), regularClicked (val)
        Click()
        if regularClicked then
            regularClicked()
        end
    end

    local premiumClicked = a1.premiumClicked

    function v19.premiumClicked() -- Line: 49 -- upvalues: Click (val), premiumClicked (val)
        Click()
        if premiumClicked then
            premiumClicked()
        end
    end

    local regularIcon = u95 and u95.regularIcon
    v19.regularIcon = regularIcon
    local premiumIcon = u95 and u95.premiumIcon
    v19.premiumIcon = premiumIcon
    v16.trackIcons = createElement(u90, v19)
    v16.track = createElement(BattlepassTrack, {
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromScale(0.806, 0.59),
        Position = UDim2.fromScale(0.191, 0.679),
        Transparency = v7.transparency,
        Visible = a1.Visible,
        level = u121,
        items = v11,
        premium = a1.premium,
        tiers = if not record then nil else record.tiers,
    })
    v16.iconContainer = v1 and createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Position = v5}, {
        icon = createElement(BattlepassItem, table.merge({}, v1, {
            BackgroundTransparency = 1,
            ZIndex = 3,
            selection = true,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.925, -0.1),
            Size = UDim2.fromScale(0.345, 0.568),
            Transparency = v7.transparency,
        }), {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.396, 0),
                    NumberSequenceKeypoint.new(0.667, 0.581, 0.0938),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint"),
        }) or nil,
    })
    return createElement(BattlepassWindow, v15, v16)
end)))