-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.world
-- Decompile time: 8.66 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local React = require(ReplicatedStorage.Shared.UI.React)
local Components = ReplicatedStorage.Client.Interfaces.Components
local ImageLabel = require(Components.ImageLabel)
local ElevatorTimer = require(script.ElevatorTimer)
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local createElement = React.createElement
local memo = React.memo
local u43 = {}
u43[Enum.Difficulty.VeryEasy] = (Color3.fromRGB(0, 255, 127))
u43[Enum.Difficulty.Easy] = (Color3.fromRGB(0, 255, 127))
u43[Enum.Difficulty.Medium] = (Color3.fromRGB(0, 170, 255))
u43[Enum.Difficulty.Normal] = (Color3.fromRGB(0, 170, 255))
u43[Enum.Difficulty.Hard] = (Color3.fromRGB(255, 56, 56))
u43[Enum.Difficulty.Insane] = (Color3.fromRGB(170, 0, 255))
u43[Enum.Difficulty.Event] = (Color3.fromRGB(255, 242, 90))
u43[Enum.Difficulty.Special] = (Color3.fromRGB(255, 242, 90))
local u104 = Color3.fromRGB(229, 62, 255)
local u109 = Color3.fromRGB(255, 230, 255)
local u114 = Color3.fromRGB(35, 0, 50)

local function lowercase(a1) -- Line: 66
    return string.lower((tostring(a1 or "")))
end

local function isVoidcoreTheme(a1) -- Line: 70 -- types: a1: table
    local v1 = string.lower((tostring(a1.Theme or "")))
    local v2 = string.lower((tostring(a1.Type or "")))
    local v3 = string.lower((tostring(a1.Difficulty or "")))
    local v4 = true
    if v1 ~= "voidcore" then
        v4 = false
        if v2 == "hardcore" then
            v4 = v3 == "hard"
        end
    end
    return v4
end

