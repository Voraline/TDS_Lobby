-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingModel
-- Decompile time: 10.30 ms

local u0 = {}
local u1 = {"Story", "Survival", "PVP", "Arcade", "Sandbox"}
local u7 = {
    Arcade = "Arcade",
    Hardcore = "Survival",
    PvP = "PVP",
    Sandbox = "Sandbox",
    ["Special Modes"] = "Arcade",
    Story = "Story",
    StoryMode = "Story",
    Survival = "Survival",
    Trials = "Arcade",
}
local u17 = {Badlands = true, PizzaParty = true, PollutedWasteland = true}
u0.SECTION_ORDER = {"Survival", "Story", "PVP", "Arcade", "Sandbox"}
u0.NAV_ITEMS = {
    {id = "Survival", title = "Survival", icon = 127015963210896},
    {id = "Story", title = "Story", icon = 6053790733},
    {id = "PVP", title = "PVP", icon = 116830879231827},
    {id = "Arcade", title = "Arcade", icon = 136916938940878},
    {id = "Sandbox", title = "Sandbox", icon = 109699732911399},
}
u0.SQUAD_SIZE_OPTIONS = {
    {
        id = "solo",
        title = "Solo",
        subtitle = "1 Player",
        playerCount = 1,
        backgroundImage = 97114317696329,
        foregroundImage = 139606842766700,
    },
    {
        id = "duo",
        title = "Duo",
        subtitle = "2 Players",
        playerCount = 2,
        backgroundImage = 97114317696329,
        foregroundImage = 132540015709205,
    },
    {
        id = "trio",
        title = "Trio",
        subtitle = "3 Players",
        playerCount = 3,
        backgroundImage = 97114317696329,
        foregroundImage = 82763221350924,
    },
    {
        id = "quad",
        title = "Quad",
        subtitle = "4 Players",
        playerCount = 4,
        backgroundImage = 97114317696329,
        foregroundImage = 91192473479229,
    },
    {
        id = "five",
        title = "Squads",
        subtitle = "5 Players",
        playerCount = 5,
        backgroundImage = 97114317696329,
        foregroundImage = 91192473479229,
    },
    {
        id = "six",
        title = "Mega",
        subtitle = "6 Players",
        playerCount = 6,
        backgroundImage = 97114317696329,
        foregroundImage = 91192473479229,
    },
}
u0.MODE_GROUPS = {
    Survival = {
        {
            id = "easy",
            title = "Easy",
            subtitle = "For new players",
            image = 122888714711215,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {difficulty = "Easy", mode = "survival", requirements = {maxPartySize = 4}},
        },
        {
            id = "casual",
            title = "Casual",
            subtitle = "For the casual players",
            image = 109434392368552,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {difficulty = "Casual", mode = "survival", requirements = {maxPartySize = 4}},
        },
        {
            id = "intermediate",
            title = "Intermediate",
            subtitle = "A balanced Experience",
            image = 111774195338037,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {
                difficulty = "Intermediate",
                mode = "survival",
                requirements = {maxPartySize = 4, minLevel = 5},
            },
        },
        {
            id = "molten",
            title = "Molten",
            subtitle = "For a molten experience",
            image = 119348057943352,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {difficulty = "Molten", mode = "survival", requirements = {maxPartySize = 4, minLevel = 15}},
        },
        {
            id = "fallen",
            title = "Fallen",
            subtitle = "For the experienced player",
            image = 131185187085184,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {difficulty = "Fallen", mode = "survival", requirements = {maxPartySize = 4, minLevel = 30}},
        },
        {
            id = "frost",
            title = "Frost",
            subtitle = "For a frosty experience",
            image = 95455129490904,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {difficulty = "Frost", mode = "survival", requirements = {maxPartySize = 4, minLevel = 60}},
        },
        {
            id = "hardcore",
            title = "Hardcore",
            subtitle = "Hardcore mode",
            image = 81166307256300,
            imageScale = 1,
            locked = false,
            maxPlayers = 3,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {difficulty = "Easy", mode = "hardcore", requirements = {maxPartySize = 3, minLevel = 50}},
        },
        {
            id = "voidcore",
            title = "Voidcore",
            subtitle = "Only for the best",
            image = 139538982655951,
            imageScale = 1,
            locked = false,
            maxPlayers = 3,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {
                difficulty = "Hard",
                mode = "hardcore",
                requirements = {maxPartySize = 3, minLevel = 50, requiresVoidcoreAccess = true},
            },
        },
    },
    Story = {},
    PVP = {
        {
            id = "casual-1v1",
            title = "1v1",
            subtitle = "A quick head-to-head match",
            image = 109843754242349,
            imageScale = 1.2,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "PVP", ranked = false, teamSize = 1},
            queue = {
                difficulty = "Casual",
                mode = "pvp",
                targetPlayerCount = 2,
                requirements = {minLevel = 25, requiresPvpEnabled = true, allowedPartySizes = {1, 2}},
            },
        },
        {
            id = "casual-2v2",
            title = "2v2",
            subtitle = "Team up for a casual match",
            image = 109843754242349,
            imageScale = 1.2,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "PVP", ranked = false, teamSize = 2},
            queue = {
                difficulty = "Casual",
                mode = "pvp",
                targetPlayerCount = 4,
                requirements = {minLevel = 25, requiresPvpEnabled = true, allowedPartySizes = {1, 2, 4}},
            },
        },
        {
            id = "ranked-1v1",
            title = "Ranked 1v1",
            subtitle = "Climb the ranks on your own",
            image = 109843754242349,
            imageScale = 1.2,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "PVP", ranked = true, teamSize = 1},
            queue = {
                difficulty = "Ranked",
                mode = "pvp",
                targetPlayerCount = 2,
                requirements = {minLevel = 25, requiresPvpEnabled = true, allowedPartySizes = {1}},
            },
        },
        {
            id = "ranked-2v2",
            title = "Ranked 2v2",
            subtitle = "Coordinate and climb together",
            image = 109843754242349,
            imageScale = 1.2,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "PVP", ranked = true, teamSize = 2},
            queue = {
                difficulty = "Ranked",
                mode = "pvp",
                targetPlayerCount = 4,
                requirements = {minLevel = 25, requiresPvpEnabled = true, allowedPartySizes = {1, 2}},
            },
        },
    },
    Arcade = {
        {
            id = "pizza-party",
            title = "Pizza Party",
            subtitle = "Survive the midnight shift",
            image = 90476859795973,
            imageScale = 1.25,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {mode = "halloween", requirements = {maxPartySize = 4, minLevel = 25}},
        },
        {
            id = "badlands-ii",
            title = "Badlands II",
            subtitle = "Defend the desert frontier",
            image = 84070807773453,
            imageScale = 1.2,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {mode = "badlands", requirements = {maxPartySize = 4, minLevel = 25}},
        },
        {
            id = "polluted-wasteland",
            title = "Polluted Wasteland II",
            subtitle = "Enter the toxic exclusion zone",
            image = 76881718117739,
            imageScale = 1.2,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            queue = {mode = "polluted", requirements = {maxPartySize = 4, minLevel = 50}},
        },
    },
    Sandbox = {
        {
            id = "sandbox-solo",
            title = "Solo",
            subtitle = "A private sandbox for one",
            image = 86222648616019,
            imageScale = 0.5,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "Sandbox"},
            queue = {
                mode = "sandbox",
                targetPlayerCount = 1,
                requirements = {
                    levelBypassEntitlement = "SandboxAdmin",
                    maxPartySize = 1,
                    minPartySize = 1,
                    minLevel = 250,
                    requiresSandboxEnabled = true,
                },
            },
        },
        {
            id = "sandbox-duo",
            title = "Duo",
            subtitle = "Experiment with a partner",
            image = 132890174210992,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "Sandbox"},
            queue = {
                mode = "sandbox",
                targetPlayerCount = 2,
                requirements = {
                    levelBypassEntitlement = "SandboxAdmin",
                    maxPartySize = 2,
                    minPartySize = 2,
                    minLevel = 250,
                    requiresSandboxEnabled = true,
                },
            },
        },
        {
            id = "sandbox-trio",
            title = "Trio",
            subtitle = "Bring a three-player squad",
            image = 136976245980452,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "Sandbox"},
            queue = {
                mode = "sandbox",
                targetPlayerCount = 3,
                requirements = {
                    levelBypassEntitlement = "SandboxAdmin",
                    maxPartySize = 3,
                    minPartySize = 3,
                    minLevel = 250,
                    requiresSandboxEnabled = true,
                },
            },
        },
        {
            id = "sandbox-quad",
            title = "Quad",
            subtitle = "The classic four-player party",
            image = 94748862987156,
            imageScale = 1,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "Sandbox"},
            queue = {
                mode = "sandbox",
                targetPlayerCount = 4,
                requirements = {
                    levelBypassEntitlement = "SandboxAdmin",
                    maxPartySize = 4,
                    minPartySize = 4,
                    minLevel = 250,
                    requiresSandboxEnabled = true,
                },
            },
        },
        {
            id = "sandbox-squads",
            title = "Squads",
            subtitle = "A larger five-player sandbox",
            image = 101215858621228,
            imageScale = 0.6,
            locked = false,
            imageOffset = UDim2.fromScale(0, -0.2),
            artworkDescriptor = {type = "Sandbox"},
            queue = {
                mode = "sandbox",
                targetPlayerCount = 5,
                requirements = {
                    levelBypassEntitlement = "SandboxAdmin",
                    maxPartySize = 5,
                    minPartySize = 5,
                    minLevel = 250,
                    requiredEntitlement = "SandboxAdmin",
                    requiresSandboxEnabled = true,
                },
            },
        },
        {
            id = "sandbox-mega",
            title = "Mega",
            subtitle = "Maximum room for experiments",
            image = 79739189350815,
            imageScale = 0.7,
            locked = false,
            imageOffset = UDim2.fromScale(0, 0),
            artworkDescriptor = {type = "Sandbox"},
            queue = {
                mode = "sandbox",
                targetPlayerCount = 6,
                requirements = {
                    levelBypassEntitlement = "SandboxAdmin",
                    maxPartySize = 6,
                    minPartySize = 6,
                    minLevel = 250,
                    requiredEntitlement = "SandboxAdmin",
                    requiresSandboxEnabled = true,
                },
            },
        },
    },
}

