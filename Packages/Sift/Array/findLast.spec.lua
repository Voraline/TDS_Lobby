-- Script path: ReplicatedStorage.Packages.Sift.Array.findLast.spec
-- Decompile time: 0.79 ms

return function() -- Line: 1
    local findLast = require(script.Parent.findLast)
    it("should return the first element that matches the given value", function() -- Line: 4 -- upvalues: findLast (val)
        expect(findLast({1, 2, 3}, 2)).to.equal(2)
    end)
    it("should return nil if no element matches the given value", function() -- Line: 10 -- upvalues: findLast (val)
        expect(findLast({1, 2, 3}, 4)).never.to.be.ok()
    end)
    it("should return nil if no element matches, given a starting index", function() -- Line: 16 -- upvalues: findLast (val)
        expect(findLast({1, 2, 3}, 3, 2)).never.to.be.ok()
    end)
    it("should return the first element that matches, given a starting index", function() -- Line: 22 -- upvalues: findLast (val)
        expect(findLast({1, 2, 3}, 1, 2)).to.equal(1)
    end)
    it("should accept a negative starting index", function() -- Line: 28 -- upvalues: findLast (val)
        expect(findLast({1, 2, 3}, 2, -1)).to.equal(2)
    end)
end