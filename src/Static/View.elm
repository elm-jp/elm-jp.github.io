module Static.View exposing (siteFooter, siteHeader)

import Html exposing (Html, a, div, footer, h1, header, img, nav, p, span, text)
import Html.Attributes exposing (class, href, rel, src, target)


siteHeader : Html msg
siteHeader =
    header [ class "flex items-center justify-between flex-wrap bg-blue-500 p-3" ]
        [ h1 [ class "flex text-white mr-6" ]
            [ img [ class "fill-current h-8 w-8 mr-2", src "/images/elm-japan-icon.svg" ] []
            , a [ href "/" ] [ span [ class "font-semibold text-xl" ] [ text "Elm-jp" ] ]
                ]
        , nav [ class "hidden flex-grow sm:flex items-center" ]
            [ div [ class "text-sm flex-grow" ] <|
                List.map
                    (\item ->
                        a [ class "inline-block text-blue-200 hover:text-white mr-4", target "_blank", rel "noopener", href item.url ]
                            [ text item.label ]
                    )
                    [ { label = "Guide（邦訳版）", url = "https://guide.elm-lang.jp" }
                    , { label = "Discord", url = "https://discordapp.com/invite/4j2MxCg" }
                    , { label = "ScrapBox", url = "https://scrapbox.io/elm-jp" }
            ]
            , div []
                [ a [ class "inline-block text-sm px-4 py-2 border rounded text-white border-white hover:border-transparent hover:text-blue-500 hover:bg-white", href "#sakura" ]
                    [ text "さくらちゃん日記" ]
                ]
            ]
        ]


siteFooter : Html msg
siteFooter =
    footer [ class "footer" ]
        [ div [ class "has-text-centered" ]
            [ p [] [ text "© 2019 Elm-jp" ]
            ]
        ]
