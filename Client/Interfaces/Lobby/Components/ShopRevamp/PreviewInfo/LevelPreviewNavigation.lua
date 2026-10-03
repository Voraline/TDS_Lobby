-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.PreviewInfo.LevelPreviewNavigation
-- Decompile time: 3.10 ms

local u0 = {}

function u0.createInitialState() -- Line: 18
    return {level = 0, choosingPath = false, lastPath = 1}
end

local function hasBranch(a1) -- Line: 27 -- types: a1: table
    local v1 = false
    if a1.branchLevel ~= nil then
        v1 = 1 < a1.pathCount
    end
    return v1
end

local function getPreferredPath(a1, a2) -- Line: 31 -- types: a1: table, a2: table
    return (math.clamp(a1.path or a1.lastPath or 1, 1, (math.max(a2.pathCount, 1))))
end

function u0.next(a1, a2) -- Line: 35 -- types: a1: table, a2: table
    if a1.choosingPath then
        return a1
    end
    if (math.max(a2.maxLevel, 0)) <= a1.level then
        local v1 = {level = 0, choosingPath = false}
        local path = a1.path or a1.lastPath
        v1.lastPath = path
        return v1
    end
    local branchLevel = a2.branchLevel
    local v2 = false
    if a2.branchLevel ~= nil then
        v2 = 1 < a2.pathCount
    end
    if v2 and branchLevel and a1.level == branchLevel - 1 then
        v2 = {choosingPath = true, level = a1.level}
        local path_2 = a1.path or a1.lastPath
        v2.lastPath = path_2
        return v2
    end
    v2 = a1.level + 1
    local v3 = {choosingPath = false, level = v2}
    v3.path = if not branchLevel or not (branchLevel <= v2) then nil else math.clamp(a1.path or a1.lastPath or 1, 1, (math.max(a2.pathCount, 1)))
    v3.lastPath = a1.lastPath
    return v3
end

function u0.previous(a1, a2) -- Line: 71 -- types: a1: table, a2: table
    local v1, v2
    local branchLevel = a2.branchLevel
    if a1.choosingPath then
        return {choosingPath = false, level = a1.level, lastPath = a1.lastPath}
    end
    if a1.level <= 0 then
        v1 = math.max(a2.maxLevel, 0)
        local v3 = false
        if a2.branchLevel ~= nil then
            v3 = 1 < a2.pathCount
        end
        v2 = if not v3 or not branchLevel or not (branchLevel <= v1) then nil else math.clamp(a1.path or a1.lastPath or 1, 1, (math.max(a2.pathCount, 1)))
        return {choosingPath = false, level = v1, path = v2, lastPath = v2 or a1.lastPath}
    end
    v1 = false
    if a2.branchLevel ~= nil then
        v1 = 1 < a2.pathCount
    end
    if v1 and branchLevel and a1.level == branchLevel then
        v1 = {choosingPath = true, level = branchLevel - 1}
        local path_2 = a1.path or a1.lastPath
        v1.lastPath = path_2
        return v1
    end
    v1 = a1.level - 1
    v2 = {choosingPath = false, level = v1}
    v2.path = if not branchLevel then nil else if not (branchLevel <= v1) then nil else a1.path
    local path_4 = a1.path or a1.lastPath
    v2.lastPath = path_4
    return v2
end

function u0.selectPath(a1, a2, a3) -- Line: 117 -- types: a1: table, a2: table, a3: number
    local branchLevel = a2.branchLevel
    if a1.choosingPath then
        local v1 = false
        if a2.branchLevel ~= nil then
            v1 = 1 < a2.pathCount
        end
        if v1 and branchLevel and not (a3 < 1) and not (a2.pathCount < a3) then
            return {choosingPath = false, level = branchLevel, path = a3, lastPath = a3}
        end
    end
    return a1
end

function u0.getIndicatorCount(a1) -- Line: 141 -- types: a1: table
    local v1 = math.max(a1.maxLevel, 0) + 1
    local v2 = false
    if a1.branchLevel ~= nil then
        v2 = 1 < a1.pathCount
    end
    return v1 + (if not v2 then 0 else 1)
end

function u0.getIndicatorIndex(a1, a2) -- Line: 145 -- upvalues: u0 (val) -- types: a1: table, a2: table
    local branchLevel = a2.branchLevel
    local v1 = false
    if a2.branchLevel ~= nil then
        v1 = 1 < a2.pathCount
    end
    if v1 and branchLevel then
        if a1.choosingPath then
            return branchLevel + 1
        end
        return (math.clamp(a1.level + 1 + (if not (branchLevel <= a1.level) then 0 else 1), 1, (u0.getIndicatorCount(a2))))
    end
    return (math.clamp(a1.level + 1, 1, (u0.getIndicatorCount(a2))))
end

return u0