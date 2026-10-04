-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryModeElevatorWindow
-- Decompile time: 11.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local StoryModeClient = require(ReplicatedStorage.Client.Modules.StoryModeClient)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local StoryModeData = require(script.Parent.StoryModeData)
local StoryModeRewards = require(script.Parent.StoryModeRewards)
local StoryModeWindow = require(script.Parent.StoryModeWindow)
local useScreenSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useScreenSize)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState

local function playStoryCutscene(a1, a2, a3) -- Line: 20
    -- upvalues: ReplicatedStorage (val)
    ((require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController).PlayStoryLocal(a1, a2)):finally(a3)):catch(warn)
end

local function getWindowSize(a1, a2) -- Line: 42 -- types: a1: userdata, a2: boolean
    local v1 = a1.X - (if not a2 then 150 else 106)
    if a2 then
        return v1, (math.clamp(a1.Y - 100, 330, 500))
    end
    return v1, (math.clamp(a1.Y - 150, 690, 900))
end

return function(a1) -- Line: 51
    -- upvalues: useSound (val), useState (val), useRef (val), useScreenSize (val), useEffect (val)
    -- upvalues: StoryModeClient (val), StoryModeData (val), MatchmakingModel (val), createElement (val)
    -- upvalues: StoryModeWindow (val), StoryModeRewards (val), ReplicatedStorage (val), IconButton (val)
    local Click = useSound("Click")
    local u6, u7 = useState({})
    local u10 = useRef(nil)
    local u13, u14 = useState(nil)
    local u17, u18 = useState(nil)
    local StoryMaxChapter = a1.StoryMaxChapter
    local u21 = a1.PartySize or 1
    local v1 = useScreenSize()
    local v2 = true
    if not (v1.X < 1000) then
        v2 = v1.Y < 800
    end
    local v3 = v1.X - (if not v2 then 150 else 106)
    local v4 = if not v2 then math.clamp(v1.Y - 150, 690, 900) else math.clamp(v1.Y - 100, 330, 500)
    local v5 = v3
    v3 = useEffect
    local v6 = {a1.Visible, StoryMaxChapter}
    v3(function() -- Line: 67
        -- upvalues: a1 (val), StoryModeClient (upval), u10 (val), u7 (val), StoryModeData (upval)
        -- upvalues: StoryMaxChapter (val)
        if a1.Visible == false then
            return
        end
        local u2 = false
        task.spawn(function() -- Line: 74
            -- upvalues: StoryModeClient (upval), u2 (ref), u10 (upval), u7 (upval), StoryModeData (upval)
            -- upvalues: StoryMaxChapter (upval)
            local success, result = pcall(function() -- Line: 75 -- upvalues: StoryModeClient (upval)
                return StoryModeClient.getProgress()
            end)
            if u2 then
                return
            end
            if success and type(result) == "table" then
                u10.current = result
                u7(StoryModeData.getSections(result, StoryMaxChapter))
                return
            end
            warn((("[StoryModeElevatorWindow] Failed to load story progress: %*"):format(result)))
        end)
        return function() -- Line: 94 -- upvalues: u2 (ref)
            u2 = true
        end
    end, v6)
    v3 = useEffect
    v6 = {a1.Visible, StoryMaxChapter, u6}
    v3(function() -- Line: 99
        -- upvalues: a1 (val), u10 (val), StoryModeData (upval), u6 (val), u7 (val), StoryMaxChapter (val)
        if a1.Visible == false then
            return
        end
        local current = u10.current
        local v1 = StoryModeData.getNextUnlockAt(u6)
        if current and v1 then
            local u8 = false
            local u9 = false
            local u21 = task.delay(math.max(0, v1 - (workspace:GetServerTimeNow())) + 0.05, function() -- Line: 114
                -- upvalues: u8 (ref), u9 (ref), u7 (upval), StoryModeData (upval), current (val)
                -- upvalues: StoryMaxChapter (upval)
                u8 = true
                if u9 then
                    return
                end
                u7(StoryModeData.getSections(current, StoryMaxChapter))
            end)
            return function() -- Line: 124 -- upvalues: u9 (ref), u8 (ref), u21 (val)
                u9 = true
                if not u8 then
                    task.cancel(u21)
                end
            end
        end
    end, v6)
    local v7 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = a1.Visible}
    local v8 = {}
    local v9 = {
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(v5, v4),
    }
    local v10 = {
        Content = createElement(StoryModeWindow, {
            compact = v2,
            loadMissionRewards = StoryModeRewards.load,
            onCutsceneActivated = function(a1, a2, a3) -- Line: 185 -- upvalues: ReplicatedStorage (upval)
                ((require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController).PlayStoryLocal(a1, a2)):finally(a3)):catch(warn)
            end,
            onEntryActivated = function(a1) -- Line: 144 -- upvalues: MatchmakingModel (upval), u6 (val), u13 (val), u18 (val) -- types: a1: string
                local v1 = MatchmakingModel.resolveStoryEntrySelection(u6, u13, nil)
                local v2 = if not v1 then nil else MatchmakingModel.findStoryEntry(v1, a1)
                if v2 and not v2.locked then
                    u18(v2.id)
                    return
                end
            end,
            onActivated = Click,
            onPlayActivated = function() -- Line: 155 -- upvalues: MatchmakingModel (upval), u6 (val), u13 (val), u17 (val), a1 (val), u21 (val)
                local v1
                _, v1 = MatchmakingModel.resolveStoryEntrySelection(u6, u13, u17)
                if v1 and not v1.locked and v1.kind == "Mission" then
                    if a1.OnReady then
                        a1.OnReady(v1.chapterNumber, v1.missionNumber, u21)
                    end
                    return
                end
            end,
            onSectionActivated = function(a1) -- Line: 132 -- upvalues: MatchmakingModel (upval), u6 (val), u14 (val), u18 (val) -- types: a1: string
                local v1 = MatchmakingModel.findSection(u6, a1)
                if v1 and not v1.locked then
                    local v2
                    _, v2 = MatchmakingModel.resolveStoryEntrySelection(u6, v1.id, nil)
                    u14(v1.id)
                    u18(if not v2 then nil else v2.id)
                    return
                end
            end,
            sections = u6,
            selectedEntryId = u17,
            selectedSectionId = u13,
        }),
    }
    local v11 = {
        ZIndex = 10,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -14, 0, 14),
    }
    local v12 = if not v2 then UDim2.fromOffset(48, 48) else UDim2.fromOffset(44, 44)
    v11.Size = v12
    v11.Color = Color3.fromRGB(255, 60, 60)
    v11.Clicked = a1.Close
    v10.Close = createElement(IconButton, v11)
    v8.Window = createElement("Frame", v9, v10)
    return createElement("Frame", v7, v8)
end