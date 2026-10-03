-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingStyle
-- Decompile time: 1.20 ms

local v1 = {
    aspectRatios = {compact = 1.7777777777777777, regular = 1.3333333333333333},
    colors = {
        background = Color3.fromRGB(7, 13, 18),
        backgroundGradientEnd = Color3.fromRGB(3, 7, 10),
        backgroundGradientStart = Color3.fromRGB(6, 31, 42),
        border = Color3.fromRGB(83, 96, 109),
        borderMuted = Color3.fromRGB(112, 115, 124),
        danger = Color3.fromRGB(255, 103, 103),
        overlay = Color3.fromRGB(8, 9, 11),
        success = Color3.fromRGB(76, 210, 104),
        surface = Color3.fromRGB(16, 17, 20),
        text = Color3.fromRGB(255, 255, 255),
        textMuted = Color3.fromRGB(177, 189, 201),
        textStrong = Color3.fromRGB(247, 249, 252),
    },
    transparency = {
        background = 0.2,
        border = 0.35,
        dropShadow = 0.2,
        stroke = 0.2,
        surface = 0.08,
    },
    spacing = {micro = 1, small = 8, medium = 14, large = 18},
    cornerRadius = {
        tag = UDim.new(0, 7),
        small = UDim.new(0, 8),
        details = UDim.new(0, 9),
        panel = UDim.new(0, 10),
        card = UDim.new(0, 12),
        navigationCompact = UDim.new(0, 18),
        navigation = UDim.new(0, 22),
    },
    strokeThickness = {thin = 1, regular = 1.5, thick = 2},
    motion = {
        cardHoverScale = 1.1,
        cardPressedScale = 0.95,
        cardRevealStagger = 0.05,
        navigationScrollDuration = 0.45,
        parallaxSensitivity = 2,
        restingScale = 1,
        tileHoverScale = 1.04,
        tilePressedScale = 0.97,
        tileRevealDuration = 0.45,
        tileRevealStagger = 0.04,
    },
}

local function fontScale(a1, a2, a3) -- Line: 91 -- types: a1: number, a2: number, a3: number
    return {scale = 1, max = a3, min = a2, size = a1}
end

local u97 = {
    header1 = {
        compact = {max = 38, min = 20, scale = 1, size = 25},
        regular = {max = 38, min = 20, scale = 1, size = 32},
    },
    subheader1 = {
        compact = {max = 23, min = 14, scale = 1, size = 17},
        regular = {max = 23, min = 14, scale = 1, size = 20},
    },
    header2 = {
        compact = {max = 24, min = 14, scale = 1, size = 17},
        regular = {max = 24, min = 14, scale = 1, size = 20},
    },
    subheader2 = {
        compact = {max = 19, min = 12, scale = 1, size = 14},
        regular = {max = 19, min = 12, scale = 1, size = 16},
    },
    header3 = {
        compact = {max = 21, min = 13, scale = 1, size = 15},
        regular = {max = 21, min = 13, scale = 1, size = 18},
    },
    body = {
        compact = {max = 20, min = 13, scale = 1, size = 15},
        regular = {max = 20, min = 13, scale = 1, size = 17},
    },
    bodySmall = {
        compact = {max = 18, min = 12, scale = 1, size = 14},
        regular = {max = 18, min = 12, scale = 1, size = 15},
    },
    caption = {
        compact = {max = 17, min = 11, scale = 1, size = 12},
        regular = {max = 17, min = 11, scale = 1, size = 14},
    },
    micro = {
        compact = {max = 15, min = 10, scale = 1, size = 11},
        regular = {max = 15, min = 10, scale = 1, size = 13},
    },
    button = {
        compact = {max = 23, min = 14, scale = 1, size = 16},
        regular = {max = 23, min = 14, scale = 1, size = 20},
    },
}

function v1.getFontSize(a1, a2) -- Line: 143 -- upvalues: u97 (val) -- types: a1: string, a2: boolean?
    local v1 = u97[a1]
    if a2 then
        return v1.compact
    end
    return v1.regular
end

return v1