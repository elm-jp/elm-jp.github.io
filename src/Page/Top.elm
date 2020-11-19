module Page.Top exposing (view)

import Html exposing (Html, a, div, footer, h1, header, img, main_, nav, p, section, span, text)
import Html.Attributes exposing (class, href, id, rel, src, target)



-- VIEW


view : List (Html msg)
view =
    [ siteHeader
    , main_ []
        [ section [ class "section" ]
            [ div [ class "content" ]
                [ img [ src "img/sakura.jpg" ] []
                , p [] [ text "Elm-jp は日本を活動拠点とする、動物を愛でるようなやさしい気持ちを大切にするElmユーザーの集まりです。" ]
                , p []
                    [ a [ class "button", target "_blank", rel "noopener", href "https://discordapp.com/invite/4j2MxCg" ]
                        [ text "Discord 招待リンク" ]
                    ]
                , p []
                    [ a
                        [ class "button", target "_blank", rel "noopener", href "https://scrapbox.io/elm-jp" ]
                        [ text "ScrapBox" ]
                    ]
                , p []
                    [ a [ class "button", target "_blank", rel "noopener", href "https://guide.elm-lang.jp" ]
                        [ text "公式ドキュメント翻訳プロジェクト" ]
                    ]
                ]
            ]
        , section [ id "sakura", class "section" ]
            [ div [ class "moment" ]
                [ a [ class "twitter-moment", href "https://twitter.com/i/moments/1088056396665352192?ref_src=twsrc%5Etfw" ]
                    [ text "さくらちゃん日記" ]
                ]
            ]
        ]
    , siteFooter
    ]


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
