-- Script path: ReplicatedStorage.Packages.Sift.Set.fromArray.spec
-- Decompile time: 0.34 ms

return function() -- Line: 1
    local fromArray = require(script.Parent.fromArray)
    it("should create a set from an array", function() -- Line: 4 -- upvalues: fromArray (val)
        local v1 = fromArray({"hello", "world"})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.world).to.equal(true)
    end)
end