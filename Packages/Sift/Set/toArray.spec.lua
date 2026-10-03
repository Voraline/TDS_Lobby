-- Script path: ReplicatedStorage.Packages.Sift.Set.toArray.spec
-- Decompile time: 0.65 ms

return function() -- Line: 1
    local toArray = require(script.Parent.toArray)
    it("should convert a set to an array", function() -- Line: 4 -- upvalues: toArray (val)
        local v1 = {hello = true, world = true}
        local v2 = toArray(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2[1]).to.equal("hello")
        expect(v2[2]).to.equal("world")
    end)
    it("should not modify the original set", function() -- Line: 16 -- upvalues: toArray (val)
        local v1 = {hello = true}
        toArray(v1)
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
    end)
end