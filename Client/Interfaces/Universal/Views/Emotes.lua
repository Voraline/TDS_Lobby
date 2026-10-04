-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Emotes
-- Decompile time: 18.97 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local CutsceneStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.CutsceneStore)
local EmoteWheel = require(ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel)
local HotKey = require(ReplicatedStorage.Client.Modules.HotKey)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local Stickers = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Stickers)
local StickerController = require(ReplicatedStorage.Client.Controllers.Shared.StickerController)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local useRef = React.useRef
local useState = React.useState
local useMemo = React.useMemo
local useEffect = React.useEffect
local useCallback = React.useCallback
local createElement = React.createElement
local Sticker = Content("Sticker")
local Emote = Content("Emote")
local Inventory = Network.Channel("Inventory")

local function getLocalCharacter(a1) -- Line: 34
    -- upvalues: PlayerReplicator (val), Players (val)
    local v1, v2
    if a1 == false then
        v1 = (PlayerReplicator.GetEntityFromPlayer(Players.LocalPlayer)) ~= nil
    else
        local v3, v4 = PlayerReplicator.GetLocalPlayer():await()
        v1 = v3
        v2 = v4
    end
    if v1 and v2.Character then
        return v2.Character
    end
end

local function usePages(a1, a2) -- Line: 50
    -- upvalues: useState (val), useMemo (val), table (val)
    local u4, u5 = useState(1)
    local v1 = {a1, a2}
    local u11 = useMemo(function() -- Line: 53 -- upvalues: a1 (val), table (upval), a2 (val)
        local v1, v2
        local v3 = {}
        local v4 = {}
        local v5 = {}
        local v6 = 0
        for i in a1 do
            table.insert(v3, i)
        end
        for j, k in a2 do
            v2 = table.find(v3, k)
            if v2 then
                v1 = v3[v2]
                v3[v2] = v3[j]
                v3[j] = v1
            end
        end
        local v7 = nil
        local v8 = nil
        for n, m in v3, v7, v8 do
            v6 = v6 + 1
            if m == "" then
                m = nil
            end
            table.insert(v5, m)
            if v6 >= 6 then
                table.insert(v4, v5)
                v5 = {}
            end
        end
        if #v5 > 0 then
            table.insert(v4, v5)
        end
        return v4
    end, v1)
    return useMemo(function() -- Line: 96 -- upvalues: u4 (val), u11 (val), u5 (val)
        local v1 = {index = u4}
        local v2 = u11[u4] or {}
        v1.page = v2
        v1.maxPages = math.max(1, #u11)

        function v1.setPage(a1) -- Line: 101 -- upvalues: u11 (upval), u4 (upval), u5 (upval) -- types: a1: number
            if #u11 < 2 then
                return
            end
            local v1 = math.clamp(a1, 1, #u11)
            if v1 ~= u4 then
                u5(v1)
            end
        end

        return v1
    end, {u4, u11, u5})
end

return function(a1) -- Line: 115
    -- upvalues: useRef (val), useView (val), useSound (val), useState (val), useCache (val), useMemo (val), table (val)
    -- upvalues: Emote (val), Sticker (val), usePages (val), Stickers (val), HotKey (val), useCallback (val)
    -- upvalues: useEffect (val), CutsceneStore (val), PlayerReplicator (val), ViewController (val)
    -- upvalues: StickerController (val), Inventory (val), createElement (val), EmoteWheel (val)
    local u3 = useRef(false)
    local u6, u7 = useView(true)
    local u11 = useSound("Swoosh", true)
    local u14, u15 = useState(false)
    local u18, u19 = useState(nil)
    local u22 = useRef(nil)
    local u25 = useRef(nil)
    u25.current = u14
    u22.current = u18 ~= nil
    local u33 = useCache("Inventory.Emotes", {})
    local u37 = useCache("Inventory.Stickers", {})
    local v1 = {u33}
    local v2 = useMemo(function() -- Line: 133 -- upvalues: table (upval), u33 (val), Emote (upval)
        return table.filter(u33, function(a1, a2) -- Line: 134 -- upvalues: Emote (upval)
            return Emote:FindFirstChild(a2) ~= nil
        end)
    end, v1)
    local v3 = {u37}
    local v4 = useMemo(function() -- Line: 139 -- upvalues: table (upval), u37 (val), Sticker (upval)
        return table.filter(u37, function(a1, a2) -- Line: 140 -- upvalues: Sticker (upval)
            return Sticker:FindFirstChild(a2) ~= nil
        end)
    end, v3)
    v1 = useCache("Equipped.Emotes", {})
    v3 = useCache("Equipped.Stickers", {})
    local u59 = usePages(v2, v1)
    local u63 = usePages(v4, v3)
    local v5 = useMemo
    local v6 = {u59.page}
    v5 = v5(function() -- Line: 151 -- upvalues: u59 (val), table (upval)
        local v1 = {}
        for i, j in u59.page do
            table.insert(v1, {animation = true, name = j})
        end
        return v1
    end, v6)
    local v7 = useMemo
    local v8 = {u63.page}
    v7 = v7(function() -- Line: 166 -- upvalues: u63 (val), Stickers (upval), table (upval)
        local v1
        local v2 = {}
        for i, j in u63.page do
            v1 = Stickers(j)
            if v1 then
                table.insert(v2, {name = j, displayName = v1.Name, icon = v1.Icon})
            end
        end
        return v2
    end, v8)
    local u77 = useMemo(function() -- Line: 187 -- upvalues: HotKey (upval)
        return HotKey.new("Emote Wheel", Enum.KeyCode.DPadDown)
    end, {})
    local u81 = useMemo(function() -- Line: 191 -- upvalues: HotKey (upval)
        return HotKey.new("Sticker Wheel", Enum.KeyCode.DPadUp)
    end, {})
    local u86 = useCallback(function() -- Line: 195 -- upvalues: u3 (val), u7 (val)
        local v1 = if not u3.current then "Hotbar" else "Inventory"
        u3.current = false
        u7(v1)
    end)
    useEffect(function() -- Line: 201
        -- upvalues: u6 (val), CutsceneStore (upval), PlayerReplicator (upval), u11 (val), u3 (val), u22 (val)
        -- upvalues: u19 (val), u7 (val), u25 (val), u15 (val), u77 (val), u81 (val), ViewController (upval)
        local function isWheelOpeningBlocked() -- Line: 202 -- upvalues: u6 (upval), CutsceneStore (upval)
            local enabled = true
            if u6:getValue() ~= "Tutorial" then
                enabled = CutsceneStore.getState().enabled
            end
            return enabled
        end

        local function onWheelPressed(a1, a2) -- Line: 206
            -- upvalues: u6 (upval), CutsceneStore (upval), PlayerReplicator (upval), u11 (upval), u3 (upval)
            -- upvalues: u22 (upval), u19 (upval), u7 (upval), u25 (upval), u15 (upval)
            local v1
            if not a1 then
                return
            end
            if not (u6:getValue() == "Emotes") then
                local enabled = true
                if u6:getValue() ~= "Tutorial" then
                    enabled = CutsceneStore.getState().enabled
                end
                if enabled then
                    return
                end
            end
            if not v1 then
                if not a2 then
                    local v2, v3 = PlayerReplicator.GetLocalPlayer():await()
                    local v4 = v3
                    local Character = if not v2 then nil else if v4.Character then v4.Character else nil
                    if Character and Character:StopEmoting() then
                        return
                    end
                end
                u11()
            end
            local v5 = if not u3.current then "Hotbar" else "Inventory"
            if v1 and u22.current then
                u19(nil)
                u3.current = false
            end
            u7(v1 and v5 or "Emotes")
            if u25.current ~= a2 then
                u15(a2)
            end
        end

        local u7_2 = u77.Pressed:Connect(function(a1) -- Line: 241 -- upvalues: u3 (upval), onWheelPressed (val)
            if not a1 then
                return
            end
            u3.current = false
            onWheelPressed(a1, false)
        end)
        local u13 = u81.Pressed:Connect(function(a1) -- Line: 250 -- upvalues: u3 (upval), onWheelPressed (val)
            if not a1 then
                return
            end
            u3.current = false
            onWheelPressed(a1, true)
        end)
        local v1 = ViewController:getEmitter("EquipEmote")
        local v2 = ViewController:getEmitter("ShowWheel")
        local u28 = v1:On("Equip", function(a1, a2) -- Line: 262
            -- upvalues: u6 (upval), CutsceneStore (upval), u19 (upval), u3 (upval), u15 (upval), u7 (upval)
            local enabled = true
            if u6:getValue() ~= "Tutorial" then
                enabled = CutsceneStore.getState().enabled
            end
            if enabled then
                return
            end
            u19({name = a1, sticker = a2})
            u3.current = true
            u15(a2 == true)
            u7("Emotes")
        end)
        local u33 = v2:On("Show", function(a1, a2) -- Line: 277
            -- upvalues: u6 (upval), CutsceneStore (upval), PlayerReplicator (upval), u3 (upval), u15 (upval)
            -- upvalues: u7 (upval)
            local enabled = true
            if u6:getValue() ~= "Tutorial" then
                enabled = CutsceneStore.getState().enabled
            end
            if enabled then
                return
            end
            if a1 ~= "Stickers" then
                local v1, v2 = PlayerReplicator.GetLocalPlayer():await()
                local v3 = v2
                local Character = if not v1 then nil else if v3.Character then v3.Character else nil
                if Character and Character:StopEmoting() then
                    return
                end
            end
            u3.current = a2 ~= false
            u15(a1 == "Stickers")
            u7("Emotes")
        end)
        local u38 = ViewController:onViewChange(function(a1) -- Line: 294 -- upvalues: u6 (upval), u22 (upval), u19 (upval)
            if u6 ~= "Emotes" and u22.current then
                u19(nil)
            end
        end)
        return function() -- Line: 300 -- upvalues: u38 (val), u28 (val), u77 (upval), u81 (upval), u7_2 (val), u13 (val), u33 (val)
            u38()
            u28:Disconnect()
            u77:Destroy()
            u81:Destroy()
            u7_2:Disconnect()
            u13:Disconnect()
            u33:Disconnect()
        end
    end, {})
    local v9 = useCallback(function() -- Line: 314 -- upvalues: u86 (val)
        u86()
    end, {})
    local v10 = {u14, u59, u63}
    local v11 = useCallback(function(a1) -- Line: 318 -- upvalues: u14 (val), u63 (val), u59 (val)
        if u14 then
            u63.setPage(a1)
            return
        end
        u59.setPage(a1)
    end, v10)
    local v12 = {u14, v5, v7, u18}
    local v13 = useCallback(function(a1, a2) -- Line: 326
        -- upvalues: u14 (val), u18 (val), u7 (val), StickerController (upval), u86 (val), u19 (val), Inventory (upval)
        -- upvalues: PlayerReplicator (upval)
        if a2 and a2.name then
            if u14 then
                if not u18 then
                    StickerController.createSticker(a2.name)
                    u86()
                    return
                end
                u7("Loading")
                local v1, v2 = StickerController.equipSticker(u18.name, a1):await()
                if not v1 then
                    warn(v2)
                end
                u86()
                u19(nil)
                return
            end
            if u18 then
                u7("Loading")
                Inventory:FireServer("Equip", "Emote", u18.name, a1)
                u86()
                u19(nil)
                return
            end
            local v3, v4 = PlayerReplicator.GetLocalPlayer():await()
            local v5 = v4
            local Character = if not v3 then nil else if v5.Character then v5.Character else nil
            if Character then
                Character:StartEmoting(a2.name)
            end
            u86()
            return
        end
    end, v12)
    local v14 = {
        Visible = u6:map(function(a1) -- Line: 370
            return a1 == "Emotes"
        end),
    }
    local index = u14 and u63.index or u59.index
    v14.page = index
    local maxPages = u14 and u63.maxPages or u59.maxPages
    v14.maxPages = maxPages
    v14.items = u14 and v7 or v5
    v14.onClose = v9
    v14.updatePage = v11
    v14.useItem = v13
    return createElement(EmoteWheel, v14)
end