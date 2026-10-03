-- Script path: ReplicatedStorage.Packages.Sift.Array.removeValues.spec
-- Decompile time: 0.45 ms

return function() -- Line: 1
    local removeValues = require(script.Parent.removeValues)
    it("should remove the elements with the given values", function() -- Line: 4 -- upvalues: removeValues (val)
        local v1 = removeValues({1, 2, 3, 4, 5}, 2, 4)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).to.equal(5)
        expect(v1[4]).never.to.be.ok()
    end)
    it("should not modify the original array", function() -- Line: 15 -- upvalues: removeValues (val)
        local v1 = {1, 2, 3, 4, 5}
        removeValues(v1, 2, 4)
        expect(v1[4]).to.equal(4)
    end)
end