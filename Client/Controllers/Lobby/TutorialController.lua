-- Script path: ReplicatedStorage.Client.Controllers.Lobby.TutorialController
-- Decompile time: 8.64 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local NavigationController = require(ReplicatedStorage.Client.Controllers.Shared.NavigationController)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local StoreController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.StoreController)
local ItemController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController)
local PlayerController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.PlayerController)
local InventoryController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.InventoryController)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local DialogController = require(ReplicatedStorage.Client.Controllers.Shared.DialogController)
local Tutorial = require(ReplicatedStorage.Shared.Modules.Network).Channel("Tutorial")
local DialogStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.DialogStore)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local u97 = {Started = false}
local u99 = {
    {
        Name = "Intro",
        View = "Hotbar",
        DialogOnly = true,
        Dialog = {
            Text = "Welcome back from bootcamp! You are now officially TDS certified! Let's get to recruiting your first tower!",
            Voice = "rbxassetid://124491177612162",
            Speaker = "Commander",
            Emotion = "Teach",
            RichText = true,
        },
    },
    {
        Name = "Inventory",
        View = "Hotbar",
        Dialog = {
            Text = "To view your towers, select the <font color=\"#ff8e3c\">ITEMS</font> button in your hotbar!",
            Voice = "rbxassetid://136874044359634",
            Speaker = "Commander",
            Emotion = "Teach",
            RichText = true,
        },
    },
    {
        Name = "tower:Demoman",
        Dialog = {
            Text = "Welcome to your inventory! This is where you can purchase and equip all your towers moving forward. To inspect a tower, select the <font color=\"#ff8e3c\">DEMOMAN</font> icon.",
            Voice = "rbxassetid://136751828957217",
            Speaker = "Commander",
            Emotion = "Teach",
            RichText = true,
        },
        Events = {SelectItem = {"Towers", "Demoman"}},
    },
    {
        Name = "DisplayAction",
        Dialog = {
            Text = "Next select the <font color=\"#ff8e3c\">PURCHASE BUTTON</font>. It will show the price of 200 coins.",
            Voice = "rbxassetid://120233970778942",
            Speaker = "Commander",
            Emotion = "Teach",
            RichText = true,
        },
    },
    {
        Name = "PromptPurchase",
        Components = {"PromptPurchase", "CancelPurchase"},
        Dialog = {
            Text = "Select <font color=\"#ff8e3c\">CONFIRM</font> to purchase your first tower!",
            Voice = "rbxassetid://134249880462796",
            Speaker = "Commander",
            Emotion = "Teach",
            RichText = true,
        },
    },
    {
        Name = "DisplayAction",
        Dialog = {
            Text = "To equip your new tower, select <font color=\"#ff8e3c\">EQUIP</font> the button.",
            Voice = "rbxassetid://88858096080070",
            Speaker = "Commander",
            Emotion = "Teach",
            RichText = true,
        },
    },
}

function u97.ShowDestination(a1, a2, a3) -- Line: 109
    -- upvalues: NavigationController (val)
    NavigationController.showDestination({destination = a1, ringOffset = a2, arrowOffset = a3}):await()
end

function u97.OwnsTower(a1) -- Line: 121
    -- upvalues: InventoryController (val), ItemController (val)
    InventoryController:init()
    return InventoryController:owns((ItemController:tower(a1)))
end

function u97.CanAffordTower(a1) -- Line: 128
    -- upvalues: ItemController (val), PlayerController (val), StoreController (val)
    ItemController:init()
    PlayerController:init()
    return StoreController:canAfford((ItemController:tower(a1)))
end

function u97.CanDoLobbyTutorial() -- Line: 136 -- upvalues: u97 (val)
    return not u97.OwnsTower("Demoman") and u97.CanAffordTower("Demoman")
end

function u97.ShowDialog(a1) -- Line: 141 -- upvalues: HttpService (val), DialogStore (val)
    local u5 = HttpService:GenerateGUID(false)
    DialogStore.add({
        OverrideSetting = true,
        id = u5,
        dialog = {
            Text = a1.Text,
            Speaker = a1.Speaker,
            Emotion = a1.Emotion,
            Hidden = a1.Hidden,
            Flip = a1.Flip,
            RichText = a1.RichText,
            Voice = a1.Voice,
        },
    })
    return function() -- Line: 158 -- upvalues: DialogStore (upval), u5 (val)
        DialogStore.remove(u5)
    end
