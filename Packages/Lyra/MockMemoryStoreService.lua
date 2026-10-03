-- Script path: ReplicatedStorage.Packages.Lyra.MockMemoryStoreService
-- Decompile time: 6.74 ms

local HttpService = game:GetService("HttpService")
local Tables = require(script.Parent.Tables)
local u10 = {
    GetAsync = {Base = 100, PlayerMultiplier = 10},
    SetAsync = {Base = 100, PlayerMultiplier = 10},
    UpdateAsync = {Base = 100, PlayerMultiplier = 10},
    RemoveAsync = {Base = 100, PlayerMultiplier = 10},
}

local function getNow() -- Line: 18
    return DateTime.now().UnixTimestampMillis
end

local function getLatencyForRequest(a1, a2) -- Line: 22 -- types: a2: string
    if a1._latencyByRequestType[a2] then
        return a1._latencyByRequestType[a2]
    end
    if not a1._randomLatencyRange then
        return a1._globalLatency or 0.1
    end
    local min = a1._randomLatencyRange.min
    local max = a1._randomLatencyRange.max
    return min + math.random() * (max - min)
end

local function shouldSimulateError(a1, a2) -- Line: 36 -- types: a2: string
    if #a1.queuedErrors[a2] > 0 then
        return true, table.remove(a1.queuedErrors[a2], 1)
    end
    if a1._errorRates[a2] and math.random() < a1._errorRates[a2] then
        return true, "InternalError: random error simulation"
    end
    if a1._simulateThrottling then
        return true, "Throttled: MemoryStore request was throttled, try again later"
    end
    if a1._simulateTimeout then
        return true, "Timeout: MemoryStore request timed out"
    end
    return false, nil
end

local function doLatency(a1, a2) -- Line: 56 -- types: a2: string
    local v1
    if a1._latencyByRequestType[a2] then
        v1 = a1._latencyByRequestType[a2]
    elseif not a1._randomLatencyRange then
        v1 = a1._globalLatency or 0.1
    else
        local min = a1._randomLatencyRange.min
        local max = a1._randomLatencyRange.max
        v1 = min + math.random() * (max - min)
    end
    if v1 > 0 then
        task.wait(v1)
    end
end

local function doRateLimitAndQueue(a1, a2) -- Line: 63
    -- upvalues: u10 (val), shouldSimulateError (val)
    local v1
    local v2 = a1.requestQueues[a2]
    local v3 = u10[a2]
    local v4 = a1._customBudgets[a2] or v3.Base + 15 * v3.PlayerMultiplier
    if v4 <= #v2 then
        error("TotalRequestsOverLimit", 0)
    end
    if #v2 >= 30 then
        error("RequestThrottled", 0)
    end
    if a1._forcedThrottles[a2] then
        local endTime = a1._forcedThrottles[a2].endTime
        if not (os.time() < endTime) then
            a1._forcedThrottles[a2] = nil
        else
            error("MemoryStore request is currently throttled", 0)
        end
    end
    table.insert(v2, true)
    if a1._latencyByRequestType[a2] then
        v1 = a1._latencyByRequestType[a2]
    elseif not a1._randomLatencyRange then
        v1 = a1._globalLatency or 0.1
    else
        local min = a1._randomLatencyRange.min
        local max = a1._randomLatencyRange.max
        v1 = min + math.random() * (max - min)
    end
    if v1 > 0 then
        task.wait(v1)
    end
    v1 = table.remove(v2, 1)
    local v5, v6 = shouldSimulateError(a1, a2)
    if v5 then
        error(v6, 0)
    end
    if typeof(v1) == "function" then
        v1()
    end
end

local function enforceKeyLimits(a1) -- Line: 103 -- types: a1: string
    if typeof(a1) ~= "string" then
        error("InvalidRequest: key must be a string", 0)
    end
    if #a1 == 0 then
        error("InvalidRequest: key cannot be empty", 0)
    end
    if #a1 > 128 then
        error("InvalidRequest: key length exceeds limit", 0)
    end
end

