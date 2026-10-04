-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.merge.spec
-- Decompile time: 0.84 ms

return function() -- Line: 1
    local merge = require(script.Parent.merge)
    local None = require(script.Parent.Parent.None)
    it("should combine two or more dictionaries, where the last value overrides previous", function() -- Line: 7 -- upvalues: merge (val)
        local v1 = merge({hello = "roblox", goodbye = "world"}, {hello = "hello"})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("hello")
        expect(v1.goodbye).to.equal("world")
    end)
    it("should not modify the original dictionaries", function() -- Line: 20 -- upvalues: merge (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        local v2 = {hello = "hello"}
        merge(v1, v2)
        expect(v1).to.be.a("table")
        expect(v2).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v2.hello).to.equal("hello")
    end)
    it("should accept nil values", function() -- Line: 33 -- upvalues: merge (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        local v2 = merge(v1, nil)
        local v3 = merge(nil, v1)
        expect(v2).to.be.a("table")
        expect(v2.hello).to.equal("roblox")
        expect(v2.goodbye).to.equal("world")
        expect(v3).to.be.a("table")
        expect(v3.hello).to.equal("roblox")
        expect(v3.goodbye).to.equal("world")
    end)
    it("should remove values set to None", function() -- Line: 50 -- upvalues: None (val), merge (val)
        local v1 = merge({hello = "roblox", goodbye = "world"}, {goodbye = None})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal(nil)
    end)
end