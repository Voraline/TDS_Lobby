-- Script path: ReplicatedStorage.Packages.Sift.Array.reduceRight.spec
-- Decompile time: 0.77 ms

return function() -- Line: 1
    local reduceRight = require(script.Parent.reduceRight)
    it("should reduce the given array from the right", function() -- Line: 4 -- upvalues: reduceRight (val)
        local v1 = reduceRight({1, 2, 3}, function(a1, a2) -- Line: 7
            return a1 + a2
        end, 0)
        expect(v1).to.equal(6)
    end)
    it("should reduce the given array from the right, using the last element as the initial value", function() -- Line: 16 -- upvalues: reduceRight (val)
        local v1 = reduceRight({1, 2, 3}, function(a1, a2) -- Line: 19
            return a1 - a2
        end)
        expect(v1).to.equal(0)
    end)
    it("should reduce the array from the right, even if the array has a falsy initial value", function() -- Line: 29 -- upvalues: reduceRight (val)
        local v1 = reduceRight({true, false, true}, function(a1, a2) -- Line: 32
            return a1 or a2
        end, false)
        expect(v1).to.equal(true)
    end)
end