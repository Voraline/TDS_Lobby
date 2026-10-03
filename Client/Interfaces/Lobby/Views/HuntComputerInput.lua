-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.HuntComputerInput
-- Decompile time: 4.70 ms

local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local HuntInput = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.HuntComputer.HuntInput)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useBadges = require(ReplicatedStorage.Client.Interfaces.Hooks.useBadges)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local Hunt = NewNetwork.Channel("Hunt")
local CurrentCamera = workspace.CurrentCamera

local function prompt(a1) -- Line: 31
    -- upvalues: ReactRoblox (val), createElement (val), React (val)
    local createPortal = ReactRoblox.createPortal
    local v1 = {}
    local v2 = createElement
    local v3 = {
        Name = "Interactable",
        ObjectText = "Interact",
        Style = Enum.ProximityPromptStyle.Custom,
        RequiresLineOfSight = false,
    }
    v3[React.Event.Triggered] = a1.onTriggered
    v1[1] = v2("ProximityPrompt", v3)
    return createPortal(v1, a1.part)
end

local u79 = React.memo(function() -- Line: 43
    -- upvalues: React (val), useFFlag (val), useMemo (val), useBadges (val), table (val), createElement (val)
    -- upvalues: prompt (val), CurrentCamera (val), TweenService (val), Lighting (val), ViewController (val)
    -- upvalues: useEffect (val), CollectionService (val), HuntInput (val), Hunt (val)
    local v1, u4 = React.useState(false)
    local u8, u9 = React.useState({})
    local v2, u14 = React.useState(false)
    local v3, u19 = React.useState("")
    local v4 = useFFlag("event.useTestingBadge", true)
    local v5 = useFFlag("event.testBadgeId", 2959399198952876)
    local v6 = useFFlag("event.chainBadgeId", 0)
    local u35 = useFFlag("event.megaBadgeId", 0)
    local v7 = useFFlag("event.objectiveActive", false)
    local u41 = if not v4 then v6 else v5
    local v8 = {u41}
    local v9 = useMemo(function() -- Line: 56 -- upvalues: u35 (val), u41 (val)
        return {u35, u41}
    end, v8)
    local u51 = useBadges(v9)
    local v10 = {u51}
    v8 = useMemo(function() -- Line: 61 -- upvalues: table (upval), u51 (val)
        return table.reduce(u51, function(a1, a2, a3) -- Line: 62 -- upvalues: table (upval)
            if a2 then
                table.insert(a1, a2)
            end
            return a1
        end, {})
    end, v10)

    local function createPrompt(a1) -- Line: 70
        -- upvalues: createElement (upval), prompt (upval), u4 (val), CurrentCamera (upval), TweenService (upval)
        -- upvalues: Lighting (upval), ViewController (upval)
        return createElement(prompt, {
            part = a1,
            onTriggered = function() -- Line: 73
                -- upvalues: u4 (upval), CurrentCamera (upval), TweenService (upval), a1 (val), Lighting (upval)
                -- upvalues: ViewController (upval)
                u4(true)
                CurrentCamera.CameraType = Enum.CameraType.Scriptable
                TweenService:Create(CurrentCamera, TweenInfo.new(1), {
                    FieldOfView = 50,
                    CFrame = CFrame.lookAt(a1.CFrame * CFrame.new(0, 0, -5).Position, a1.Position),
                }):Play()
                Lighting.DepthOfField.Enabled = true
                TweenService:Create(Lighting.DepthOfField, TweenInfo.new(1), {FarIntensity = 1, InFocusRadius = 3, NearIntensity = 0.75}):Play()
                ViewController:setView("Crate")
            end,
        })
    end

    useEffect(function() -- Line: 97
        -- upvalues: CollectionService (upval), createElement (upval), prompt (upval), u4 (val), CurrentCamera (upval)
        -- upvalues: TweenService (upval), Lighting (upval), ViewController (upval), table (upval), u9 (val), u8 (val)
        local v1
        local v2 = {}
        for i, v in ipairs(CollectionService:GetTagged("HuntSuperComputer")) do
            v1 = createElement(prompt, {
                part = v,
                onTriggered = function() -- Line: 73
                    -- upvalues: u4 (upval), CurrentCamera (upval), TweenService (upval), v (val), Lighting (upval)
                    -- upvalues: ViewController (upval)
                    u4(true)
                    CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    TweenService:Create(CurrentCamera, TweenInfo.new(1), {
                        FieldOfView = 50,
                        CFrame = CFrame.lookAt(v.CFrame * CFrame.new(0, 0, -5).Position, v.Position),
                    }):Play()
                    Lighting.DepthOfField.Enabled = true
                    TweenService:Create(
                        Lighting.DepthOfField,
                        TweenInfo.new(1),
                        {FarIntensity = 1, InFocusRadius = 3, NearIntensity = 0.75}
                    ):Play()
                    ViewController:setView("Crate")
                end,
            })
            table.insert(v2, v1)
        end
        u9(v2)
        local u31 = (CollectionService:GetInstanceAddedSignal("HuntSuperComputer")):Connect(function(a1) -- Line: 107
            -- upvalues: table (upval), u8 (upval), createElement (upval), prompt (upval), u4 (upval)
            -- upvalues: CurrentCamera (upval), TweenService (upval), Lighting (upval), ViewController (upval)
            -- upvalues: u9 (upval)
            local v1 = table.deepClone(u8)
            local v2 = createElement(prompt, {
                part = a1,
                onTriggered = function() -- Line: 73
                    -- upvalues: u4 (upval), CurrentCamera (upval), TweenService (upval), a1 (val), Lighting (upval)
                    -- upvalues: ViewController (upval)
                    u4(true)
                    CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    TweenService:Create(CurrentCamera, TweenInfo.new(1), {
                        FieldOfView = 50,
                        CFrame = CFrame.lookAt(a1.CFrame * CFrame.new(0, 0, -5).Position, a1.Position),
                    }):Play()
                    Lighting.DepthOfField.Enabled = true
                    TweenService:Create(
                        Lighting.DepthOfField,
                        TweenInfo.new(1),
                        {FarIntensity = 1, InFocusRadius = 3, NearIntensity = 0.75}
                    ):Play()
                    ViewController:setView("Crate")
                end,
            })
            table.insert(v1, v2)
            u9(v1)
        end)
        return function() -- Line: 114 -- upvalues: u31 (ref)
            u31:Disconnect()
        end
    end, {})
    v10 = createElement(HuntInput, {
        uiVisible = v1,
        closed = function() -- Line: 121 -- upvalues: u4 (val), Lighting (upval), CurrentCamera (upval), ViewController (upval)
            u4(false)
            Lighting.DepthOfField.Enabled = false
            CurrentCamera.CameraType = Enum.CameraType.Custom
            CurrentCamera.FieldOfView = 70
            ViewController:setView("Hotbar")
        end,
        complete = v2,
        successText = v3,
        entered = function(a1) -- Line: 130 -- upvalues: Hunt (upval), u14 (val), u19 (val) -- types: a1: string
            if not (#a1 >= 255) and #a1 ~= 0 then
                local v1, v2 = Hunt:invokeServer("Submit", a1)
                if v1 then
                    u14(true)
                    u19(v2)
                end
                return v1
            end
            return false
        end,
    })
    if #v8 ~= 0 and #v8 ~= #v9 and u51[u41] and v7 then
        return React.createElement(React.Fragment, nil, {Input = v10, Prompts = createElement(React.Fragment, nil, u8)})
    end
    return nil
end)
return function() -- Line: 160 -- upvalues: React (val), u79 (val)
    if workspace.Type.Value ~= "Lobby" then
        return nil
    end
    return React.createElement(u79)
end