-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.StoryBook_old
-- Decompile time: 40.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local React = require(ReplicatedStorage.Shared.UI.React)
local StoryModeClient = require(ReplicatedStorage.Client.Modules.StoryModeClient)
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local u35 = {1, 2, 3, 4}
local ChapterCollection = require(script.Parent.ChapterCollection)
local u45 = nil
local u46 = nil

local function getChapters() -- Line: 21 -- upvalues: u45 (ref), u46 (ref), Content (val), ChapterCollection (val)
    local v1
    if u45 and u46 then
        return u45, u46
    end
    local v2 = {}
    for i, j in (Content("Gamemodes"):WaitForChild("StoryMode")):WaitForChild("Chapters"):GetChildren() do
        if j:IsA("ModuleScript") then
            v1 = tonumber((j.Name:match("%d+")))
            if v1 then
                v2[v1] = (require(j))
            else
                warn((("No chapter num for %*"):format(j.Name)))
            end
        end
    end
    u45 = v2
    u46 = ChapterCollection.getSortedNumericKeys(v2)
    return v2, u46
end

local function getChapterProgress(a1, a2) -- Line: 65 -- types: a1: table?, a2: number
    if a1 and a1.Chapters then
        return a1.Chapters[a2]
    end
    return nil
end

local function isMissionCompleted(a1, a2, a3) -- Line: 73 -- types: a1: table?, a2: number, a3: number
    local v1 = if not a1 then nil else if a1.Chapters then a1.Chapters[a2] else nil
    if v1 and v1.Missions then
        return v1.Missions[a3] ~= nil
    end
    return false
end

local function getMissionStars(a1, a2, a3) -- Line: 86 -- types: a1: table?, a2: number, a3: number
    local v1 = if not a1 then nil else if a1.Chapters then a1.Chapters[a2] else nil
    if v1 and v1.Missions then
        local v2 = v1.Missions[a3]
        if type(v2) ~= "table" then
            return 0
        end
        return (math.clamp(tonumber(v2.Stars) or 0, 0, 3))
    end
    return 0
end

local function createStarRating(a1) -- Line: 104 -- upvalues: createElement (val) -- types: a1: number
    local v1, v2, v3
    local v4 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.04, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    for i = 1, 3 do
        v1 = ("Star%*"):format(i)
        v2 = {
            BackgroundTransparency = 1,
            Image = "rbxassetid://17368097932",
            LayoutOrder = i,
            Size = UDim2.fromScale(0.3, 1),
        }
        v3 = i <= a1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(60, 60, 60)
        v2.ImageColor3 = v3
        v2.ScaleType = Enum.ScaleType.Fit
        v4[v1] = (createElement("ImageLabel", v2, {UIAspectRatio = createElement("UIAspectRatioConstraint")}))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0.35, 0.1),
    }, v4)
end

local function isChapterUnlocked(a1, a2, a3) -- Line: 137 -- types: a1: table, a2: table?, a3: number
    if a3 <= 1 then
        return true
    end
    local v1 = a3 - 1
    local v2 = a1[v1]
    if v2 and v2.Missions then
        local v3 = #v2.Missions
        local v4 = if not a2 then nil else if a2.Chapters then a2.Chapters[v1] else nil
        if v4 and v4.Missions then
            return v4.Missions[v3] ~= nil
        end
        return false
    end
    return false
end

local function isMissionUnlocked(a1, a2, a3, a4) -- Line: 155 -- types: a1: table, a2: table?, a3: number, a4: number
    local v1, v2, v3
    if not (a3 <= 1) then
        v2 = a3 - 1
        v3 = a1[v2]
        if not v3 then
            v1 = false
        elseif v3.Missions then
            local v4 = #v3.Missions
            local v5 = if not a2 then nil else if a2.Chapters then a2.Chapters[v2] else nil
            v1 = if not v5 then false else if v5.Missions then v5.Missions[v4] ~= nil else false
        else
            v1 = false
        end
    else
        v1 = true
    end
    if not v1 then
        return false
    end
    if a4 <= 1 then
        return true
    end
    v2 = a4 - 1
    v3 = if not a2 then nil else if a2.Chapters then a2.Chapters[a3] else nil
    if v3 and v3.Missions then
        return v3.Missions[v2] ~= nil
    end
    return false
