-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards
-- Decompile time: 7.65 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local RewardAddSelection = require(script.RewardAddSelection)
local RewardGameStat = require(script.RewardGameStat)
local RewardLevelSection = require(script.RewardLevelSection)
local RewardRewardsSection = require(script.RewardRewardsSection)
local RewardStats = require(script.RewardStats)
local RewardTowersBanner = require(script.RewardTowersBanner)
local RewardVictoryBanner = require(script.RewardVictoryBanner)
local TeamPlayersReward = require(script.TeamPlayersReward)
local createElement = React.createElement
local memo = React.memo
local useMemo = React.useMemo
local useEffect = React.useEffect
local v1 = {6893281917, 6893283194, 6893283959}
local v2 = {
    "Don't give up!",
    "Mission Failed, we'll get em' next time.",
    "The enemies got to the base!",
    "We'll get them next time!",
    "Oops! Try again!",
    "Strategy is key!",
    "We're overrun chief!",
    "We're toast!",
    "We need back up sergeant!",
    "Not enough numbers!",
    "Mistakes are just part of the journey..",
    "OOF!",
    "We have to fall back soldier!",
    "We just had our grave dug..",
}
local u95 = v1[math.random(1, #v1)]
local u100 = v2[math.random(1, #v2)]
return memo(function(a1) -- Line: 81
    -- upvalues: useMemo (val), Players (val), ReactFlow (val), useTransparencyModifier (val), useEffect (val)
    -- upvalues: Enum (val), createElement (val), RewardGameStat (val), u95 (val), u100 (val), GlowButton (val)
    -- upvalues: RewardAddSelection (val), RewardRewardsSection (val), RewardLevelSection (val), RewardStats (val)
    -- upvalues: RewardVictoryBanner (val), TeamPlayersReward (val), RewardTowersBanner (val)
    local v1, v2
    local u10 = UDim2.fromScale(0, 0)
    if a1.hasVIP then
        u10 = UDim2.fromScale(0, -0.16)
    end
    local v3 = useMemo
    local v4 = {a1.won}
    v3 = v3(function() -- Line: 88 -- upvalues: Players (upval)
        return Players:GetPlayers()
    end, v4)
    local v5, u21 = ReactFlow.useSpring({target = 0, start = 0, damper = 0.3, speed = 7})
    local v6, u31 = ReactFlow.useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v7, u36 = ReactFlow.useSpring({start = 0, target = 0, damper = 0.6, speed = 30})
    local v8, u49 = ReactFlow.useSpring({
        damper = 0.4,
        speed = 20,
        start = UDim2.fromScale(0.5, 0),
        target = UDim2.fromScale(0.5, 0.2),
    })
    local v9, u54 = ReactFlow.useSpring({start = -0.4, target = -0.4, damper = 0.8, speed = 15})
    local v10 = useTransparencyModifier(v6)
    local v11 = useEffect
    local v12 = {a1.visible}
    v11(function() -- Line: 128 -- upvalues: u31 (val), a1 (val), u36 (val), u49 (val), u54 (val)
        u31({target = if not a1.visible then 1 else 0})
        u36({target = if not a1.visible then 0 else 1})
        local v1 = {}
        local v2 = if not a1.visible then UDim2.fromScale(0.5, 0.2) else UDim2.fromScale(0.5, 0.54)
        v1.target = v2
        u49(v1)
        u54({target = if not a1.visible then -0.4 else 0})
    end, v12)
    useEffect(function() -- Line: 145 -- upvalues: u21 (val)
        local u2 = task.spawn(function() -- Line: 146 -- upvalues: u21 (upval)
            while true do
                u21({force = 10})
                task.wait(2)
            end
        end)
        return function() -- Line: 152 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    local currentTeam = a1.currentTeam or Enum.Team.Player
    local winningTeam = a1.winningTeam or Enum.Team.Player
    v12 = {}
    if a1.visible then
        local v13
        for i, j in a1.gameStats do
            v13 = createElement
            v1 = RewardGameStat
            v2 = {
                leftText = j.title,
                rightText = j.value,
                visible = a1.visible,
                index = i,
            }
            v12[i] = (v13(v1, v2))
        end
    end
    local v14 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v8,
        Size = UDim2.fromScale(1.8, 1.05),
        Visible = a1.visible,
    }
    local v15 = {
        commander = not a1.won and createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://" .. u95,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.4, 0.1),
            Size = UDim2.fromScale(0.43, 0.43),
            ScaleType = Enum.ScaleType.Fit,
        }),
    }
    local v16 = not a1.won and createElement("ImageLabel", {
        Image = "rbxassetid://6893248975",
        BackgroundTransparency = 1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = v5:map(function(a1) -- Line: 197
            return UDim2.new(0.53, 0, -0.1, -a1 * 20)
        end),
        Size = UDim2.fromScale(0.18, 0.1),
    }, {
        tail = createElement("ImageLabel", {
            Image = "rbxassetid://6893250260",
            BackgroundTransparency = 1,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 0, 1, -10),
            Size = UDim2.fromOffset(26, 17),
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 18,
            TextStrokeTransparency = 0.9,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = u100,
            TextColor3 = Color3.fromRGB(45, 45, 45),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -10, 1, -10),
        }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
    }) or nil
    v15.bubble = v16
    v15.uIScale = createElement("UIScale", {
        Scale = v7:map(function(a1) -- Line: 236
            return a1 * 0.6
        end),
    })
    v15.uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
        AspectRatio = 1.28,
        AspectType = Enum.AspectType.ScaleWithParentSize,
        DominantAxis = Enum.DominantAxis.Height,
    })
    v1 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        BackgroundTransparency = v10(0.01),
        Position = UDim2.fromScale(0.5, 0.47),
        Size = UDim2.fromScale(0.91102, 0.596859),
    }
    v2 = {}
    v2.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0175439, 0)})
    v2.uIStroke = createElement("UIStroke", {Thickness = 5, Color = Color3.new(1, 1, 1), Transparency = v10(0.86)})
    local canContinue = a1.canContinue and createElement(GlowButton, {
        text = "Continue",
        textScale = 1.2,
        stroke = true,
        Size = UDim2.fromScale(0.32, 0.135),
        Position = v9:map(function(a1) -- Line: 267 -- upvalues: u10 (ref)
            return (UDim2.fromScale(a1 + 0.3, 1.3)) + u10
        end),
        color = Color3.fromRGB(46, 255, 74),
        clicked = function() -- Line: 271 -- upvalues: a1 (val)
            if a1.continueClicked then
                a1.continueClicked()
            end
        end,
        transparency = v6,
    })
    v2.ContinueBtn = canContinue
    local playAgain = a1.playAgain and createElement(GlowButton, {
        textScale = 1.2,
        stroke = true,
        text = a1.playAgainText or "Play Again",
        Size = UDim2.fromScale(0.32, 0.135),
        Position = v9:map(function(a1) -- Line: 284 -- upvalues: u10 (ref)
            return (UDim2.fromScale(a1 + 0.3, 1.3)) + u10
        end),
        color = Color3.fromRGB(46, 255, 74),
        clicked = function() -- Line: 288 -- upvalues: a1 (val)
            if a1.playAgainClicked then
                a1.playAgainClicked()
            end
        end,
        transparency = v6,
    })
    v2.PlayAgain = playAgain
    v2.ReturnToLobby = createElement(GlowButton, {
        text = "Return To Lobby",
        textScale = 1.2,
        stroke = true,
        Size = UDim2.fromScale(0.32, 0.135),
        Position = v9:map(function(a1_2) -- Line: 301 -- upvalues: a1 (val), u10 (ref)
            local v1 = UDim2.fromScale(a1_2, 0)
            local v2 = if a1.playAgain then UDim2.fromScale(0.7, 1.3) else if a1.canContinue then UDim2.fromScale(0.7, 1.3) else UDim2.fromScale(0.5, 1.3)
            return v1 + v2 + u10
        end),
        color = Color3.fromRGB(160, 160, 160),
        clicked = function() -- Line: 309 -- upvalues: a1 (val)
            if a1.returnToLobbyClicked then
                a1.returnToLobbyClicked()
            end
        end,
        transparency = v6,
    })
    local tryAgain = a1.tryAgain and createElement(GlowButton, {
        textScale = 1.2,
        stroke = true,
        text = a1.tryAgainText or "Try again",
        Size = UDim2.fromScale(0.32, 0.135),
        Position = v9:map(function(a1) -- Line: 322 -- upvalues: u10 (ref)
            return (UDim2.fromScale(a1 + 0.5, 1.491)) + u10
        end),
        color = Color3.fromRGB(255, 201, 22),
        clicked = function() -- Line: 326 -- upvalues: a1 (val)
            if a1.tryAgainClicked then
                a1.tryAgainClicked()
            end
        end,
        transparency = v6,
    })
    v2.TryAgain = tryAgain
    v2.RewardAd = createElement(RewardAddSelection, {
        hasVIP = a1.hasVIP or false,
        vipPrice = a1.vipPrice or 100,
        vipClicked = a1.vipClicked,
        visible = a1.visible,
        transparency = v6,
    })
    local visible = a1.visible and createElement(RewardRewardsSection, {rewards = a1.rewards, visible = a1.visible, transparency = v6})
    v2.RewardsSection = visible
    v2.LevelSection = createElement(RewardLevelSection, {
        previousLevel = a1.previousLevel or 1,
        newLevel = a1.newLevel or 2,
        currentXP = a1.currentXP or 0,
        xpEarned = a1.xpEarned or 1000,
        visible = a1.visible,
    })
    v2.gameStats = createElement(RewardStats, {
        adVisible = a1.adVisible or false,
        adText = a1.adText or "Claim 2x Rewards!",
        adClicked = a1.adClicked,
        stars = a1.stars,
        visible = a1.visible,
    }, v12)
    local v17 = createElement
    local v18 = RewardVictoryBanner
    local v19 = {
        won = a1.won,
        team = winningTeam,
        currentTeam = currentTeam,
        isPVP = a1.isPVP or false,
        visible = a1.visible,
    }
    v2.RewardBanner = v17(v18, v19)
    local isPVP = a1.isPVP and createElement(TeamPlayersReward, {players = v3, team = winningTeam, visible = a1.visible})
    v2.Players = isPVP
    local won = not a1.isPVP
    if won then
        won = a1.won
        if won then
            v19 = {}
            local towers = a1.towers or {Medic = "Mermaid", Assassin = "Default"}
            v19.towers = towers
            v19.visible = a1.visible
            won = createElement(RewardTowersBanner, v19)
        end
    end
    v2.RewardTowers = won
    v15.RewardsScreen = createElement("Frame", v1, v2)
    return (createElement("Frame", v14, v15))
end)