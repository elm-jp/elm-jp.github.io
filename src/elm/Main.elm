module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Page.Top
import Route exposing (Route)
import Url
import Url.Parser as Parser



-- MAIN


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
    { key : Nav.Key
    , page : Page
    }


type Page
    = NotFound
    | Top


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    routing url
        { key = key
        , page = Top
        }



-- ROUTER


routing : Url.Url -> Model -> ( Model, Cmd Msg )
routing url model =
    let
        maybeRoute : Maybe Route
        maybeRoute =
            Parser.parse Route.parser url
    in
    case maybeRoute of
        Nothing ->
            ( { model | page = NotFound }, Cmd.none )

        Just Route.Top ->
            ( { model | page = Top }, Cmd.none )



-- UPDATE


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url


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


view : Model -> Browser.Document Msg
view model =
    case model.page of
        NotFound ->
            { title = "Elm-jp"
            , body = Page.Top.view
            }

        Top ->
            { title = "Elm-jp"
            , body = Page.Top.view
            }
