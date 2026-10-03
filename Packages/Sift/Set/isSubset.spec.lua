-- Script path: ReplicatedStorage.Packages.Sift.Set.isSubset.spec
-- Decompile time: 0.38 ms

return function() -- Line: 1
    local isSubset = require(script.Parent.isSubset)
    it("should check if a set is a subset of another set", function() -- Line: 4 -- upvalues: isSubset (val)
        local v1 = {hello = true, world = true}
        local v2 = {hello = true}
        expect(isSubset(v2, v1)).to.equal(true)
        expect(isSubset(v1, v2)).to.equal(false)
    end)
end