-- Script path: ReplicatedStorage.Packages.Sift.Array.last.spec
-- Decompile time: 0.28 ms

return function() -- Line: 1
    local last = require(script.Parent.last)
    it("should return the last element of the given array", function() -- Line: 4 -- upvalues: last (val)
        local v1 = last({1, 2, 3})
        expect(v1).to.equal(3)
    end)
end