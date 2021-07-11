module Siteelm.Page exposing (Page, page)

import Browser
import Html exposing (Html, main_, node)
import Html.Attributes exposing (attribute, class, href, name)
import Siteelm.Html as Html exposing (link, meta, script, title)
import Siteelm.Html.Attributes exposing (charset, content, data, rel)
import Siteelm.Html.Attributes.Extra exposing (httpEquiv, lang)
import Siteelm.Html.Ogp as Ogp
import Static.View exposing (siteFooter, siteHeader)


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
renderPage additionalHead body =
    Html.html [ lang "ja" ]
        [ Html.head [ Ogp.prefix "og: http://ogp.me/ns#" ] (commonHead ++ additionalHead)
        , Html.body [ class "flex flex-col min-h-screen" ]
            [ siteHeader
            , main_ [ class "flex-grow" ] body
            , siteFooter
            ]
        ]


commonHead : List (Html Never)
commonHead =
    let
        siteName =
            "Elm-jp"

        siteUrl =
            "https://elm-lang.jp"

        -- description =
        --     "Sakura-chan is the cutest goat all of the world. Elm-jp is the best Elm community in Japan."
        imageUrl =
            siteUrl ++ "/images/card.png"
    in
    [ meta [ charset "UTF-8" ]
    , meta [ content "IE=edge", httpEquiv "X-UA-Compatible" ]
    , meta [ name "viewport", content "width=device-width, initial-scale=1" ]

    -- Global site tag (gtag.js) - Google Analytics
    -- Siteelm.Html.scriptではcharsetやasyncの設定ができないため、直接記述している
    , node "siteelm-custom" [ data "tag" "script", attribute "async" "", attribute "src" "https://www.googletagmanager.com/gtag/js?id=UA-134256281-1" ] []
    , script "/gtag.js" ""

    -- , meta [ name "description", content description ]
    , Ogp.title siteName
    , Ogp.url siteUrl
    , Ogp.image imageUrl
    , Ogp.siteName siteUrl

    -- , Ogp.description description
    , Ogp.locale "ja_JP"
    , Ogp.type_ "website"
    , meta [ name "keywords", content "Elm" ]
    , meta [ name "thumbnail", content imageUrl ]
    , Ogp.twitterCard "summary_large_image"
    , title [] siteName
    , link [ rel "", href "/favicon.ico" ]
    , link [ rel "stylesheet", href "https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" ]
    , link [ rel "stylesheet", href "/style.css" ]
    ]
