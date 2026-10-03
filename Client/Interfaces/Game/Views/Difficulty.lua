-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Difficulty
-- Decompile time: 11.60 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DifficultyVote = ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote
local Button = require(DifficultyVote.Button)
local Ready = require(DifficultyVote.Ready)
local Title = require(DifficultyVote.Title)
local VipAd = require(DifficultyVote.VipAd)
local DifficultyReplicator = require(ReplicatedStorage.Client.Modules.Replicators.DifficultyReplicator)
local DifficultyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.DifficultyStore)
local useBadges = require(ReplicatedStorage.Client.Interfaces.Hooks.useBadges)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useEffect = React.useEffect
local useCallback = React.useCallback
local memo = React.memo
local Difficulty = require(ReplicatedStorage.Shared.Modules.Network).Channel("Difficulty")
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local u106 = {}
u106.Frost = {Color3.fromRGB(0, 195, 255), (Color3.fromRGB(0, 106, 255))}
u106.Fallen = {Color3.fromRGB(0, 225, 255), (Color3.fromRGB(0, 89, 255))}
u106["Awakened Fallen King"] = {Color3.fromRGB(255, 0, 212), (Color3.fromRGB(183, 0, 255))}
u106.Casual = {Color3.fromRGB(0, 255, 115), (Color3.fromRGB(18, 95, 7))}
u106.Intermediate = {Color3.fromRGB(255, 78, 131), (Color3.fromRGB(216, 45, 48))}
u106.Easy = {Color3.fromRGB(29, 177, 95), (Color3.fromRGB(18, 95, 7))}
u106.Molten = {Color3.fromRGB(255, 187, 1), (Color3.fromRGB(255, 102, 0))}
u106.PVP_lowRanks = {Color3.fromRGB(255, 187, 1), (Color3.fromRGB(255, 102, 0))}
u106.PVP_midRanks = {Color3.fromRGB(255, 187, 1), (Color3.fromRGB(255, 102, 0))}
local u206 = {
    Easy = {image = "rbxassetid://112696659470062", level = 0},
    Casual = {image = "rbxassetid://138730920504021", level = 0},
    Intermediate = {image = "rbxassetid://128301720523651", level = 5},
    Molten = {image = "rbxassetid://102198937125369", level = 15, hideOnPrevious = true},
    Hard = {image = "http://www.roblox.com/asset/?id=5352009868", level = 10, hideOnPrevious = true},
    Fallen = {
        image = "rbxassetid://18535640309",
        image2 = "http://www.roblox.com/asset/?id=18757025100",
        level = 30,
        hideOnPrevious = true,
    },
    Frost = {image = "rbxassetid://89107535866598", level = 60, hideOnPrevious = true},
    PVP_lowRanks = {image = "rbxassetid://112696659470062", level = 0},
    PVP_midRanks = {image = "rbxassetid://102198937125369", level = 10},
    PVP_highRanks = {image = "rbxassetid://18757025100", level = 15},
}

local function sendReady() -- Line: 124 -- upvalues: Difficulty (val)
    Difficulty:InvokeServer("Ready")
end

local function sendVote(a1) -- Line: 128 -- upvalues: Difficulty (val), DifficultyStore (val) -- types: a1: string
    Difficulty:InvokeServer("Vote", a1)
    DifficultyStore.setVoted(true)
    DifficultyStore.setSelected(a1)
end

