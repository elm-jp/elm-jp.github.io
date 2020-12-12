module Static.Top exposing (main)

import Html exposing (Html, a, div, img, main_, node, p, section, text)
import Html.Attributes exposing (attribute, class, href, id, name, src, target)
import Siteelm.Html exposing (link, meta, script, title)
import Siteelm.Html.Attributes as Attributes exposing (charset, content, rel)
import Siteelm.Html.Attributes.Extra exposing (httpEquiv)
import Siteelm.Html.Ogp as Ogp
import Siteelm.Page exposing (Page, page)
import Static.View as View


main : Page
main =
    page { head = viewHead, body = viewBody }


{-| Make contents inside the _head_ tag.
-}
viewHead : List (Html Never)
viewHead =
    let
        siteName =
            "Elm-jp"

        siteUrl =
            "https://elm-lang.jp"

        description =
            "Sakura-chan is the cutest goat all of the world. Elm-jp is the best Elm community in Japan."

        imageUrl =
            siteUrl ++ "/images/card.png"
    in
    [ meta [ charset "UTF-8" ]
    , meta [ content "IE=edge", httpEquiv "X-UA-Compatible" ]
    , meta [ name "viewport", content "width=device-width, initial-scale=1" ]

    -- Global site tag (gtag.js) - Google Analytics
    , -- Siteelm.Html.scriptではcharsetやasyncの設定ができないため、直接記述している
      node "siteelm-custom" [ Attributes.data "tag" "script", attribute "async" "", attribute "src" "https://www.googletagmanager.com/gtag/js?id=UA-134256281-1" ] []
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

    -- <!-- <link rel="icon" type="image/x-icon" href="/favicon.ico"> -->
    , title [] siteName
    , link [ rel "stylesheet", href "https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css" ]
    , link [ rel "stylesheet", href "/style.css" ]
    , -- Siteelm.Html.scriptではcharsetやasyncの設定ができないため、直接記述している
      node "siteelm-custom" [ Attributes.data "tag" "script", attribute "async" "", attribute "src" "https://platform.twitter.com/widgets.js", charset "utf-8" ] []
    ]


{-| Make contents inside the _body_ tag. The parameter "body" is usually something like markdown.
-}
viewBody : List (Html Never)
viewBody =
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
