-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.__mocks__.testEventHandler
-- Decompile time: 3.92 ms

local v1 = {}
local console = (require((script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill")))).console
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-types"))

function v1.default(a1, a2, a3) -- Line: 17 -- upvalues: console (val)
    if a2.name == "start_describe_definition" or a2.name == "finish_describe_definition" then
        console.log(a2.name .. ":", a2.blockName)
    elseif a2.name == "run_describe_start" or a2.name == "run_describe_finish" then
        console.log(a2.name .. ":", a2.describeBlock.name)
    elseif a2.name == "test_start" or a2.name == "test_retry" or a2.name == "test_done" then
        console.log(a2.name .. ":", a2.test.name)
    elseif a2.name == "add_test" then
        console.log(a2.name .. ":", a2.testName)
    elseif a2.name == "test_fn_start" or a2.name == "test_fn_success" or a2.name == "test_fn_failure" then
        console.log(a2.name .. ":", a2.test.name)
    elseif a2.name == "add_hook" then
        console.log(a2.name .. ":", a2.hookType)
    elseif a2.name == "hook_start" or a2.name == "hook_success" then
        console.log(a2.name .. ":", a2.hook.type)
    elseif a2.name ~= "hook_failure" then
        console.log(a2.name)
    else
        console.log(a2.name .. ":", a2.hook.type)
    end
    if a2.name == "run_finish" then
        console.log("")
        console.log(("unhandledErrors: %d"):format(#a3.unhandledErrors))
    end
end

return v1