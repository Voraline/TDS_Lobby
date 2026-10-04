-- Script path: ReplicatedStorage.Packages.Sift.Array.count.spec
-- Decompile time: 0.61 ms

return function() -- Line: 1
    local count = require(script.Parent.count)
    it("should return the number of elements in the given array", function() -- Line: 4 -- upvalues: count (val)
        local v1 = count({1, 2, 3})
        expect(v1).to.equal(3)
    end)
    it("should return 0 for an empty array", function() -- Line: 12 -- upvalues: count (val)
        local v1 = count({})
        expect(v1).to.equal(0)
    end)
    it("should return the number of elements matching the given predicate", function() -- Line: 20 -- upvalues: count (val)
        local v1 = count({1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, function(a1) -- Line: 23
            return a1 % 2 == 0
        end)
        expect(v1).to.equal(5)
    end)
end