local u221 = memo(function(a1) -- Line: 135
    -- upvalues: useTween (val), useCharmSelector (val), DifficultyStore (val), u106 (val), useEffect (val)
    -- upvalues: createElement (val), Button (val)
    local v1, u13 = useTween(9, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false), false, true)
    local v2, u26 = useTween(1, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false), false, true)
    local v3 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 150
        return a1.selected
    end)
    local u35 = v1:map(function(a1_2) -- Line: 154 -- upvalues: a1 (val)
        return (math.max(a1_2 - 0.1 * a1.LayoutOrder, 0)) * (0.5 - a1.LayoutOrder * 0.25)
    end)
    local u39 = v2:map(function(a1_2) -- Line: 158 -- upvalues: a1 (val)
        return a1_2 - 0.1 * a1.LayoutOrder
    end)

    local function getCardInfo() -- Line: 162 -- upvalues: a1 (val), u39 (val), u35 (val)
        if a1.difficultyVoteCompleted then
            return {
                Size = UDim2.fromScale(1, 1),
                Position = u39:map(function(a1) -- Line: 167
                    return UDim2.fromScale(0.5, a1)
                end),
            }
        end
        return {
            Size = u35:map(function(a1) -- Line: 173
                return UDim2.fromScale(1 - a1, 1 - a1)
            end),
            Position = u35:map(function(a1) -- Line: 177
                return UDim2.fromScale(0.5 + a1, 0.5)
            end),
        }
    end

    local ForceColor = a1.ForceColor
    if ForceColor and ForceColor:getValue() == "none" then
        ForceColor = nil
    end
    local v4 = ForceColor and ForceColor:getValue() or u106[a1.DifficultyAlias] or {Color3.fromRGB(255, 255, 255), (Color3.fromRGB(0, 0, 0))}
    local v5 = getCardInfo()
    local v6 = useEffect
    local v7 = {a1.Visible}
    v6(function() -- Line: 197 -- upvalues: a1 (val), u13 (val)
        if a1.Visible then
            u13(0)
            return
        end
        u13(1)
    end, v7)
    v6 = useEffect
    v7 = {a1.difficultyVoteCompleted}
    v6(function() -- Line: 205 -- upvalues: a1 (val), u26 (val)
        if a1.difficultyVoteCompleted then
            u26(-2)
            return
        end
        u26(0)
    end, v7)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Visible = a1.Visible,
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.fromOffset(192, 192),
    }, {
        button = createElement(Button, {
            DifficultyAlias = a1.DifficultyAlias,
            DifficultyText = a1.DifficultyText,
            Locked = a1.Locked,
            LevelRequired = a1.LevelRequired,
            Image = a1.Image,
            Votes = a1.Votes,
            NewMode = a1.NewMode or false,
            Revamped = a1.Revamped or false,
            SubTitle = a1.SubTitle,
            tooltipData = a1.tooltipData,
            OnClick = a1.OnClick,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = v5.Size,
            Position = v5.Position,
            color = v4,
        }),
        glow = createElement("ImageLabel", {
            Image = "rbxassetid://18536357138",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = -1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(43, 43, 43, 43),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 45, 1, 45),
            Visible = v3 == a1.DifficultyText,
        }, {
            iGradient = createElement("UIGradient", {
                Rotation = 45,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v4[1]),
                    (ColorSequenceKeypoint.new(1, v4[2])),
                }),
            }),
        }),
    })
