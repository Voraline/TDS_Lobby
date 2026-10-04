-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LobbyInputController
-- Decompile time: 15.20 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local HotKey = require(ReplicatedStorage.Client.Modules.HotKey)
local InventoryController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.InventoryController)
local ItemController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController)
local LoginStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.LoginStore)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local StoreController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.StoreController)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local UnboxingController = require(ReplicatedStorage.Client.Controllers.Shared.UnboxingController)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local LocalPlayer = Players.LocalPlayer
local News = Network.Channel("News")
local Tutorial = Network.Channel("Tutorial")
local DailySpin = NewNetwork.Channel("DailySpin")
local Skills = NewNetwork.Channel("Skills")
local LOBBY_MUSIC = (require(ReplicatedStorage.Shared.Modules.SharedGameConstants)).LOBBY_MUSIC

local function showUnboxing(a1, a2) -- Line: 30
    -- upvalues: TypedPromise (val), UnboxingController (val), StoreController (val)
    return TypedPromise.new(function(a1_2, a2_2) -- Line: 31
        -- upvalues: a1 (val), a2 (val), UnboxingController (upval), StoreController (upval), TypedPromise (upval)
        local v1 = a2 or "Default"
        local v2, v3 = UnboxingController.GetMetadataForReward("Skin", a1.name, v1)
        local finished = v3.finished

        function v3.finished() -- Line: 38
            -- upvalues: finished (val), StoreController (upval), a1 (upval), a2_2 (val), TypedPromise (upval)
            -- upvalues: a1_2 (val)
            if finished then
                finished()
            end
            local v1, v2 = StoreController:purchase(a1)
            if not v1 then
                a2_2(v2 or "Unknown error occurred while awarding tower")
                return
            end
            ;(TypedPromise.delay(1)):andThen(a1_2)
        end

        UnboxingController.Present(v2, v3)
    end)
end

local function waitForRoot() -- Line: 56 -- upvalues: TypedPromise (val), ViewController (val)
    return TypedPromise.new(function(a1, a2, a3) -- Line: 57 -- upvalues: ViewController (upval)
        local u3 = nil
        u3 = ViewController:onViewChange(function(a1_2) -- Line: 59 -- upvalues: u3 (ref), a1 (val)
            if a1_2 ~= "" and a1_2 ~= "Hotbar" then
                return
            end
            if u3 then
                u3()
                u3 = nil
            end
            a1()
        end)
        a3(function() -- Line: 72 -- upvalues: u3 (ref)
            if u3 then
                u3()
            end
        end)
    end)
end