function u0.getPopularCategoryCounts(a1) -- Line: 734 -- upvalues: u17 (val), u7 (val) -- types: a1: table?
    local v1, v2, v3
    local v4 = {
        Arcade = 0,
        PVP = 0,
        Sandbox = 0,
        Story = 0,
        Survival = 0,
    }
    local v5 = nil
    local v6 = nil
    for i, j in a1 or {}, v5, v6 do
        if type(j) == "table" then
            v2 = nil
            v3 = nil
            for k, n in j, v2, v3 do
                if type(n) == "number" and not (n <= 0) then
                    v1 = if not u17[k] then u7[i] else "Arcade"
                    if v1 then
                        v4[v1] = v4[v1] + n
                    end
                end
            end
        end
    end
    return v4
end

function u0.getMostPopularCategory(a1) -- Line: 767 -- upvalues: u0 (val), u1 (val) -- types: a1: table?
    local v1
    local v2 = u0.getPopularCategoryCounts(a1)
    local v3 = nil
    local v4 = 0
    for i, j in u1 do
        v1 = v2[j]
        if v4 < v1 then
            v3 = j
        end
    end
    return v3
end

function u0.findMode(a1, a2, a3) -- Line: 784 -- upvalues: u0 (val) -- types: a1: string, a2: string?, a3: table?
    for i, j in (a3 or u0.MODE_GROUPS)[a1] do
        if j.id == a2 then
            return j
        end
    end
    return nil
