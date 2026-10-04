-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.mergeDeep.spec
-- Decompile time: 0.91 ms

return function() -- Line: 1
    local mergeDeep = require(script.Parent.mergeDeep)
    local None = require(script.Parent.Parent.None)
    it("should combine two or more dictionaries, where the last value overrides previous, recursively", function() -- Line: 7 -- upvalues: mergeDeep (val)
        local v1 = mergeDeep({hello = "roblox", goodbye = {world = "world"}}, {goodbye = {world = "hello"}})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye.world).to.equal("hello")
    end)
    it("should not modify the original dictionaries", function() -- Line: 20 -- upvalues: mergeDeep (val)
        local v1 = {hello = "roblox", goodbye = {world = "world"}}
        local v2 = {goodbye = {world = "hello"}}
        mergeDeep(v1, v2)
        expect(v1).to.be.a("table")
        expect(v2).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye.world).to.equal("world")
    end)
    it("should accept nil values", function() -- Line: 33 -- upvalues: mergeDeep (val)
        local v1 = {hello = "roblox", goodbye = {world = "world"}}
        local v2 = mergeDeep(v1, nil)
        local v3 = mergeDeep(nil, v1)
        expect(v2).to.be.a("table")
        expect(v2.hello).to.equal("roblox")
        expect(v2.goodbye.world).to.equal("world")
        expect(v3).to.be.a("table")
        expect(v3.hello).to.equal("roblox")
        expect(v3.goodbye.world).to.equal("world")
    end)
    it("should remove values set to None", function() -- Line: 50 -- upvalues: None (val), mergeDeep (val)
        local v1 = mergeDeep({hello = "roblox", goodbye = {world = "world"}}, {goodbye = None})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal(nil)
    end)
end