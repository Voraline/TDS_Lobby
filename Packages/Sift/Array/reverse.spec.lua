-- Script path: ReplicatedStorage.Packages.Sift.Array.reverse.spec
-- Decompile time: 0.56 ms

return function() -- Line: 1
    local reverse = require(script.Parent.reverse)
    it("should reverse the given array", function() -- Line: 4 -- upvalues: reverse (val)
        local v1 = reverse({1, 2, 3})
        expect(v1[1]).to.equal(3)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(1)
    end)
    it("should not modify the original array", function() -- Line: 14 -- upvalues: reverse (val)
        local v1 = {1, 2, 3}
        reverse(v1)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
end