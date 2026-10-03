-- Script path: ReplicatedStorage.Packages.Sift.Array.equals.spec
-- Decompile time: 0.48 ms

return function() -- Line: 1
    local equals = require(script.Parent.equals)
    it("should return true if the arrays are equal", function() -- Line: 4 -- upvalues: equals (val)
        expect(equals({1, 2, 3}, {1, 2, 3})).to.equal(true)
    end)
    it("should return false if the arrays are not equal", function() -- Line: 11 -- upvalues: equals (val)
        expect(equals({1, 2, 3}, {1, 2, 4})).to.equal(false)
    end)
    it("should return false for nested arrays", function() -- Line: 18 -- upvalues: equals (val)
        expect(equals({1, 2, {3, 4}}, {1, 2, {3, 4}})).to.equal(false)
    end)
end