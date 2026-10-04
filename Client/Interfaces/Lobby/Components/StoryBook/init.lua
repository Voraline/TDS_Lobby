-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook
-- Decompile time: 21.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local StoryMissionAvailability = require(ReplicatedStorage.Shared.Modules.StoryMissionAvailability)
local StoryModeClient = require(ReplicatedStorage.Client.Modules.StoryModeClient)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local ChapterCollection = require(script.ChapterCollection)
local ChapterList = require(script.Components.ChapterList)
local MissionBoard = require(script.Components.MissionBoard)
local MissionList = require(script.Components.MissionList)
local PartySelector = require(script.Components.PartySelector)
local PlayFooter = require(script.Components.PlayFooter)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local Chapters = NewNetwork.Channel("Chapters")
local u71 = {1, 2, 3, 4}
local u76 = nil
local u77 = {}

local function getChapters() -- Line: 49 -- upvalues: u76 (ref), Content (val)
    local v1
    if u76 then
        return u76
    end
    local v2 = {}
    for i, j in (Content("Gamemodes"):WaitForChild("StoryMode")):WaitForChild("Chapters"):GetChildren() do
        if j:IsA("ModuleScript") then
            v1 = tonumber((j.Name:match("%d+")))
            if v1 then
                v2[v1] = (require(j))
            else
                warn((("[StoryBook] Chapter module \"%*\" has no chapter number"):format(j.Name)))
            end
        end
    end
    u76 = v2
    return v2
end

