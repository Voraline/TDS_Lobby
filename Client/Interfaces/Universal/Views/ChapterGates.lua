-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.ChapterGates
-- Decompile time: 8.14 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local StoryModeClient = require(ReplicatedStorage.Client.Modules.StoryModeClient)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local useEffect = React.useEffect
local useState = React.useState
local u35 = {}
for i, j in (Content("Gamemodes"):WaitForChild("StoryMode")):WaitForChild("Chapters"):GetChildren() do
    if j:IsA("ModuleScript") then
        v1 = tonumber((j.Name:match("%d+")))
        if v1 then
            u35[v1] = (require(j))
        end
    end
end

local function getMissionsCompleted(a1, a2) -- Line: 37 -- types: a1: table?, a2: number
    local Chapters = a1 and a1.Chapters and a1.Chapters[a2]
    if Chapters and Chapters.Missions then
        local v1 = 0
        for i in Chapters.Missions do
            v1 = v1 + 1
        end
        return v1
    end
    return 0
end

local function getChapterMissionCount(a1) -- Line: 54 -- upvalues: u35 (val) -- types: a1: number
    local v1 = u35[a1]
    if v1 and v1.Missions then
        return #v1.Missions
    end
    return 0
end

local function getChapterGateProgress(a1, a2) -- Line: 63 -- upvalues: u35 (val) -- types: a1: table?, a2: number
    local v1
    local v2 = u35[a2]
    if (if not v2 then 0 else if v2.Missions then #v2.Missions else 0) <= 0 then
        return 0, false
    end
    local Chapters = a1 and a1.Chapters and a1.Chapters[a2]
    if not Chapters then
        v2 = 0
    elseif Chapters.Missions then
        local v3 = 0
        for i in Chapters.Missions do
            v3 = v3 + 1
        end
        v2 = v3
    else
        v2 = 0
    end
    return (math.clamp(v2 / v1, 0, 1)), v1 <= v2
end

local function ChapterGateSurface(a1) -- Line: 80 -- upvalues: createElement (val)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Text = ("BEAT CHAPTER %*"):format(a1.requiredChapter),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.4),
            Size = UDim2.fromScale(1, 0.2),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {UIStroke = createElement("UIStroke", {Thickness = 4})}),
        Bar = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(26, 26, 26),
            Position = UDim2.fromScale(0.5, 0.7),
            Size = UDim2.fromScale(0.8, 0.1),
        }, {
            Fill = createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(80, 255, 86),
                Size = UDim2.fromScale(a1.progress, 1),
            }),
        }),
    })
end

local function ChapterGatePortal(a1) -- Line: 120
    -- upvalues: u35 (val), useEffect (val), createPortal (val), createElement (val), ChapterGateSurface (val)
    local u86, v1
    local gatePart = a1.gatePart
    local UI = gatePart:FindFirstChild("UI")
    if not UI then
        warn((("ChapterGate %* is missing SurfaceGui \"UI\""):format((gatePart:GetFullName()))))
        return nil
    end
    local Attribute = gatePart:GetAttribute("RequiredChapter")
    if not Attribute then
        warn((("ChapterGate %* is missing <RequiredChapter> attribute"):format((gatePart:GetFullName()))))
        return nil
    end
    local Main = UI:FindFirstChild("Main")
    if Main then
        Main:Destroy()
    end
    local storyProgress = a1.storyProgress
    local v2 = u35[Attribute]
    local v3 = if not v2 then 0 else if v2.Missions then #v2.Missions else 0
    if not (v3 <= 0) then
        local Chapters = storyProgress and storyProgress.Chapters and storyProgress.Chapters[Attribute]
        if not Chapters then
            v2 = 0
        elseif Chapters.Missions then
            local v4 = 0
            for i in Chapters.Missions do
                v4 = v4 + 1
            end
            v2 = v4
        else
            v2 = 0
        end
        v1 = math.clamp(v2 / v3, 0, 1)
        u86 = v3 <= v2
    else
        v1 = 0
        u86 = false
    end
    v2 = {u86, gatePart, UI}
    useEffect(function() -- Line: 148 -- upvalues: gatePart (val), u86 (val), UI (val)
        gatePart.CanCollide = not u86
        gatePart.Transparency = if not u86 then 0.5 else 1
        UI.Enabled = not u86
    end, v2)
    return createPortal(createElement(ChapterGateSurface, {requiredChapter = Attribute, progress = v1}), UI)
end

return function() -- Line: 163
    -- upvalues: useTagged (val), useState (val), useEffect (val), StoryModeClient (val), createElement (val)
    -- upvalues: ChapterGatePortal (val), React (val)
    local ChapterGate = useTagged("ChapterGate")
    local v1, u6 = useState(nil)
    local v2 = {ChapterGate}
    useEffect(function() -- Line: 168 -- upvalues: ChapterGate (val), StoryModeClient (upval), u6 (val)
        if #ChapterGate <= 0 then
            return
        end
        local u3 = false
        task.spawn(function() -- Line: 175 -- upvalues: StoryModeClient (upval), u3 (ref), u6 (upval)
            local success, result = pcall(function() -- Line: 177 -- upvalues: StoryModeClient (upval)
                return StoryModeClient.getProgress()
            end)
            if u3 then
                return
            end
            if success then
                u6(result)
                return
            end
            warn((("Failed to load chapter gate progress: %*"):format(result)))
        end)
        return function() -- Line: 194 -- upvalues: u3 (ref)
            u3 = true
        end
    end, v2)
    local v3 = {}
    for i, j in ChapterGate do
        if j:IsA("BasePart") then
            v3[j] = (createElement(ChapterGatePortal, {gatePart = j, storyProgress = v1}))
        end
    end
    return createElement(React.Fragment, nil, v3)
end