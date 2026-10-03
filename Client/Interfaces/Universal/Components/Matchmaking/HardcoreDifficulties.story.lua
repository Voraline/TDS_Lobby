-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.HardcoreDifficulties.story
-- Decompile time: 2.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameModeCard = require(script.Parent.GameModeCard)
local GameModeData = require(ReplicatedStorage.Shared.Data.GameModeData)
local MatchmakingMenu = require(script.Parent.MatchmakingMenu)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local Notifications = require(ReplicatedStorage.Client.Interfaces.Universal.Views.Notifications)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local createElement = React.createElement
local u53 = {}
local v1 = {
    title = "Hardcore",
    internalDifficulty = "Easy",
    subTitle = "Hardcore Mode",
    character = 126383122109632,
    subTitleColor = Color3.fromRGB(225, 0, 255),
    characterAnchorPoint = Vector2.new(0.55, 0.82),
    characterSize = UDim2.fromScale(1.35, 1.35),
}
local v2 = {
    title = "Voidcore",
    internalDifficulty = "Hard",
    subTitle = "Only for the very best",
    character = 128952127679051,
    subTitleColor = Color3.fromRGB(225, 0, 255),
    characterAnchorPoint = Vector2.new(0.4, 0.82),
    characterSize = UDim2.fromScale(1.35, 1.35),
}
u53[1] = v1
u53[2] = v2

local function Component(a1) -- Line: 38
    -- upvalues: createElement (val), u53 (val), GameModeData (val), GameModeCard (val), Notification (val), React (val)
    -- upvalues: MatchmakingMenu (val), Notifications (val)
    local Hardcore, v1
    local hasTriumphHardcoreBadge = a1.hasTriumphHardcoreBadge
    local v2 = {
        layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.06, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v3 = nil
    local v4 = nil
    for i, j in u53, v3, v4 do
        local u60 = false
        if j.internalDifficulty == "Hard" then
            u60 = not hasTriumphHardcoreBadge
        end
        Hardcore = not (j.internalDifficulty ~= "Easy") and GameModeData.Hardcore or GameModeData.Voidcore
        v1 = ("difficulty%*"):format(i)
        v2[v1] = (createElement(GameModeCard, {
            background = "rbxassetid://85475926125534",
            playerLevel = 999,
            disabledText = "Beat Hardcore First To Unlock Voidcore",
            disabledTextWrapped = false,
            title = j.title,
            subTitle = j.subTitle,
            subTitleColor = j.subTitleColor,
            character = j.character,
            characterAnchorPoint = j.characterAnchorPoint,
            characterSize = j.characterSize,
            LayoutOrder = i,
            Size = UDim2.fromScale(0.45, 1),
            rewardInfo = Hardcore,
            disabled = u60,
            disabledTextPosition = UDim2.fromScale(0.5, 0.68),
            clicked = function() -- Line: 70 -- upvalues: u60 (val), Notification (upval), j (val)
                if u60 then
                    Notification.Create({
                        Text = "MockPlayer cannot queue: Beat Hardcore first to unlock Voidcore.",
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    return
                end
                print((("Selected %* (internal difficulty: %*)"):format(j.title, j.internalDifficulty)))
            end,
        }))
    end
    return createElement(React.Fragment, {}, {
        menu = createElement(MatchmakingMenu, {title = "Hardcore Difficulties"}, {
            content = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.54),
                Size = UDim2.fromScale(0.72, 0.62),
            }, v2),
        }),
        notifications = createElement(Notifications),
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {hasTriumphHardcoreBadge = false},
    story = function(a1) -- Line: 106 -- upvalues: ViewController (val), createElement (val), Component (val)
        ViewController:init()
        return createElement(Component, {hasTriumphHardcoreBadge = a1.controls.hasTriumphHardcoreBadge})
    end,
}