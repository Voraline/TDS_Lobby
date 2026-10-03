-- Script path: ReplicatedStorage.Packages.Sift.Set.count.spec
-- Decompile time: 0.36 ms

return function() -- Line: 1
    local count = require(script.Parent.count)
    it("should count the number of values in a set", function() -- Line: 4 -- upvalues: count (val)
        expect(count({hello = true, world = true})).to.equal(2)
    end)
    it("should count the number of values in a set matching the predicate", function() -- Line: 10 -- upvalues: count (val)
        expect(count({hello = true, world = true}, function(a1) -- Line: 13
            return a1 == "hello"
        end)).to.equal(1)
    end)
end