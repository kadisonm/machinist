local State = require(script.Parent.State)
local Value = require(script.Parent.Value)

type Class = {
    States: { State.Class },
    CurrentState: State.Class?
}

local function New(states: { State.Class })
    local self = {
        States = states,
        CurrentState = Value(nil)
    }
    
    function self:ChangeState(id: (string | number))
        local wantedState = self.States[id]

        self.CurrentState():Exit()
        self.CurrentState(wantedState)
        self.CurrentState():Enter()
    end

    function self:Destroy()
        self.CurrentState():Exit()
        self.States = nil
    end

    return self
end

return New