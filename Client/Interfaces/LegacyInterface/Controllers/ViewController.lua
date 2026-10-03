-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController
-- Decompile time: 6.84 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
MediaQuery = require(ReplicatedStorage.Shared.UI.Components.MediaQuery)
LazyLoader = require(ReplicatedStorage.Shared.UI.LazyLoader)
Emitter = require(ReplicatedStorage.Shared.Modules.Emitter)
local ScreenStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ScreenStore)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)
local u82 = RunService:IsRunning()
local u87 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local u88 = false
local u89 = false
local u98 = nil
if u82 then
    u98 = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Nametag)
end
local v1 = {_notifyEmitter = Emitter.new()}
v1.__index = v1
local u103 = {}

local function waitForNotifications() -- Line: 39 -- upvalues: u88 (ref)
    while u88 ~= true do
        task.wait()
    end
end

function v1.init(a1, a2) -- Line: 46
    -- upvalues: u89 (ref), ScreenStore (val), ViewStateStore (val), u82 (val), Lighting (val), VRService (val)
    -- upvalues: TweenService (val), u87 (val), StarterGui (val), UserInputService (val), u98 (ref), Charm (val)
    if u89 then
        if a2 then
            a2()
        end
        return
    end
    u89 = true
    local _notifyEmitter = a1._notifyEmitter or Emitter.new()
    a1._notifyEmitter = _notifyEmitter
    a1._emitters = {}
    MediaQuery(function(a1, a2) -- Line: 60 -- upvalues: ScreenStore (upval)
        ScreenStore.setScreenInfo(a1, a2)
    end)

    local function u39() end

    local function getTargetBlur() -- Line: 65 -- upvalues: ViewStateStore (upval)
        local v1 = ViewStateStore.getState()
        if v1.enabled then
            return v1.blur
        end
        return 0
    end

    if u82 then
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "InterfaceBlur"
        BlurEffect.Parent = Lighting
        local v1 = if not VRService.VREnabled then ViewStateStore.getBlur() else ViewStateStore.getBlur() / 40
        BlurEffect.Size = v1
        BlurEffect.Enabled = not VRService.VREnabled
        local u38 = nil

        function u39(a1) -- Line: 80
            -- upvalues: VRService (upval), u38 (ref), TweenService (upval), BlurEffect (val), u87 (upval)
            local v1 = if not VRService.VREnabled then a1 else a1 / 40
            if u38 then
                u38:Cancel()
            end
            u38 = TweenService:Create(BlurEffect, u87, {Size = v1})
            u38:Play()
        end
    end

    local function toggleStarterCores(a1) -- Line: 93
        -- upvalues: StarterGui (upval), UserInputService (upval)
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, a1)
        UserInputService.ModalEnabled = not a1
    end

    local function updateMobileView() -- Line: 99
        -- upvalues: ScreenStore (upval), StarterGui (upval), UserInputService (upval)
        if not ScreenStore.getIsMobile() then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
            UserInputService.ModalEnabled = false
        end
    end

    local function updateView() -- Line: 106
        -- upvalues: ViewStateStore (upval), ScreenStore (upval), StarterGui (upval), UserInputService (upval)
        -- upvalues: u39 (ref), u82 (upval), u98 (upval)
        local v1 = ViewStateStore.getCurrentView()
        local v2 = ScreenStore.getIsMobile()
        local v3 = true
        if v1 ~= "Hotbar" then
            v3 = true
            if v1 ~= "Upgrades" then
                v3 = true
                if v1 ~= "Music" then
                    v3 = true
                    if v1 ~= "" then
                        v3 = v1 == nil
                    end
                end
            end
        end
        if v2 then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, v3)
            UserInputService.ModalEnabled = not v3
        end
        local v4 = u39
        local v5 = ViewStateStore.getState()
        v4(if not v5.enabled then 0 else v5.blur)
        if u82 then
            u98.setEnabled(v3)
        end
    end

    Charm.listen(function() -- Line: 130 -- upvalues: ViewStateStore (upval)
        local v1 = ViewStateStore.getState()
        if v1.enabled then
            return v1.blur
        end
        return 0
    end, u39)
    Charm.subscribe(ViewStateStore.getCurrentView, updateView)
    Charm.subscribe(ScreenStore.getIsMobile, function() -- Line: 136 -- upvalues: ScreenStore (upval), StarterGui (upval), UserInputService (upval), updateView (val)
        if not ScreenStore.getIsMobile() then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
            UserInputService.ModalEnabled = false
        end
        updateView()
    end)
    updateView()
    local v2 = u39
    local v3 = ViewStateStore.getState()
    v2(if not v3.enabled then 0 else v3.blur)
    if a2 then
        a2()
    end
end

function v1.getEnabled(a1) -- Line: 150 -- upvalues: ViewStateStore (val)
    return ViewStateStore.getEnabled
end

function v1.setEnabled(a1, a2) -- Line: 155 -- upvalues: ViewStateStore (val)
    ViewStateStore.setEnabled(a2)
end

function v1.getView(a1) -- Line: 160 -- upvalues: ViewStateStore (val)
    return ViewStateStore.getCurrentView
end

