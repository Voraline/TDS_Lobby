-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.GlitchEffect
-- Decompile time: 5.43 ms

game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GlitchScreenStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.GlitchScreenStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local LocalPlayer = game.Players.LocalPlayer
local createElement = React.createElement
local u68 = Random.new()
local NumberValue = Instance.new("NumberValue")
NumberValue.Value = 1
local u74 = tick()
local u75 = nil
local u76 = nil

local function render() -- Line: 29
    -- upvalues: ReactCharm (val), GlitchScreenStore (val), useReactBinding (val), React (val), u76 (ref)
    -- upvalues: NumberValue (val), u75 (ref), TweenService (val), Shaker (val), RunService (val), u74 (ref), u68 (val)
    local u4 = ReactCharm.useSignalState(GlitchScreenStore.getState)
    local v1, u8 = useReactBinding(1)
    React.useEffect(function() -- Line: 34 -- upvalues: u76 (upval), NumberValue (upval), u8 (val)
        u76 = Instance.new("ColorCorrectionEffect")
        u76.Parent = game:GetService("Lighting")
        u76:AddTag("DONT_TOUCH")
        NumberValue.Changed:Connect(function() -- Line: 39 -- upvalues: u8 (upval), NumberValue (upval)
            u8(NumberValue.Value)
        end)
        return function() -- Line: 43 -- upvalues: u76 (upval), NumberValue (upval)
            u76:Destroy()
            NumberValue:Destroy()
        end
    end, {})
    local v2 = {u4}
    React.useEffect(function() -- Line: 49
        -- upvalues: u75 (upval), u4 (val), TweenService (upval), NumberValue (upval), Shaker (upval)
        -- upvalues: RunService (upval), u74 (upval), u76 (upval), u68 (upval)
        if u75 then
            u75:Disconnect()
        end
        if not u4.enabled then
            TweenService:Create(NumberValue, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 1}):Play()
            TweenService:Create(u76, TweenInfo.new(2), {Contrast = 0, Brightness = 0, Saturation = 0}):Play()
        else
            TweenService:Create(NumberValue, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
            Shaker:Shake({1, 60, 0, 1.5}, 0.1, 3)
            u75 = RunService.Heartbeat:Connect(function(a1) -- Line: 62 -- upvalues: u74 (upval), u76 (upval), u68 (upval)
                if 0.093 < tick() - u74 then
                    u74 = tick()
                    u76.Contrast = u68:NextNumber(0, 0.3)
                    u76.Brightness = u68:NextNumber(-0.3, 0)
                    u76.Saturation = u68:NextNumber(-2, 1)
                end
            end)
        end
        return function() -- Line: 83 -- upvalues: u75 (upval)
            if u75 then
                u75:Disconnect()
            end
        end
    end, v2)
    return React.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        fade = React.createElement("ImageLabel", {
            Image = "rbxassetid://12293645094",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(2.7, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            ImageTransparency = v1,
        }),
    })
end

return function(a1) -- Line: 111
    -- upvalues: React (val), GameState (val), GlitchScreenStore (val), createElement (val), render (val)
    a1.setDisplayOrder(3)
    a1.setIgnoreGuiInset(true)
    React.useEffect(function() -- Line: 115 -- upvalues: GameState (upval), GlitchScreenStore (upval)
        local u9 = (GameState.Replicator:GetStateChangedSignal("GlitchEffect")):Connect(function() -- Line: 118 -- upvalues: GameState (upval), GlitchScreenStore (upval)
            local v1 = GameState.Replicator:Get("GlitchEffect")
            GlitchScreenStore.setEnabled(v1)
        end)
        return function() -- Line: 123 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    return createElement(render)
end