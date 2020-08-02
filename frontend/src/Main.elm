port module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (hidden, id, src)
import Html.Events exposing (onClick)



---- PORT ----


port login : () -> Cmd msg



---- MODEL ----


type alias Model =
    { user : Maybe User
    , showLoginView : Bool
    }


type alias User =
    {}


initialModel : Model
initialModel =
    { user = Nothing, showLoginView = False }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | Login


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Login ->
            ( { model | showLoginView = True }, login () )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ loginView model.showLoginView
        , div [ model.showLoginView |> hidden ]
            [ img [ src "/logo.svg" ] []
            , h1 [] [ text "Your Elm App is working!" ]
            ]
        , div [ model.showLoginView |> hidden ] [ button [ onClick Login ] [] ]
        ]


loginView : Bool -> Html Msg
loginView showLoginView =
    div [ id "firebaseui-auth-container", not showLoginView |> hidden ] []



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
