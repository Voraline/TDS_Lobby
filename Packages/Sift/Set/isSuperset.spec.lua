-- Script path: ReplicatedStorage.Packages.Sift.Set.isSuperset.spec
-- Decompile time: 0.39 ms

return function() -- Line: 1
    local isSuperset = require(script.Parent.isSuperset)
    it("should check if a set is a superset of another set", function() -- Line: 4 -- upvalues: isSuperset (val)
        local v1 = {hello = true, world = true}
        local v2 = {hello = true}
        expect(isSuperset(v1, v2)).to.equal(true)
        expect(isSuperset(v2, v1)).to.equal(false)
    end)
end