-- Script path: ReplicatedStorage.Packages.Sift.Array.set.spec
-- Decompile time: 0.43 ms

return function() -- Line: 1
    local set = require(script.Parent.set)
    it("should set the given value in the given array", function() -- Line: 4 -- upvalues: set (val)
        local v1 = set({1, 2, 3}, 2, 4)
        expect(v1[2]).to.equal(4)
    end)
    it("should not modify the original array", function() -- Line: 12 -- upvalues: set (val)
        local v1 = {1, 2, 3}
        set(v1, 2, 4)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
end