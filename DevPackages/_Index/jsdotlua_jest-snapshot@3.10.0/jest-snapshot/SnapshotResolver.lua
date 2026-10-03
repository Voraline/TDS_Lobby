-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.SnapshotResolver
-- Decompile time: 1.67 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local Map = v1.Map
local String = v1.String
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v2 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local getParent = v3.getParent
local CoreScriptSyncService = v3.getDataModelService("CoreScriptSyncService")
local createSnapshotResolver = nil
local createDefaultSnapshotResolver = nil
v2.EXTENSION = "snap"
v2.DOT_EXTENSION = ".snap"

function v2.isSnapshotPath(a1) -- Line: 65 -- upvalues: String (val) -- types: a1: string
    return String.endsWith(a1, ".snap")
end

local u51 = Map.new()

function v2.buildSnapshotResolver(a1, a2) -- Line: 73
    -- upvalues: promise (val), u51 (val), createSnapshotResolver (ref)
    return (promise.resolve()):andThen(function() -- Line: 84 -- upvalues: a1 (val), u51 (upval), createSnapshotResolver (upval)
        local rootDir = a1.rootDir
        local v1 = u51:get(rootDir)
        local v2 = if v1 == nil then createSnapshotResolver():expect() else v1
        u51:set(rootDir, v2)
        return v2
    end)
end

function createSnapshotResolver() -- Line: 100 -- upvalues: promise (val), createDefaultSnapshotResolver (ref)
    return (promise.resolve()):andThen(function() -- Line: 104 -- upvalues: createDefaultSnapshotResolver (upval)
        return createDefaultSnapshotResolver()
    end)
end

function createDefaultSnapshotResolver() -- Line: 114
    -- upvalues: CoreScriptSyncService (val), Error (val), getParent (val)
    return {
        resolveSnapshotPath = function(a1, a2) -- Line: 116
            -- upvalues: CoreScriptSyncService (upval), Error (upval), getParent (upval)
            return {
                getInstance = function() -- Line: 124 -- upvalues: a2 (val)
                    local Name = a2.Name
                    local u2 = nil
                    pcall(function() -- Line: 127 -- upvalues: u2 (ref), a2 (upval), Name (val)
                        u2 = a2.Parent.__snapshots__[Name .. ".snap"]
                    end)
                    return u2
                end,
                getPath = function() -- Line: 132 -- upvalues: CoreScriptSyncService (upval), Error (upval), a2 (val), getParent (upval)
                    if not CoreScriptSyncService then
                        error(Error("Attempting to save snapshots in an environment where CoreScriptSyncService is inaccessible.\nYou may need to pass in --load.asRobloxScript."))
                    end
                    local success, result = pcall(function() -- Line: 142 -- upvalues: CoreScriptSyncService (upval), a2 (upval)
                        return CoreScriptSyncService:GetScriptFilePath(a2)
                    end)
                    if not success then
                        if not string.find(result, "lacking permission 5") then
                            error(Error.new(string.format(
                                "Could not get a snapshot path for test file '%s' because of the following error: %s",
                                a2.Name,
                                result
                            )))
                        else
                            error(Error.new(string.format(
                                "Could not get a snapshot path for test file '%s'. You may need to pass in --load.asRobloxScript",
                                a2.Name
                            )))
                        end
                    end
                    return ("%s/__snapshots__/%s"):format(getParent(result, 1), a2.Name .. ".snap.lua")
                end,
            }
        end,
    }
end

return v2