end

return function(a1) -- Line: 172
    -- upvalues: useState (val), u35 (val), useEffect (val), StoryModeClient (val), getChapters (val)
    -- upvalues: createElement (val), React (val), createStarRating (val), CutSceneController (val), IconButton (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local u2659, u2524 = useState(1)
    local u2669, u2533 = useState(1)
    local u2681, u2542 = useState(nil)
    local u2692, u2702 = useState(1)
    local u2710, u20 = useState(nil)
    local PartySizes = a1.PartySizes
    if not PartySizes then
        PartySizes = u35
    end
    local StoryMaxChapter = a1.StoryMaxChapter
    local v13 = {PartySizes, u2692}
    useEffect(function() -- Line: 181 -- upvalues: PartySizes (val), u2692 (val), u2702 (val)
        if not table.find(PartySizes, u2692) then
            u2702(PartySizes[1] or 1)
        end
    end, v13)
    local v14 = useEffect
    v13 = {a1.Visible}
    v14(function() -- Line: 187 -- upvalues: a1 (val), StoryModeClient (upval), u20 (val)
        if a1.Visible == false then
            return
        end
        local u2 = false
        task.spawn(function() -- Line: 194 -- upvalues: StoryModeClient (upval), u2 (ref), u20 (upval)
            local success, result = pcall(function() -- Line: 195 -- upvalues: StoryModeClient (upval)
                return StoryModeClient.getProgress()
            end)
            if u2 then
                return
            end
            if success then
                u20(result)
                return
            end
            warn((("Failed to load story progress: %*"):format(result)))
        end)
        return function() -- Line: 210 -- upvalues: u2 (ref)
            u2 = true
        end
    end, v13)
    local u2737, u42 = getChapters()

    local function isChapterAvailable(a1) -- Line: 217
        -- upvalues: StoryMaxChapter (val), u2737 (val), u2710 (val)
        if StoryMaxChapter and not (a1 <= StoryMaxChapter) then
            return false
        end
        local v1 = u2710
        if a1 <= 1 then
            return true
        end
        local v2 = a1 - 1
        local v3 = u2737[v2]
        if v3 and v3.Missions then
            local v4 = #v3.Missions
            local v5 = if not v1 then nil else if v1.Chapters then v1.Chapters[v2] else nil
            if v5 and v5.Missions then
                return v5.Missions[v4] ~= nil
            end
            return false
        end
        return false
    end

    local function isCutsceneAvailable(a1, a2) -- Line: 222
        -- upvalues: StoryMaxChapter (val), u2737 (val), u2710 (val)
        local v1, v2, v3, v4, v5, v6
        if not StoryMaxChapter then
            v2 = u2710
            if not (a1 <= 1) then
                v3 = a1 - 1
                v4 = u2737[v3]
                if not v4 then
                    v1 = false
                elseif v4.Missions then
                    v5 = #v4.Missions
                    v6 = if not v2 then nil else if v2.Chapters then v2.Chapters[v3] else nil
                    v1 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
                else
                    v1 = false
                end
            else
                v1 = true
            end
        else
            v1 = false
            if a1 <= StoryMaxChapter then
                v2 = u2710
                if not (a1 <= 1) then
                    v3 = a1 - 1
                    v4 = u2737[v3]
                    if not v4 then
                        v1 = false
                    elseif v4.Missions then
                        v5 = #v4.Missions
                        v6 = if not v2 then nil else if v2.Chapters then v2.Chapters[v3] else nil
                        v1 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
                    else
                        v1 = false
                    end
                else
                    v1 = true
                end
            end
        end
        if v1 then
            v1 = true
            if a2.AfterMission ~= 0 then
                local v7 = u2710
                local AfterMission = a2.AfterMission
                v3 = if not v7 then nil else if v7.Chapters then v7.Chapters[a1] else nil
                if v3 and v3.Missions then
                    return v3.Missions[AfterMission] ~= nil
                end
                return false
            end
        end
        return v1
    end

    local function isMissionAvailable(a1, a2) -- Line: 230
        -- upvalues: StoryMaxChapter (val), u2737 (val), u2710 (val)
        local v1, v2, v3, v4, v5, v6
        if not StoryMaxChapter then
            v2 = u2710
            if not (a1 <= 1) then
                v3 = a1 - 1
                v4 = u2737[v3]
                if not v4 then
                    v1 = false
                elseif v4.Missions then
                    v5 = #v4.Missions
                    v6 = if not v2 then nil else if v2.Chapters then v2.Chapters[v3] else nil
                    v1 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
                else
                    v1 = false
                end
            else
                v1 = true
            end
        else
            v1 = false
            if a1 <= StoryMaxChapter then
                v2 = u2710
                if not (a1 <= 1) then
                    v3 = a1 - 1
                    v4 = u2737[v3]
                    if not v4 then
                        v1 = false
                    elseif v4.Missions then
                        v5 = #v4.Missions
                        v6 = if not v2 then nil else if v2.Chapters then v2.Chapters[v3] else nil
                        v1 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
                    else
                        v1 = false
                    end
                else
                    v1 = true
                end
            end
        end
        if not v1 then
            return v1
        end
        v2 = u2710
        if not (a1 <= 1) then
            v4 = a1 - 1
            v5 = u2737[v4]
            if not v5 then
                v3 = false
            elseif v5.Missions then
                v6 = #v5.Missions
                local v7 = if not v2 then nil else if v2.Chapters then v2.Chapters[v4] else nil
                v3 = if not v7 then false else if v7.Missions then v7.Missions[v6] ~= nil else false
            else
                v3 = false
            end
        else
            v3 = true
        end
        if not v3 then
            return false
        end
        if a2 <= 1 then
            return true
        end
        v3 = a2 - 1
        v4 = if not v2 then nil else if v2.Chapters then v2.Chapters[a1] else nil
        if v4 and v4.Missions then
            return v4.Missions[v3] ~= nil
        end
        return false
    end

    local v15 = {u2710, u2659, StoryMaxChapter, u42}
    useEffect(function() -- Line: 235
        -- upvalues: u2659 (val), StoryMaxChapter (val), u2737 (val), u2710 (val), u42 (val), u2524 (val), u2533 (val)
        -- upvalues: u2542 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local v11 = u2659
        if not StoryMaxChapter then
            v4 = u2710
            if not (v11 <= 1) then
                v5 = v11 - 1
                v6 = u2737[v5]
                if not v6 then
                    v1 = false
                elseif v6.Missions then
                    v7 = #v6.Missions
                    v8 = if not v4 then nil else if v4.Chapters then v4.Chapters[v5] else nil
                    v1 = if not v8 then false else if v8.Missions then v8.Missions[v7] ~= nil else false
                else
                    v1 = false
                end
            else
                v1 = true
            end
        else
            v1 = false
            if v11 <= StoryMaxChapter then
                v4 = u2710
                if not (v11 <= 1) then
                    v5 = v11 - 1
                    v6 = u2737[v5]
                    if not v6 then
                        v1 = false
                    elseif v6.Missions then
                        v7 = #v6.Missions
                        v8 = if not v4 then nil else if v4.Chapters then v4.Chapters[v5] else nil
                        v1 = if not v8 then false else if v8.Missions then v8.Missions[v7] ~= nil else false
                    else
                        v1 = false
                    end
                else
                    v1 = true
                end
            end
        end
        if v1 then
            return
        end
        v11 = nil
        local v12 = nil
        for i, j in u42, v11, v12 do
            if not StoryMaxChapter then
                v8 = u2710
                if not (j <= 1) then
                    v9 = j - 1
                    v10 = u2737[v9]
                    if not v10 then
                        v6 = false
                    elseif v10.Missions then
                        v2 = #v10.Missions
                        v3 = if not v8 then nil else if v8.Chapters then v8.Chapters[v9] else nil
                        v6 = if not v3 then false else if v3.Missions then v3.Missions[v2] ~= nil else false
                    else
                        v6 = false
                    end
                else
                    v6 = true
                end
            else
                v6 = false
                if j <= StoryMaxChapter then
                    v8 = u2710
                    if not (j <= 1) then
                        v9 = j - 1
                        v10 = u2737[v9]
                        if not v10 then
                            v6 = false
                        elseif v10.Missions then
                            v2 = #v10.Missions
                            v3 = if not v8 then nil else if v8.Chapters then v8.Chapters[v9] else nil
                            v6 = if not v3 then false else if v3.Missions then v3.Missions[v2] ~= nil else false
                        else
                            v6 = false
                        end
                    else
                        v6 = true
                    end
                end
            end
            if v6 then
                u2524(j)
                u2533(1)
                u2542(nil)
                return
            end
        end
        u2524(1)
        u2533(1)
        u2542(nil)
    end, v15)
    v15 = {u2710, u2659, u2669}
    useEffect(function() -- Line: 263 -- upvalues: u2737 (val), u2710 (val), u2659 (val), u2669 (val), u2533 (val)
        local v1, v2, v3, v4, v5
        local v6 = u2710
        local v7 = u2659
        local v8 = u2669
        if not (v7 <= 1) then
            v3 = v7 - 1
            local v9 = u2737[v3]
            if not v9 then
                v2 = false
            elseif v9.Missions then
                v4 = #v9.Missions
                v5 = if not v6 then nil else if v6.Chapters then v6.Chapters[v3] else nil
                v2 = if not v5 then false else if v5.Missions then v5.Missions[v4] ~= nil else false
            else
                v2 = false
            end
        else
            v2 = true
        end
        if not v2 then
            v1 = false
        elseif not (v8 <= 1) then
            v2 = v8 - 1
            v3 = if not v6 then nil else if v6.Chapters then v6.Chapters[v7] else nil
            v1 = if not v3 then false else if v3.Missions then v3.Missions[v2] ~= nil else false
        else
            v1 = true
        end
        if v1 then
            return
        end
        v1 = u2737[u2659]
        if v1 and v1.Missions then
            local v10, v11, v12, v13, v14
            v6 = nil
            v7 = nil
            for i in v1.Missions, v6, v7 do
                v4 = u2710
                v5 = u2659
                if not (v5 <= 1) then
                    v11 = v5 - 1
                    v12 = u2737[v11]
                    if not v12 then
                        v10 = false
                    elseif v12.Missions then
                        v13 = #v12.Missions
                        v14 = if not v4 then nil else if v4.Chapters then v4.Chapters[v11] else nil
                        v10 = if not v14 then false else if v14.Missions then v14.Missions[v13] ~= nil else false
                    else
                        v10 = false
                    end
                else
                    v10 = true
                end
                if not v10 then
                    v3 = false
                elseif not (i <= 1) then
                    v10 = i - 1
                    v11 = if not v4 then nil else if v4.Chapters then v4.Chapters[v5] else nil
                    v3 = if not v11 then false else if v11.Missions then v11.Missions[v10] ~= nil else false
                else
                    v3 = true
                end
                if v3 then
                    u2533(i)
                    return
                end
            end
            u2533(1)
            return
        end
    end, v15)
    local v16 = {UIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 2)})}
    v16.UIPadding = createElement("UIPadding", {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 0),
        PaddingTop = UDim.new(0.02, 0),
        PaddingBottom = UDim.new(0.02, 0),
    })
    v15 = nil
    local v17 = nil
    for i, j in u42, v15, v17 do
        v2 = u2737[j]
        if not StoryMaxChapter or not (StoryMaxChapter < j) then
            if StoryMaxChapter then
                v4 = false
                if j <= StoryMaxChapter then
                    if not (j <= 1) then
                        v5 = j - 1
                        v6 = u2737[v5]
                        if not v6 then
                            v4 = false
                        elseif v6.Missions then
                            v7 = #v6.Missions
                            v8 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v5] else nil
                            v4 = if not v8 then false else if v8.Missions then v8.Missions[v7] ~= nil else false
                        else
                            v4 = false
                        end
                    else
                        v4 = true
                    end
                end
            elseif not (j <= 1) then
                v5 = j - 1
                v6 = u2737[v5]
                if not v6 then
                    v4 = false
                elseif v6.Missions then
                    v7 = #v6.Missions
                    v8 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v5] else nil
                    v4 = if not v8 then false else if v8.Missions then v8.Missions[v7] ~= nil else false
                else
                    v4 = false
                end
            else
                v4 = true
            end
            local u2465 = not v4
            v4 = ("Chapter_%*"):format(j)
            v7 = {}
            v8 = not (u2659 ~= j) and not u2465 and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(25, 25, 25)
            v7.BackgroundColor3 = v8
            v7.BackgroundTransparency = 0
            v7.Size = UDim2.fromScale(1, 0.25)
            v7.LayoutOrder = j
            v7.BorderSizePixel = 0
            v7.AutoButtonColor = not u2465
            v7.Active = not u2465
            v7.Selectable = not u2465

            v7[React.Event.Activated] = function() -- Line: 316 -- upvalues: u2465 (val), u2524 (val), j (val), u2533 (val), u2542 (val)
                if u2465 then
                    return
                end
                u2524(j)
                u2533(1)
                u2542(nil)
            end

            v8 = {
                UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
                ChapterName = createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = v2.Title,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                    Size = UDim2.fromScale(1, 0.5),
                    Position = UDim2.fromScale(0, 0.25),
                }),
            }
            v9 = u2465 and createElement("Frame", {
                BackgroundTransparency = 0.25,
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            }, {
                LockIcon = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://15117261700",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.4, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                }),
            })
            v8.LockedFrame = v9
            v16[v4] = (createElement("ImageButton", v7, v8))
        end
    end
    local v18 = {
        UIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder}),
    }
    v15 = createElement
    local v19 = {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 0),
        PaddingTop = UDim.new(0.02, 0),
        PaddingBottom = UDim.new(0.02, 0),
    }
    v18.UIPadding = v15("UIPadding", v19)
    v15 = u2737[u2659]
    if v15 then
        local AfterMission
        v19 = nil
        v1 = nil
        for k, n in v15.Missions, v19, v1 do
            if StoryMaxChapter then
                v5 = false
                if u2659 <= StoryMaxChapter then
                    if not (u2659 <= 1) then
                        v6 = u2659 - 1
                        v7 = u2737[v6]
                        if not v7 then
                            v5 = false
                        elseif v7.Missions then
                            v8 = #v7.Missions
                            v9 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v6] else nil
                            v5 = if not v9 then false else if v9.Missions then v9.Missions[v8] ~= nil else false
                        else
                            v5 = false
                        end
                    else
                        v5 = true
                    end
                end
            elseif not (u2659 <= 1) then
                v6 = u2659 - 1
                v7 = u2737[v6]
                if not v7 then
                    v5 = false
                elseif v7.Missions then
                    v8 = #v7.Missions
                    v9 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v6] else nil
                    v5 = if not v9 then false else if v9.Missions then v9.Missions[v8] ~= nil else false
                else
                    v5 = false
                end
            else
                v5 = true
            end
            if v5 then
                if not (u2659 <= 1) then
                    v7 = u2659 - 1
                    v8 = u2737[v7]
                    if not v8 then
                        v6 = false
                    elseif v8.Missions then
                        v9 = #v8.Missions
                        v10 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v7] else nil
                        v6 = if not v10 then false else if v10.Missions then v10.Missions[v9] ~= nil else false
                    else
                        v6 = false
                    end
                else
                    v6 = true
                end
                if not v6 then
                    v5 = false
                elseif not (k <= 1) then
                    v6 = k - 1
                    v7 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[u2659] else nil
                    v5 = if not v7 then false else if v7.Missions then v7.Missions[v6] ~= nil else false
                else
                    v5 = true
                end
            end
            local u603 = not v5
            v5 = ("mission_%*"):format(k)
            v8 = {}
            v9 = if u2681 ~= nil then Color3.fromRGB(0, 73, 122) else if u2669 ~= k then Color3.fromRGB(0, 73, 122) else Color3.fromRGB(0, 100, 160)
            v8.BackgroundColor3 = v9
            v8.BackgroundTransparency = 0
            v8.Size = UDim2.fromScale(1, 0.125)
            v8.LayoutOrder = k * 100
            v8.BorderSizePixel = 0
            v8.AutoButtonColor = not u603
            v8.Active = not u603
            v8.Selectable = not u603

            v8[React.Event.Activated] = function() -- Line: 390 -- upvalues: u603 (val), u2533 (val), k (val), u2542 (val)
                if u603 then
                    return
                end
                u2533(k)
                u2542(nil)
            end

            v9 = {
                UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
                MissionName = createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = ("Mission %*"):format(k),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                    Size = UDim2.fromScale(0.5, 0.4),
                    Position = UDim2.fromScale(0, 0),
                }),
                MissionTitle = createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = n.Title,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                    Size = UDim2.fromScale(0.5, 0.4),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.fromScale(1, 1),
                }),
            }
            v10 = u603 and createElement("Frame", {
                BackgroundTransparency = 0.25,
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            }, {
                LockIcon = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://15117261700",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.5, 0.8),
                    ScaleType = Enum.ScaleType.Fit,
                }),
            })
            v9.LockedFrame = v10
            v18[v5] = (createElement("ImageButton", v8, v9))
        end
        local Cutscenes = v15.Cutscenes or {}
        v19 = nil
        v1 = nil
        for m, i5 in Cutscenes, v19, v1 do
            if not i5.Hidden then
                if StoryMaxChapter then
                    v5 = false
                    if u2659 <= StoryMaxChapter then
                        if not (u2659 <= 1) then
                            v6 = u2659 - 1
                            v7 = u2737[v6]
                            if not v7 then
                                v5 = false
                            elseif v7.Missions then
                                v8 = #v7.Missions
                                v9 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v6] else nil
                                v5 = if not v9 then false else if v9.Missions then v9.Missions[v8] ~= nil else false
                            else
                                v5 = false
                            end
                        else
                            v5 = true
                        end
                    end
                elseif not (u2659 <= 1) then
                    v6 = u2659 - 1
                    v7 = u2737[v6]
                    if not v7 then
                        v5 = false
                    elseif v7.Missions then
                        v8 = #v7.Missions
                        v9 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v6] else nil
                        v5 = if not v9 then false else if v9.Missions then v9.Missions[v8] ~= nil else false
                    else
                        v5 = false
                    end
                else
                    v5 = true
                end
                if v5 then
                    v5 = true
                    if i5.AfterMission ~= 0 then
                        AfterMission = i5.AfterMission
                        v7 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[u2659] else nil
                        v5 = if not v7 then false else if v7.Missions then v7.Missions[AfterMission] ~= nil else false
                    end
                end
                local u227 = not v5
                v5 = ("cutscene_%*"):format(m)
                v8 = {}
                v9 = if u2681 ~= m then Color3.fromRGB(76, 52, 28) else Color3.fromRGB(120, 82, 35)
                v8.BackgroundColor3 = v9
                v8.BackgroundTransparency = 0
                v8.Size = UDim2.fromScale(1, 0.09)
                v8.LayoutOrder = i5.AfterMission * 100 + m
                v8.BorderSizePixel = 0
                v8.AutoButtonColor = not u227
                v8.Active = not u227
                v8.Selectable = not u227

                v8[React.Event.Activated] = function() -- Line: 460 -- upvalues: u227 (val), u2542 (val), m (val)
                    if u227 then
                        return
                    end
                    u2542(m)
                end

                v9 = {
                    UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
                    PlayIcon = createElement("TextLabel", {
                        Text = ">",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        TextColor3 = Color3.fromRGB(255, 210, 105),
                        FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                        Size = UDim2.fromScale(0.18, 0.7),
                        Position = UDim2.fromScale(0.02, 0.15),
                    }),
                    CutsceneTitle = createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Text = i5.Title or "Cinematic",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.fromScale(0.72, 0.45),
                        Position = UDim2.fromScale(0.2, 0.275),
                    }),
                }
                v10 = u227 and createElement("Frame", {
                    BackgroundTransparency = 0.25,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                }, {
                    LockIcon = createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://15117261700",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.35, 0.7),
                        ScaleType = Enum.ScaleType.Fit,
                    }),
                })
                v9.LockedFrame = v10
                v18[v5] = (createElement("ImageButton", v8, v9))
            end
        end
    end
    if not u2681 then
        v1 = {
            Kind = "Mission",
            Title = ("Mission %*: %*"):format(u2669, v15.Missions[u2669].Title),
        }
        if StoryMaxChapter then
            v2 = false
            if u2659 <= StoryMaxChapter then
                if not (u2659 <= 1) then
                    v3 = u2659 - 1
                    v4 = u2737[v3]
                    if not v4 then
                        v2 = false
                    elseif v4.Missions then
                        v5 = #v4.Missions
                        v6 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v3] else nil
                        v2 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
                    else
                        v2 = false
                    end
                else
                    v2 = true
                end
            end
        elseif not (u2659 <= 1) then
            v3 = u2659 - 1
            v4 = u2737[v3]
            if not v4 then
                v2 = false
            elseif v4.Missions then
                v5 = #v4.Missions
                v6 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v3] else nil
                v2 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
            else
                v2 = false
            end
        else
            v2 = true
        end
        if v2 then
            if not (u2659 <= 1) then
                v4 = u2659 - 1
                v5 = u2737[v4]
                if not v5 then
                    v3 = false
                elseif v5.Missions then
                    v6 = #v5.Missions
                    v7 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v4] else nil
                    v3 = if not v7 then false else if v7.Missions then v7.Missions[v6] ~= nil else false
                else
                    v3 = false
                end
            else
                v3 = true
            end
            if not v3 then
                v2 = false
            elseif not (u2669 <= 1) then
                v3 = u2669 - 1
                v4 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[u2659] else nil
                v2 = if not v4 then false else if v4.Missions then v4.Missions[v3] ~= nil else false
            else
                v2 = true
            end
        end
    else
        v19 = v15.Cutscenes[u2681]
        v1 = {Kind = "Cutscene", Title = v19.Title or "Cinematic"}
        if StoryMaxChapter then
            v2 = false
            if u2659 <= StoryMaxChapter then
                if not (u2659 <= 1) then
                    v3 = u2659 - 1
                    v4 = u2737[v3]
                    if not v4 then
                        v2 = false
                    elseif v4.Missions then
                        v5 = #v4.Missions
                        v6 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v3] else nil
                        v2 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
                    else
                        v2 = false
                    end
                else
                    v2 = true
                end
            end
        elseif not (u2659 <= 1) then
            v3 = u2659 - 1
            v4 = u2737[v3]
            if not v4 then
                v2 = false
            elseif v4.Missions then
                v5 = #v4.Missions
                v6 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[v3] else nil
                v2 = if not v6 then false else if v6.Missions then v6.Missions[v5] ~= nil else false
            else
                v2 = false
            end
        else
            v2 = true
        end
        if v2 then
            v2 = true
            if v19.AfterMission ~= 0 then
                local AfterMission_2 = v19.AfterMission
                v4 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[u2659] else nil
                v2 = if not v4 then false else if v4.Missions then v4.Missions[AfterMission_2] ~= nil else false
            end
        end
    end
    v1.Unlocked = v2
    local u2410 = v1.Kind == "Cutscene"
    local Unlocked = v17.Unlocked
    v4 = if not u2710 then nil else if u2710.Chapters then u2710.Chapters[u2659] else nil
    if not v4 then
        v3 = 0
    elseif v4.Missions then
        v5 = v4.Missions[u2669]
        v3 = if type(v5) == "table" then math.clamp(tonumber(v5.Stars) or 0, 0, 3) else 0
    else
        v3 = 0
    end
    v4 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.02, 0),
        }),
    }
    v6 = nil
    v7 = nil
    for i6, i7 in PartySizes, v6, v7 do
        v10 = ("SIZE_BUTTON_%*"):format(i7)
        v11 = {}
        v12 = not (u2692 ~= i7) and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(90, 90, 90)
        v11.BackgroundColor3 = v12
        v11.BorderSizePixel = 0
        v11.Size = UDim2.fromScale(0.24, 0.8)
        v11.AnchorPoint = Vector2.new(0.5, 0.5)

        v11[React.Event.Activated] = function() -- Line: 554 -- upvalues: u2702 (val), i7 (val)
            u2702(i7)
        end

        v4[v10] = (createElement("ImageButton", v11, {
            UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
            Label = createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                Text = tostring(i7),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                Size = UDim2.fromScale(0.8, 0.8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextXAlignment = Enum.TextXAlignment.Center,
            }, {
                UIStroke = createElement("UIStroke", {Thickness = 0.05, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize}),
            }),
        }))
    end
    v7 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = a1.Visible}
    v8 = {}
    local v20 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),
    }
    local v21 = {
        ChapterList = createElement("ScrollingFrame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0.3, 1),
            CanvasSize = UDim2.fromScale(0, 1),
            VerticalScrollBarInset = Enum.ScrollBarInset.Always,
        }, v16),
    }
    v21.TimelineList = createElement("ScrollingFrame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.3, 0.5),
        Size = UDim2.fromScale(0.25, 1),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.fromScale(0, 0),
        VerticalScrollBarInset = Enum.ScrollBarInset.Always,
    }, v18)
    local v22 = {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.45, 1),
    }
    local v23 = {
        UIPadding = createElement("UIPadding", {
            PaddingLeft = UDim.new(0.01, 0),
            PaddingRight = UDim.new(0.01, 0),
            PaddingTop = UDim.new(0.01, 0),
            PaddingBottom = UDim.new(0, 0),
        }),
    }
    v23.MainWindow = createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        Size = UDim2.fromScale(1, 0.6),
    }, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
        UIPadding = createElement("UIPadding", {
            PaddingLeft = UDim.new(0.03, 0),
            PaddingRight = UDim.new(0.03, 0),
            PaddingTop = UDim.new(0.03, 0),
            PaddingBottom = UDim.new(0.03, 0),
        }),
        MissionName = createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = v17.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
            Size = UDim2.fromScale(0.5, 0.1),
            Position = UDim2.fromScale(0, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        StarRating = not u2410 and createStarRating(v3),
        PartySizeFrame = not u2410 and createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(0, 170, 50),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(0.55, 0.2),
        }, {
            PartySizeLabel = createElement("TextLabel", {
                Text = "Party Size:",
                TextScaled = true,
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
                Size = UDim2.fromScale(1, 0.5),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 1),
                TextXAlignment = Enum.TextXAlignment.Center,
            }),
            SizeList = createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.fromScale(1, 1)}, v4),
        }),
    })
    v23.RewardFrame = not u2410 and createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.62),
        Size = UDim2.fromScale(1, 0.2),
    }, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
        UIPadding = createElement("UIPadding", {
            PaddingLeft = UDim.new(0.03, 0),
            PaddingRight = UDim.new(0.03, 0),
            PaddingTop = UDim.new(0.03, 0),
            PaddingBottom = UDim.new(0, 0),
        }),
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        TEMPLATE = createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(0, 100, 150),
            Size = UDim2.fromScale(0.25, 0.85),
        }, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}),
    })
    local v24 = {}
    local v25 = Unlocked and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(90, 90, 90)
    v24.BackgroundColor3 = v25
    v24.BorderSizePixel = 0
    v24.Size = UDim2.fromScale(0.5, 0.1)
    v24.AnchorPoint = Vector2.new(0.5, 0)
    v24.Position = UDim2.fromScale(0.5, 0.85)
    v24.AutoButtonColor = Unlocked
    v24.Active = Unlocked
    v24.Selectable = Unlocked

    v24[React.Event.Activated] = function() -- Line: 739
        -- upvalues: Unlocked (val), u2410 (val), CutSceneController (upval), u2659 (val), u2681 (val), a1 (val)
        -- upvalues: u2669 (val), u2692 (val)
        if not Unlocked then
            return
        end
        if u2410 then
            (CutSceneController.PlayStoryLocal(u2659, u2681)):catch(warn)
            return
        end
        if a1.OnReady then
            a1.OnReady(u2659, u2669, u2692)
        end
    end

    v23.ReadyButton = createElement("ImageButton", v24, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.7),
            FontFace = Font.new("Montserrat", Enum.FontWeight.Heavy),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = if not Unlocked then "Locked" else if not u2410 then "Ready" else "Play",
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 0.05, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize}),
        }),
    })
    v21.MissionFrame = createElement("Frame", v22, v23)
    v21.close = createElement(IconButton, {
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.fromScale(0.044, 0.069),
        Position = UDim2.fromScale(0.5, 1.025),
        Color = Color3.fromRGB(255, 60, 60),
        Clicked = function() -- Line: 784 -- upvalues: a1 (val)
            if a1.Close then
                a1.Close()
            end
        end,
    })
    v8.window = createElement("Frame", v20, v21)
    return createElement("Frame", v7, v8)
end