return memo(function(a1) -- Line: 78
    -- upvalues: useState (val), useMemo (val), NewMaps (val), Enum (val), u43 (val), u104 (val), useEffect (val)
    -- upvalues: Players (val), useRef (val), createElement (val), ElevatorTimer (val), ImageLabel (val), u109 (val)
    -- upvalues: u114 (val)
    local u44
    local onMap = a1.onMap
    local settings = a1.settings
    if not settings then
        settings = {}
    end
    local v1 = settings.Capacity or 4
    local v2 = settings.Intermission or 20
    local u11 = a1.map or "Grass Isle"
    local u13 = a1.timer or v2
    local u15 = a1.players or 0
    local v3 = string.lower((tostring(settings.Theme or "")))
    local v4 = string.lower((tostring(settings.Type or "")))
    local v5 = string.lower((tostring(settings.Difficulty or "")))
    local v6 = true
    if v3 ~= "voidcore" then
        v6 = false
        if v4 == "hardcore" then
            v6 = v5 == "hard"
        end
    end
    v3, u44 = useState(false)
    local v7, u47 = useState()
    local v8 = {u11}
    local u53 = useMemo(function() -- Line: 93 -- upvalues: NewMaps (upval), u11 (val)
        return NewMaps(u11)
    end, v8)
    local v9 = {u53}
    local u58 = useMemo(function() -- Line: 97 -- upvalues: u53 (val), Enum (upval)
        if u53 then
            return u53.Difficulty
        end
        return Enum.Difficulty.Easy
    end, v9)
    v8 = useMemo
    local v10 = {u58, a1.forcedColor}
    local u65 = v8(function() -- Line: 105 -- upvalues: a1 (val), u43 (upval), u53 (val), u58 (val), Enum (upval)
        if a1.forcedColor then
            return u43[tostring(a1.forcedColor)] or Color3.new(1, 1, 1)
        end
        if u53 then
            return u43[u58]
        end
        return u43[Enum.Difficulty.Easy]
    end, v10)
    local u68 = if not v6 then u65 else u104
    v10 = useMemo
    local v11 = {u58, a1.forcedDifficulty, settings.MapDifficulty}
    v10 = v10(function() -- Line: 119 -- upvalues: a1 (val), settings (val), Enum (upval), u58 (val)
        if a1.forcedDifficulty then
            return a1.forcedDifficulty
        end
        if settings.MapDifficulty then
            return settings.MapDifficulty
        end
        return Enum.Difficulty.ToString(u58)
    end, v11)
    local v12 = {u53}
    useEffect(function() -- Line: 131 -- upvalues: u47 (val), u53 (val), Players (upval)
        u47("")
        if not u53 then
            return
        end
        local u6 = task.spawn(function() -- Line: 138 -- upvalues: u53 (upval), Players (upval), u47 (upval)
            local v1 = {}
            for i, v in ipairs(u53.Creator) do
                table.insert(v1, (Players:GetNameFromUserIdAsync(v)))
            end
            u47(table.concat(v1, ", "))
        end)
        return function() -- Line: 148 -- upvalues: u6 (val)
            if u6 then
                task.cancel(u6)
            end
        end
    end, v12)
    v12 = {u53, onMap, u68}
    useEffect(function() -- Line: 155
        -- upvalues: onMap (val), u11 (val), u53 (val), u58 (val), u65 (val), u68 (val), u15 (val), u13 (val)
        if onMap then
            onMap({
                name = u11,
                data = u53,
                difficulty = u58,
                difficultyColor = u65,
                themeColor = u68,
                players = u15,
                timer = u13,
            })
        end
    end, v12)
    v12 = {u53}
    local u108 = useMemo(function() -- Line: 169 -- upvalues: u53 (val)
        return u53 and u53.ImageID or 13690741683
    end, v12)
    local u111 = useRef(u108)
    local v13 = {u108}
    useEffect(function() -- Line: 174 -- upvalues: u111 (val), u108 (val), u44 (val)
        local v1 = u111.current ~= u108
        u111.current = u108
        if not v1 then
            return
        end
        u44(true)
        local u15 = task.spawn(function() -- Line: 185 -- upvalues: u44 (upval)
            task.wait(0.4)
            u44(false)
        end)
        return function() -- Line: 190 -- upvalues: u15 (ref)
            if u15 then
                task.cancel(u15)
            end
        end
    end, v13)
    v13 = {}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v13.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v13.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v13.AnchorPoint = AnchorPoint
    local v14 = {
        timer = createElement(ElevatorTimer, {
            timeLeft = u13,
            intermission = v2,
            capacity = v1,
            players = u15,
            barColor = u68,
            dontShowPlayers = not a1.has3DPlayerCount,
        }),
    }
    local v15 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 1,
        ZIndex = 0,
        disableSpinner = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(58, 58, 58),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    v15.Image = a1.forcedIcon and ("rbxassetid://%*"):format(a1.forcedIcon) or (if not v3 then ("rbxassetid://%*"):format(u53 and u53.ImageID or 13602640868) else "")
    v15.Position = UDim2.fromScale(0.5, 0.5)
    v15.ScaleType = Enum.ScaleType.Crop
    v15.Size = UDim2.fromScale(1, 1)
    v14.icon = createElement(ImageLabel, v15)
    v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 4,
    }
    local v16 = if not v6 then Vector2.new(1, 1) else Vector2.new(0.5, 0)
    v15.AnchorPoint = v16
    v15.BackgroundColor3 = Color3.fromRGB(139, 139, 139)
    v15.BorderColor3 = Color3.fromRGB(27, 42, 53)
    v15.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v16 = if not v6 then UDim2.new(1, -16, 1, -40) else UDim2.new(0.5, 0, 0, 3)
    v15.Position = v16
    v16 = if not v6 then UDim2.new(0.5, -16, 0, 24) else UDim2.new(1, 0, 0, 22)
    v15.Size = v16
    v15.Text = if not v6 then string.upper(v10) else "Voidcore"
    v15.TextColor3 = if not v6 then u65 else u109
    v15.TextSize = if not v6 then 20 else 18
    v15.TextStrokeColor3 = if not v6 then Color3.fromRGB(0, 0, 0) else u114
    v15.TextStrokeTransparency = if not v6 then 0.7 else 0.35
    v15.TextXAlignment = if not v6 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Center
    v15.TextYAlignment = Enum.TextYAlignment.Bottom
    v14.mode = createElement("TextLabel", v15, {
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20}),
        uIStroke = createElement("UIStroke", {
            Color = if not v6 then Color3.fromRGB(0, 0, 0) else u114,
            Thickness = if not v6 then 3 else 2,
            Transparency = if not v6 then 0.25 else 0.35,
        }),
        uIGradient = v6 and createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(190, 45, 255)),
        }),
    })
    v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 16,
        TextStrokeTransparency = 0.7,
        TextWrapped = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(139, 139, 139),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    v16 = if not v6 then UDim2.new(0.5, 0, 0, 4) else UDim2.new(0.5, 0, 0, 25)
    v15.Position = v16
    v16 = if not v6 then UDim2.new(1, 0, 0, 40) else UDim2.new(0.9, 0, 0, 34)
    v15.Size = v16
    local DisplayName = u53 and u53.DisplayName or u11
    v15.Text = DisplayName
    v15.TextColor3 = Color3.fromRGB(255, 255, 255)
    v14.title = createElement("TextLabel", v15, {
        uIStroke1 = createElement("UIStroke", {Thickness = 3, Transparency = 0.25}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(132, 132, 132)),
        }),
    })
    v14.mapDifficulty = v6 and createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 18,
        TextStrokeTransparency = 0.55,
        TextWrapped = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(139, 139, 139),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.5, 0, 0, 60),
        Size = UDim2.new(1, 0, 0, 20),
        Text = string.upper(v10),
        TextColor3 = u65,
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.4, Color = Color3.fromRGB(0, 0, 0)}),
    })
    v14.creator = createElement("TextLabel", {
        AutoLocalize = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 16,
        TextTransparency = 0.5,
        TextWrapped = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(139, 139, 139),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Position = UDim2.new(0, 16, 1, -40),
        Size = UDim2.new(0.5, -16, 0, 24),
        Text = ("Creator: %*"):format(v7),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        Visible = v7 ~= "",
    }, {uITextSizeConstraint1 = createElement("UITextSizeConstraint", {MaxTextSize = 16})})
    v14.innerGlow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://85104292402513",
        ImageTransparency = 0.5,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageColor3 = u68,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    })
    return createElement("Frame", v13, v14)
end)