end

function u97.SelectComponent(a1) -- Line: 163 -- upvalues: SpotlightStore (val), Promise (val)
    local v1
    local v2 = not (typeof(a1) ~= "table") and a1[1] or a1
    SpotlightStore.select(v2)
    if not a1 then
        return true
    end
    if type(a1) == "string" then
        if a1 ~= "" then
            SpotlightStore.wait(a1)
        end
        return true
    end
    local v3 = {}
    for i, v in ipairs(a1) do
        table.insert(v3, (Promise.new(function(a1, a2, a3) -- Line: 182 -- upvalues: SpotlightStore (upval), v (val)
            local u3 = nil
            local v1 = v
            u3 = SpotlightStore.connect(v1, function() -- Line: 184 -- upvalues: u3 (ref), a1 (val), v (upval)
                if u3.Connected then
                    u3:Disconnect()
                end
                a1(v)
            end)
            a3(function() -- Line: 192 -- upvalues: u3 (ref)
                if u3.Connected then
                    u3:Disconnect()
                end
            end)
        end)))
    end
    _, v1 = Promise.race(v3):await()
    return v1 == v2
end

function u97.SelectComponentWithDialog(a1, a2) -- Line: 206 -- upvalues: u97 (val)
    local v1 = u97.ShowDialog(a2)
    local v2 = u97.SelectComponent(a1)
    v1()
    return v2
end

function u97.StartTutorialFlow() -- Line: 217
    -- upvalues: u97 (val), ViewController (val), u99 (val), SpotlightStore (val), DialogController (val)
    -- upvalues: Tutorial (val), Notification (val)
    local Components, SelectComponentWithDialog, v1
    u97.Started = true
    ViewController:setView("Hotbar")
    local v2 = nil
    local v3 = nil
    for i, j in u99, v2, v3 do
        if j.Events then
            for k, n in j.Events do
                SpotlightStore.fire(k, unpack(n))
            end
        end
        if j.View then
            ViewController:setView(j.View)
        end
        if not j.DialogOnly then
            SelectComponentWithDialog = u97.SelectComponentWithDialog
            Components = j.Components or j.Name
            if not SelectComponentWithDialog(Components, j.Dialog) then
                break
            end
        else
            v1 = u97.ShowDialog(j.Dialog)
            task.wait(j.DialogDuration or DialogController.GetDialogDelay(j.Dialog.Text))
            v1()
        end
    end
    u97.SelectComponent(nil)
    ViewController:setView("Hotbar")
    local v4 = u97.ShowDialog({
        Text = "Now you're ready for your first real battle! Use the matchnaking menu to join your first match!",
        Voice = "rbxassetid://130139723385409",
        Speaker = "Commander",
        Emotion = "Teach",
        RichText = true,
    })
    task.wait(7)
    u97.SelectComponent(nil)
    v4()
    if not Tutorial:InvokeServer("Complete") then
        Notification.Create({
            Text = "Error occured while trying to end tutorial.",
            Color = Color3.fromRGB(255, 0, 0),
        })
    end
    u97.Started = false
    return true
end

function u97.Start() -- Line: 284 -- upvalues: u97 (val), ViewController (val), Tutorial (val)
    if u97.Started == true then
        return false
    end
    u97.Started = true
    if not ViewController:getCurrentView() ~= "Hotbar" then
        task.wait(5)
    else
        repeat
            task.wait()
        until ViewController:getCurrentView() == "Hotbar"
    end
    if u97.CanDoLobbyTutorial() then
        return u97.StartTutorialFlow()
    end
    Tutorial:FireServer("Complete")
    u97.Started = false
    return false
end

function u97.init() -- Line: 309 -- upvalues: Players (val), u97 (val)
    if workspace.Type.Value ~= "Lobby" then
        return
    end
    local Tutorial = Players.LocalPlayer:WaitForChild("Tutorial")
    if Tutorial.Value == 2 then
        u97.Start()
    end
    Tutorial.Changed:Connect(function(a1) -- Line: 319 -- upvalues: u97 (upval)
        if a1 == 2 then
            u97.Start()
        end
    end)
end

task.spawn(u97.init)
return u97