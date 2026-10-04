-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useBadges
-- Decompile time: 4.45 ms

local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useState = React.useState
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
local u34 = {}

local function hasBadges(a1) -- Line: 14
    -- upvalues: u34 (val), TypedPromise (val), BadgeService (val), LocalPlayer (val)
    local u1 = {}

    local function getOwnedBadgeIds() -- Line: 16 -- upvalues: a1 (val), u34 (upval)
        local v1 = {}
        for i, j in a1 do
            if u34[j] == true then
                table.insert(v1, j)
            end
        end
        return v1
    end

    for i, j in a1 do
        if u34[j] == nil then
            table.insert(u1, j)
        end
    end
    if #u1 == 0 then
        return TypedPromise.resolve((getOwnedBadgeIds()))
    end
    if #u1 == 1 then
        return TypedPromise.new(function(a1, a2) -- Line: 38
            -- upvalues: BadgeService (upval), LocalPlayer (upval), u1 (val), u34 (upval), getOwnedBadgeIds (val)
            local success, result = pcall(function() -- Line: 39 -- upvalues: BadgeService (upval), LocalPlayer (upval), u1 (upval)
                return BadgeService:UserHasBadgeAsync(LocalPlayer.UserId, u1[1])
            end)
            if not success then
                a2(result)
                return
            end
            u34[u1[1]] = result
            a1((getOwnedBadgeIds()))
        end)
    end
    return TypedPromise.new(function(a1, a2) -- Line: 54
        -- upvalues: BadgeService (upval), LocalPlayer (upval), u1 (val), u34 (upval), getOwnedBadgeIds (val)
        local success, result = pcall(function() -- Line: 55 -- upvalues: BadgeService (upval), LocalPlayer (upval), u1 (upval)
            local v1 = u1
            return BadgeService:CheckUserBadgesAsync(LocalPlayer.UserId, v1)
        end)
        if not success then
            a2(result)
            return
        end
        for i, j in u1 do
            u34[j] = false
        end
        for k, n in result do
            u34[n] = true
        end
        a1((getOwnedBadgeIds()))
    end)
end

return function(a1, a2) -- Line: 75
    -- upvalues: useReactBinding (val), useState (val), useEffect (val), hasBadges (val)
    local v1, v2
    if not a2 then
        v1, v2 = useState({})
    else
        v1, v2 = useReactBinding({})
    end
    local u14 = v1
    local u15 = v2
    local v3 = a1 or {}
    useEffect(function() -- Line: 84 -- upvalues: u15 (ref), hasBadges (upval), a1 (val), a2 (val), u14 (ref)
        u15({})
        local u13 = ((hasBadges(a1)):andThen(function(a1) -- Line: 88 -- upvalues: a2 (upval), u14 (upval), u15 (upval)
            local v1
            for i, j in a1 do
                if not a2 then
                    u15(function(a1) -- Line: 95 -- upvalues: j (val)
                        local v1 = table.clone(a1)
                        v1[j] = true
                        return v1
                    end)
                else
                    v1 = table.clone(u14:getValue())
                    v1[j] = true
                    u15(v1)
                end
            end
        end)):catch(function(a1) -- Line: 103
            warn("Failed to get badges", a1)
        end)
        return function() -- Line: 107 -- upvalues: u13 (val)
            u13:cancel()
        end
    end, v3)
    return u14
end