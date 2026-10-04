-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Matchmaking.Views.Match
-- Decompile time: 13.65 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = script.Parent.Parent.Parent
local Controllers = Parent.Controllers
local Stores = Parent.Stores
local Shared = ReplicatedStorage.Client.Interfaces.Stores.Shared
local Lobby = ReplicatedStorage.Client.Interfaces.Stores.Lobby
local Matchmaking = ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking
local MatchmakingController = require(Controllers.MatchmakingController)
local MatchmakingResultCard = require(Matchmaking.MatchmakingResultCard)
local MatchmakingResults = require(Matchmaking.MatchmakingResults)
local MatchmakingStatus = require(Matchmaking.MatchmakingStatus)
local MatchmakingStore = require(Lobby.MatchmakingStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ScreenStore = require(Shared.ScreenStore)
local MatchmakingStates = require(Lobby.MatchmakingStates)
local ViewController = require(Controllers.ViewController)
local Viewport = require(Parent.Components.Viewport)
local useConfetti = require(ReplicatedStorage.Client.Interfaces.Hooks.useConfetti)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local u81 = {}
local v1 = {Amount = 40, Lifetime = 1, Force = 20, Direction = Vector2.new(0.9, 0)}
local v2 = {Amount = 40, Lifetime = 1, Force = 20, Direction = Vector2.new(-0.9, 0)}
u81[1] = v1
u81[2] = v2
local u92 = {}

local function runRequest(a1) -- Line: 47 -- types: a1: function
    local result, success
    for i = 1, 5 do
        success, result = pcall(a1)
        if success then
            return result
        end
        task.wait(i ^ 2 * 0.15)
    end
    return nil
end

local function getCharacter(a1) -- Line: 63 -- upvalues: u92 (val), runRequest (val), Players (val) -- types: a1: number
    if u92[a1] then
        return u92[a1]
    end
    local v1 = runRequest(function() -- Line: 68 -- upvalues: Players (upval), a1 (val)
        local HumanoidDescriptionFromUserId = Players:GetHumanoidDescriptionFromUserId(a1)
        return Players:CreateHumanoidModelFromDescription(HumanoidDescriptionFromUserId, Enum.HumanoidRigType.R15)
    end)
    if not v1 then
        return nil
    end
    v1:WaitForChild("HumanoidRootPart", 5)
    v1:PivotTo((CFrame.new()))
    u92[a1] = v1
    return v1
end

local function getCharacterSize(a1) -- Line: 84 -- types: a1: userdata
    local Humanoid = a1:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        return Humanoid.HipHeight * 2
    end
    return a1:GetExtentsSize().Magnitude
end

local function PlayerAvatarViewport(a1) -- Line: 93
    -- upvalues: useRef (val), useEffect (val), Viewport (val), getCharacter (val), createElement (val)
    local u3 = useRef(nil)
    local v1 = useEffect
    local v2 = {a1.userId}
    v1(function() -- Line: 96 -- upvalues: u3 (val), Viewport (upval), getCharacter (upval), a1 (val)
        local current = u3.current
        if not current then
            return
        end
        local u2 = true
        local u3_2 = nil
        local u7 = Viewport.new(current)
        u7:Include("viewport_update", function(a1) -- Line: 106 -- upvalues: u3_2 (ref), current (val)
            if not u3_2 then
                return
            end
            local AbsoluteSize = current.AbsoluteSize
            local v1 = math.max(AbsoluteSize.X, 1)
            local v2 = math.min(1, (math.max(AbsoluteSize.Y, 1)) / v1)
            a1.FieldOfView = 45
            local v3 = math.atan((math.tan((math.rad(a1.FieldOfView / 2)))) * v2)
            local v4 = u3_2
            local Humanoid = v4:FindFirstChildOfClass("Humanoid")
            local Magnitude = if not Humanoid then v4:GetExtentsSize().Magnitude else Humanoid.HipHeight * 2
            v4 = if not (v3 > 0) then Magnitude * 2 else Magnitude / math.sin(v3)
            a1.CFrame = (CFrame.Angles(0, 2.9670597283903604, 0)) * CFrame.new(0, 0, v4)
        end)
        u7:Run()
        local u18 = task.spawn(function() -- Line: 127 -- upvalues: getCharacter (upval), a1 (upval), u2 (ref), u3_2 (ref), u7 (val)
            local v1 = getCharacter(a1.userId)
            if u2 and v1 then
                u3_2 = v1:Clone()
                u3_2:PivotTo((CFrame.new()))
                u7:SetModel(u3_2)
                return
            end
        end)
        return function() -- Line: 138 -- upvalues: u2 (ref), u18 (val), u7 (val), u3_2 (ref)
            u2 = false
            pcall(task.cancel, u18)
            if u7 then
                u7:Destroy()
            end
            if u3_2 then
                u3_2:Destroy()
            end
        end
    end, v2)
    return createElement("ViewportFrame", {
        Name = "PlayerPreview",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ref = u3,
    })
end

local function formatElapsed(a1) -- Line: 163 -- types: a1: number
    return string.format("%01d:%02d", math.floor(a1 / 60), (math.floor(a1 % 60)))
end

local function getResults(a1) -- Line: 167
    return a1 and a1.result or {}
end

local function Results(a1) -- Line: 171
    -- upvalues: createElement (val), MatchmakingResultCard (val), PlayerAvatarViewport (val), MatchmakingResults (val)
    local Session, v1, v2
    local v3 = {}
    local v4 = a1
    for i, v in ipairs(a1.results) do
        Session = v.Session or {}
        v1 = v.UserId or 1
        v2 = ("%*:%*"):format(v1, i)
        v3[v2] = (createElement(MatchmakingResultCard, {
            index = i,
            layoutOrder = i,
            title = ("@%*"):format(v.Name or "Player"),
            levelText = ("Lv. %*"):format(Session.Level or 0),
            lossesText = tostring(Session.Losses or 0),
            triumphsText = tostring(Session.Triumphs or 0),
            playerPreview = createElement(PlayerAvatarViewport, {userId = v1}),
            towers = Session.Towers,
        }))
    end
    return createElement(MatchmakingResults, {visible = #v4.results > 0, screenSize = v4.screenSize}, v3)
end

local function MatchContainer() -- Line: 198
    -- upvalues: ReactCharm (val), MatchmakingStore (val), ScreenStore (val), useState (val), useConfetti (val)
    -- upvalues: u81 (val), useRef (val), useEffect (val), MatchmakingStates (val), createElement (val)
    -- upvalues: MatchmakingStatus (val), MatchmakingController (val), Results (val)
    local u4 = ReactCharm.useSignalState(MatchmakingStore.getMatchState)
    local v1 = ReactCharm.useSignalState(MatchmakingStore.getSearch)
    local v2 = ReactCharm.useSignalState(ScreenStore.getState)
    local v3 = ReactCharm.useSignalState(MatchmakingStore.getCanCancel)
    local v4, u23 = useState(os.time)
    local u26, u27 = useConfetti(u81)
    local u30 = useRef(nil)
    local u33 = useRef(false)
    useEffect(function() -- Line: 208 -- upvalues: u23 (val)
        local u0 = true
        local u3 = task.spawn(function() -- Line: 211 -- upvalues: u0 (ref), u23 (upval)
            while u0 do
                u23(os.time())
                task.wait(0.1)
            end
        end)
        return function() -- Line: 218 -- upvalues: u0 (ref), u3 (val)
            u0 = false
            pcall(task.cancel, u3)
        end
    end, {})
    local v5 = {u26, u30}
    useEffect(function() -- Line: 224 -- upvalues: u26 (val), u30 (val)
        if u26.current and u30.current then
            u26.current.Parent = u30.current
        end
    end, v5)
    v5 = {u4}
    useEffect(function() -- Line: 230 -- upvalues: u4 (val), MatchmakingStates (upval), u33 (val), u27 (val)
        if u4 == MatchmakingStates.MATCHED and u33.current then
            u27()
        end
        u33.current = u4 == MatchmakingStates.SEARCHING
    end, v5)
    local result = v1 and v1.result or {}
    local v6 = math.max(0, v4 - (v1.started or v4))
    local v7 = u4 == MatchmakingStates.MATCHED
    if v5 and v2.isMobile and #result > 0 then
        v7 = false
    end
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = v5}, {
        Status = createElement(MatchmakingStatus, {
            title = "GAME FOUND!",
            visible = v7,
            text = string.format("%01d:%02d", math.floor(v6 / 60), (math.floor(v6 % 60))),
            completed = v5,
            canClose = v3,
            onClose = function() -- Line: 258 -- upvalues: MatchmakingController (upval)
                MatchmakingController:cancelMatchmaking()
            end,
        }, {
            Confetti = createElement("Frame", {
                Name = "Confetti",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                ref = u30,
            }),
        }),
        Results = createElement(Results, {results = if not v5 then {} else result, screenSize = v2.screenSize}),
    })
end

return function(a1) -- Line: 277
    -- upvalues: ViewController (val), MatchmakingController (val), ReactRoblox (val), createElement (val)
    -- upvalues: MatchContainer (val)
    ViewController:init()
    MatchmakingController:init()
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.fromScale(1, 1)
    local u20 = ReactRoblox.createRoot(Frame)
    u20:render((createElement(MatchContainer)))
    Frame.Destroying:Once(function() -- Line: 288 -- upvalues: u20 (val)
        u20:unmount()
    end)
    return Frame
end