-- Script path: ReplicatedStorage.Packages.Sift.Array.removeValue.spec
-- Decompile time: 0.39 ms

return function() -- Line: 1
    local removeValue = require(script.Parent.removeValue)
    it("should remove the elements with the given value", function() -- Line: 4 -- upvalues: removeValue (val)
        local v1 = removeValue({1, 2, 3, 4, 5}, 2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).to.equal(4)
        expect(v1[4]).to.equal(5)
        expect(v1[5]).never.to.be.ok()
    end)
    it("should not modify the original array", function() -- Line: 16 -- upvalues: removeValue (val)
        local v1 = {1, 2, 3, 4, 5}
        removeValue(v1, 2)
        expect(v1[2]).to.equal(2)
    end)
end