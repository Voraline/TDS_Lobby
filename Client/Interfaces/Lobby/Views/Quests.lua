-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Quests
-- Decompile time: 2.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local QuestWindow = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useQuestState = require(ReplicatedStorage.Client.Interfaces.Hooks.useQuestState)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local u67 = UDim2.new(0.665, 0, 0.65, 0)
local u71 = UDim2.fromScale(0.7, 0.7)
return function() -- Line: 23
    -- upvalues: useState (val), useFFlag (val), useScale (val), useViewportSize (val), u71 (val), u67 (val)
    -- upvalues: useView (val), useQuestState (val), useEffect (val), ViewController (val), createElement (val)
    -- upvalues: QuestWindow (val), NewNetwork (val)
    local u38
    local v1, u3 = useState(false)
    local v2 = useFFlag("quests.active", true, {enabled = v1})
    local v3 = useScale(1.2)
    local v4 = useViewportSize()
    local v5 = false
    if 0 < v4.X then
        v5 = true
        if not (v4.X <= 1200) then
            v5 = v4.Y <= 720
        end
    end
    local Quests, Quests_2 = useState("Quests")
    _, u38 = useView(true)
    local v6, u49 = useQuestState(v2, v1)
    useEffect(function() -- Line: 37 -- upvalues: ViewController (upval), u3 (val)
        return ViewController:onViewChange(function(a1) -- Line: 38 -- upvalues: u3 (upval)
            u3(a1 == "Quests")
        end)
    end, {})
    if v1 and not v2 then
        task.defer(u38, "Hotbar")
    end
    return createElement(QuestWindow, {
        Actions = u49,
        Error = v6.Error,
        IsMobile = v5,
        Loaded = v6.Loaded,
        PendingAction = v6.PendingAction,
        Position = UDim2.fromScale(0.5, 0.5),
        Scale = if not v5 then v3 else 1,
        SetTab = Quests_2,
        Size = if not v5 then u67 else u71,
        State = v6.State,
        Tab = Quests,
        Visible = v2 and v1,
        OnClose = function() -- Line: 61 -- upvalues: u38 (val)
            u38("Hotbar")
        end,
        OnPurchaseMission = function(a1, a2, a3) -- Line: 65
            -- upvalues: ViewController (upval), u49 (val)
            ViewController:prompt({
                Override = true,
                Subject = "Purchase Mission",
                Icon = "rbxassetid://13691899952",
                Description = ("Would you like to start \"%*\" for %* coins?"):format(a2, a3),
                Buttons = {
                    {
                        Text = "Confirm",
                        Color = Color3.fromRGB(10, 220, 80),
                        Clicked = function() -- Line: 75 -- upvalues: ViewController (upval), u49 (upval), a1 (val)
                            ViewController:closePrompt()
                            u49.PurchaseMission(a1)
                        end,
                    },
                    {
                        Text = "Cancel",
                        Color = Color3.fromRGB(39, 39, 39),
                        Clicked = function() -- Line: 83 -- upvalues: ViewController (upval)
                            ViewController:closePrompt()
                        end,
                    },
                },
            })
        end,
        OnSkipMission = function(a1, a2, a3) -- Line: 91 -- upvalues: NewNetwork (upval) -- types: a1: string, a2: number, a3: string
            NewNetwork.Channel("Monetization"):fireServer("PromptPurchase", a2)
        end,
    })
end