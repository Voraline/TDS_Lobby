-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.removeKeys.spec
-- Decompile time: 0.54 ms

return function() -- Line: 1
    local removeKeys = require(script.Parent.removeKeys)
    it("should return a new dictionary with the given keys removed", function() -- Line: 4 -- upvalues: removeKeys (val)
        local v1 = removeKeys({hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow"}, "cat", "dog")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("world")
        expect(v1.cat).to.equal(nil)
        expect(v1.dog).to.equal(nil)
        expect(v1.unicorn).to.equal("rainbow")
    end)
    it("should not modify the original dictionary", function() -- Line: 17 -- upvalues: removeKeys (val)
        local v1 = {hello = "world", cat = "meow", dog = "woof", unicorn = "rainbow"}
        removeKeys(v1, "cat", "dog")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("world")
        expect(v1.cat).to.equal("meow")
        expect(v1.dog).to.equal("woof")
        expect(v1.unicorn).to.equal("rainbow")
    end)
end