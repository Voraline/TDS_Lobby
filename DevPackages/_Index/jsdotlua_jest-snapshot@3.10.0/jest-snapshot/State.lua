-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.State
-- Decompile time: 11.11 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local Object = v1.Object
local Set = v1.Set
require(script.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent:WaitForChild("PrettyFormat"))
local utils = require(script.Parent:WaitForChild("utils"))
local addExtraLineBreaks = utils.addExtraLineBreaks
local getSnapshotData = utils.getSnapshotData
local keyToTestName = utils.keyToTestName
local removeExtraLineBreaks = utils.removeExtraLineBreaks
local saveSnapshotFile = utils.saveSnapshotFile
local serialize = utils.serialize
local testNameToKey = utils.testNameToKey
require(script.Parent:WaitForChild("types"))
local u53 = {}
u53.__index = u53

function u53.new(a1, a2) -- Line: 145
    -- upvalues: getSnapshotData (val), Set (val), Object (val), u53 (val)
    local v1 = getSnapshotData(a1.getInstance(), a2.updateSnapshot)
    local data = v1.data
    return (setmetatable({
        _index = 0,
        added = 0,
        matched = 0,
        unmatched = 0,
        updated = 0,
        _snapshotPath = a1,
        _initialData = data,
        _snapshotData = data,
        _dirty = v1.dirty,
        _inlineSnapshots = {},
        _uncheckedKeys = Set.new(Object.keys(data)),
        _counters = {},
        expand = a2.expand or false,
        _updateSnapshot = a2.updateSnapshot,
        _snapshotFormat = a2.snapshotFormat,
    }, u53))
end

function u53.markSnapshotsAsCheckedForTest(a1, a2) -- Line: 177
    -- upvalues: keyToTestName (val)
    for i, j in a1._uncheckedKeys do
        if keyToTestName(j) == a2 then
            a1._uncheckedKeys:delete(j)
        end
    end
end

function u53:_addSnapshot(a2, a3, a4) -- Line: 186
    -- upvalues: Error (val)
    self._dirty = true
    if a4.isInline then
        error(Error("Jest-Roblox: inline snapshot testing is not currently supported"))
        return
    end
    self._snapshotData[a2] = a3
end

function u53:clear() -- Line: 200
    self._snapshotData = self._initialData
    self._inlineSnapshots = {}
    self._counters = {}
    self._index = 0
    self.added = 0
    self.matched = 0
    self.unmatched = 0
    self.updated = 0
end

function u53.save(a1) -- Line: 211 -- upvalues: Object (val), saveSnapshotFile (val), Error (val)
    local v1 = #Object.keys(a1._snapshotData) > 0
    local v2 = #a1._inlineSnapshots > 0
    local v3 = {deleted = false, saved = false}
    if not a1._dirty and not (0 < a1._uncheckedKeys.size) then
        if not v1 and a1._snapshotPath.getInstance() ~= nil then
            if a1._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox-internal or in #jest-roblox")
            end
            v3.deleted = true
        end
        return v3
    end
    if not v1 and not v2 then
        if not v1 and a1._snapshotPath.getInstance() ~= nil then
            if a1._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox-internal or in #jest-roblox")
            end
            v3.deleted = true
        end
        return v3
    end
    if v1 then
        if a1._dirty or a1._updateSnapshot == "all" then
            saveSnapshotFile(a1._snapshotData, a1._snapshotPath.getPath())
        end
    end
    if v2 then
        error(Error("Jest-Roblox: inline snapshot testing is not currently supported"))
    end
    v3.saved = true
    return v3
end

function u53.getUncheckedCount(a1) -- Line: 258
    return a1._uncheckedKeys.size or 0
end

function u53.getUncheckedKeys(a1) -- Line: 262 -- upvalues: Array (val)
    return Array.from(a1._uncheckedKeys)
end

