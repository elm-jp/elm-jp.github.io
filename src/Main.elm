module Main exposing (main)

import Browser exposing (Document)
import Browser.Navigation as Nav exposing (Key)
import Html exposing (Html, a, div, footer, h1, header, main_, nav, p, span, text)
import Html.Attributes exposing (class, href)
import Page.Top
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, top)


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequested
        }



-- MODEL


type alias Model =
    { key : Key
    , page : Page
    }


type Page
    = NotFound
    | TopPage


init : () -> Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    routing url
        { key = key
        , page = TopPage
        }



-- ROUTER


type Route
    = Top


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Top top
        ]


routing : Url -> Model -> ( Model, Cmd Msg )
routing url model =
    let
        maybeRoute : Maybe Route
        maybeRoute =
            Parser.parse parser url
    in
    case maybeRoute of
        Nothing ->
            ( { model | page = NotFound }, Cmd.none )

        Just Top ->
            ( { model | page = TopPage }, Cmd.none )



-- UPDATE


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            routing url model



-- VIEW


view : Model -> Document Msg
view { page } =
    case page of
        NotFound ->
            { title = "Elm-jp"
            , body = body Page.Top.view
            }

        TopPage ->
            { title = "Elm-jp"
            , body = body Page.Top.view
            }


body : List (Html msg) -> List (Html msg)
body contents =
    [ siteHeader
    , main_ [] contents
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
