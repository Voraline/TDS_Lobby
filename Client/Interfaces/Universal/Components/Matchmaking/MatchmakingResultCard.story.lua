-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingResultCard.story
-- Decompile time: 1.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MatchmakingResultCard = require(script.Parent.MatchmakingResultCard)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u21 = {"Scout", "Sniper", "Minigunner", "Commander", "Farm", "DJ Booth"}

local function App() -- Line: 18 -- upvalues: createElement (val), MatchmakingResultCard (val), u21 (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(520, 340),
    }, {
        Card = createElement(MatchmakingResultCard, {
            title = "@Paradoxum",
            levelText = "Lv. 75",
            lossesText = "12",
            triumphsText = "24",
            playerImage = "rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420",
            towers = u21,
        }),
    })
end

return function(a1) -- Line: 36 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 40 -- upvalues: u4 (val)
        u4:unmount()
    end
end