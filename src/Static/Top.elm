module Static.Top exposing (main)

import Html exposing (Html, a, div, img, main_, p, section, text)
import Html.Attributes exposing (attribute, class, href, id, name, src, target)
import Json.Decode as D exposing (Decoder)
import Siteelm.Html as Html
import Siteelm.Html.Attributes as Attributes exposing (charset, content, rel)
import Siteelm.Html.Ogp as Ogp
import Siteelm.Page exposing (Page, page)
import Static.View as View


main : Page Preamble
main =
    page
        { decoder = preambleDecoder
        , head = viewHead
        , body = viewBody
        }


{-| Preamble is what you write on the head of the content files.
-}
type alias Preamble =
    { title : String }


{-| Preamble is passed as a JSON string. So it requires a decoder.
-}
preambleDecoder : Decoder Preamble
preambleDecoder =
    D.map Preamble
        (D.field "title" D.string)


{-| Make contents inside the _head_ tag.
-}
viewHead : Preamble -> String -> List (Html Never)
viewHead _ _ =
    let
        siteName =
            "Elm-jp"

        siteUrl =
            "https://elm-lang.jp"

        description =
            "Sakura-chan is the cutest goat all of the world. Elm-jp is the best Elm community in Japan."

        imageUrl =
            siteUrl ++ "/images/card.jpg"
    in
    [ Html.meta [ charset "utf-8" ]

    -- , Html.meta [ name "description", content description ]
    , Ogp.title siteName
    , Ogp.url siteUrl
    , Ogp.image imageUrl
    , Ogp.siteName siteUrl

    -- , Ogp.description description
    , Ogp.locale "ja_JP"
    , Ogp.type_ "website"
    , Html.meta [ name "keywords", content "Elm" ]
    , Html.meta [ name "thumbnail", content imageUrl ]
    , Ogp.twitterCard "summary_large_image"
    , Ogp.twitterDescription description
    , Ogp.twitterImage imageUrl
    , Ogp.twitterTitle siteName

    -- <!-- <link rel="icon" type="image/x-icon" href="/favicon.ico"> -->
    , Html.title [] siteName
    , Html.link [ rel "stylesheet", href "https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css" ]
    , Html.link [ rel "stylesheet", href "/style.css" ]
    , -- Siteelm.Html.scriptではcharsetやasyncの設定ができないため、直接記述している
      Html.node "siteelm-custom" [ Attributes.data "tag" "script", attribute "async" "true", attribute "src" "https://platform.twitter.com/widgets.js", charset "utf-8" ] []
    ]


{-| Make contents inside the _body_ tag. The parameter "body" is usually something like markdown.
-}
viewBody : Preamble -> String -> List (Html Never)
viewBody _ _ =
    [ View.siteHeader
    , main_ []
        [ section [ class "section" ]
            [ div [ class "content" ]
                [ img [ src "/images/sakura.jpg" ] []
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
    ]
