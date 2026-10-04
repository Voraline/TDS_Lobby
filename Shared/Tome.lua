-- Script path: ReplicatedStorage.Shared.Tome
-- Decompile time: 12.46 ms

local evaluateComparison

local function cloneQuest(a1) -- Line: 96 -- types: a1: table
    local v1
    local v2 = table.clone(a1)
    v2.objectives = {}
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in a1.objectives, v3, v4 do
        v1 = table.clone(j)
        if j.filter then
            v1.filter = table.clone(j.filter)
        end
        v2.objectives[i] = v1
    end
    v2.rewards = {}
    for k, n in v5.rewards do
        v2.rewards[k] = (table.clone(n))
    end
    if v5.cost then
        v2.cost = table.clone(v5.cost)
    end
    if v5.tags then
        v2.tags = table.clone(v5.tags)
    end
    if v5.templateVariables then
        v2.templateVariables = table.clone(v5.templateVariables)
    end
    if v5.metadata then
        v2.metadata = table.clone(v5.metadata)
    end
    return v2
end

local function generateId() -- Line: 132
    local v1 = {}
    for i = 1, 16 do
        v1[i] = (math.random(0, 255))
    end
    v1[7] = (bit32.bor(bit32.band(v1[7], 15), 64))
    v1[9] = (bit32.bor(bit32.band(v1[9], 63), 128))
    return string.gsub(string.format(
        "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
        v1[1],
        v1[2],
        v1[3],
        v1[4],
        v1[5],
        v1[6],
        v1[7],
        v1[8],
        v1[9],
        v1[10],
        v1[11],
        v1[12],
        v1[13],
        v1[14],
        v1[15],
        v1[16]
    ), "-", "")
end

local function processTemplate(a1, a2) -- Line: 166 -- types: a1: string, a2: table
    return (string.gsub(string.gsub(a1, "%$(%d+)", function(a1) -- Line: 167 -- upvalues: a2 (val) -- types: a1: string
        local v1 = tonumber(a1)
        if v1 then
            return (tostring(a2[v1] or ""))
        end
        return ""
    end), "%${([%w_]+)}", function(a1) -- Line: 175 -- upvalues: a2 (val) -- types: a1: string
        return (tostring(a2[a1] or ""))
    end))
end

local function parseComparison(a1) -- Line: 182
    if type(a1) ~= "string" then
        return "=", a1
    end
    local v1, v2 = string.match(a1, "^([<>=!]+)(.+)$")
    if not v1 then
        return "=", a1
    end
    local v3 = tonumber(v2)
    if v3 ~= nil then
        return v1, v3
    end
    return v1, v2
end

local function isArray(a1) -- Line: 200
    if type(a1) ~= "table" then
        return false
    end
    local v1 = 0
    for i in a1 do
        if type(i) == "number" and not (i < 1) and i % 1 == 0 then
            v1 = v1 + 1
            continue
        end
        return false
    end
    local v2 = false
    if v1 == #a1 then
        v2 = v1 > 0
    end
    return v2
end

function evaluateComparison(a1, a2) -- Line: 217 -- upvalues: isArray (val), evaluateComparison (val)
    local v1, v2
    if isArray(a2) then
        for i, j in a2 do
            if evaluateComparison(a1, j) then
                return true
            end
        end
        return false
    end
    if type(a2) == "string" then
        local v3, v4 = string.match(a2, "^([<>=!]+)(.+)$")
        if v3 then
            local v5 = tonumber(v4)
            if v5 == nil then
                v1 = v3
                v2 = v4
            else
                v1 = v3
                v2 = v5
            end
        else
            v1 = "="
            v2 = a2
        end
    else
        v1 = "="
        v2 = a2
    end
    if v1 ~= ">" and v1 ~= ">=" and v1 ~= "<" and v1 ~= "<=" then
        if v1 == "=" then
            return a1 == v2
        end
        if v1 == "!=" then
            return a1 ~= v2
        end
        if v1 == ">" then
            return v2 < a1
        end
        if v1 == ">=" then
            return v2 <= a1
        end
        if v1 == "<" then
            return a1 < v2
        end
        if v1 == "<=" then
            return a1 <= v2
        end
        return a1 == a2
    end
    if type(a1) == "number" and type(v2) == "number" then
        if v1 == "=" then
            return a1 == v2
        end
        if v1 == "!=" then
            return a1 ~= v2
        end
        if v1 == ">" then
            return v2 < a1
        end
        if v1 == ">=" then
            return v2 <= a1
        end
        if v1 == "<" then
            return a1 < v2
        end
        if v1 == "<=" then
            return a1 <= v2
        end
        return a1 == a2
    end
    return false
end

