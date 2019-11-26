module Route exposing (Route(..), parser)

import Url.Parser as Parser exposing (map, oneOf, top)



-- ROUTING


type Route
    = Top


parser : Parser.Parser (Route -> a) a
parser =
    oneOf
        [ map Top top
        ]
