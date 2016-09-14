port module Port exposing (..)

-- dispatchSomeMessage will create a command with a
-- string payload representing an important message
-- to broadcast to listening components.

port dispatchSomeMessage : String -> Cmd msg


-- receiveSomeMessage is the port which our components
-- subscribe to receive the dispatched message

port receiveSomeMessage : (String -> msg) -> Sub msg