local function getMetadataValue(a1, a2) -- Line: 253 -- types: a1: table, a2: string
    local v1 = a1[a2]
    if v1 ~= nil then
        return v1
    end
    local v2 = string.match(a2, "^([%a_]+)%d*$")
    if v2 and v2 ~= a2 then
        return a1[v2]
    end
    return nil
end

local function filterMatchesPositionalArg(a1, a2) -- Line: 267
    -- upvalues: evaluateComparison (val)
    if not a1 then
        return false
    end
    for i, j in a1 do
        if evaluateComparison(j, a2) then
            return true
        end
    end
    return false
end

local function matchesFilter(a1, a2) -- Line: 281 -- upvalues: evaluateComparison (val) -- types: a1: table, a2: table?
    local v1, v2, v3
    if not a1.filter then
        return true
    end
    if not a2 then
        return false
    end
    local v4 = a1.filterMatchType or "ALL"
    local v5 = false
    local args = a2.args
    local v6 = nil
    local v7 = nil
    local v8 = a2
    for i, j in a1.filter, v6, v7 do
        v2 = v8[i]
        if v2 == nil then
            v3 = string.match(i, "^([%a_]+)%d*$")
            v1 = if not v3 then nil else if v3 == i then nil else v8[v3]
        else
            v1 = v2
        end
        if v1 ~= nil then
            v2 = evaluateComparison(v1, j)
        else
            if args then
                for k, n in args do
                    if evaluateComparison(n, j) then
                        if v4 == "ALL" and false then
                            return false
                        end
                        if v4 == "ANY" and v2 then
                            v5 = true
                        end
                        break
                    end
                end
            end
            v2 = false
        end
        if v4 == "ALL" and not v2 then
            return false
        end
        if v4 == "ANY" and v2 then
            v5 = true
        end
    end
    local v9 = true
    if v4 ~= "ALL" then
        v9 = v5
    end
    return v9
end

local function getObjectiveProgress(a1, a2) -- Line: 318 -- types: a1: table, a2: table
    local v1 = a1.objectives[a2.id]
    if v1 ~= nil then
        return v1
    end
    return a2.current or 0
end

local function isCompleted(a1, a2) -- Line: 331 -- types: a1: table, a2: table
    local v1, v2
    local v3 = nil
    local v4 = nil
    for i, j in a1.objectives, v3, v4 do
        if j.requirement == "REQUIRED" then
            v2 = a2.objectives[j.id]
            v1 = if v2 == nil then j.current or 0 else v2
            if not (j.amount <= v1) then
                return false
            end
        end
    end
    return true
end

local function getCurrentObjectives(a1, a2, a3, a4) -- Line: 361
    -- upvalues: matchesFilter (val)
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = {}
    if a1.objectiveMode == "PARALLEL" then
        v6 = nil
        v7 = nil
        for k, n in a1.objectives, v6, v7 do
            v3 = a2.objectives[n.id]
            v2 = if v3 == nil then n.current or 0 else v3
            if not (n.amount <= v2) then
                if not v4 then
                    if matchesFilter(n, v5) then
                        table.insert(v8, n)
                    end
                elseif n.type == v4 and matchesFilter(n, v5) then
                    table.insert(v8, n)
                end
            end
        end
        return v8
    end
    local objectives_2 = a1.objectives
    v6 = nil
    v7 = nil
    v1, v4, v5 = a2, a3, a4
    for i, j in objectives_2, v6, v7 do
        if j.requirement == "OPTIONAL" then
            v3 = v1.objectives[j.id]
            v2 = if v3 == nil then j.current or 0 else v3
            if j.amount <= v2 then
                continue
            end
        end
        v3 = v1.objectives[j.id]
        v2 = if v3 == nil then j.current or 0 else v3
        if not (j.amount <= v2) then
            if v4 and j.type ~= v4 then
                return v8
            end
            if matchesFilter(j, v5) then
                table.insert(v8, j)
            end
            return v8
        end
    end
    return v8
end

local function coerceProgressValue(a1, a2) -- Line: 412 -- types: a2: table
    if type(a1) ~= "boolean" then
        return a1
    end
    if a1 then
        return a2.amount
    end
    return 0
end

