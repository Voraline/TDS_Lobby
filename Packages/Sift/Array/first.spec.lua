-- Script path: ReplicatedStorage.Packages.Sift.Array.first.spec
-- Decompile time: 0.22 ms

return function() -- Line: 1
    local first = require(script.Parent.first)
    it("should return the first element of the given array", function() -- Line: 4 -- upvalues: first (val)
        local v1 = first({1, 2, 3})
        expect(v1).to.equal(1)
    end)
end