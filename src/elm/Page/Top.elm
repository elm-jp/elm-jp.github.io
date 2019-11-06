module Page.Top exposing (view)

import Html exposing (Html, a, div, footer, img, li, main_, p, section, text, ul)
import Html.Attributes exposing (class, href, rel, src, target)



-- VIEW


view : List (Html msg)
view =
    [ main_ []
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
        , section [ class "section" ]
            [ div [ class "moment" ]
                [ a [ class "twitter-moment", href "https://twitter.com/i/moments/1088056396665352192?ref_src=twsrc%5Etfw" ]
                    [ text "さくらちゃん日記" ]
                ]
            ]
        ]
    , siteFooter
    ]


siteFooter : Html msg
siteFooter =
    footer [ class "footer" ]
        [ div [ class "has-text-centered" ]
            [ p [] [ text "© 2019 Elm-jp" ]
            ]
        ]
