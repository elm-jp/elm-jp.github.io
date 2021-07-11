module Static.Top exposing (main)

import Html exposing (Html, a, div, h1, img, p, section, text)
import Html.Attributes exposing (class, href, src, target)
import Siteelm.Html exposing (link, title)
import Siteelm.Html.Attributes exposing (rel)
import Siteelm.Page exposing (Page, page)


main : Page
main =
    page { head = viewHead, body = viewBody }


{-| Make contents inside the _head_ tag.
-}
viewHead : List (Html Never)
viewHead =
    []


{-| Make contents inside the _body_ tag. The parameter "body" is usually something like markdown.
-}
viewBody : List (Html Never)
viewBody =
    let
        card { title, description, link } =
            div [ class "flex-1 rounded overflow-hidden border m-2 p-5" ]
                [ h1 [ class "text-gray-900 font-bold text-xl" ] [ text title ]
                , p [ class "mt-2" ] [ text description ]
                , a [ class "block text-blue-500 hover:text-blue-700 mt-1", target "_blank", rel "noopener", href link.url ]
                    [ text <| link.label ++ " →" ]
                ]
    in
    [ section [ class "p-5" ]
        [ img [ src "/images/sakura.jpg" ] []
        , p [ class "mt-2" ] [ text "Elm-jp は日本を活動拠点とする、動物を愛でるようなやさしい気持ちを大切にするElmユーザーの集まりです。" ]
        ]
    , section [ class "md:flex flex-wrap p-3" ] <|
        List.map card
            [ { title = "公式ガイドの翻訳"
              , description = "Elmの公式ガイドを日本語に翻訳して公開しています。Elmに興味を持ったら、まずはここから始めましょう。"
              , link = { label = "はじめに · An Introduction to Elm", url = "https://guide.elm-lang.jp" }
              }
            , { title = "Discord"
              , description = "日本のユーザー間で、Elmのノウハウや最新情報を共有しています。Elm初心者からの質問も受け付けています。"
              , link = { label = "Discordに参加する", url = "https://discordapp.com/invite/4j2MxCg" }
              }
            , { title = "ScrapBox"
              , description = "Elm-jpのScrapBoxです。ScrapBoxのほか、QiitaやZennなどでも記事を探すことができます。"
              , link = { label = "ScrapBox", url = "https://scrapbox.io/elm-jp" }
              }
            ]
    ]
