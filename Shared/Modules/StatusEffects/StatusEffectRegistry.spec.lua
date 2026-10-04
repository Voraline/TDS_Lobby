-- Script path: ReplicatedStorage.Shared.Modules.StatusEffects.StatusEffectRegistry.spec
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JestGlobals = require(ReplicatedStorage.DevPackages.JestGlobals)
local describe = JestGlobals.describe
local expect = JestGlobals.expect
local it = JestGlobals.it
local StatusEffectRegistry = require(script.Parent.StatusEffectRegistry)
describe("Register", function() -- Line: 10 -- upvalues: it (val), StatusEffectRegistry (val), expect (val)
    it("should register a valid definition", function() -- Line: 11 -- upvalues: StatusEffectRegistry (upval), expect (upval)
        StatusEffectRegistry.register({
            name = "Burn",
            displayName = "Burning",
            ownership = "Global",
            stacking = "Refresh",
            duration = 6,
        })
        expect(StatusEffectRegistry.has("Burn")).toBe(true)
    end)
    it("should reject duplicate registrations", function() -- Line: 23 -- upvalues: StatusEffectRegistry (upval), expect (upval)
        StatusEffectRegistry.register({name = "Duplicate", displayName = "Dupe", ownership = "Global", stacking = "Disallowed"})
        expect(function() -- Line: 31 -- upvalues: StatusEffectRegistry (upval)
            StatusEffectRegistry.register({name = "Duplicate", displayName = "Dupe2", ownership = "Global", stacking = "Disallowed"})
        end).toThrow()
    end)
    it("should reject definitions without a name", function() -- Line: 41 -- upvalues: expect (upval), StatusEffectRegistry (upval)
        expect(function() -- Line: 42 -- upvalues: StatusEffectRegistry (upval)
            StatusEffectRegistry.register({displayName = "No Name", ownership = "Global", stacking = "Disallowed"})
        end).toThrow()
    end)
end)
describe("Get", function() -- Line: 52 -- upvalues: it (val), StatusEffectRegistry (val), expect (val)
    it("should return a registered definition", function() -- Line: 53 -- upvalues: StatusEffectRegistry (upval), expect (upval)
        StatusEffectRegistry.register({
            name = "GetTest",
            displayName = "Get Test",
            ownership = "Individual",
            stacking = "Stack",
            maxStacks = 10,
        })
        local GetTest = StatusEffectRegistry.get("GetTest")
        expect(GetTest).never.toBeNil()
        expect(GetTest.name).toBe("GetTest")
        expect(GetTest.ownership).toBe("Individual")
        expect(GetTest.maxStacks).toBe(10)
    end)
    it("should return nil for unregistered effects", function() -- Line: 69 -- upvalues: StatusEffectRegistry (upval), expect (upval)
        local NonExistent = StatusEffectRegistry.get("NonExistent")
        expect(NonExistent).toBeNil()
    end)
end)
describe("Has", function() -- Line: 75 -- upvalues: it (val), expect (val), StatusEffectRegistry (val)
    it("should return false for unregistered effects", function() -- Line: 76 -- upvalues: expect (upval), StatusEffectRegistry (upval)
        expect(StatusEffectRegistry.has("NeverRegistered")).toBe(false)
    end)
end)
describe("RegisterAll", function() -- Line: 81 -- upvalues: it (val), StatusEffectRegistry (val), expect (val)
    it("should register multiple definitions at once", function() -- Line: 82 -- upvalues: StatusEffectRegistry (upval), expect (upval)
        StatusEffectRegistry.registerAll({
            Batch1 = {name = "Batch1", displayName = "Batch 1", ownership = "Global", stacking = "Refresh"},
            Batch2 = {
                name = "Batch2",
                displayName = "Batch 2",
                ownership = "Individual",
                stacking = "Accumulate",
            },
        })
        expect(StatusEffectRegistry.has("Batch1")).toBe(true)
        expect(StatusEffectRegistry.has("Batch2")).toBe(true)
    end)
end)
describe("Frozen definitions", function() -- Line: 103 -- upvalues: it (val), StatusEffectRegistry (val), expect (val)
    it("should freeze registered definitions", function() -- Line: 104 -- upvalues: StatusEffectRegistry (upval), expect (upval)
        StatusEffectRegistry.register({
            name = "FrozenTest",
            displayName = "Frozen Test",
            ownership = "Global",
            stacking = "Disallowed",
        })
        local FrozenTest = StatusEffectRegistry.get("FrozenTest")
        expect(function() -- Line: 113 -- upvalues: FrozenTest (val)
            FrozenTest.name = "Mutated"
        end).toThrow()
    end)
end)