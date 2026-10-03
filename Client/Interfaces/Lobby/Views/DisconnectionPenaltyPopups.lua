-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.DisconnectionPenaltyPopups
-- Decompile time: 3.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controllers = ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(Controllers.ViewController)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useCache = require(Hooks.useCache)
local useMemo = React.useMemo
local useRef = React.useRef
local RejoinMatchPopup = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.DisconnectionPenalty.RejoinMatchPopup)
local RestrictedPopup = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.DisconnectionPenalty.RestrictedPopup)

local function v1() -- Line: 26 -- upvalues: ViewController (val)
    return ViewController:getCurrentView() == "RejoinMatchPopup"
end

local function v2() -- Line: 31 -- upvalues: ViewController (val)
    return ViewController:getCurrentView() == "RestrictedPopup"
end

local function mapValueToOffset(a1) -- Line: 36
    return math.clamp((a1 - 0) / 30, 0, 1) * 1 + -0.5
end

return function() -- Line: 47
    -- upvalues: useCache (val), useBinding (val), ViewController (val), useEffect (val), useRef (val), NewNetwork (val)
    -- upvalues: createElement (val), RejoinMatchPopup (val), RestrictedPopup (val)
    local u3 = useCache("DisconnectionPenalty.DisconnectionStart", 0)
    local u7 = useCache("DisconnectionPenalty.PenalizedDuration", 0)
    local u11 = useCache("DisconnectionPenalty.PenalizedStart", 0)
    local v1, u15 = useBinding(0)
    local v2, u19 = useBinding(-0.5)
    local v3, u23 = useBinding(function() -- Line: 54 -- upvalues: ViewController (upval)
        return ViewController:getCurrentView() == "RejoinMatchPopup"
    end)
    local v4, u27 = useBinding(function() -- Line: 57 -- upvalues: ViewController (upval)
        return ViewController:getCurrentView() == "RestrictedPopup"
    end)
    useEffect(function() -- Line: 61 -- upvalues: ViewController (upval), u23 (val), u27 (val)
        return (ViewController:onViewChange(function(a1) -- Line: 62 -- upvalues: u23 (upval), ViewController (upval), u27 (upval)
            u23(ViewController:getCurrentView() == "RejoinMatchPopup")
            u27(ViewController:getCurrentView() == "RestrictedPopup")
        end))
    end, {})
    local u34 = useRef(nil)
    local u37 = useRef(nil)
    local v5 = {u7}
    useEffect(function() -- Line: 73 -- upvalues: u3 (val), u34 (val), u7 (val), u11 (val), u15 (val), ViewController (upval)
        if os.time() - u3 < 30 then
            return
        end
        if u34.current then
            task.cancel(u34.current)
        end
        u34.current = task.spawn(function() -- Line: 83 -- upvalues: u7 (upval), u11 (upval), u15 (upval), ViewController (upval)
            local v1 = u7 - (os.time() - u11)
            u15(v1)
            while task.wait(1) do
                if not (os.time() - u11 < u7) then
                    break
                end
                v1 = u7 - (os.time() - u11)
                u15(v1)
            end
            u15(0)
            if ViewController:getCurrentView() == "RestrictedPopup" then
                ViewController:setView("Hotbar")
            end
        end)
        return function() -- Line: 101 -- upvalues: u34 (upval)
            if u34.current then
                task.cancel(u34.current)
            end
        end
    end, v5)
    v5 = {u3}
    useEffect(function() -- Line: 108 -- upvalues: u37 (val), u3 (val), u19 (val)
        if u37.current then
            task.cancel(u37.current)
        end
        u37.current = task.spawn(function() -- Line: 113 -- upvalues: u3 (upval), u19 (upval)
            local v1 = 30 - (os.time() - u3)
            u19(math.clamp((v1 - 0) / 30, 0, 1) * 1 + -0.5)
            while task.wait(1) do
                if not (os.time() - u3 < 30) then
                    break
                end
                v1 = 30 - (os.time() - u3)
                u19(math.clamp((v1 - 0) / 30, 0, 1) * 1 + -0.5)
            end
            u19(-0.5)
        end)
        return function() -- Line: 125 -- upvalues: u37 (upval)
            if u37.current then
                task.cancel(u37.current)
            end
        end
    end, v5)

    local function onClose() -- Line: 132 -- upvalues: ViewController (upval)
        ViewController:setView("Hotbar")
    end

    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        RejoinMatchPopup = createElement(RejoinMatchPopup, {
            Visible = v3,
            OnClose = onClose,
            OnRejoin = function() -- Line: 136 -- upvalues: NewNetwork (upval), ViewController (upval)
                task.defer(function() -- Line: 138 -- upvalues: NewNetwork (upval), ViewController (upval)
                    NewNetwork.Channel("Rejoin"):fireServer("Request")
                    ViewController:setView("Hotbar")
                end)
            end,
            Offset = v2,
        }),
        RestrictedPopup = createElement(RestrictedPopup, {Visible = v4, OnClose = onClose, TimeLeft = v1}),
    })
end