function v1.getCurrentView(a1) -- Line: 164 -- upvalues: ViewStateStore (val)
    return ViewStateStore.getCurrentView()
end

function v1.setBlur(a1, a2) -- Line: 169 -- upvalues: VRService (val), ViewStateStore (val)
    if not VRService.VREnabled then
        ViewStateStore.setBlur(a2)
        return
    end
    ViewStateStore.setBlur(0)
end

function v1.getNotificationEmitter(a1) -- Line: 178 -- upvalues: u88 (ref)
    u88 = true
    return a1._notifyEmitter
end

function v1.getEmitter(a1, a2) -- Line: 184
    local v1 = a1._emitters[a2]
    if v1 then
        return v1
    end
    v1 = Emitter.new()
    a1._emitters[a2] = v1
    return v1
end

function v1.getPrompts(a1) -- Line: 196 -- upvalues: ViewStateStore (val)
    return ViewStateStore.getPrompts
end

function v1.getCurrentPrompt(a1) -- Line: 201 -- upvalues: ViewStateStore (val)
    return ViewStateStore.getPrompts()[1]
end

function v1.getViewEnabled(a1, a2) -- Line: 206 -- upvalues: Charm (val), ViewStateStore (val)
    return Charm.computed(function() -- Line: 207 -- upvalues: ViewStateStore (upval), a2 (val)
        return ViewStateStore.getEnabled() and ViewStateStore.getCurrentView() == a2
    end)
end

function v1.closePrompt(a1, a2) -- Line: 213 -- upvalues: ViewStateStore (val)
    ViewStateStore.closePrompt(a2)
end

function v1.prompt(a1, a2, a3) -- Line: 218 -- upvalues: ViewStateStore (val)
    if a2.Override ~= true and ViewStateStore.getPrompts()[1] then
        return
    end
    for i, j in ViewStateStore.getPrompts() do
        if a2.Subject == a2.Subject then
            return
        end
    end
    return ViewStateStore.addPrompt(a2, a3)
end

function v1:notifyError(a2, a3) -- Line: 236
    return self:notify("Error: " .. a2, a3, (Color3.new(1, 0, 0)))
end

function v1:notify(a2, a3, a4, a5, a6) -- Line: 241 -- upvalues: u88 (ref)
    if a2 and a2 ~= "" then
        if u88 then
            self._notifyEmitter:Emit("notification", {
                text = a2,
                timeout = a3 or 5,
                icon = a5,
                color = a4,
                sound = a6,
            })
            return
        end
        task.spawn(function() -- Line: 259 -- upvalues: u88 (upval), self (val), a2 (val), a3 (val), a5 (val), a4 (val), a6 (val)
            while u88 ~= true do
                task.wait()
            end
            self._notifyEmitter:Emit("notification", {
                text = a2,
                timeout = a3 or 5,
                icon = a5,
                color = a4,
                sound = a6,
            })
        end)
        return
    end
end

function v1.onViewChange(a1, a2) -- Line: 272 -- upvalues: Charm (val), ViewStateStore (val)
    return Charm.listen(ViewStateStore.getCurrentView, a2)
end

local u138 = FFlagController.get("inventory.disabled", false)
local u142 = FFlagController.get("shop.disabled", false)

function v1.isViewDisabledForMaintenance(a1, a2) -- Line: 279 -- upvalues: u138 (val), u142 (val)
    if a2 == "Inventory" then
        return u138()
    end
    if a2 == "Shop" then
        return u142()
    end
end

function v1:setView(a2) -- Line: 288 -- upvalues: u103 (val), ViewStateStore (val), NewNetwork (val)
    local v1
    if self:isViewDisabledForMaintenance(a2) then
        self:notifyError(("%* is currently disabled for maintenance!"):format(a2), 2)
        return
    end
    if a2 == "Hotbar" or a2 == "" then
        v1 = table.remove(u103, 1)
        if v1 then
            a2 = v1
        end
    end
    if a2 == "Hotbar" or a2 == "Inventory" or a2 == "Shop" then
        v1 = ViewStateStore.getCurrentView()
        if v1 ~= "Shop" then
            if a2 == "Shop" and v1 ~= "Shop" then
                NewNetwork.Channel("Shop"):fireUnreliableServer("OpenShop")
            end
        elseif a2 ~= "Shop" then
            NewNetwork.Channel("Shop"):fireUnreliableServer("CloseShop")
        elseif a2 == "Shop" and v1 ~= "Shop" then
            NewNetwork.Channel("Shop"):fireUnreliableServer("OpenShop")
        end
        if a2 == "Inventory" and v1 ~= "Inventory" then
            NewNetwork.Channel("Inventory"):fireUnreliableServer("OpenInventory")
        end
    end
    ViewStateStore.setView(a2)
end

function v1.queueView(a1, a2) -- Line: 318 -- upvalues: ViewStateStore (val), u103 (val)
    local v1 = ViewStateStore.getCurrentView()
    if v1 == a2 then
        return
    end
    if v1 ~= "Hotbar" and v1 ~= "" then
        table.insert(u103, a2)
        return
    end
    a1:setView(a2)
end

return (LazyLoader(v1))