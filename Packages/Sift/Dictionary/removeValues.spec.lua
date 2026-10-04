-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.removeValues.spec
-- Decompile time: 0.47 ms

return function() -- Line: 1
    local removeValues = require(script.Parent.removeValues)
    it("should return a new dictionary with the given values removed", function() -- Line: 4 -- upvalues: removeValues (val)
        local v1 = removeValues({hello = "world", goodbye = "world", cat = "meow", dog = "woof"}, "world")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(nil)
        expect(v1.goodbye).to.equal(nil)
        expect(v1.cat).to.equal("meow")
        expect(v1.dog).to.equal("woof")
    end)
    it("should not modify the original dictionary", function() -- Line: 17 -- upvalues: removeValues (val)
        local v1 = {hello = "world", goodbye = "world", cat = "meow", dog = "woof"}
        removeValues(v1, "world")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("world")
        expect(v1.goodbye).to.equal("world")
        expect(v1.cat).to.equal("meow")
        expect(v1.dog).to.equal("woof")
    end)
end