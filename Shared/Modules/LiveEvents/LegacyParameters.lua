-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.LegacyParameters
-- Decompile time: 7.13 ms

local HttpService = game:GetService("HttpService")
local u5 = {EndlessMaxLength = 500}

local function finite(a1, a2, a3) -- Line: 13
    local v1 = false
    if type(a1) == "number" then
        v1 = false
        if a1 == a1 then
            v1 = false
            if a2 <= a1 then
                v1 = a1 <= a3
            end
        end
    end
    return v1
end

function u5.loadout(a1) -- Line: 17
    if type(a1) == "string" and not (#a1 > 720) then
        local v1
        local v2 = {}
        local v3 = {}
        for i, j in string.split(a1, ",") do
            v1 = string.match(j, "^%s*(.-)%s*$")
            if v1 and v1 ~= "" and not (#v1 > 80) and not v3[v1] then
                v3[v1] = true
                table.insert(v2, v1)
                continue
            end
            return nil
        end
        if #v2 >= 1 and #v2 <= 9 then
            return v2
        end
        return nil
    end
    return nil
end

local u9 = {
    Interval = {0.3, 120},
    StartInterval = {0, 120},
    IntervalScaleCoefficient = {0, 10},
    IntervalScaling = {-10, 10},
    MinInterval = {0.3, 120},
    MaxInterval = {0.3, 120},
    HealthScaleCoefficient = {0, 10},
    HealthScaling = {-1000000, 1000000},
    MinHealth = {1, 10000000},
    MaxHealth = {1, 10000000},
    Weight = {0, 100},
    GlobalDelay = {0, 120},
}

local function paths(a1) -- Line: 48
    if type(a1) == "table" and #a1 ~= 0 and not (#a1 > 8) then
        local v1 = {}
        local v2 = 0
        for i, j in a1 do
            if type(i) == "number"
                and i % 1 == 0
                and not (i < 1)
                and not (#a1 < i)
                and type(j) == "string"
                and #j ~= 0
                and not (#j > 80)
                and not v1[j] then
                v1[j] = true
                v2 = v2 + 1
                continue
            end
            return nil
        end
        if v2 == #a1 then
            return v1
        end
        return nil
    end
    return nil
end

function u5.endless(a1) -- Line: 72 -- upvalues: u5 (val), HttpService (val), paths (val), u9 (val)
    if type(a1) == "string" and not (u5.EndlessMaxLength < #a1) then
        local success, result = pcall(HttpService.JSONDecode, HttpService, a1)
        if success and type(result) == "table" then
            local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
            local v14 = {}
            local v15 = 0
            local v16 = nil
            local v17 = nil
            for i, j in result, v16, v17 do
                v1 = tonumber(i)
                v2 = false
                if type(v1) == "number" then
                    v2 = false
                    if v1 == v1 then
                        v2 = false
                        if v1 >= 0 then
                            v2 = v1 <= 120
                        end
                    end
                end
                if v2 and v1 % 1 == 0 and not v14[v1] and type(j) == "table" then
                    v15 = v15 + 1
                    if v15 > 8 then
                        return nil, "Use at most eight enemy pools."
                    end
                    v2 = {SpawnDelay = 1, Enemies = {}}
                    v4 = nil
                    v5 = nil
                    for k, n in j, v4, v5 do
                        if k == "SpawnDelay" then
                            v7 = false
                            if type(n) == "number" then
                                v7 = false
                                if n == n then
                                    v7 = false
                                    if n >= 0.3 then
                                        v7 = n <= 120
                                    end
                                end
                            end
                            if v7 then
                                v2.SpawnDelay = n
                                continue
                            end
                        end
                        if k == "Paths" and paths(n) then
                            v2.Paths = paths(n)
                            continue
                        end
                        if k == "AllPaths" and type(n) == "boolean" then
                            v2.AllPaths = n
                            continue
                        end
                        if k ~= "Enemies" then
                            return nil, "An enemy pool contains an unsupported setting."
                        end
                    end
                    if type(j.Enemies) ~= "table" then
                        return nil, "Each pool needs an Enemies object."
                    end
                    v3 = 0
                    v5 = nil
                    v6 = nil
                    for m, i5 in j.Enemies, v5, v6 do
                        if type(m) == "string" and #m ~= 0 and not (#m > 80) and type(i5) == "table" then
                            v3 = v3 + 1
                            if v3 > 12 then
                                return nil, "Use at most twelve enemies per pool."
                            end
                            v8 = {Interval = 2, MinInterval = 0.3, MaxHealth = 10000000}
                            v10 = nil
                            v11 = nil
                            for i6, i7 in i5, v10, v11 do
                                v12 = u9[i6]
                                if v12 then
                                    v13 = false
                                    if type(i7) == "number" then
                                        v13 = false
                                        if i7 == i7 then
                                            v13 = false
                                            if v12[1] <= i7 then
                                                v13 = i7 <= v12[2]
                                            end
                                        end
                                    end
                                    if v13 then
                                        v8[i6] = i7
                                        continue
                                    end
                                end
                                if i6 == "Paths" and paths(i7) then
                                    v8.Paths = paths(i7)
                                    continue
                                end
                                return nil, "An enemy has an unsupported or out-of-range setting."
                            end
                            v9 = v8.MinInterval or 0.3
                            if not ((v8.MaxInterval or 120) < v9) and not (v8.MaxHealth < (v8.MinHealth or 1)) then
                                v2.Enemies[m] = v8
                                continue
                            end
                            return nil, "Enemy minimums must not exceed maximums."
                        end
                        return nil, "Each enemy needs a content name and spawn settings."
                    end
                    if v3 == 0 then
                        return nil, "An enemy pool cannot be empty."
                    end
                    v14[v1] = v2
                    continue
                end
                return nil, "Pool times must be unique whole seconds from 0 to 120."
            end
            if v15 ~= 0 and v14[0] then
                return v14, nil
            end
            return nil, "Enemy pools need an entry starting at second zero."
        end
        return nil, "Enemy pools must be a JSON object keyed by starting second."
    end
    return nil, "Enemy pools must be JSON of at most " .. u5.EndlessMaxLength .. " characters."
end

function u5.validate(a1, a2) -- Line: 147 -- upvalues: u5 (val)
    if a1 == "force-loadout" and not u5.loadout(a2.loadout) then
        return "Choose one to nine distinct tower names separated by commas."
    end
    if a1 == "add-endless-mode" then
        local v1
        _, v1 = u5.endless(a2.endlessData)
        return v1
    end
    if a1 == "add-game-modifier" and a2.name == "EndlessMode" then
        return "Use Start Endless Spawning to configure an enemy pool."
    end
    return nil
end

return u5