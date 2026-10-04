-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.count.spec
-- Decompile time: 0.52 ms

return function() -- Line: 1
    local count = require(script.Parent.count)
    it("should return the number of elements in the given dictionary", function() -- Line: 4 -- upvalues: count (val)
        local v1 = count({hello = "world", goodbye = "world"})
        expect(v1).to.equal(2)
    end)
    it("should return 0 for an empty dictionary", function() -- Line: 12 -- upvalues: count (val)
        local v1 = count({})
        expect(v1).to.equal(0)
    end)
    it("should return the number of elements matching the given predicate", function() -- Line: 20 -- upvalues: count (val)
        local v1 = count({hello = "world", goodbye = "world"}, function(a1, a2) -- Line: 23
            return a2 == "goodbye"
        end)
        expect(v1).to.equal(1)
    end)
end