return {
    create = function() -- Line: 557 -- upvalues: generateId (val), processTemplate (val), cloneQuest (val)
        local u0 = {}
        u0._quest = {
            name = "",
            description = "",
            state = "AVAILABLE",
            objectiveMode = "SEQUENTIAL",
            id = generateId(),
            objectives = {},
            rewards = {},
            tags = {},
        }

        function u0.id(a1) -- Line: 571 -- upvalues: u0 (val) -- types: a1: string
            u0._quest.id = a1
            return u0
        end

        function u0.name(a1) -- Line: 576 -- upvalues: u0 (val) -- types: a1: string
            u0._quest.name = a1
            return u0
        end

        function u0.description(a1) -- Line: 581 -- upvalues: u0 (val) -- types: a1: string
            u0._quest.description = a1
            return u0
        end

        function u0.state(a1) -- Line: 586 -- upvalues: u0 (val) -- types: a1: string
            u0._quest.state = a1
            return u0
        end

        function u0.objectiveMode(a1) -- Line: 591 -- upvalues: u0 (val) -- types: a1: string
            u0._quest.objectiveMode = a1
            return u0
        end

        function u0.objective(a1) -- Line: 596 -- upvalues: generateId (upval), u0 (val) -- types: a1: table
            local v1 = {current = 0}
            local id = a1.id or generateId()
            v1.id = id
            v1.type = a1.type
            v1.amount = a1.amount or 1
            v1.description = a1.description
            v1.requirement = a1.requirement or "REQUIRED"
            v1.progressType = a1.progressType or "INCREMENT"
            v1.itemId = a1.itemId
            v1.filter = a1.filter
            v1.filterMatchType = a1.filterMatchType or "ALL"
            v1.order = a1.order
            v1.resetOnFail = a1.resetOnFail
            table.insert(u0._quest.objectives, v1)
            return u0
        end

        function u0.reward(a1) -- Line: 616 -- upvalues: u0 (val) -- types: a1: table
            local v1 = table.clone(a1)
            v1.deliveryType = a1.deliveryType or "CLAIM_REQUIRED"
            v1.claimed = a1.claimed == true
            table.insert(u0._quest.rewards, v1)
            return u0
        end

        function u0.cost(a1) -- Line: 625 -- upvalues: u0 (val) -- types: a1: table
            u0._quest.cost = {currency = a1.currency, amount = a1.amount}
            return u0
        end

        function u0.withCategory(a1) -- Line: 633 -- upvalues: u0 (val) -- types: a1: string
            u0._quest.category = a1
            return u0
        end

        function u0.withTags(...) -- Line: 638 -- upvalues: u0 (val)
            u0._quest.tags = {...}
            return u0
        end

        function u0.withMetadata(a1) -- Line: 643 -- upvalues: u0 (val) -- types: a1: table
            u0._quest.metadata = a1
            return u0
        end

        function u0.withTemplate(a1) -- Line: 648 -- upvalues: u0 (val), processTemplate (upval) -- types: a1: table
            u0._quest.templateVariables = a1
            u0._quest.name = processTemplate(u0._quest.name, a1)
            u0._quest.description = processTemplate(u0._quest.description, a1)
            for i, j in u0._quest.objectives do
                if j.description then
                    j.description = processTemplate(j.description, a1)
                end
            end
            return u0
        end

        function u0.build() -- Line: 663 -- upvalues: u0 (val), cloneQuest (upval)
            assert(u0._quest.name ~= "", "Quest name is required")
            local v1 = false
            for i, j in u0._quest.objectives do
                if j.requirement == "REQUIRED" then
                    v1 = true
                    break
                end
            end
            assert(v1, "Quest must have at least one required objective")
            if u0._quest.description == "" then
                local _quest = u0._quest
                local description = u0._quest.objectives[1].description or u0._quest.name
                _quest.description = description
            end
            return (cloneQuest(u0._quest))
        end

        return u0
    end,
    clone = cloneQuest,
    createProgress = function(a1, a2) -- Line: 343 -- types: a1: table, a2: string?
        local id, rewards_2
        local v1 = {state = a2 or a1.state}
        v1.objectives = {}
        v1.rewards = {}
        for i, j in a1.objectives do
            v1.objectives[j.id] = j.current or 0
        end
        local v2 = nil
        local v3 = nil
        for k, n in a1.rewards, v2, v3 do
            rewards_2 = v1.rewards
            id = n.id or ("%*:%*"):format(n.type, k)
            rewards_2[id] = n.claimed == true
        end
        return v1
    end,
    fromProgress = function(a1, a2) -- Line: 686 -- types: a1: table, a2: table
        local id, rewards, v1, v2, v3
        local v4 = table.clone(a1)
        v4.state = a2.state
        local v5 = table.clone(a1.objectives)
        local v6 = nil
        local v7 = nil
        local v8, v9 = a1, a2
        for i, j in v5, v6, v7 do
            v3 = table.clone(j)
            v2 = v9.objectives[j.id]
            v3.current = if v2 == nil then j.current or 0 else v2
            v5[i] = v3
        end
        v4.objectives = v5
        local v10 = table.clone(v8.rewards)
        v7 = nil
        local v11 = nil
        for k, n in v10, v7, v11 do
            v1 = table.clone(n)
            rewards = v9.rewards
            id = n.id or ("%*:%*"):format(n.type, k)
            v1.claimed = rewards[id] == true
            v10[k] = v1
        end
        v4.rewards = v10
        return v4
    end,
    applyProgress = function(a1, a2, a3) -- Line: 420
        -- upvalues: getCurrentObjectives (val), matchesFilter (val), isCompleted (val)
        if a2.state ~= "COMPLETED" and a2.state ~= "FAILED" then
            local amount_2, v1, v2, v3, value
            local v4 = if not a3.objectiveId then getCurrentObjectives(a1, a2, a3.type, a3.metadata) else {}
            if a3.objectiveId then
                for i, j in a1.objectives do
                    if j.id == a3.objectiveId then
                        if not matchesFilter(j, a3.metadata) then
                            break
                        end
                        table.insert(v4, j)
                        break
                    end
                end
            end
            if #v4 == 0 then
                return a2, false, false
            end
            local v5 = {
                state = a2.state,
                objectives = table.clone(a2.objectives),
                rewards = table.clone(a2.rewards),
            }
            local v6 = false
            local v7 = nil
            local v8 = nil
            for k, n in v4, v7, v8 do
                v2 = v5.objectives[n.id]
                v1 = if v2 == nil then n.current or 0 else v2
                value = v9.value
                amount_2 = if type(value) ~= "boolean" then value else if not value then 0 else n.amount
                v3 = math.clamp(if n.progressType ~= "SET_VALUE" then v1 + amount_2 else amount_2, 0, n.amount)
                if v3 ~= v1 then
                    v5.objectives[n.id] = v3
                    v6 = true
                end
            end
            if v6 and isCompleted(a1, v5) then
                v5.state = "COMPLETED"
                return v5, v6, true
            end
            if v6 and v5.state == "AVAILABLE" then
                v5.state = "IN_PROGRESS"
            end
            return v5, v6, false
        end
        return a2, false, false
    end,
    markRewardsClaimed = function(a1, a2) -- Line: 484 -- types: a1: table, a2: table
        local id, rewards
        local v1 = {
            state = a2.state,
            objectives = table.clone(a2.objectives),
            rewards = table.clone(a2.rewards),
        }
        local v2 = nil
        local v3 = nil
        for i, j in a1.rewards, v2, v3 do
            rewards = v1.rewards
            id = j.id or ("%*:%*"):format(j.type, i)
            rewards[id] = true
        end
        return v1
    end,
    areRewardsClaimed = function(a1, a2) -- Line: 498 -- types: a1: table, a2: table
        local id, rewards
        local v1 = nil
        local v2 = nil
        for i, j in a1.rewards, v1, v2 do
            rewards = a2.rewards
            id = j.id or ("%*:%*"):format(j.type, i)
            if not rewards[id] then
                return false
            end
        end
        return true
    end,
    resetProgress = function(a1, a2) -- Line: 508 -- types: a1: table, a2: table
        local v1 = {
            state = "IN_PROGRESS",
            objectives = table.clone(a2.objectives),
            rewards = table.clone(a2.rewards),
        }
        for i, j in a1.objectives do
            v1.objectives[j.id] = 0
        end
        return v1
    end,
    resetFailedObjectives = function(a1, a2) -- Line: 522 -- types: a1: table, a2: table
        local v1, v2
        if a2.state == "COMPLETED" then
            return a2, false
        end
        local v3 = nil
        local v4 = nil
        local v5 = nil
        local v6 = a2
        for i, j in a1.objectives, v4, v5 do
            if j.resetOnFail then
                v1 = v6.objectives[j.id]
                v2 = if v1 == nil then j.current or 0 else v1
                if not (j.amount <= v2) then
                    v2 = v6.objectives[j.id]
                    if not ((if v2 == nil then j.current or 0 else v2) <= 0) then
                        v2 = v3 or {
                            state = v6.state,
                            objectives = table.clone(v6.objectives),
                            rewards = table.clone(v6.rewards),
                        }
                        v3 = v2
                        v2.objectives[j.id] = 0
                    end
                end
            end
        end
        if not v3 then
            return v6, false
        end
        return v3, true
    end,
    isCompleted = isCompleted,
    isObjectiveCompleted = function(a1, a2) -- Line: 327 -- types: a1: table, a2: table
        local v1 = a1.objectives[a2.id]
        return a2.amount <= (if v1 == nil then a2.current or 0 else v1)
    end,
    getCurrentObjectives = getCurrentObjectives,
    matchesFilter = matchesFilter,
    getRewardKey = function(a1, a2) -- Line: 314 -- types: a1: table, a2: number
        return a1.id or ("%*:%*"):format(a1.type, a2)
    end,
    formatString = processTemplate,
    generateId = generateId,
}