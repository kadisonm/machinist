export type Class = {
    Enter: (self: Class) -> (),
    Exit: (self: Class) -> (),
    Cleanup: (self: Class) -> (),
    [any]: any,
}

local function State(): Class
    local function Cleanup(self: Class)
        for key, value in pairs(self) do
            if typeof(value) == "RBXScriptConnection" then
                value:Disconnect()
            elseif typeof(value) == "table" and typeof(value.Disconnect) == "function" then
                value:Disconnect()
            elseif typeof(value) == "Instance" then
                value:Destroy()
            end
    
            self[key] = nil
        end
    end

    local state = {
        Enter = function() end,
        Exit = function() end,
        Cleanup = Cleanup,
    } :: Class

    return state
end

return State