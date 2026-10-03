-- Script path: ReplicatedStorage.Packages.Sift.Set.filter.spec
-- Decompile time: 0.50 ms

return function() -- Line: 1
    local filter = require(script.Parent.filter)
    it("should filter a set", function() -- Line: 4 -- upvalues: filter (val)
        local v1 = filter({hello = true, world = true}, function(a1) -- Line: 7
            return a1 ~= "hello"
        end)
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(nil)
        expect(v1.world).to.equal(true)
    end)
    it("should not modify the original set", function() -- Line: 17 -- upvalues: filter (val)
        local v1 = {hello = true}
        filter(v1, function(a1) -- Line: 20
            return a1 ~= "hello"
        end)
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
    end)
end