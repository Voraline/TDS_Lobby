-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.withKeys.spec
-- Decompile time: 0.60 ms

return function() -- Line: 1
    local withKeys = require(script.Parent.withKeys)
    it("should return a new dictionary with the given keys kept", function() -- Line: 4 -- upvalues: withKeys (val)
        local v1 = withKeys({hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow"}, "cat", "dog")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(nil)
        expect(v1.cat).to.equal("meow")
        expect(v1.dog).to.equal("woof")
        expect(v1.unicorn).to.equal(nil)
    end)
    it("should not modify the original dictionary", function() -- Line: 17 -- upvalues: withKeys (val)
        local v1 = {hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow"}
        withKeys(v1, "cat", "dog")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("world")
        expect(v1.cat).to.equal("meow")
        expect(v1.dog).to.equal("woof")
        expect(v1.unicorn).to.equal("rainbow")
    end)
end