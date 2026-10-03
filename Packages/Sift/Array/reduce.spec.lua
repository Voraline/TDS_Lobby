-- Script path: ReplicatedStorage.Packages.Sift.Array.reduce.spec
-- Decompile time: 0.61 ms

return function() -- Line: 1
    local reduce = require(script.Parent.reduce)
    it("should reduce the given array to a single value", function() -- Line: 4 -- upvalues: reduce (val)
        local v1 = reduce({1, 2, 3}, function(a1, a2) -- Line: 7
            return a1 + a2
        end, 0)
        expect(v1).to.equal(6)
    end)
    it("should reduce the given array to a single value, using the first element as the initial value", function() -- Line: 16 -- upvalues: reduce (val)
        local v1 = reduce({1, 2, 3}, function(a1, a2) -- Line: 19
            return a1 - a2
        end)
        expect(v1).to.equal(-4)
    end)
    it("should reduce the array, even if the array has a falsy initial value", function() -- Line: 27 -- upvalues: reduce (val)
        local v1 = reduce({true, false, false}, function(a1, a2) -- Line: 30
            return a1 or a2
        end, false)
        expect(v1).to.equal(true)
    end)
end