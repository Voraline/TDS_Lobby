-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.filter.spec
-- Decompile time: 0.61 ms

return function() -- Line: 1
    local filter = require(script.Parent.filter)
    it("should return a copy of the given dictionary with only the elements that match the predicate", function() -- Line: 6 -- upvalues: filter (val)
        local v1 = {hello = "world", goodbye = "goodbye"}
        local v2 = filter(v1, function(a1) -- Line: 9
            return a1 == "world"
        end)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal("world")
    end)
    it("should not modify the original dictionary", function() -- Line: 20 -- upvalues: filter (val)
        local v1 = {hello = "world", goodbye = "goodbye"}
        local v2 = filter(v1, function(a1) -- Line: 23
            return a1 == "world"
        end)
        expect(v2).never.to.equal(v1)
        expect(v1.hello).to.equal("world")
        expect(v1.goodbye).to.equal("goodbye")
        expect(v2.hello).to.equal("world")
    end)
end