-- Script path: ReplicatedStorage.Packages.Sift.Array.removeIndex.spec
-- Decompile time: 0.51 ms

return function() -- Line: 1
    local removeIndex = require(script.Parent.removeIndex)
    it("should remove the element at the given index", function() -- Line: 4 -- upvalues: removeIndex (val)
        local v1 = removeIndex({1, 2, 3}, 2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).never.to.be.ok()
    end)
    it("should not modify the original array", function() -- Line: 14 -- upvalues: removeIndex (val)
        local v1 = {1, 2, 3}
        removeIndex(v1, 2)
        expect(v1[2]).to.equal(2)
    end)
    it("should remove an element at the given negative index", function() -- Line: 22 -- upvalues: removeIndex (val)
        local v1 = removeIndex({1, 2, 3}, -1)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).never.to.be.ok()
    end)
end