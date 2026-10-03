-- Script path: ReplicatedStorage.Client.Interfaces.Universal
-- Decompile time: 2.70 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Charm = require(ReplicatedStorage.Packages.Charm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local v1 = {}
local Value = workspace:WaitForChild("Type").Value
local u45 = {Game = {GlitchEffectTextEvent = false}, Lobby = {Communications = true, Hotbar = true}}

local function shouldSkipView(a1) -- Line: 27 -- upvalues: u45 (val), Value (val) -- types: a1: userdata
    local v1 = u45[Value]
    return v1 and v1[a1.Name]
end

local function warnViewError(a1, a2, a3) -- Line: 32 -- types: a1: string, a2: string
    warn((("Error occurred while %* universal view \"%*\": %*"):format(a1, a2, a3)))
end

local function mountView(a1, a2, a3) -- Line: 36
    -- upvalues: Create (val), ReactRoblox (val), createElement (val)
    local Name = a2.Name
    local success, result = pcall(require, a2)
    if not success then
        warn((("Error occurred while loading universal view \"%*\": %*"):format(Name, result)))
        return
    end
    if typeof(result) ~= "function" and typeof(result) ~= "table" then
        local v1 = (("view returned %* instead of React component"):format((typeof(result))))
        warn((("Error occurred while loading universal view \"%*\": %*"):format(Name, v1)))
        return
    end
    local u62 = if not a3[Name] then Create("ScreenGui", {
        ResetOnSpawn = false,
        Name = ("ReactUniversal%*"):format(Name),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = if Name ~= "QAWatermark" then if Name ~= "SelectionList" then 1001 else 9999 else 9999,
        Parent = a1,
    }) else a3[Name]
    local u67 = ReactRoblox.createRoot(u62)
    local u78 = createElement(result, {
        setZIndexBehavior = function(a1) -- Line: 71 -- upvalues: u62 (ref)
            u62.ZIndexBehavior = a1
        end,
        setDisplayOrder = function(a1) -- Line: 74 -- upvalues: u62 (ref)
            u62.DisplayOrder = a1
        end,
        setIgnoreGuiInset = function(a1) -- Line: 77 -- upvalues: u62 (ref)
            u62.IgnoreGuiInset = a1
        end,
        setScreenInsets = function(a1) -- Line: 80 -- upvalues: u62 (ref)
            u62.ScreenInsets = a1
        end,
        screen = u62,
    })
    local success_2, result_2 = pcall(function() -- Line: 86 -- upvalues: u67 (val), u78 (val)
        u67:render(u78)
    end)
    if not success_2 then
        warn((("Error occurred while rendering universal view \"%*\": %*"):format(Name, result_2)))
        u62:Destroy()
    end
end

function v1.OnSpotlight(a1) -- Line: 95 -- upvalues: SpotlightStore (val), Charm (val) -- types: a1: function
    a1(SpotlightStore.getState().selected)
    return Charm.listen(function() -- Line: 102 -- upvalues: SpotlightStore (upval)
        return SpotlightStore.getState().selected
    end, function() -- Line: 96 -- upvalues: SpotlightStore (upval), a1 (val)
        a1((SpotlightStore.getState()).selected)
    end)
end

function v1.Init() -- Line: 107 -- upvalues: Players (val), Create (val), u45 (val), Value (val), mountView (val)
    local v1
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local v2 = {
        Dialog = Create("ScreenGui", {
            Name = "ReactOverridesDialog",
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            DisplayOrder = 1002,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            Parent = PlayerGui,
        }),
    }
    v2.TopBar = Create("ScreenGui", {
        Name = "ReactOverridesTopBar",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets,
        Parent = PlayerGui,
    })
    v2.Vote = Create("ScreenGui", {
        Name = "ReactOverridesVote",
        ResetOnSpawn = false,
        DisplayOrder = 1000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.CurseVoteView = Create("ScreenGui", {
        Name = "ReactOverridesCurseVoteView",
        ResetOnSpawn = false,
        DisplayOrder = 99999,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.Tooltips = Create("ScreenGui", {
        Name = "ReactOverridesTooltips",
        ResetOnSpawn = false,
        DisplayOrder = 10000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.Spotlight = Create("ScreenGui", {
        Name = "ReactOverridesSpotlight",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 10000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.Loading = Create("ScreenGui", {
        Name = "ReactOverridesLoading",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 100000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.Modifiers = Create("ScreenGui", {
        Name = "ReactOverridesModifiers",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = -1000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.Notifications = Create("ScreenGui", {
        Name = "ReactOverridesNotifications",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 10000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.SoftShutdown = Create("ScreenGui", {
        Name = "SoftShutdown",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 1000000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    v2.PlayerCountdown = Create("ScreenGui", {
        Name = "PlayerCountdown",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 10000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    for i, v in ipairs(script.Views:GetChildren()) do
        if v:IsA("ModuleScript") then
            v1 = u45[Value]
            if not v1 or not v1[v.Name] then
                task.spawn(mountView, PlayerGui, v, v2)
            end
        end
    end
end

return v1