-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.__mocks__.testUtils
-- Decompile time: 0.44 ms

local u10 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
return {
    runTest = function(a1) -- Line: 14 -- upvalues: u10 (val) -- types: a1: string
        local v1 = ("\t\treturn function(__script, __env)\n\t\t\t-- ROBLOX deviation START\n\t\t\tlocal Module = __env.Module\n\t\t\tModule.resetModules()\n\t\t\tlocal require = Module.requireOverride\n\t\t\tlocal LuauPolyfill = require(\n\t\t\t\t__script.Parent.Parent.Parent.Parent.Parent\n\t\t\t\t\t:FindFirstChild(\"luau-polyfill\")\n\t\t\t\t\t:FindFirstChild(\"src\")\n\t\t\t)\n\t\t\tlocal Array = LuauPolyfill.Array\n\t\t\tlocal Error = LuauPolyfill.Error\n\t\t\tlocal console = LuauPolyfill.console\n\n\t\t\tlocal stdout = {}\n\n\t\t\tlocal function getStdout()\n\t\t\t\treturn Array.join(stdout, \"\\n\")\n\t\t\tend\n\n\t\t\tlocal function log(...)\n\t\t\t\ttable.insert(stdout, Array.join({ ... }, \" \"))\n\t\t\tend\n\n\t\t\tconsole.log = log\n\n\t\t\tlocal global = getfenv()\n\t\t\t-- ROBLOX deviation END\n\n\t\t\tlocal circus = require(__script.Parent.Parent)\n\n\n\t\t\tglobal.console = console\n\t\t\tglobal.test = circus.test\n\t\t\tglobal.describe = circus.describe\n\t\t\tglobal.beforeEach = circus.beforeEach\n\t\t\tglobal.afterEach = circus.afterEach\n\t\t\tglobal.beforeAll = circus.beforeAll\n\t\t\tglobal.afterAll = circus.afterAll\n\n\t\t\tlocal testEventHandler = require(__script.Parent.testEventHandler).default\n\t\t\tlocal addEventHandler = require(__script.Parent.Parent.state).addEventHandler\n\t\t\taddEventHandler(testEventHandler)\n\n\t\t\t%s\n\n\t\t\tlocal run = require(__script.Parent.Parent.run).default\n\n\t\t\trun();\n\n\t\t\treturn getStdout()\n\t\tend\n  "):format(a1)
        local v2, v3 = loadstring(v1)
        assert(v2, (("Error while loading code: %s"):format((tostring(v3)))))
        return {
            stdout = v2()(script, {LuauPolyfill = u10, Module = require(script.Parent:WaitForChild("Module"))}),
        }
    end,
}