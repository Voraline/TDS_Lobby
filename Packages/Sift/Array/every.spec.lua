-- Script path: ReplicatedStorage.Packages.Sift.Array.every.spec
-- Decompile time: 0.37 ms

return function() -- Line: 1
    local every = require(script.Parent.every)
    it("should return true if all elements match the predicate", function() -- Line: 4 -- upvalues: every (val)
        expect(every({1, 2, 3}, function(a1) -- Line: 7
            return a1 % 1 == 0
        end)).to.equal(true)
    end)
    it("should return false if any elements do not match the predicate", function() -- Line: 12 -- upvalues: every (val)
        expect(every({1, 2, 3}, function(a1) -- Line: 15
            return a1 % 2 == 0
        end)).to.equal(false)
    end)
end