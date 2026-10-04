-- Script path: ReplicatedStorage.Packages.Sift.Set.map.spec
-- Decompile time: 0.52 ms

return function() -- Line: 1
    local map = require(script.Parent.map)
    it("should map a set", function() -- Line: 4 -- upvalues: map (val)
        local v1 = {hello = true, world = true}
        local v2 = map(v1, function(a1) -- Line: 7
            return a1 .. "!"
        end)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal(nil)
        expect(v2.world).to.equal(nil)
        expect(v2["hello!"]).to.equal(true)
        expect(v2["world!"]).to.equal(true)
    end)
    it("should not modify the original set", function() -- Line: 21 -- upvalues: map (val)
        local v1 = {hello = true}
        map(v1, function(a1) -- Line: 24
            return a1 .. "!"
        end)
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
    end)
end