local function enforceValueLimits(a1) -- Line: 115
    if a1 == nil then
        return
    end
    local success, result = pcall(function() -- Line: 120 -- upvalues: a1 (val)
        return (game:GetService("HttpService")):JSONEncode(a1)
    end)
    if not success then
        error("InvalidRequest: value cannot be encoded to JSON", 0)
    end
    if #result > 32768 then
        error("ItemValueSizeTooLarge", 0)
    end
end

local function enforceExpirationLimits(a1) -- Line: 133 -- types: a1: number
    if typeof(a1) ~= "number" then
        error("InvalidRequest: expiration must be a number", 0)
    end
    if a1 < 0 then
        error("InvalidRequest: expiration must be >= 0", 0)
    end
    if a1 > 3888000 then
        error("InvalidRequest: expiration exceeds maximum", 0)
    end
end

local function getScopedData(a1) -- Line: 145
    local v1 = a1.service.mockData[a1.name]
    if not v1 then
        a1.service.mockData[a1.name] = {}
    end
    return v1
end

local function isExpired(a1) -- Line: 154
    if a1 and a1.expiration then
        return a1.expiration < (DateTime.now()).UnixTimestampMillis
    end
    return true
end

local function sanitize(a1) -- Line: 161 -- upvalues: Tables (val)
    return Tables.copyDeep(a1)
end

local u26 = {}

function u26.GetAsync(a1, a2) -- Line: 167
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val)
    enforceKeyLimits(a2)
    doRateLimitAndQueue(a1.service, "GetAsync")
    local v1 = a1.service.mockData[a1.name]
    if not v1 then
        a1.service.mockData[a1.name] = {}
    end
    local v2 = v1[a2]
    if not (if not v2 then true else if v2.expiration then v2.expiration < (DateTime.now()).UnixTimestampMillis else true) then
        return v2.value
    end
    v1[a2] = nil
    return nil
end

function u26.SetAsync(a1, a2, a3, a4) -- Line: 183
    -- upvalues: Tables (val), enforceKeyLimits (val), enforceValueLimits (val), doRateLimitAndQueue (val)
    -- upvalues: HttpService (val)
    local v1 = Tables.copyDeep(a3)
    enforceKeyLimits(a2)
    enforceValueLimits(v1)
    if typeof(a4) ~= "number" then
        error("InvalidRequest: expiration must be a number", 0)
    end
    if a4 < 0 then
        error("InvalidRequest: expiration must be >= 0", 0)
    end
    if a4 > 3888000 then
        error("InvalidRequest: expiration exceeds maximum", 0)
    end
    doRateLimitAndQueue(a1.service, "SetAsync")
    local v2 = a1.service.mockData[a1.name]
    if not v2 then
        a1.service.mockData[a1.name] = {}
    end
    if HttpService:JSONEncode(v1) == nil then
        return false
    end
    v2[a2] = {value = v1, expiration = DateTime.now().UnixTimestampMillis + a4 * 1000}
    return true
end

function u26.UpdateAsync(a1, a2, a3, a4) -- Line: 205
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val), Tables (val), enforceValueLimits (val)
    local result, success, v1, v2, v3
    enforceKeyLimits(a2)
    if typeof(a4) ~= "number" then
        error("InvalidRequest: expiration must be a number", 0)
    end
    if a4 < 0 then
        error("InvalidRequest: expiration must be >= 0", 0)
    end
    if a4 > 3888000 then
        error("InvalidRequest: expiration exceeds maximum", 0)
    end
    doRateLimitAndQueue(a1.service, "UpdateAsync")
    local v4 = a1.service.mockData[a1.name]
    if not v4 then
        a1.service.mockData[a1.name] = {}
    end
    local v5 = 0
    local v6, v7, v8 = a2, a3, a4
    while v5 < 3 do
        v1 = v4[v6]
        v2 = nil
        if not (if not v1 then true else if v1.expiration then v1.expiration < (DateTime.now()).UnixTimestampMillis else true) then
            v2 = Tables.copyDeep(v1.value)
        end
        success, result = pcall(v7, v2)
        if not success then
            error("TransformCallbackFailed", 0)
        end
        if result == nil then
            return nil
        end
        v3 = Tables.copyDeep(result)
        enforceValueLimits(v3)
        if v1 then
            if not (if not v1 then true else if v1.expiration then v1.expiration < (DateTime.now()).UnixTimestampMillis else true)
                and not Tables.equalsDeep(v1.value, v2) then
                v5 = v5 + 1
                if v5 >= 3 then
                    error("DataUpdateConflict", 0)
                end
                continue
            end
        end
        v4[v6] = {value = v3, expiration = DateTime.now().UnixTimestampMillis + v8 * 1000}
        return v3
    end
    error("UpdateConflict: Exceeded max number of retries", 0)
