type Listener = (oldValue: any?, newValue: any?) -> nil

local function Value<T>(initialValue: T)
    local value = {}
    local listeners = {} :: { Listener }
    local _data = initialValue

    function value:Connect(listener: Listener)
        local listenerIndex = #listeners + 1

        listeners[listenerIndex] = listener

        return { Disconnect = function()
            for i, v in pairs(listeners) do
                listeners[listenerIndex] = nil
            end
        end }
    end

    setmetatable(value, {
        __call = function(table: {any}, ... : any)
            local args = {...} :: {T}
            local newValue = args[1]

            if #args > 1 then
                warn("Only provide 1 argument to Value() as additional arguments are ignored.")
            end

            if #args <= 0 then
                return _data
            else
                local oldValue = _data
                _data = newValue

                for _, listener in pairs(listeners) do
                    listener(oldValue, _data)
                end
                
                return _data
            end
        end
    })

    return value
end

return Value