end

function u0.findSquadSize(a1) -- Line: 796 -- upvalues: u0 (val) -- types: a1: string?
    for i, j in u0.SQUAD_SIZE_OPTIONS do
        if j.id == a1 then
            return j
        end
    end
    return nil
end

function u0.resolveSquadMode(a1, a2, a3) -- Line: 806
    -- upvalues: u0 (val)
    if a1 ~= "Survival" and a1 ~= "Arcade" then
        return nil
    end
    local v1 = u0.findMode(a1, a2, a3)
    if v1 and not v1.locked then
        return v1
    end
    return nil
end

local function hasEntitlement(a1, a2) -- Line: 823 -- types: a1: table, a2: string
    if a2 == "SandboxAdmin" then
        return a1.hasSandboxAdmin
    end
    return false
end

function u0.getQueueAvailability(a1, a2) -- Line: 831 -- types: a1: table, a2: table
    if a1.locked then
        return {locked = true, lockReason = a1.lockReason}
    end
    local queue = a1.queue
    local requirements = queue and queue.requirements
    if queue and requirements then
        if requirements.unavailableReason then
            return {locked = true, lockReason = requirements.unavailableReason}
        end
        if requirements.requiresPvpEnabled and not a2.pvpEnabled then
            return {locked = true, lockReason = "PVP is currently unavailable."}
        end
        if requirements.requiresSandboxEnabled and not a2.sandboxEnabled then
            return {locked = true, lockReason = "Sandbox is currently unavailable."}
        end
        if not a2.isPartyLeader then
            return {locked = true, lockReason = "Only the party leader can start matchmaking."}
        end
        if requirements.requiredEntitlement
            and not (if requirements.requiredEntitlement ~= "SandboxAdmin" then false else a2.hasSandboxAdmin) then
            return {locked = true, lockReason = "Purchase \"Admin Gamepass\" to unlock."}
        end
        if requirements.requiresVoidcoreAccess and not a2.hasVoidcoreAccess then
            return {locked = true, lockReason = "Complete Hardcore to unlock."}
        end
        if requirements.minLevel and a2.playerLevel < requirements.minLevel then
            local levelBypassEntitlement = requirements.levelBypassEntitlement and (if requirements.levelBypassEntitlement ~= "SandboxAdmin" then false else a2.hasSandboxAdmin)
            if not levelBypassEntitlement then
                local v1 = {locked = true}
                local v2 = if requirements.levelBypassEntitlement ~= "SandboxAdmin" then ("Reach level %* to unlock."):format(requirements.minLevel) else ("Reach level %* or own the Admin Gamepass to unlock."):format(requirements.minLevel)
                v1.lockReason = v2
                return v1
            end
        end
        if requirements.allowedPartySizes and not table.find(requirements.allowedPartySizes, a2.partySize) then
            return {locked = true, lockReason = "Party size too big."}
        end
        if requirements.maxPartySize and requirements.maxPartySize < a2.partySize then
            return {locked = true, lockReason = "Party size too big."}
        end
        if requirements.minPartySize and a2.partySize < requirements.minPartySize then
            return {locked = true, lockReason = "Not enough party members"}
        end
        return {locked = false}
    end
    return {locked = false}