return function(a1) -- Line: 83
    -- upvalues: useState (val), u71 (val), useEffect (val), StoryModeClient (val), u77 (val), Chapters (val)
    -- upvalues: getChapters (val), ChapterCollection (val), StoryMissionAvailability (val), createElement (val)
    -- upvalues: MissionList (val), MissionBoard (val), PartySelector (val), PlayFooter (val), ChapterList (val)
    -- upvalues: IconButton (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local u1009, u4 = useState(1)
    local u1022, u1037 = useState(1)
    local u1052, u1067 = useState(1)
    local u176, u16 = useState(nil)
    local v10, u20 = useState(nil)
    local PartySizes = a1.PartySizes
    if not PartySizes then
        PartySizes = u71
    end
    local u1117 = a1.partySize or u1052
    local v11 = false
    if a1.PartySizes ~= nil then
        v11 = a1.partySize == nil
    end

    local function onSelectChapter(a1) -- Line: 96 -- upvalues: u4 (val), u1037 (val) -- types: a1: number
        u4(a1)
        u1037(1)
    end

    local v12 = useEffect
    local v13 = {a1.partySize, PartySizes, u1052}
    v12(function() -- Line: 102 -- upvalues: a1 (val), PartySizes (val), u1052 (val), u1067 (val)
        if a1.partySize ~= nil then
            return
        end
        if not table.find(PartySizes, u1052) then
            u1067(PartySizes[1] or 1)
        end
    end, v13)
    v12 = useEffect
    v13 = {a1.Visible}
    v12(function() -- Line: 113 -- upvalues: a1 (val), StoryModeClient (upval), u16 (val)
        if a1.Visible == false then
            return
        end
        local u2 = false
        task.spawn(function() -- Line: 121 -- upvalues: StoryModeClient (upval), u2 (ref), u16 (upval)
            local success, result = pcall(function() -- Line: 123 -- upvalues: StoryModeClient (upval)
                return StoryModeClient.getProgress()
            end)
            if u2 then
                return
            end
            if success then
                u16(result)
                return
            end
            warn((("[StoryBook] Failed to load story progress: %*"):format(result)))
        end)
        return function() -- Line: 141 -- upvalues: u2 (ref)
            u2 = true
        end
    end, v13)
    v12 = useEffect
    v13 = {a1.Visible, u1009, u1022}
    v12(function() -- Line: 147 -- upvalues: a1 (val), u1009 (val), u1022 (val), u77 (upval), u20 (val), Chapters (upval)
        if a1.Visible == false then
            return
        end
        local u7 = ("%*-%*"):format(u1009, u1022)
        local v1 = u77[u7]
        if v1 then
            u20(v1)
            return
        end
        u20(nil)
        local u16 = false
        task.spawn(function() -- Line: 166
            -- upvalues: Chapters (upval), u1009 (upval), u1022 (upval), u16 (ref), u77 (upval), u7 (val), u20 (upval)
            local success, result = pcall(function() -- Line: 167 -- upvalues: Chapters (upval), u1009 (upval), u1022 (upval)
                return Chapters:invokeServer("GetMissionRewards", u1009, u1022)
            end)
            if u16 then
                return
            end
            if success then
                u77[u7] = result
                u20(result)
                return
            end
            if not success then
                warn((("[StoryBook] Failed to load mission rewards: %*"):format(result)))
            end
        end)
        return function() -- Line: 190 -- upvalues: u16 (ref)
            u16 = true
        end
    end, v13)

    local function isMissionCompleted(a1, a2) -- Line: 197 -- upvalues: u176 (val) -- types: a1: number, a2: number
        local v1 = u176 and u176.Chapters[a1]
        local v2 = false
        if v1 ~= nil then
            v2 = v1.Missions[a2] ~= nil
        end
        return v2
    end

    local function getMissionStars(a1, a2) -- Line: 202 -- upvalues: u176 (val) -- types: a1: number, a2: number
        local v1 = u176 and u176.Chapters[a1]
        local v2 = v1 and v1.Missions[a2]
        if type(v2) ~= "table" then
            return 0
        end
        return (math.clamp(v2.Stars or 0, 0, 3))
    end

    v13 = getChapters()
    local v14 = ChapterCollection.count(v13)
    local v15 = v13[u1009]
    local v16 = v15 and v15.Missions[u1022]
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v17 = false
    if v15 ~= nil then
        v17 = StoryMissionAvailability.isMissionReleased(v15, u1022, ServerTimeNow)
    end
    local v18 = false
    if v16 ~= nil then
        v18 = v17
        if v18 then
            v18 = true
            if not (u1022 <= 1) then
                v1 = u1022 - 1
                v2 = u176 and u176.Chapters[u1009]
                v18 = false
                if v2 ~= nil then
                    v18 = v2.Missions[v1] ~= nil
                end
            end
        end
    end
    v1 = v15 and #v15.Missions or 0
    v2 = 0
    for i = 1, v1 do
        v4 = u176 and u176.Chapters[u1009]
        v3 = false
        if v4 ~= nil then
            v3 = v4.Missions[i] ~= nil
        end
        if v3 then
            v2 = v2 + 1
        end
    end
    local v19 = 0
    local v20 = nil
    v3 = nil
    for j, k in v13, v20, v3 do
        v5 = true
        v6 = #k.Missions
        for n = 1, v6 do
            v8 = u176 and u176.Chapters[j]
            v7 = false
            if v8 ~= nil then
                v7 = v8.Missions[n] ~= nil
            end
            if not v7 then
                v5 = false
                break
            end
        end
        if v5 then
            v19 = v19 + 1
        end
    end
    v3 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = a1.Visible}
    v4 = {}
    v6 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.Size = UDim2.fromScale(0.957, 0.955)
    local v21 = {
        Header = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Visible = false,
            Size = UDim2.fromScale(0.958, 0.089),
        }, {
            Label = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Text = "Battle your way through the story of TDS",
                TextSize = 24,
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0.005, 1),
                Size = UDim2.fromScale(0.995, 1),
                FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                UIStroke = createElement("UIStroke", {Thickness = 0.1, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize}),
            }),
        }),
    }
    v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.999, 0.91),
    }
    local v22 = {}
    local v23 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.227, 0.002),
        Size = UDim2.fromScale(0.773, 0.998),
    }
    local v24 = {}
    local v25 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v26 = {
        MissionList = createElement(MissionList, {
            chapter = u1009,
            missions = v15 and v15.Missions,
            chapterDefinition = v15,
            nowTimestamp = ServerTimeNow,
            progress = u176,
            selectedMission = u1022,
            onSelect = u1037,
        }),
    }
    local v27 = {missionTitle = v16 and v16.Title}
    v27.chapterTitle = v15 and v15.Title
    v27.map = v16 and v16.Map
    v27.completedMissions = v2
    v27.totalMissions = v1
    if not v16 or not v16.StarThresholds then
        v9 = nil
    else
        local v28 = u176 and u176.Chapters[u1009]
        local v29 = v28 and v28.Missions[u1022]
        v9 = if type(v29) == "table" then math.clamp(v29.Stars or 0, 0, 3) else 0
    end
    v27.stars = v9
    v27.rewards = v10
    v26.MissionBoard = createElement(MissionBoard, v27)
    local v30 = v11 and createElement(PartySelector, {sizes = PartySizes, selected = u1052, onSelect = u1067}) or nil
    v26.PartySelector = v30
    v26.PlayFrame = createElement(PlayFooter, {
        enabled = v18,
        onPlay = function() -- Line: 343 -- upvalues: a1 (val), u1009 (val), u1022 (val), u1117 (val)
            if a1.OnReady then
                a1.OnReady(u1009, u1022, u1117)
            end
        end,
    })
    v26.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.45})
    v26.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.018, 0)})
    v26.UIStroke = createElement("UIStroke", {
        Thickness = 0.004,
        Transparency = 0.86,
        Color = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v24.StoryModeScreen = createElement("Frame", v25, v26)
    v24.ChapterCounter = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        Position = UDim2.fromScale(-0.294, 0.922),
        Size = UDim2.fromScale(0.272, 0.073),
    }, {
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Text = "Sections completed",
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.646, 0.773),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2}),
            UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
        Count = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            TextScaled = true,
            TextWrapped = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromScale(0, 0.55),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
            Text = ("%* / %*"):format(v19, v14),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2}),
            UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        InnerStroke = createElement("UIStroke", {
            Thickness = 0.05,
            Color = Color3.fromRGB(109, 109, 109),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v22.ChapterDisplay = createElement("Frame", v23, v24)
    v22.ChapterList = createElement(ChapterList, {
        chapters = v13,
        progress = u176,
        storyMaxChapter = a1.StoryMaxChapter,
        selectedChapter = u1009,
        onSelect = onSelectChapter,
    })
    v21.Body = createElement("Frame", v8, v22)
    v21.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.71})
    v21.UIListLayout = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder})
    v4.window = createElement("Frame", v6, v21)
    local v31 = a1.ShowClose ~= false and createElement(IconButton, {
        ZIndex = 4,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1.015, 0.024),
        Size = UDim2.fromScale(0.03, 0.05),
        Color = Color3.fromRGB(255, 60, 60),
        Clicked = function() -- Line: 464 -- upvalues: a1 (val)
            if a1.Close then
                a1.Close()
            end
            return
        end,
    }) or nil
    v4.Close = v31
    return createElement("Frame", v3, v4)
end