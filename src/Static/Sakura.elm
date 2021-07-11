module Static.Sakura exposing (main)

import Html exposing (Html, a, div, node, section, text)
import Html.Attributes exposing (attribute, class, href, id)
import Siteelm.Html.Attributes as Attributes exposing (charset)
import Siteelm.Page exposing (Page, page)


main : Page
main =
    page { head = viewHead, body = viewBody }


{-| Make contents inside the _head_ tag.
-}
viewHead : List (Html Never)
viewHead =
    [ -- Siteelm.Html.scriptではcharsetやasyncの設定ができないため、直接記述している
      node "siteelm-custom" [ Attributes.data "tag" "script", attribute "async" "", attribute "src" "https://platform.twitter.com/widgets.js", charset "utf-8" ] []
    ]


{-| Make contents inside the _body_ tag. The parameter "body" is usually something like markdown.
-}
viewBody : List (Html Never)
viewBody =
    [ section [ id "sakura", class "p-5" ]
        [ div [ class "moment" ]
            [ a [ class "twitter-moment", href "https://twitter.com/i/moments/1088056396665352192?ref_src=twsrc%5Etfw" ]
                [ text "さくらちゃん日記" ]
            ]
        ]
    ]
