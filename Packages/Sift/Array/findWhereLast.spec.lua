-- Script path: ReplicatedStorage.Packages.Sift.Array.findWhereLast.spec
-- Decompile time: 0.66 ms

return function() -- Line: 1
    local findWhereLast = require(script.Parent.findWhereLast)
    it("should return the last element that matches the predicate", function() -- Line: 4 -- upvalues: findWhereLast (val)
        expect(findWhereLast({1, 2, 3, 4, 5}, function(a1) -- Line: 7
            return a1 % 2 == 0
        end)).to.equal(4)
    end)
    it("should return nil if no element matches the predicate", function() -- Line: 12 -- upvalues: findWhereLast (val)
        expect(findWhereLast({1, 2, 3, 4, 5}, function(a1) -- Line: 15
            return a1 == 6
        end)).never.to.be.ok()
    end)
    it("should return the last element that matches the predicate, given a starting index", function() -- Line: 22 -- upvalues: findWhereLast (val)
        expect(findWhereLast({1, 2, 3, 4, 5}, function(a1) -- Line: 25
            return a1 % 2 == 0
        end, 2)).to.equal(2)
    end)
    it("should return nil if no element matches the predicate, given a starting index", function() -- Line: 31 -- upvalues: findWhereLast (val)
        expect(findWhereLast({1, 2, 3, 4, 5}, function(a1) -- Line: 34
            return a1 == 4
        end, 3)).never.to.be.ok()
    end)
end