task.spawn(function() -- Line: 80
    -- upvalues: News (val), ViewController (val), DailySpin (val), LoginStore (val), HotKey (val), Skills (val)
    -- upvalues: Comma (val), TeleportService (val), Players (val), LocalPlayer (val), Tutorial (val), Enum (val)
    -- upvalues: InventoryController (val), ReplicatedStorage (val), ItemController (val), TypedPromise (val)
    -- upvalues: showUnboxing (val), Network (val), LOBBY_MUSIC (val)
    if News:InvokeServer("Check") then
        ViewController:queueView("News")
    end
    local v1 = DailySpin:invokeServer("GetDailyReward")
    if v1 then
        LoginStore.setDay(v1.day)
        LoginStore.setClaimed(if not v1.claimable then v1.day else v1.day - 1)
        if v1.claimable then
            ViewController:queueView("Login")
        end
    end
    ;(HotKey.new("Inventory", Enum.KeyCode.ButtonY)).Pressed:Connect(function(a1) -- Line: 99 -- upvalues: ViewController (upval)
        if a1 and ViewController:getCurrentView() == "Hotbar" then
            ViewController:setView("Inventory")
        end
    end)
    ;(HotKey.new("Close", Enum.KeyCode.ButtonB)).Pressed:Connect(function(a1) -- Line: 106 -- upvalues: ViewController (upval)
        if a1 then
            if ViewController:getCurrentView() ~= "Hotbar" then
                ViewController:setView("Hotbar")
                return
            end
            ViewController:setView("Battlepass")
        end
    end)
    ;(HotKey.new("PlaySurvival", Enum.KeyCode.ButtonX)).Pressed:Connect(function(a1) -- Line: 117 -- upvalues: ViewController (upval)
        if a1 and ViewController:getCurrentView() == "Hotbar" then
            ViewController:setView("PromptMatchmaking")
        end
    end)
    task.spawn(function() -- Line: 123
        -- upvalues: Skills (upval), Comma (upval), ViewController (upval), TeleportService (upval), Players (upval)
        local v1 = Skills:invokeServer("GetMigrations")
        if v1 and next(v1) then
            print("Skill tree migration data received:", v1)
            local v2 = if not v1.coins then nil else if not (0 < v1.coins) then nil else Comma(v1.coins)
            local v3 = if not v1.gems then nil else if not (0 < v1.gems) then nil else Comma(v1.gems)
            local v4 = "Your skill tree has been migrated, and you have had the following refunded:\n"
            if v2 then
                v4 = v4 .. ("Coins: $%*\n"):format(v2)
            end
            if v3 then
                v4 = v4 .. ("Gems: $%*"):format(v3)
            end
            ViewController:prompt({
                Override = true,
                Subject = "Skill Tree Migration",
                Icon = "rbxassetid://13691899952",
                Description = v4,
                Buttons = {
                    {
                        Text = "Close",
                        Color = Color3.fromRGB(39, 39, 39),
                        Clicked = function() -- Line: 158 -- upvalues: ViewController (upval), TeleportService (upval), Players (upval)
                            ViewController:closePrompt()
                            TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
                        end,
                    },
                },
            })
            return
        end
    end)
    task.spawn(function() -- Line: 167 -- upvalues: LocalPlayer (upval), Tutorial (upval), Enum (upval), ViewController (upval)
        local Tutorial_2 = LocalPlayer:WaitForChild("Tutorial")
        local success, result = pcall(function() -- Line: 169 -- upvalues: Tutorial (upval)
            return Tutorial:InvokeServer("ShouldPlayIntro")
        end)
        if not success then
            warn((("Failed to check tutorial intro state: %*"):format(result)))
        end
        if Tutorial_2.Value < tonumber(Enum.TutorialStage.Game) or success and result == true then
            ViewController:queueView("Tutorial")
        end
        Tutorial_2.Changed:Connect(function(a1) -- Line: 184 -- upvalues: Enum (upval), ViewController (upval)
            if a1 < tonumber(Enum.TutorialStage.Game) then
                ViewController:queueView("Tutorial")
            end
        end)
    end)
    task.spawn(function() -- Line: 191
        -- upvalues: InventoryController (upval), ReplicatedStorage (upval), ItemController (upval), Enum (upval)
        -- upvalues: LocalPlayer (upval), TypedPromise (upval), ViewController (upval), showUnboxing (upval)
        local Price, v1
        InventoryController:init()
        local u68 = {}
        for i, j in ReplicatedStorage:WaitForChild("Content").Tower:GetChildren() do
            v1 = ItemController:tower(j.Name)
            Price = v1.info.Price
            if not InventoryController:owns(v1) and Price then
                if Price.Type == tostring(Enum.CurrencyType.Free)
                    or Price.Type == tostring(Enum.CurrencyType.Robux) then
                    if Price.Eligible and Price.Eligible(LocalPlayer) then
                        table.insert(u68, v1)
                    end
                elseif Price.Type == "Robux" and Price.Eligible and Price.Eligible(LocalPlayer) then
                    table.insert(u68, v1)
                end
            end
        end
        if #u68 < 1 then
            return
        end
        ;((TypedPromise.new(function(a1, a2, a3) -- Line: 57 -- upvalues: ViewController (upval)
            local u3 = nil
            u3 = ViewController:onViewChange(function(a1_2) -- Line: 59 -- upvalues: u3 (ref), a1 (val)
                if a1_2 ~= "" and a1_2 ~= "Hotbar" then
                    return
                end
                if u3 then
                    u3()
                    u3 = nil
                end
                a1()
            end)
            a3(function() -- Line: 72 -- upvalues: u3 (ref)
                if u3 then
                    u3()
                end
            end)
        end)):andThen(function() -- Line: 230 -- upvalues: TypedPromise (upval)
            return TypedPromise.delay(2)
        end)):andThen(function() -- Line: 233 -- upvalues: TypedPromise (upval), u68 (val), showUnboxing (upval)
            return TypedPromise.each(u68, function(a1) -- Line: 234 -- upvalues: showUnboxing (upval)
                return showUnboxing(a1)
            end)
        end)
    end)
    task.spawn(function() -- Line: 240 -- upvalues: ViewController (upval), Network (upval), LocalPlayer (upval)
        local showPrompt

        local function showConfirm(a1, a2) -- Line: 241
            -- upvalues: ViewController (upval)
            ViewController:prompt({
                Override = true,
                Subject = "Are you sure?",
                Description = "Are you sure you want to ignore the refund? You will not be able to refund your Mercenary Base later.",
                Icon = "rbxassetid://13691899952",
                Buttons = {
                    {
                        Text = "Yes",
                        Color = Color3.fromRGB(10, 220, 80),
                        Clicked = function() -- Line: 251 -- upvalues: ViewController (upval), a1 (val)
                            ViewController:closePrompt()
                            ViewController:setView("Hotbar")
                            a1()
                        end,
                    },
                    {
                        Text = "No",
                        Color = Color3.fromRGB(39, 39, 39),
                        Clicked = function() -- Line: 260 -- upvalues: ViewController (upval), a2 (val)
                            ViewController:closePrompt()
                            a2()
                        end,
                    },
                },
            })
        end

        function showPrompt() -- Line: 269
            -- upvalues: ViewController (upval), Network (upval), showConfirm (val), showPrompt (val)
            ViewController:setView("MercRefund")
            ViewController:prompt({
                Override = true,
                Subject = "Mercenary Base Refund",
                Description = "You are eligible for a refund of your Mercenary Base. Would you like to proceed?",
                Icon = "rbxassetid://13691899952",
                Buttons = {
                    {
                        Text = "Yes",
                        Color = Color3.fromRGB(10, 220, 80),
                        Clicked = function() -- Line: 280 -- upvalues: Network (upval), ViewController (upval)
                            Network.Channel("MercRefund"):InvokeServer("Teleport")
                            ViewController:closePrompt()
                            ViewController:setView("Hotbar")
                        end,
                    },
                    {
                        Text = "No",
                        Color = Color3.fromRGB(39, 39, 39),
                        Clicked = function() -- Line: 289 -- upvalues: ViewController (upval), showConfirm (upval), Network (upval), showPrompt (upval)
                            ViewController:closePrompt()
                            showConfirm(function() -- Line: 292 -- upvalues: Network (upval)
                                Network.Channel("MercRefund"):InvokeServer("Cancel")
                            end, function() -- Line: 294 -- upvalues: showPrompt (upval)
                                showPrompt()
                            end)
                        end,
                    },
                },
            })
        end

        if LocalPlayer:GetAttribute("ShowMercenaryBaseRefund") then
            showPrompt()
        end
        ;(LocalPlayer:GetAttributeChangedSignal("ShowMercenaryBaseRefund")):Connect(function() -- Line: 307 -- upvalues: LocalPlayer (upval), showPrompt (val)
            if LocalPlayer:GetAttribute("ShowMercenaryBaseRefund") then
                showPrompt()
            end
        end)
    end)
    LocalPlayer.CharacterAdded:Connect(function() -- Line: 314 -- upvalues: LOBBY_MUSIC (upval)
        if workspace:WaitForChild("Music").Value ~= LOBBY_MUSIC then
            local Music = workspace:WaitForChild("Music")
            Music.Value = LOBBY_MUSIC
        end
    end)
    task.spawn(function() -- Line: 320 -- upvalues: LOBBY_MUSIC (upval)
        if workspace:WaitForChild("Music").Value == "" then
            local Music = workspace:WaitForChild("Music")
            Music.Value = LOBBY_MUSIC
        end
    end)
end)
return nil