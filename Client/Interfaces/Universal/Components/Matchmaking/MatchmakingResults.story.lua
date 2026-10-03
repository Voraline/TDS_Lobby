-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingResults.story
-- Decompile time: 1.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MatchmakingResultCard = require(script.Parent.MatchmakingResultCard)
local MatchmakingResults = require(script.Parent.MatchmakingResults)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u26 = {
    {key = "scout", icon = "rbxassetid://6034525915"},
    {key = "soldier", icon = "rbxassetid://6034483344"},
    {key = "mini", icon = "rbxassetid://6034509993"},
}

local function resultCard(a1, a2) -- Line: 25
    -- upvalues: createElement (val), MatchmakingResultCard (val), u26 (val)
    return createElement(MatchmakingResultCard, {
        index = a1,
        layoutOrder = a1,
        title = ("@%*"):format(a2),
        levelText = ("Lv. %*"):format(40 + a1),
        lossesText = tostring(a1 * 2),
        triumphsText = tostring(a1 + 10),
        playerImage = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(a1),
        towers = u26,
    })
end

local function App() -- Line: 38
    -- upvalues: createElement (val), MatchmakingResults (val), MatchmakingResultCard (val), u26 (val)
    return createElement(MatchmakingResults, {visible = true, screenSize = Vector2.new(1920, 1080)}, {
        Player1 = createElement(MatchmakingResultCard, {
            index = 1,
            layoutOrder = 1,
            title = "@PlayerOne",
            levelText = ("Lv. %*"):format(41),
            lossesText = tostring(2),
            triumphsText = tostring(11),
            playerImage = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(1),
            towers = u26,
        }),
        Player2 = createElement(MatchmakingResultCard, {
            index = 2,
            layoutOrder = 2,
            title = "@PlayerTwo",
            levelText = ("Lv. %*"):format(42),
            lossesText = tostring(4),
            triumphsText = tostring(12),
            playerImage = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(2),
            towers = u26,
        }),
        Player3 = createElement(MatchmakingResultCard, {
            index = 3,
            layoutOrder = 3,
            title = "@PlayerThree",
            levelText = ("Lv. %*"):format(43),
            lossesText = tostring(6),
            triumphsText = tostring(13),
            playerImage = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(3),
            towers = u26,
        }),
        Player4 = createElement(MatchmakingResultCard, {
            index = 4,
            layoutOrder = 4,
            title = "@PlayerFour",
            levelText = ("Lv. %*"):format(44),
            lossesText = tostring(8),
            triumphsText = tostring(14),
            playerImage = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(4),
            towers = u26,
        }),
    })
end

return function(a1) -- Line: 50 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 54 -- upvalues: u4 (val)
        u4:unmount()
    end
end