end

function u26.RemoveAsync(a1, a2) -- Line: 253
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val)
    enforceKeyLimits(a2)
    doRateLimitAndQueue(a1.service, "RemoveAsync")
    local v1 = a1.service.mockData[a1.name]
    if not v1 then
        a1.service.mockData[a1.name] = {}
    end
    v1[a2] = nil
end

local function createMockHashMap(a1, a2) -- Line: 262 -- types: a2: string
    return (setmetatable({service = a1, name = a2}, {__index = a1.mockHashMapMeta}))
end

return {
    new = function() -- Line: 269 -- upvalues: u26 (val)
        local v1 = table.clone(u26)
        v1.__index = v1
        return {
            _simulateThrottling = false,
            _simulateTimeout = false,
            mockData = {},
            hashMaps = {},
            mockHashMapMeta = v1,
            requestQueues = {GetAsync = {}, SetAsync = {}, UpdateAsync = {}, RemoveAsync = {}},
            queuedErrors = {GetAsync = {}, SetAsync = {}, UpdateAsync = {}, RemoveAsync = {}},
            _latencyByRequestType = {},
            _errorRates = {},
            _customBudgets = {},
            _forcedThrottles = {},
            GetHashMap = function(a1, a2) -- Line: 300 -- types: a2: string
                if not a1.hashMaps[a2] then
                    local hashMaps = a1.hashMaps
                    local v1 = {service = a1, name = a2}
                    local v2 = {__index = a1.mockHashMapMeta}
                    hashMaps[a2] = (setmetatable(v1, v2))
                end
                return a1.hashMaps[a2]
            end,
        }
    end,
    mockHashMapMethod = function(a1, a2, a3) -- Line: 313 -- types: a2: string
        local v1 = a1.mockHashMapMeta[a2]
        local v2, v3 = a3.fn(v1)
        a1.mockHashMapMeta[a2] = v3
        return v2, v1
    end,
    setGlobalLatency = function(a1, a2) -- Line: 320 -- types: a2: number
        a1._globalLatency = a2
    end,
    setLatencyForRequestType = function(a1, a2, a3) -- Line: 323 -- types: a2: string, a3: number
        a1._latencyByRequestType[a2] = a3
    end,
    setRandomLatency = function(a1, a2, a3) -- Line: 326 -- types: a2: number, a3: number
        a1._randomLatencyRange = {min = a2, max = a3}
    end,
    queueError = function(a1, a2, a3, a4) -- Line: 329 -- types: a2: string, a3: string, a4: number?
        for i = 1, a4 or 1 do
            table.insert(a1.queuedErrors[a2], a3)
        end
    end,
    setErrorRate = function(a1, a2, a3) -- Line: 334 -- types: a2: string, a3: number
        a1._errorRates[a2] = a3
    end,
    simulateThrottling = function(a1, a2) -- Line: 337 -- types: a2: boolean
        a1._simulateThrottling = a2
    end,
    simulateTimeout = function(a1, a2) -- Line: 340 -- types: a2: boolean
        a1._simulateTimeout = a2
    end,
    setRequestBudget = function(a1, a2, a3) -- Line: 343 -- types: a2: string, a3: number
        a1._customBudgets[a2] = a3
    end,
    forceThrottle = function(a1, a2, a3) -- Line: 346 -- types: a2: string, a3: number
        a1._forcedThrottles[a2] = {endTime = os.time() + a3}
    end,
    snapshot = function(a1) -- Line: 352 -- upvalues: HttpService (val)
        return HttpService:JSONEncode({mockData = a1.mockData})
    end,
    restore = function(a1, a2) -- Line: 357 -- upvalues: HttpService (val) -- types: a2: string
        a1.mockData = HttpService:JSONDecode(a2).mockData
    end,
}