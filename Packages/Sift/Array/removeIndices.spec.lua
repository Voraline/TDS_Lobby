-- Script path: ReplicatedStorage.Packages.Sift.Array.removeIndices.spec
-- Decompile time: 0.56 ms

return function() -- Line: 1
    local removeIndices = require(script.Parent.removeIndices)
    it("should remove the elements at the given indices", function() -- Line: 4 -- upvalues: removeIndices (val)
        local v1 = removeIndices({1, 2, 3, 4, 5}, 2, 4)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).to.equal(5)
        expect(v1[4]).never.to.be.ok()
    end)
    it("should not modify the original array", function() -- Line: 15 -- upvalues: removeIndices (val)
        local v1 = {1, 2, 3, 4, 5}
        removeIndices(v1, 2, 4)
        expect(v1[4]).to.equal(4)
    end)
    it("should remove indices at given negative indices", function() -- Line: 23 -- upvalues: removeIndices (val)
        local v1 = removeIndices({1, 2, 3, 4, 5}, -1, -3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).to.equal(5)
        expect(v1[4]).never.to.be.ok()
    end)
end