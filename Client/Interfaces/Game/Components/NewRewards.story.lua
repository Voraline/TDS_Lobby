-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.story
-- Decompile time: 1.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local NewRewards = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 8 -- upvalues: React (val), NewRewards (val), Enum (val)
    local v1, u4 = React.useState(false)
    React.useEffect(function() -- Line: 11 -- upvalues: u4 (val)
        local u3 = task.delay(3, function() -- Line: 12 -- upvalues: u4 (upval)
            u4(true)
        end)
        return function() -- Line: 16 -- upvalues: u3 (val)
            task.cancel(u3)
        end
    end, {})
    return React.createElement(NewRewards, {
        isPVP = false,
        hasVIP = false,
        previousLevel = 1,
        newLevel = 6,
        currentXP = 0,
        xpEarned = 1000,
        won = true,
        vipPrice = 400,
        adVisible = true,
        adText = "Claim 2x Rewards!",
        tryAgain = true,
        playAgain = true,
        stars = 2,
        towers = {Medic = "Mermaid", Assassin = "Default"},
        currentTeam = Enum.Team.Red,
        winningTeam = Enum.Team.Red,
        visible = v1,
        adClicked = function() -- Line: 51
            print("ad")
        end,
        returnToLobbyClicked = function() end,
        playAgainClicked = function() end,
        tryAgainClicked = function() end,
        vipClicked = function() end,
        gameStats = {
            {title = "Time Completed:", value = "5m 32s"},
            {title = "Map:", value = "Grass Isle"},
            {title = "Enemies Killed", value = "1,340"},
            {title = "Damage Dealt", value = "25,340"},
            {title = "Total Cash Earned", value = "3,400"},
        },
        rewards = {
            {stat = "Coins", amount = 3, type = "stat"},
            {stat = "Gems", amount = 300, type = "stat"},
            {stat = "Experience", amount = 300, type = "stat"},
            {tower = "Medic", type = "tower"},
        },
    })
end

return function(a1) -- Line: 117 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 122 -- upvalues: u4 (val)
        u4:unmount()
    end
end