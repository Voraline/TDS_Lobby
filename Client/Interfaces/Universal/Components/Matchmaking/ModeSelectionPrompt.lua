-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.ModeSelectionPrompt
-- Decompile time: 4.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PromptModal = require(ReplicatedStorage.Client.Interfaces.Universal.Components.PromptModal)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local u18 = {
    {name = "Solo", count = 1, versus = "1v0"},
    {name = "Duo", count = 2, versus = "1v1"},
    {name = "Trio", count = 3},
    {name = "Quad", count = 4, versus = "2v2"},
}
local u23 = {
    frost_invasion = true,
    halloween2024 = true,
    hardcore = true,
    hunt_2025 = true,
    plsDonate = true,
    weeklyChallengeMap = true,
}

local function getModeText(a1, a2) -- Line: 62 -- upvalues: u18 (val) -- types: a1: string, a2: string
    if a2 == "pvp" then
        for i, v in ipairs(u18) do
            if v.name == a1 then
                return v.versus
            end
        end
    end
    return a1
end

local function isModeVisible(a1, a2, a3) -- Line: 74
    -- upvalues: u23 (val), u18 (val)
    local mode = a3.mode
    if a2 == 4 and u23[mode] then
        return false
    end
    if mode == "egg_hunt" then
        if a3.difficulty == "Easy" then
            return a1.name == "Solo"
        end
        return a1.name == u18[(math.clamp(a3.maxPlayers, 1, 4))].name
    end
    if mode == "pvp" then
        if a1.name == "Solo" and a3.gameId == 1176784616 then
            return false
        end
        return a1.versus ~= nil
    end
    if a1.name == "Solo" then
        if a3.showSolo then
            return true
        end
        return a3.isPrivateServer == true
    end
    if a1.name == "Quad" and a3.hideQuad then
        return false
    end
    return a3.maxPlayers <= a1.count
end

return function(a1) -- Line: 115
    -- upvalues: u18 (val), isModeVisible (val), createElement (val), PromptModal (val)
    local name, v1, versus
    local v2 = {}
    for i, v in ipairs(u18) do
        v1 = {key = v.name}
        name = v.name
        if a1.mode == "pvp" then
            for i2, i3 in ipairs(u18) do
                if i3.name == name then
                    versus = i3.versus
                    v1.text = versus
                    v1.color = Color3.new(0, 0.749019, 1)
                    v1.size = UDim2.fromOffset(240, 44)
                    v1.visible = isModeVisible(v, i, a1)

                    function v1.onClick() -- Line: 125 -- upvalues: a1 (val), v (val)
                        if a1.onSelect then
                            a1.onSelect(v.count)
                        end
                    end

                    v2[i] = v1
                    break
                end
            end
        end
        v1.text = name
        v1.color = Color3.new(0, 0.749019, 1)
        v1.size = UDim2.fromOffset(240, 44)
        v1.visible = isModeVisible(v, i, a1)

        function v1.onClick() -- Line: 125 -- upvalues: a1 (val), v (val)
            if a1.onSelect then
                a1.onSelect(v.count)
            end
        end

        v2[i] = v1
    end
    table.insert(v2, {
        key = "cancel",
        text = "Cancel",
        size = UDim2.fromOffset(240, 44),
        onClick = a1.onCancel,
    })
    local v3 = {
        noBackground = true,
        subject = "Match Type",
        description = "Choose the number of players you want to play with",
        visible = a1.visible,
    }
    local position = a1.position or UDim2.fromOffset(0, 0)
    v3.position = position
    local anchorPoint = a1.anchorPoint or Vector2.new(0, 0)
    v3.anchorPoint = anchorPoint
    v3.icon = a1.icon
    v3.actions = v2
    v3.playClick = a1.playClick
    return createElement(PromptModal, v3)
end