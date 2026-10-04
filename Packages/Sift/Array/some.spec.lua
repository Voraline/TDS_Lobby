-- Script path: ReplicatedStorage.Packages.Sift.Array.some.spec
-- Decompile time: 0.44 ms

return function() -- Line: 1
    local some = require(script.Parent.some)
    it("should return true if the given predicate returns true for any element", function() -- Line: 4 -- upvalues: some (val)
        local v1 = some({1, 2, 3}, function(a1) -- Line: 7
            return a1 == 2
        end)
        expect(v1).to.equal(true)
    end)
    it("should return false if the given predicate returns false for all elements", function() -- Line: 14 -- upvalues: some (val)
        local v1 = some({1, 2, 3}, function(a1) -- Line: 17
            return a1 == 4
        end)
        expect(v1).to.equal(false)
    end)
end