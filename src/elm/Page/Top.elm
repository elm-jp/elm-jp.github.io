module Page.Top exposing (view)

import Html exposing (Html, a, div, img, text)
import Html.Attributes exposing (class, href, rel, src, target)



-- VIEW


view : List (Html msg)
view =
    [ img [ class "eyeCatch", src "img/sakura.jpg" ] []
    , div [ class "description" ]
        [ text "Elm-jp は日本を活動拠点とする、動物を愛でるようなやさしい気持ちを大切にするElmユーザーの集まりです。" ]
    , div [ class "link" ]
        [ a [ target "_blank", rel "noopener", href "https://discordapp.com/invite/4j2MxCg" ]
            [ text "Discord 招待リンク" ]
        ]
    , div [ class "link" ]
        [ a [ target "_blank", rel "noopener", href "https://scrapbox.io/elm-jp" ]
            [ text "ScrapBox" ]
        ]
    , div [ class "link" ]
        [ a [ target "_blank", rel "noopener", href "https://guide.elm-lang.jp" ]
            [ text "公式ドキュメント翻訳プロジェクト" ]
        ]
    , div [ class "moment" ]
        [ a [ class "twitter-moment", href "https://twitter.com/i/moments/1088056396665352192?ref_src=twsrc%5Etfw" ]
            [ text "さくらちゃん日記" ]
        ]
    ]
