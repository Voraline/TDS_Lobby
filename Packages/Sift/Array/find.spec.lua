-- Script path: ReplicatedStorage.Packages.Sift.Array.find.spec
-- Decompile time: 0.88 ms

return function() -- Line: 1
    local find = require(script.Parent.find)
    it("should return the first element that matches the given value", function() -- Line: 4 -- upvalues: find (val)
        expect(find({1, 2, 3}, 2)).to.equal(2)
    end)
    it("should return nil if no element matches the given value", function() -- Line: 10 -- upvalues: find (val)
        expect(find({1, 2, 3}, 4)).never.to.be.ok()
    end)
    it("should return the first element that matches, given a starting index", function() -- Line: 16 -- upvalues: find (val)
        expect(find({1, 2, 3}, 3, 2)).to.equal(3)
    end)
    it("should return nil if no element matches, given a starting index", function() -- Line: 22 -- upvalues: find (val)
        expect(find({1, 2, 3}, 1, 2)).never.to.be.ok()
    end)
    it("should accept a negative starting index", function() -- Line: 28 -- upvalues: find (val)
        expect(find({1, 2, 3}, 2, -1)).to.equal(2)
    end)
end