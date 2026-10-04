-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.AdidasEvent
-- Decompile time: 7.69 ms

local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AdidasEventConfig = require(ReplicatedStorage.Client.Interfaces.Lobby.AdidasEventConfig)
local EventSplashScreen = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local useCache = require(Hooks.useCache)
local useFFlag = require(Hooks.useFFlag)
local useScale = require(Hooks.useScale)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
local LocalPlayer = Players.LocalPlayer
local Flags = Network.Channel("Flags")
local u71 = nil
task.spawn(function() -- Line: 35 -- upvalues: u71 (ref)
    u71 = workspace.Spawns:WaitForChild("SpawnEvent")
end)
return function() -- Line: 39
    -- upvalues: useViewEnabled (val), useFFlag (val), useCache (val), useState (val), useScale (val)
    -- upvalues: AdidasEventConfig (val), useCallback (val), Flags (val), useEffect (val), BadgeService (val)
    -- upvalues: LocalPlayer (val), ViewController (val), createElement (val), EventSplashScreen (val), u71 (ref)
    local EventPrompt, EventPrompt_2 = useViewEnabled("EventPrompt")
    local u7 = useFFlag("adidas.event", true)
    local u11, u12 = useCache("Flags", nil)
    local v1, u16 = useState(false)
    local u19, u20 = useState(nil)
    local v2 = useScale(1.25)
    local u27 = AdidasEventConfig.hasCompleted(u19)
    local u34 = v1
    if not u34 then
        u34 = u11
        if u34 then
            u34 = u11[AdidasEventConfig.PromptSeenFlag] == true
        end
    end
    local v3 = {u11, u34}
    local u44 = useCallback(function() -- Line: 51 -- upvalues: u34 (val), u16 (val), u11 (val), AdidasEventConfig (upval), u12 (val), Flags (upval)
        if u34 then
            return
        end
        u16(true)
        local v1 = if not u11 then {} else table.clone(u11)
        v1[AdidasEventConfig.PromptSeenFlag] = true
        u12(v1)
        task.spawn(function() -- Line: 62 -- upvalues: Flags (upval), AdidasEventConfig (upval)
            local success, result = pcall(function() -- Line: 63 -- upvalues: Flags (upval), AdidasEventConfig (upval)
                return Flags:InvokeServer("Update", AdidasEventConfig.PromptSeenFlag, true)
            end)
            if not success then
                warn("Failed to update Adidas event prompt flag", result)
            end
        end)
    end, v3)
    useEffect(function() -- Line: 73 -- upvalues: BadgeService (upval), LocalPlayer (upval), AdidasEventConfig (upval), u20 (val)
        local u0 = false
        task.spawn(function() -- Line: 76
            -- upvalues: BadgeService (upval), LocalPlayer (upval), AdidasEventConfig (upval), u0 (ref), u20 (upval)
            local success, result = pcall(function() -- Line: 77 -- upvalues: BadgeService (upval), LocalPlayer (upval), AdidasEventConfig (upval)
                return BadgeService:CheckUserBadgesAsync(LocalPlayer.UserId, AdidasEventConfig.CompletionBadgeIds)
            end)
            if u0 then
                return
            end
            if not success then
                warn("Failed to get Adidas event badges", result)
                return
            end
            local v1 = {}
            for i, j in result do
                v1[j] = true
            end
            u20(v1)
        end)
        return function() -- Line: 101 -- upvalues: u0 (ref)
            u0 = true
        end
    end, {})
    local v4 = {EventPrompt, u7, u27}
    useEffect(function() -- Line: 106 -- upvalues: EventPrompt (val), u7 (val), u27 (val), EventPrompt_2 (val)
        if EventPrompt then
            if not u7 or u27 then
                EventPrompt_2("Hotbar")
            end
        end
    end, v4)
    v4 = {u7, u11, u19, u34, u27, u44}
    useEffect(function() -- Line: 112
        -- upvalues: u7 (val), u11 (val), u19 (val), u34 (val), u27 (val), u44 (val), ViewController (upval)
        if u7 and u11 and u19 and not u34 and not u27 then
            u44()
            ViewController:queueView("EventPrompt")
            return
        end
    end, v4)
    if u7 and not u27 then
        return createElement(EventSplashScreen, {
            Title = "Backyard Legends",
            EventThumbnail = 95972374540687,
            Size = UDim2.fromOffset(900, 550),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            EventThumbnailPosition = UDim2.fromScale(0.5, 0.5),
            Visible = EventPrompt,
            Scale = v2,
            Objectives = {
                {
                    Icon = "rbxassetid://80940287317147",
                    Text = "<font size=\"11\">Rise to Stardom</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Complete the Backyard Legends story line across 3 missions.</font><font size=\"3\"><br /></font>",
                },
                {
                    Icon = "rbxassetid://80940287317147",
                    Text = "<font size=\"11\">Dream Team</font><font size=\"3\"><br /><br /></font><font size=\"8\" weight=\"800\">Complete quests to earn up to 5 exclusive Adidas skins!</font><font size=\"3\"><br /></font>",
                },
            },
            Buttons = {
                {
                    Text = "Play Event!",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.fromScale(0.5, 1.25),
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 167 -- upvalues: u44 (val), u71 (upval), EventPrompt_2 (val), LocalPlayer (upval)
                        u44()
                        if not u71 then
                            return
                        end
                        EventPrompt_2("Loading")
                        LocalPlayer:RequestStreamAroundAsync(u71.Position, 3)
                        LocalPlayer.Character:PivotTo(u71.CFrame + Vector3.new(0, 5, 0))
                        EventPrompt_2("Hotbar")
                    end,
                },
                {
                    Text = "Skip",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 200, 1, 0),
                    Position = UDim2.fromScale(0.5, 1.25),
                    Color = Color3.fromRGB(229, 40, 40),
                    Clicked = function() -- Line: 186 -- upvalues: u44 (val), EventPrompt_2 (val)
                        u44()
                        EventPrompt_2("Hotbar")
                    end,
                },
            },
        })
    end
    return nil
end