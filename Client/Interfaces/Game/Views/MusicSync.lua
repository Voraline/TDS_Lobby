-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.MusicSync
-- Decompile time: 5.01 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local MusicSyncStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.MusicSyncStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Vignette = require(ReplicatedStorage.Client.Interfaces.Game.Components.Vignette)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local LocalPlayer = Players.LocalPlayer
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local NumberValue = Instance.new("NumberValue")
NumberValue.Value = 1

local function render() -- Line: 22
    -- upvalues: useCharmBinding (val), MusicSyncStore (val), useBinding (val), useEffect (val), NumberValue (val)
    -- upvalues: useReactBindings (val), TweenService (val), Scheduler (val), RunService (val), LocalPlayer (val)
    -- upvalues: math (val), createElement (val), Vignette (val)
    local v1 = useCharmBinding(MusicSyncStore.getState)
    local u4 = nil
    local u7, u8 = useBinding(1)
    local u11, u12 = useBinding(0)
    useEffect(function() -- Line: 31 -- upvalues: NumberValue (upval), u12 (val)
        NumberValue.Changed:Connect(function() -- Line: 32 -- upvalues: u12 (upval), NumberValue (upval)
            u12(NumberValue.Value)
        end)
        return function() -- Line: 36 -- upvalues: NumberValue (upval)
            NumberValue:Destroy()
        end
    end, {})
    local v2 = {v1}
    useReactBindings(function(a1) -- Line: 41 -- upvalues: TweenService (upval), NumberValue (upval)
        if a1.enabled then
            TweenService:Create(NumberValue, TweenInfo.new(a1.fadeOutTime), {Value = 0}):Play()
        end
    end, v2)
    v2 = {v1}
    useReactBindings(function(a1) -- Line: 48
        -- upvalues: u4 (ref), NumberValue (upval), Scheduler (upval), RunService (upval), LocalPlayer (upval)
        -- upvalues: u11 (val), math (upval), u7 (val), u8 (val), TweenService (upval)
        if not a1.enabled then
            if u4 then
                u4()
            end
            TweenService:Create(workspace.CurrentCamera, TweenInfo.new(2), {FieldOfView = 70}):Play()
            u8(1)
        else
            if u4 then
                NumberValue.Value = 1
                u4:Disconnect()
            end
            u4 = Scheduler.addDynamic("MusicSync", RunService.RenderStepped, function(a1) -- Line: 55 -- upvalues: LocalPlayer (upval), u11 (upval), math (upval), u7 (upval), u8 (upval)
                local v1 = LocalPlayer.PlayerGui.SoundGui["Controller Global Background"].PlaybackLoudness * u11:getValue()
                local v2 = 1 - v1 / 800
                local v3 = 70 - v1 / 200
                workspace.CurrentCamera.FieldOfView = math.lerp(workspace.CurrentCamera.FieldOfView, v3, a1 * 20)
                local v4 = math.lerp(u7:getValue(), v2, a1 * 20)
                u8(v4)
            end)
        end
        return function() -- Line: 77 -- upvalues: u4 (upval)
            if u4 then
                u4()
            end
        end
    end, v2)
    return (createElement(Vignette, {
        Image = "5945121255",
        transparency = u7,
        color = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1.1, 1.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }))
end

return function(a1) -- Line: 93 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(-5)
    a1.setIgnoreGuiInset(true)
    return createElement(render)
end