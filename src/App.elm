module App exposing (..)

import Http
import Json.Decode as Decode
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Types exposing (Exercise)


type alias Model =
    { exercises : List Exercise
    , currentExercise : Exercise
    }



init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = PostExercise Exercise


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        PostExercise currentExercise ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Gainz" ]
        , p [] [ text <| toString model ]
        , button
            [ class "btn btn-primary"
            , onClick PostExercise model.currentExercise3

















            ]
            [ text "+ 1" ]
        ]