end)
DifficultyReplicator.Listen()
return function() -- Line: 263
    -- upvalues: useCharmSelector (val), DifficultyStore (val), useScale (val), useSpring (val), useGameStateValue (val)
    -- upvalues: useCache (val), useBadges (val), useCallback (val), ReplicatedStorage (val), useEffect (val)
    -- upvalues: Sound (val), createElement (val), u221 (val), u206 (val), Difficulty (val), u106 (val), Ready (val)
    -- upvalues: Players (val), VipAd (val), Title (val)
    local u4 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 264
        return a1.voted
    end)
    local u9 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 268
        return a1.gamemodeData
    end)
    local v1 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 272
        return a1.readyCount
    end)
    local v2 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 276
        return a1.readyVisible
    end)
    local u22 = useScale(1)
    local v3, u32 = useSpring(UDim2.fromScale(-1, 0.5), 1, 12, true)
    local v4, u39 = useSpring(u22, 0.6, 15, true)
    local GameMode = useGameStateValue("GameMode")
    local Intermission = useGameStateValue("Intermission")
    local v5 = GameMode == "PVP"
    local HasDifficultyVote = useGameStateValue("HasDifficultyVote")
    local DifficultyVotes = useGameStateValue("DifficultyVotes") or {}
    local HasDifficultyVoteCompleted = useGameStateValue("HasDifficultyVoteCompleted")
    local v6 = useCache("Values.Level", 0)
    local v7 = useBadges({1270412135564244}, true)
    local v8 = {GameMode}
    local v9 = useCallback(function() -- Line: 294 -- upvalues: ReplicatedStorage (upval), GameMode (val), u9 (ref), DifficultyStore (upval)
        local v1 = ReplicatedStorage.Content.Gamemodes:FindFirstChild(GameMode)
        if not v1 then
            return
        end
        local v2 = {}
        for i, j in (v1.Difficulties:GetChildren()) do
            v2[j.Name] = (j:GetChildren())
        end
        local u50 = {}
        local v3 = nil
        local v4 = nil
        for k, n in v2, v3, v4 do
            u50[k] = {}
            for m, i5 in n do
                pcall(function() -- Line: 312 -- upvalues: u50 (val), k (val), i5 (val)
                    local v1 = u50[k]
                    v1[i5.Name] = (require(i5))
                end)
            end
        end
        u9 = u50
        DifficultyStore.setGamemodeData(u50)
    end, v8)
    if GameMode and next(u9) == nil and not Intermission then
        v9()
    end
    local v10 = {u4, HasDifficultyVote}
    useEffect(function() -- Line: 327
        -- upvalues: HasDifficultyVote (val), u4 (val), u32 (val), Sound (upval), HasDifficultyVoteCompleted (val)
        -- upvalues: DifficultyStore (upval)
        if HasDifficultyVote and u4 then
            u32(UDim2.fromScale(0.5, 0.15))
            return
        end
        if HasDifficultyVote and not u4 then
            Sound("Woosh"):Play()
            u32(UDim2.fromScale(0.5, 0.5))
            return
        end
        if u4 then
            Sound("Swoosh"):Play()
        end
        if not HasDifficultyVoteCompleted then
            u32(UDim2.fromScale(-2, 0.5))
            return
        end
        u32(UDim2.fromScale(0.5, 0.15))
        task.delay(1, function() -- Line: 339 -- upvalues: DifficultyStore (upval)
            DifficultyStore.resetVote()
        end)
    end, v10)
    v10 = {u4}
    useEffect(function() -- Line: 348 -- upvalues: u4 (val), u39 (val), u22 (val)
        if u4 then
            u39(u22 * 0.75)
            return
        end
        u39(u22)
    end, v10)
    v10 = {
        BackgroundTransparency = 1,
        ZIndex = 3,
        Visible = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = v3,
        Size = UDim2.fromOffset(650, 350),
    }
    local v11 = {uiScale = createElement("UIScale", {Scale = v4})}
    local v12 = {BackgroundTransparency = 1, ZIndex = 3, Size = UDim2.fromScale(1, 1)}
    local v13 = {
        uiListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 32),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v13.easyButton = not v5 and createElement(u221, {
        LayoutOrder = 0,
        DifficultyText = "Easy",
        DifficultyAlias = "Easy",
        Revamped = false,
        Locked = v6 < u206.Easy.level,
        LevelRequired = u206.Easy.level,
        Image = u206.Easy.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.Easy ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "Easy",
            Subject = "Difficulty Information",
            Content = {
                {Text = "For players who are new to the game or want a more relaxed experience."},
                {Text = "Boss: Brute"},
                {Text = "Total waves: 25"},
                {Text = "Coins: 250"},
                {Text = "EXP: 50"},
            },
        },
        OnClick = function() -- Line: 419 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "Easy")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("Easy")
        end,
    })
    v13.casualButton = not v5 and createElement(u221, {
        LayoutOrder = 1,
        DifficultyText = "Casual",
        DifficultyAlias = "Casual",
        Revamped = false,
        Locked = v6 < u206.Casual.level,
        LevelRequired = u206.Casual.level,
        Image = u206.Casual.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.Casual ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "Casual",
            Subject = "Difficulty Information",
            Content = {
                {Text = "For players who are looking for a casual experience."},
                {Text = "Boss: Grave Digger"},
                {Text = "Total waves: 30"},
                {Text = "Coins: 400"},
                {Text = "EXP: 90"},
            },
        },
        OnClick = function() -- Line: 457 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "Casual")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("Casual")
        end,
    })
    v13.intermediateButton = not v5 and createElement(u221, {
        LayoutOrder = 2,
        DifficultyText = "Intermediate",
        DifficultyAlias = "Intermediate",
        NewMode = false,
        Locked = v6 < u206.Intermediate.level,
        LevelRequired = u206.Intermediate.level,
        Image = u206.Intermediate.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.Intermediate ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "Intermediate",
            Subject = "Difficulty Information",
            Content = {
                {Text = "For players who are familiar with the game and want a balanced experience."},
                {Text = "Boss: Patient Zero"},
                {Text = "Total waves: 30"},
                {Text = "Coins: 500"},
                {Text = "EXP: 120"},
            },
        },
        OnClick = function() -- Line: 496 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "Intermediate")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("Intermediate")
        end,
    })
    v13.moltenButton = not v5 and createElement(u221, {
        LayoutOrder = 3,
        DifficultyText = "Molten",
        DifficultyAlias = "Molten",
        Revamped = false,
        Locked = v6 < u206.Molten.level,
        LevelRequired = u206.Molten.level,
        Image = u206.Molten.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.Molten ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "Molten",
            Subject = "Difficulty Information",
            Content = {
                {Text = "For players who are experienced with the game and want a little challenge."},
                {Text = "Boss: Molten Warlord"},
                {Text = "Total waves: 35"},
                {Text = "Coins: 750"},
                {Text = "EXP: 185"},
            },
        },
        OnClick = function() -- Line: 535 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "Molten")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("Molten")
        end,
    })
    v13.fallenButton = not v5 and createElement(u221, {
        LayoutOrder = 4,
        DifficultyText = "Fallen",
        DifficultyAlias = "Fallen",
        NewMode = false,
        Revamped = false,
        Locked = v6 < u206.Fallen.level,
        LevelRequired = u206.Fallen.level,
        Image = v7:map(function(a1) -- Line: 547 -- upvalues: u206 (upval)
            if a1[1270412135564244] then
                return u206.Fallen.image2
            end
            return u206.Fallen.image
        end),
        ForceColor = v7:map(function(a1) -- Line: 554 -- upvalues: u106 (upval)
            if a1[1270412135564244] then
                return u106["Awakened Fallen King"]
            end
            return "none"
        end),
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.Fallen ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "Fallen",
            Subject = "Difficulty Information",
            Content = {
                {Text = "For players who are experts at the game and want to test their limits."},
                {Text = "Boss: Fallen King"},
                {Text = "Total waves: 40"},
                {Text = "Coins: 1000"},
                {Text = "EXP: 250"},
            },
        },
        OnClick = function() -- Line: 588 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "Fallen")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("Fallen")
        end,
    })
    v13.frostButton = not v5 and createElement(u221, {
        LayoutOrder = 5,
        DifficultyText = "Frost",
        DifficultyAlias = "Frost",
        SubTitle = "[NEW]",
        Revamped = false,
        Locked = v6 < u206.Frost.level,
        LevelRequired = u206.Frost.level,
        Image = u206.Frost.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.Frost ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "Frost",
            Subject = "Difficulty Information",
            Content = {
                {Text = "For a frosty experience."},
                {Text = "Boss: Frost Spirit"},
                {Text = "Total waves: 40"},
                {Text = "Coins: 1500"},
                {Text = "Gems: 75"},
                {Text = "EXP: 300"},
            },
        },
        OnClick = function() -- Line: 630 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "Frost")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("Frost")
        end,
    })
    v13.PVP_lowRanksButton = v5 and createElement(u221, {
        LayoutOrder = 1,
        DifficultyText = "PVP_lowRanks",
        DifficultyAlias = "Basic Arena",
        Revamped = false,
        Locked = v6 < u206.PVP_lowRanks.level,
        LevelRequired = u206.PVP_lowRanks.level,
        Image = u206.PVP_lowRanks.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.PVP_lowRanks ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "PVP Low Ranks",
            Subject = "Difficulty Information",
            Content = {
                {
                    Text = "For players who want a more relaxed competitive experience with simple enemies.",
                },
                {Text = "Boss: Champion Templar"},
                {Text = "Total waves: 30"},
                {Text = "Coins: 500 (Max)"},
                {Text = "EXP: 100 (Max)"},
            },
        },
        OnClick = function() -- Line: 670 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "PVP_lowRanks")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("PVP_lowRanks")
        end,
    })
    v13.PVP_midRanksButton = v5 and createElement(u221, {
        LayoutOrder = 2,
        DifficultyText = "PVP_midRanks",
        DifficultyAlias = "Molten Arena",
        Revamped = false,
        Locked = v6 < u206.PVP_midRanks.level,
        LevelRequired = u206.PVP_midRanks.level,
        Image = u206.PVP_midRanks.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.PVP_midRanks ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "PVP Mid Ranks",
            Subject = "Difficulty Information",
            Content = {
                {
                    Text = "A difficulty for more experienced PvP players that offers more unique and deadlier enemies.",
                },
                {Text = "Boss: Champion Templar"},
                {Text = "Total waves: 30"},
                {Text = "Coins: 500 (Max)"},
                {Text = "EXP: 100 (Max)"},
            },
        },
        OnClick = function() -- Line: 709 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "PVP_midRanks")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("PVP_midRanks")
        end,
    })
    v13.PVP_highRanksButton = v5 and createElement(u221, {
        LayoutOrder = 3,
        DifficultyText = "PVP_highRanks",
        DifficultyAlias = "Fallen Arena",
        Revamped = false,
        Locked = v6 < u206.PVP_highRanks.level,
        LevelRequired = u206.PVP_highRanks.level,
        Image = u206.PVP_highRanks.image,
        Votes = DifficultyVotes,
        Visible = DifficultyVotes.PVP_highRanks ~= nil,
        difficultyVoteCompleted = HasDifficultyVoteCompleted,
        tooltipData = {
            Header = "PVP High Ranks",
            Subject = "Difficulty Information",
            Content = {
                {
                    Text = "An intense PvP game mode with deadlier and bulkier enemies. Only for the best of the best.",
                },
                {Text = "Boss: Champion Templar"},
                {Text = "Total waves: 30"},
                {Text = "Coins: 500 (Max)"},
                {Text = "EXP: 100 (Max)"},
            },
        },
        OnClick = function() -- Line: 748 -- upvalues: Difficulty (upval), DifficultyStore (upval)
            Difficulty:InvokeServer("Vote", "PVP_highRanks")
            DifficultyStore.setVoted(true)
            DifficultyStore.setSelected("PVP_highRanks")
        end,
    })
    v11.buttons = createElement("Frame", v12, v13)
    v11.ready = createElement(Ready, {
        readyVisible = v2 and not HasDifficultyVoteCompleted,
        readyCount = v1,
        playerCount = #Players:GetPlayers(),
        OnClick = function() -- Line: 759 -- upvalues: Difficulty (upval), Sound (upval)
            Difficulty:InvokeServer("Ready")
            Sound("Click"):Play()
        end,
    })
    v11.vipAd = createElement(VipAd, {voteCompleted = HasDifficultyVoteCompleted})
    v11.title = createElement(Title, {Visible = not u4 and not HasDifficultyVoteCompleted})
    return (createElement("Frame", v10, v11))
end