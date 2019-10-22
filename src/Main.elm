module Main exposing (main)

import Browser
import Html exposing (a, div, img, text)
import Html.Attributes exposing (class, href, rel, src, target)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { userState : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model ""
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Elm-jp"
    , body =
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
    }
