-- Script path: ReplicatedStorage.Packages.Sift.Array.equalsDeep.spec
-- Decompile time: 0.50 ms

return function() -- Line: 1
    local equalsDeep = require(script.Parent.equalsDeep)
    it("should return true if the arrays are equal", function() -- Line: 4 -- upvalues: equalsDeep (val)
        expect(equalsDeep({1, 2, 3}, {1, 2, 3})).to.equal(true)
    end)
    it("should return false if the arrays are not equal", function() -- Line: 11 -- upvalues: equalsDeep (val)
        expect(equalsDeep({1, 2, 3}, {1, 2, 4})).to.equal(false)
    end)
    it("should return true if nested arrays are equal", function() -- Line: 18 -- upvalues: equalsDeep (val)
        expect(equalsDeep({1, 2, {3, 4}}, {1, 2, {3, 4}})).to.equal(true)
    end)
end