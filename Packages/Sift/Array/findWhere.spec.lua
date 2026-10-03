-- Script path: ReplicatedStorage.Packages.Sift.Array.findWhere.spec
-- Decompile time: 0.79 ms

return function() -- Line: 1
    local findWhere = require(script.Parent.findWhere)
    it("should return the first element in the array that matches the given predicate", function() -- Line: 4 -- upvalues: findWhere (val)
        local v1 = findWhere({1, 2, 3}, function(a1) -- Line: 7
            return a1 == 2
        end)
        expect(v1).to.equal(2)
    end)
    it("should return nil if no element matches the given predicate", function() -- Line: 14 -- upvalues: findWhere (val)
        local v1 = findWhere({1, 2, 3}, function(a1) -- Line: 17
            return a1 == 4
        end)
        expect(v1).never.to.be.ok()
    end)
    it("should return the first element in the array that matches the given predicate, given a starting index", function() -- Line: 26 -- upvalues: findWhere (val)
        local v1 = findWhere({1, 2, 3}, function(a1) -- Line: 29
            return a1 == 3
        end, 2)
        expect(v1).to.equal(3)
    end)
    it("should return nil if no element matches the given predicate, given a starting index", function() -- Line: 39 -- upvalues: findWhere (val)
        local v1 = findWhere({1, 2, 3}, function(a1) -- Line: 42
            return a1 == 1
        end, 2)
        expect(v1).never.to.be.ok()
    end)
end