function u53.removeUncheckedKeys(a1) -- Line: 266
    if a1._updateSnapshot == "all" and 0 < a1._uncheckedKeys.size then
        a1._dirty = true
        for i, j in a1._uncheckedKeys do
            a1._snapshotData[j] = nil
        end
        a1._uncheckedKeys:clear()
    end
end

function u53.match(a1, a2) -- Line: 276
    -- upvalues: testNameToKey (val), addExtraLineBreaks (val), serialize (val), Error (val)
    -- upvalues: removeExtraLineBreaks (val)
    local v1
    local testName = a2.testName
    local received = a2.received
    local isInline = a2.isInline
    local error_ = a2.error_
    a1._counters[testName] = (a1._counters[testName] or 0) + 1
    local v2 = a1._counters[testName]
    local key = if not a2.key then testNameToKey(testName, v2) else a2.key
    if not isInline or a1._snapshotData[key] == nil then
        a1._uncheckedKeys:delete(key)
    end
    local v3 = addExtraLineBreaks(serialize(received, nil, a1._snapshotFormat))
    local v4 = nil
    if not isInline then
        v4 = a1._snapshotData[key]
    else
        error(Error("Jest-Roblox: inline snapshot testing is not currently supported"))
    end
    local v5 = v4 == v3
    local v6 = v4 ~= nil
    local success = pcall(function() -- Line: 308 -- upvalues: a1 (val)
        require(a1._snapshotPath.getInstance())
    end)
    if v5 and not isInline then
        a1._snapshotData[key] = v3
    end
    if v6 and a1._updateSnapshot == "all" then
        if a1._updateSnapshot ~= "all" then
            a1:_addSnapshot(key, v3, {error = error_, isInline = isInline})
            a1.added = a1.added + 1
        elseif v5 then
            a1.matched = a1.matched + 1
        else
            if not v6 then
                a1.added = a1.added + 1
            else
                a1.updated = a1.updated + 1
            end
            a1:_addSnapshot(key, v3, {error = error_, isInline = isInline})
        end
        return {
            actual = "",
            expected = "",
            pass = true,
            count = v2,
            key = key,
        }
    end
    if v6 and (isInline or success) then
        if v5 then
            a1.matched = a1.matched + 1
            return {
                actual = "",
                expected = "",
                pass = true,
                count = v2,
                key = key,
            }
        end
        a1.unmatched = a1.unmatched + 1
        v1 = if not v4 then nil else removeExtraLineBreaks(v4)
        return {
            pass = false,
            actual = removeExtraLineBreaks(v3),
            count = v2,
            expected = v1,
            key = key,
        }
    end
    if a1._updateSnapshot ~= "new" and a1._updateSnapshot ~= "all" then
        if v5 then
            a1.matched = a1.matched + 1
            return {
                actual = "",
                expected = "",
                pass = true,
                count = v2,
                key = key,
            }
        end
        a1.unmatched = a1.unmatched + 1
        v1 = if not v4 then nil else removeExtraLineBreaks(v4)
        return {
            pass = false,
            actual = removeExtraLineBreaks(v3),
            count = v2,
            expected = v1,
            key = key,
        }
    end
    if a1._updateSnapshot ~= "all" then
        a1:_addSnapshot(key, v3, {error = error_, isInline = isInline})
        a1.added = a1.added + 1
    elseif v5 then
        a1.matched = a1.matched + 1
    else
        if not v6 then
            a1.added = a1.added + 1
        else
            a1.updated = a1.updated + 1
        end
        a1:_addSnapshot(key, v3, {error = error_, isInline = isInline})
    end
    return {
        actual = "",
        expected = "",
        pass = true,
        count = v2,
        key = key,
    }
end

function u53.fail(a1, a2, a3, a4) -- Line: 385
    -- upvalues: testNameToKey (val)
    a1._counters[a2] = (a1._counters[a2] or 0) + 1
    local v1 = a1._counters[a2]
    local v2 = a4 or testNameToKey(a2, v1)
    a1._uncheckedKeys:delete(v2)
    a1.unmatched = a1.unmatched + 1
    return v2
end

return {default = u53}