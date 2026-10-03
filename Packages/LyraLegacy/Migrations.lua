-- Script path: ReplicatedStorage.Packages.LyraLegacy.Migrations
-- Decompile time: 1.64 ms

require(script.Parent.Log)
local Promise = require(script.Parent.Promise)
local Tables = require(script.Parent.Tables)
require(script.Parent.Types)
return {
    makeAddFieldsStep = function(a1, a2) -- Line: 72 -- upvalues: Tables (val) -- types: a1: string, a2: table
        return {
            name = a1,
            apply = function(a1) -- Line: 75 -- upvalues: Tables (upval), a2 (val)
                return Tables.mergeDeep(a2, a1)
            end,
        }
    end,
    makeTransformStep = function(a1, a2) -- Line: 93 -- types: a1: string, a2: function
        return {name = a1, apply = a2}
    end,
    validate = function(a1) -- Line: 54 -- types: a1: table
        assert(typeof(a1) == "table", "steps must be a table")
        local v1 = nil
        local v2 = nil
        for i, j in a1, v1, v2 do
            assert(typeof(j) == "table", "step must be a table")
            assert(typeof(j.name) == "string", "step.name must be a string")
            assert(typeof(j.apply) == "function", "step.apply must be a function")
        end
    end,
    apply = function(a1) -- Line: 142 -- upvalues: Promise (val), Tables (val) -- types: a1: table
        local logger = a1.logger
        local data = a1.data
        local u5 = table.clone(a1.appliedMigrations)
        local u6 = {}
        for i, j in u5 do
            u6[j] = true
        end
        return (Promise.new(function(a1_2, a2) -- Line: 154 -- upvalues: a1 (val), u6 (val), logger (val), Tables (upval), data (ref), u5 (val)
            local result, success, v1
            for i, j in a1.steps do
                if not u6[j.name] then
                    logger:log("trace", "applying migration step", {stepName = j.name})
                    v1 = Tables.copyDeep(data)
                    success, result = pcall(j.apply, v1)
                    if not success then
                        logger:log("error", "failed to apply migration step", {stepName = j.name, error = result})
                        return a2((("Failed migration step '%*': %*"):format(j.name, result)))
                    end
                    data = Tables.copyDeep(result)
                    table.insert(u5, j.name)
                    u6[j.name] = true
                end
            end
            return a1_2({data = data, appliedMigrations = u5})
        end))
    end,
    getStepNames = function(a1) -- Line: 199 -- types: a1: table
        local v1 = {}
        for i, j in a1 do
            table.insert(v1, j.name)
        end
        return v1
    end,
}