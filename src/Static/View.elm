module Static.View exposing (siteFooter, siteHeader)

import Html exposing (Html, a, div, footer, h1, header, nav, p, span, text)
import Html.Attributes exposing (class, href)


siteHeader : Html msg
siteHeader =
    header [ class "navbar is-spaced is-light" ]
        [ h1 [ class "navbar-brand" ]
            [ a [ class "navbar-item", href "/" ]
                [ span [ class "has-text-weight-bold" ] [ text "Elm-jp" ]
                ]
            ]
        , nav [ class "navbar-menu navbar-end" ]
            [ a [ class "navbar-item", href "#sakura" ] [ text "さくらちゃん日記" ]
            ]
        ]


siteFooter : Html msg
siteFooter =
    footer [ class "footer" ]
        [ div [ class "has-text-centered" ]
            [ p [] [ text "© 2019 Elm-jp" ]
            ]
        ]
