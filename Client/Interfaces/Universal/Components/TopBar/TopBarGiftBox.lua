-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.TopBarGiftBox
-- Decompile time: 4.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Giftbox = require(ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Giftbox)
local GiftboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.GiftboxStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local useRef = React.useRef
local useMemo = React.useMemo
local useEffect = React.useEffect
local createElement = React.createElement

local function getGiftBoxTemplate() -- Line: 20 -- upvalues: ReplicatedStorage (val)
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    local Templates = Assets and Assets:FindFirstChild("Templates")
    local UI = Templates and Templates:FindFirstChild("UI")
    return UI and UI:FindFirstChild("Giftbox")
end

return function(a1) -- Line: 27
    -- upvalues: useRef (val), ReactCharm (val), GiftboxStore (val), useMemo (val), getGiftBoxTemplate (val)
    -- upvalues: Giftbox (val), useEffect (val), createElement (val)
    local u2 = useRef()
    local giftBoxOpen = a1.giftBoxOpen
    local setButtonVisible = a1.setButtonVisible
    local u9 = ReactCharm.useSignalState(GiftboxStore.getShowButton)
    local u13 = useMemo(getGiftBoxTemplate, {})
    local v1 = {u13}
    local u18 = useMemo(function() -- Line: 35 -- upvalues: u13 (val)
        if not u13 then
            return nil
        end
        local v1 = u13:Clone()
        v1.Name = "Frame"
        return v1
    end, v1)
    local v2 = {u18}
    local u23 = useMemo(function() -- Line: 45 -- upvalues: u18 (val), Giftbox (upval)
        if not u18 then
            return nil
        end
        Giftbox.Container = u18.Content
        Giftbox:Initialize()
        return Giftbox
    end, v2)
    local v3 = {u18, u9}
    useEffect(function() -- Line: 55 -- upvalues: setButtonVisible (val), u18 (val), u9 (val)
        local v1 = false
        if u18 ~= nil then
            v1 = u9
        end
        setButtonVisible(v1)
    end, v3)
    v3 = {u18, u23}
    useEffect(function() -- Line: 59 -- upvalues: u18 (val), u23 (val)
        if u18 and u23 then
            return function() -- Line: 64 -- upvalues: u23 (upval), u18 (upval)
                u23:Destroy()
                u18:Destroy()
            end
        end
    end, v3)
    v3 = {u18, u2}
    useEffect(function() -- Line: 70 -- upvalues: u18 (val), u2 (val)
        if u18 and u2.current then
            u18.Parent = u2.current
        end
    end, v3)
    v3 = {u23, giftBoxOpen}
    useEffect(function() -- Line: 76 -- upvalues: u23 (val), giftBoxOpen (val)
        if not u23 then
            return
        end
        if giftBoxOpen then
            u23:Open()
            return
        end
        u23:Close()
    end, v3)
    if u18 and u23 then
        return createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 36),
            Position = UDim2.fromOffset(0, 0),
            AnchorPoint = Vector2.new(0, 0),
            ref = u2,
        }, {})
    end
    return nil
end