-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.CurseVoteView
-- Decompile time: 7.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Components = ReplicatedStorage.Client.Interfaces.Game.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local CurseUI = require(ReplicatedStorage.Client.Interfaces.Game.Components.CurseUI)
local React = require(ReplicatedStorage.Shared.UI.React)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
require(Components.MainObjective)
local createElement = React.createElement
local useEffect = React.useEffect
local CurseVote = NewNetwork.Channel("CurseVote")
return function(a1) -- Line: 31
    -- upvalues: useTagReplicators (val), useReplicatedState (val), useSound (val), React (val), useEffect (val)
    -- upvalues: EasySound (val), SoundService (val), TweenService (val), Content (val), createElement (val)
    -- upvalues: CurseUI (val), CurseVote (val)
    local u177, v1, v2, v3
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    local v4 = useTagReplicators("CurseReplicator")[1]
    local u171 = useReplicatedState(v4, "VotingActive")
    local v5 = useReplicatedState(v4, "Curses", {})
    local v6 = useReplicatedState(v4, "VotingText", "")
    local v7 = useReplicatedState(v4, "Votes", {})
    local CurseUIOpen = useSound("CurseUIOpen")
    local CurseUIClose = useSound("CurseUIClose")
    local u37 = React.useRef(nil)
    useEffect(function() -- Line: 48 -- upvalues: u37 (val), EasySound (upval), SoundService (upval)
        u37.current = EasySound.Create({id = 113747608376743, volume = 0.4, looped = true, parent = SoundService})
    end, {})
    local v8 = {u171, u37}
    useEffect(function() -- Line: 57 -- upvalues: u171 (val), CurseUIOpen (val), CurseUIClose (val), u37 (val)
        if not u171 then
            CurseUIClose()
        else
            CurseUIOpen()
        end
        if u37.current then
            if u171 then
                u37.current:Play()
                return
            end
            u37.current:Stop()
        end
    end, v8)
    local v9, u175 = React.useState(nil)
    v8, u177 = React.useState("")
    local v10 = {}
    local u62 = React.useRef(nil)
    useEffect(function() -- Line: 80 -- upvalues: u62 (val)
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "CurseVoteBlur"
        BlurEffect.Size = 0
        BlurEffect.Parent = game:GetService("Lighting")
        u62.current = BlurEffect
    end, {})
    local v11 = {u171}
    useEffect(function() -- Line: 88 -- upvalues: u171 (val), TweenService (upval), u62 (val)
        if u171 then
            TweenService:Create(u62.current, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = 50}):Play()
            return
        end
        TweenService:Create(u62.current, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = 0}):Play()
    end, v11)
    local v12 = nil
    v11 = nil
    for i, j in v5 or {}, v12, v11 do
        v1 = Content("GlobalModifiers")[j]
        if v1 then
            v2 = require(v1)
            v3 = {}
            for k, n in v7 or {} do
                if k == j then
                    v3 = n
                end
            end
            table.insert(v10, {
                data = {
                    icon = ("rbxassetid://%*"):format(v2.icon),
                    title = v2.displayName,
                    modifiers = {v2.description},
                    votedFor = v3 or {},
                },
            })
        end
    end
    return createElement(CurseUI, {
        cards = v10,
        selected = v9,
        clickedOn = v8,
        enabled = u171,
        votingText = v6,
        onHover = function(a1) -- Line: 142 -- upvalues: u175 (val) -- types: a1: string
            u175(a1)
        end,
        onUnhover = function() -- Line: 145 -- upvalues: u175 (val)
            u175("")
        end,
        selectCurse = function(a1) -- Line: 148 -- upvalues: u177 (val), CurseVote (upval) -- types: a1: string
            u177(a1)
            CurseVote:fireServer("Vote", a1)
        end,
    })
end