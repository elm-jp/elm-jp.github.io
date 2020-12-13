module Siteelm.Page exposing (Page, page)

import Browser
import Html exposing (Html)
import Siteelm.Html as Html
import Siteelm.Html.Attributes.Extra as Html
import Siteelm.Html.Ogp as Ogp


{-| Generate a Program for static page.
-}
page : { head : List (Html Never), body : List (Html Never) } -> Page
page { head, body } =
    Browser.document
        { init = always ( (), Cmd.none )
        , update = \_ () -> ( (), Cmd.none )
        , view = always { title = "", body = [ renderPage head body ] }
        , subscriptions = always Sub.none
        }


type alias Page =
    Program () () Never


renderPage : List (Html Never) -> List (Html Never) -> Html Never
renderPage head body =
    Html.html [ Html.lang "ja" ]
        [ Html.head [ Ogp.prefix "og: http://ogp.me/ns#" ] head
        , Html.body [] body
        ]