end

function u0.applyAvailability(a1, a2) -- Line: 937 -- upvalues: u0 (val) -- types: a1: table, a2: table
    local v1, v2, v3, v4
    local v5 = {}
    local v6 = nil
    local v7 = nil
    for i, j in u0.SECTION_ORDER, v6, v7 do
        v3 = a1[j]
        v4 = table.create(#v3)
        for k, n in v3 do
            v1 = table.clone(n)
            v2 = u0.getQueueAvailability(v1, v8)
            v1.locked = v2.locked
            v1.lockReason = v2.lockReason
            v4[k] = v1
        end
        v5[j] = v4
    end
    return v5
end

function u0.buildQueueRequest(a1, a2) -- Line: 961 -- types: a1: table, a2: number?
    local queue = a1.queue
    if not queue then
        return nil
    end
    local v1 = queue.targetPlayerCount or a2
    if not v1 then
        return nil
    end
    return {
        difficulty = queue.difficulty,
        mode = queue.mode,
        playerCount = v1,
        story = queue.story,
    }
end

function u0.findSection(a1, a2) -- Line: 980 -- types: a1: table, a2: string?
    for i, j in a1 do
        if j.id == a2 then
            return j
        end
    end
    return nil
end

function u0.findMission(a1, a2) -- Line: 990 -- types: a1: table, a2: string
    for i, j in a1.missions do
        if j.id == a2 then
            return j
        end
    end
    return nil
end

function u0.findStoryEntry(a1, a2) -- Line: 1000 -- types: a1: table, a2: string
    for i, j in a1.entries do
        if j.id == a2 then
            return j
        end
    end
    return nil
end

function u0.createStoryModeEntry(a1, a2) -- Line: 1010 -- types: a1: table, a2: table
    local v1 = math.clamp(math.floor(a2.maxPlayers or 4), 1, 4)
    return {
        id = ("%*/%*"):format(a1.id, a2.id),
        title = a2.title,
        subtitle = a1.title,
        image = a2.mapImage,
        locked = a2.locked,
        lockReason = a2.lockReason,
        maxPlayers = v1,
        queue = {
            mode = "story",
            requirements = {maxPartySize = v1},
            story = {chapter = a2.chapterNumber, mission = a2.missionNumber},
            targetPlayerCount = if v1 ~= 1 then nil else 1,
        },
    }
end

function u0.firstUnlockedId(a1) -- Line: 1038 -- types: a1: table
    for i, j in a1 do
        if j.locked ~= true then
            return j.id
        end
    end
    return nil
end

function u0.resolveStoryEntrySelection(a1, a2, a3) -- Line: 1050
    -- upvalues: u0 (val)
    local v1 = if not a2 then nil else u0.findSection(a1, a2)
    if v1 and v1.locked then
        v1 = nil
    end
    if not v1 then
        for i, j in a1 do
            if not j.locked then
                v1 = j
                break
            end
        end
    end
    if not v1 then
        return nil, nil
    end
    local v2 = if not a3 then nil else u0.findStoryEntry(v1, a3)
    if v2 and v2.locked then
        v2 = nil
    end
    if not v2 then
        for k, n in v1.entries do
            if not n.locked then
                return v1, n
            end
        end
    end
    return v1, v2
end

function u0.resolveStorySelection(a1, a2, a3) -- Line: 1096
    -- upvalues: u0 (val)
    local v1 = if not a2 then nil else u0.findSection(a1, a2)
    if v1 and v1.locked then
        v1 = nil
    end
    if not v1 then
        for i, j in a1 do
            if not j.locked then
                v1 = j
                break
            end
        end
    end
    if not v1 then
        return nil, nil
    end
    local v2 = if not a3 then nil else u0.findMission(v1, a3)
    if v2 and v2.locked then
        v2 = nil
    end
    if not v2 then
        for k, n in v1.missions do
            if not n.locked then
                return v1, n
            end
        end
    end
    return v1, v2
end

return u0