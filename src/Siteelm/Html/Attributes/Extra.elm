module Siteelm.Html.Attributes.Extra exposing (httpEquiv, lang)

import Html exposing (Attribute)
import Html.Attributes exposing (attribute)


httpEquiv : String -> Attribute msg
httpEquiv =
    attribute "http-equiv"


lang : String -> Attribute msg
lang =
    attribute "lang"
