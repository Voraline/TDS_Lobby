-- Script path: ReplicatedStorage.Packages.Sift.Set.intersection.spec
-- Decompile time: 0.29 ms

return function() -- Line: 1
    local intersection = require(script.Parent.intersection)
    it("should return the intersection of two sets", function() -- Line: 4 -- upvalues: intersection (val)
        local v1 = intersection({hello = true, world = true}, {world = true, cat = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(nil)
        expect(v1.world).to.equal(true)
        expect(v1.cat).to.equal(nil)
    end)
end