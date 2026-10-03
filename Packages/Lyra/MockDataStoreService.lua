-- Script path: ReplicatedStorage.Packages.Lyra.MockDataStoreService
-- Decompile time: 13.39 ms

local HttpService = game:GetService("HttpService")
local Tables = require(script.Parent.Tables)
local u10 = {
    GetAsync = {Base = 60, PlayerMultiplier = 10},
    SetAsync = {Base = 60, PlayerMultiplier = 10},
    UpdateAsync = {Base = 60, PlayerMultiplier = 10},
    RemoveAsync = {Base = 60, PlayerMultiplier = 10},
    GetVersion = {Base = 5, PlayerMultiplier = 2},
}

local function getLatencyForRequest(a1, a2) -- Line: 19 -- types: a2: string
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

local function shouldSimulateError(a1, a2) -- Line: 33 -- types: a2: string
    if #a1.queuedErrors[a2] > 0 then
        return true, table.remove(a1.queuedErrors[a2], 1)
    end
    if a1._errorRates[a2] and math.random() < a1._errorRates[a2] then
        return true, "DataStore request failed due to random error simulation"
    end
    if a1._simulateThrottling then
        return true, "DataStore request was throttled, try again later"
    end
    if a1._simulateTimeout then
        return true, "DataStore request timed out"
    end
    return false, nil
end

local function doLatency(a1, a2) -- Line: 53 -- types: a2: string
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

local function getNow() -- Line: 60
    return DateTime.now().UnixTimestampMillis
end

local function msToHours(a1) -- Line: 64 -- types: a1: number
    return (math.floor(a1 / 3600000))
end

local function getUtcHour() -- Line: 68
    return (math.floor((DateTime.now()).UnixTimestampMillis / 3600000))
end

local function createVersion(a1, a2, a3) -- Line: 72
    return {
        Value = a1,
        UserIds = a2 or {},
        Metadata = a3 or {},
        CreatedTime = DateTime.now().UnixTimestampMillis,
        Version = tostring((DateTime.now()).UnixTimestampMillis),
    }
end

local function createMockKeyInfo(a1, a2) -- Line: 82
    return {
        CreatedTime = DateTime.now().UnixTimestampMillis,
        UpdatedTime = DateTime.now().UnixTimestampMillis,
        Version = tostring((DateTime.now()).UnixTimestampMillis),
        userIds = a1 or {},
        metadata = a2 or {},
        GetUserIds = function(self) -- Line: 89
            return self.userIds
        end,
        GetMetadata = function(self) -- Line: 92
            return self.metadata
        end,
    }
end

local function validateMetadata(a1) -- Line: 99
    if a1 == nil then
        return
    end
    if typeof(a1) ~= "table" then
        error("DataStoreService: Metadata must be a table", 0)
    end
    if #(game:GetService("HttpService")):JSONEncode(a1) > 300 then
        error(("DataStoreService: Metadata size exceeds %* limit"):format(300), 0)
    end
end

local function getScopedData(a1) -- Line: 114
    local v1 = a1._service.mockData[a1.datastoreName]
    if not v1 then
        a1._service.mockData[a1.datastoreName] = {}
    end
    local v2 = v1[a1.scope]
    if not v2 then
        v1[a1.scope] = {}
    end
    return v2
end

local function getVersionsForKey(a1, a2) -- Line: 130 -- types: a2: string
    local v1 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    if not a1._service.mockVersions[v1] then
        a1._service.mockVersions[v1] = {}
    end
    return a1._service.mockVersions[v1]
end

