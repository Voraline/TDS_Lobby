-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.copy.spec
-- Decompile time: 0.52 ms

return function() -- Line: 1
    local copy = require(script.Parent.copy)
    it("should return a copy of the given dictionary", function() -- Line: 4 -- upvalues: copy (val)
        local v1 = {hello = "world"}
        local v2 = copy(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal("world")
    end)
    it("should not copy nested dictionaries", function() -- Line: 15 -- upvalues: copy (val)
        local v1 = {hello = {world = "goodbye"}}
        local v2 = copy(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal(v1.hello)
    end)
end