local function getCacheKey(a1, a2) -- Line: 138 -- types: a2: string
    return (("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2))
end

local function getCachedValue(a1, a2) -- Line: 142 -- types: a2: string
    local v1 = a1._service.mockCache[(("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2))]
    if v1 and os.time() - v1.timestamp < 4 then
        return v1.value, v1.keyInfo
    end
    return nil, nil
end

local function setCachedValue(a1, a2, a3, a4) -- Line: 151 -- types: a2: string
    local v1 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    a1._service.mockCache[v1] = {value = a3, keyInfo = a4, timestamp = os.time()}
end

local function enforceKeyLimits(a1) -- Line: 160
    if typeof(a1) ~= "string" then
        error("DataStoreService: Key must be a string", 0)
    end
    if #a1 == 0 then
        error("DataStoreService: Key name can't be empty", 0)
    end
    if #a1 > 50 then
        error(("DataStoreService: Key name exceeds the %* character limit"):format(50), 0)
    end
end

local function enforceDataLimits(a1) -- Line: 174
    if a1 == nil then
        return
    end
    local success, result = pcall(function() -- Line: 179 -- upvalues: a1 (val)
        return (game:GetService("HttpService")):JSONEncode(a1)
    end)
    if not success then
        error(("DataStoreService: Cannot store %* in DataStore"):format((typeof(a1))), 0)
    end
    if #result > 4194304 then
        error(("DataStoreService: Serialized value exceeds %* limit"):format(4194304), 0)
    end
end

local function doRateLimitAndQueue(a1, a2) -- Line: 191
    -- upvalues: u10 (val), shouldSimulateError (val)
    local v1, v2
    local v3 = a1._service.requestQueues[a2]
    local GetAsync = u10[a2] or u10.GetAsync
    local v4 = a1._service._customBudgets[a2] or GetAsync.Base + 15 * GetAsync.PlayerMultiplier
    if v4 <= #v3 then
        return false
    end
    if #v3 >= 30 then
        error(("DataStoreService:%*() request dropped. Request was throttled, but throttled request queue was full"):format(a2), 0)
    end
    if a1._service._forcedThrottles[a2] then
        local endTime = a1._service._forcedThrottles[a2].endTime
        if not (os.time() < endTime) then
            a1._service._forcedThrottles[a2] = nil
        else
            error("DataStoreService: Request is currently throttled", 0)
        end
    end
    table.insert(v3, true)
    local _service_2 = a1._service
    if _service_2._latencyByRequestType[a2] then
        v1 = _service_2._latencyByRequestType[a2]
    elseif not _service_2._randomLatencyRange then
        v1 = _service_2._globalLatency or 0.1
    else
        local min = _service_2._randomLatencyRange.min
        local max = _service_2._randomLatencyRange.max
        v1 = min + math.random() * (max - min)
    end
    if v1 > 0 then
        task.wait(v1)
    end
    local v5 = table.remove(v3, 1)
    v1, v2 = shouldSimulateError(a1._service, a2)
    if v1 then
        error(v2, 0)
    end
    if typeof(v5) == "function" then
        v5()
    end
    return true
end

local function sanitize(a1) -- Line: 240 -- upvalues: Tables (val)
    return Tables.copyDeep(a1)
end

local u34 = {}

function u34.SetAsync(a1, a2, a3, a4, a5) -- Line: 246
    -- upvalues: Tables (val), enforceKeyLimits (val), enforceDataLimits (val), validateMetadata (val)
    -- upvalues: doRateLimitAndQueue (val), getScopedData (val), createVersion (val), createMockKeyInfo (val)
    local v1 = Tables.copyDeep(a3)
    enforceKeyLimits(a2)
    enforceDataLimits(v1)
    if a5 then
        validateMetadata(a5:GetMetadata())
    end
    doRateLimitAndQueue(a1, "SetAsync")
    local v2 = getScopedData(a1)
    local v3 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    if not a1._service.mockVersions[v3] then
        a1._service.mockVersions[v3] = {}
    end
    local v4 = a1._service.mockVersions[v3]
    v3 = math.floor((DateTime.now()).UnixTimestampMillis / 3600000)
    if #v4 == 0 then
        table.insert(v4, (createVersion(v1, a4, a5 and a5:GetMetadata())))
    elseif math.floor(v4[#v4].CreatedTime / 3600000) == v3 then
        local v5 = v4[#v4]
        v5.Value = v1
        if a4 then
            v5.UserIds = a4
        end
        if a5 then
            local Metadata = a5:GetMetadata() or {}
            v5.Metadata = Metadata
        end
    else
        table.insert(v4, (createVersion(v1, a4, a5 and a5:GetMetadata())))
    end
    local Version = v4[#v4].Version
    v2[a2] = v1
    local v6 = createMockKeyInfo(a4, a5 and a5:GetMetadata())
    local mockKeyInfo = a1._service.mockKeyInfo
    local datastoreName_2 = a1.datastoreName
    local scope_2 = a1.scope
    mockKeyInfo[("%*|%*|%*"):format(datastoreName_2, scope_2, a2)] = v6
    local v7 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    a1._service.mockCache[v7] = {value = v1, keyInfo = v6, timestamp = os.time()}
    return Version
end

function u34.GetAsync(a1, a2, a3) -- Line: 283
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val), getScopedData (val)
    local keyInfo, v1, v2, v3, value
    enforceKeyLimits(a2)
    if a3 ~= nil and a3.UseCache ~= true then
        doRateLimitAndQueue(a1, "GetAsync")
        v1 = getScopedData(a1)[a2]
        v2 = a1._service.mockKeyInfo[("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)]
        if v1 ~= nil then
            v3 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
            a1._service.mockCache[v3] = {value = v1, keyInfo = v2, timestamp = os.time()}
        end
        return v1, v2
    end
    v3 = a1._service.mockCache[(("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2))]
    if not v3 or not (os.time() - v3.timestamp < 4) then
        value = nil
        keyInfo = nil
    else
        value = v3.value
        keyInfo = v3.keyInfo
    end
    if value ~= nil then
        return value, keyInfo
    end
    doRateLimitAndQueue(a1, "GetAsync")
    v1 = getScopedData(a1)[a2]
    v2 = a1._service.mockKeyInfo[("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)]
    if v1 ~= nil then
        v3 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
        a1._service.mockCache[v3] = {value = v1, keyInfo = v2, timestamp = os.time()}
    end
    return v1, v2
end

function u34.UpdateAsync(a1, a2, a3) -- Line: 306
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val), getScopedData (val), createMockKeyInfo (val)
    -- upvalues: Tables (val), enforceDataLimits (val), validateMetadata (val), createVersion (val)
    local v1, v2, v3, v4, v5, v6, v7
    enforceKeyLimits(a2)
    doRateLimitAndQueue(a1, "UpdateAsync")
    local v8, v9 = a1, a2
    repeat
        v1 = getScopedData(v8)
        v2 = v8._service.mockKeyInfo[("%*|%*|%*"):format(v8.datastoreName, v8.scope, v9)] or createMockKeyInfo()
        v3 = v1[v9]
        v4 = false
        if v3 ~= nil then
            v4 = Tables.copyDeep(v3)
        end
        v5, v6, v7 = v10(v4, v2)
        if v5 == nil then
            return v3, v2
        end
        v5 = Tables.copyDeep(v5)
        enforceDataLimits(v5)
        validateMetadata(v7)
    until Tables.equalsDeep(v3, v1[v9])
    local v11 = ("%*|%*|%*"):format(v8.datastoreName, v8.scope, v9)
    if not v8._service.mockVersions[v11] then
        v8._service.mockVersions[v11] = {}
    end
    local v12 = v8._service.mockVersions[v11]
    v11 = math.floor((DateTime.now()).UnixTimestampMillis / 3600000)
    if #v12 == 0 then
        table.insert(v12, (createVersion(v5, v6 or v2:GetUserIds(), v7 or v2:GetMetadata())))
    elseif v12[#v12].CreatedTime == v11 then
        local v13 = v12[#v12]
        v13.Value = v5
        if v6 then
            v13.UserIds = v6
        end
        if v7 then
            v13.Metadata = v7
        end
    else
        table.insert(v12, (createVersion(v5, v6 or v2:GetUserIds(), v7 or v2:GetMetadata())))
    end
    v1[v9] = v5
    if v6 ~= nil then
        v2.userIds = v6
    end
    if v7 ~= nil then
        v2.metadata = v7
    end
    v2.UpdatedTime = DateTime.now().UnixTimestampMillis
    v2.Version = tostring((DateTime.now()).UnixTimestampMillis)
    local v14 = ("%*|%*|%*"):format(v8.datastoreName, v8.scope, v9)
    v8._service.mockCache[v14] = {value = v5, keyInfo = v2, timestamp = os.time()}
    return v5, v2
end

function u34.RemoveAsync(a1, a2) -- Line: 364
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val), getScopedData (val), createVersion (val)
    enforceKeyLimits(a2)
    doRateLimitAndQueue(a1, "RemoveAsync")
    local v1 = getScopedData(a1)
    local v2 = v1[a2]
    local v3 = a1._service.mockKeyInfo[("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)]
    if v2 ~= nil then
        local v4 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
        if not a1._service.mockVersions[v4] then
            a1._service.mockVersions[v4] = {}
        end
        table.insert(a1._service.mockVersions[v4], (createVersion(nil, nil, nil)))
    end
    v1[a2] = nil
    local v5 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    a1._service.mockCache[v5] = nil
    return v2, v3
end

function u34.GetVersionAsync(a1, a2, a3) -- Line: 386
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val), createMockKeyInfo (val)
    enforceKeyLimits(a2)
    doRateLimitAndQueue(a1, "GetVersion")
    local v1 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    if not a1._service.mockVersions[v1] then
        a1._service.mockVersions[v1] = {}
    end
    v1 = a1._service.mockVersions[v1]
    for i, j in v1 do
        if j.Version == a3 then
            return j.Value, (createMockKeyInfo(j.UserIds, j.Metadata))
        end
    end
    return nil, nil
end

function u34.ListVersionsAsync(a1, a2, a3, a4, a5) -- Line: 400
    -- upvalues: enforceKeyLimits (val), doRateLimitAndQueue (val)
    enforceKeyLimits(a2)
    doRateLimitAndQueue(a1, "GetVersion")
    local v1 = ("%*|%*|%*"):format(a1.datastoreName, a1.scope, a2)
    if not a1._service.mockVersions[v1] then
        a1._service.mockVersions[v1] = {}
    end
    local v2 = a1._service.mockVersions[v1]
    local u65 = {}
    local v3 = nil
    local v4 = nil
    local v5, v6, v7 = a3, a4, a5
    for i, j in v2, v3, v4 do
        if not v6 or v6 <= j.CreatedTime then
            if not v7 or j.CreatedTime <= v7 then
                table.insert(u65, {Version = j.Version, CreatedTime = j.CreatedTime})
            end
        end
    end
    if v5 ~= Enum.SortDirection.Descending then
        table.sort(u65, function(a1, a2) -- Line: 422
            return a1.CreatedTime < a2.CreatedTime
        end)
    else
        table.sort(u65, function(a1, a2) -- Line: 418
            return a2.CreatedTime < a1.CreatedTime
        end)
    end
    return {
        IsFinished = true,
        GetCurrentPage = function() -- Line: 429 -- upvalues: u65 (val)
            return u65
        end,
    }
end

local function createMockStore(a1, a2, a3) -- Line: 435 -- types: a2: string, a3: string?
    return (setmetatable({datastoreName = a2, scope = a3 or "global", _service = a1}, a1.mockStoreMeta))
end

return {
    new = function() -- Line: 443 -- upvalues: u34 (val), u10 (val)
        local v1 = table.clone(u34)
        v1.__index = v1
        return {
            _simulateThrottling = false,
            _simulateTimeout = false,
            dataStores = {},
            mockData = {},
            mockKeyInfo = {},
            mockVersions = {},
            mockCache = {},
            requestQueues = {
                GetAsync = {},
                SetAsync = {},
                UpdateAsync = {},
                RemoveAsync = {},
                GetVersion = {},
            },
            queuedErrors = {
                GetAsync = {},
                SetAsync = {},
                UpdateAsync = {},
                RemoveAsync = {},
                GetVersion = {},
            },
            mockStoreMeta = v1,
            _latencyByRequestType = {},
            _errorRates = {},
            _customBudgets = {},
            _forcedThrottles = {},
            GetDataStore = function(a1, a2, a3) -- Line: 479 -- types: a2: string, a3: string?
                local v1 = a1.dataStores[("%*%*"):format(a2, a3 or "")]
                if not v1 then
                    local v2 = {datastoreName = a2, scope = a3 or "global", _service = a1}
                    local mockStoreMeta = a1.mockStoreMeta
                    v1 = setmetatable(v2, mockStoreMeta)
                    a1.dataStores[("%*%*"):format(a2, a3 or "")] = v1
                end
                return v1
            end,
            GetRequestBudgetForRequestType = function(a1, a2) -- Line: 488 -- upvalues: u10 (upval)
                local Name = a2.Name
                local v1 = Name
                if Name == "GetVersionAsync" then
                    v1 = "GetVersion"
                end
                if Name == "GetIncrementAsync" then
                    v1 = "GetAsync"
                end
                if Name == "SetIncrementAsync" then
                    v1 = "SetAsync"
                end
                if a1._customBudgets[v1] then
                    return a1._customBudgets[v1]
                end
                local GetAsync = u10[v1] or u10.GetAsync
                return (math.max(0, GetAsync.Base + 15 * GetAsync.PlayerMultiplier - #a1.requestQueues[v1]))
            end,
        }
    end,
    mockStoreMethod = function(a1, a2, a3) -- Line: 524 -- types: a2: string
        local v1 = a1.mockStoreMeta[a2]
        local v2, v3 = a3.fn(v1)
        a1.mockStoreMeta[a2] = v3
        return v2, v1
    end,
    setGlobalLatency = function(a1, a2) -- Line: 531 -- types: a2: number
        a1._globalLatency = a2
    end,
    setLatencyForRequestType = function(a1, a2, a3) -- Line: 534 -- types: a2: string, a3: number
        a1._latencyByRequestType[a2] = a3
    end,
    setRandomLatency = function(a1, a2, a3) -- Line: 537 -- types: a2: number, a3: number
        a1._randomLatencyRange = {min = a2, max = a3}
    end,
    queueError = function(a1, a2, a3, a4) -- Line: 540 -- types: a2: string, a3: string, a4: number?
        for i = 1, a4 or 1 do
            table.insert(a1.queuedErrors[a2], a3)
        end
    end,
    setErrorRate = function(a1, a2, a3) -- Line: 545 -- types: a2: string, a3: number
        a1._errorRates[a2] = a3
    end,
    simulateThrottling = function(a1, a2) -- Line: 548 -- types: a2: boolean
        a1._simulateThrottling = a2
    end,
    simulateTimeout = function(a1, a2) -- Line: 551 -- types: a2: boolean
        a1._simulateTimeout = a2
    end,
    setRequestBudget = function(a1, a2, a3) -- Line: 554 -- types: a2: string, a3: number
        a1._customBudgets[a2] = a3
    end,
    forceThrottle = function(a1, a2, a3) -- Line: 557 -- types: a2: string, a3: number
        a1._forcedThrottles[a2] = {endTime = os.time() + a3}
    end,
    snapshot = function(a1) -- Line: 562 -- upvalues: HttpService (val)
        return HttpService:JSONEncode({
            mockData = a1.mockData,
            mockKeyInfo = a1.mockKeyInfo,
            mockVersions = a1.mockVersions,
            mockCache = a1.mockCache,
        })
    end,
    restore = function(a1, a2) -- Line: 570 -- upvalues: HttpService (val) -- types: a2: string
        local v1 = HttpService:JSONDecode(a2)
        a1.mockData = v1.mockData
        a1.mockKeyInfo = v1.mockKeyInfo
        a1.mockVersions = v1.mockVersions
        a1.mockCache = v1.mockCache
    end,
}