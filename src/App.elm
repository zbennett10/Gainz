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

initialModel : Model
initialModel =
    { exercises = [ Exercise "Bicep Curl" 12 4 "2017-06-11T:00:00:00Z" ["Biceps"] ]
    , currentExercise = Exercise "Skullcrushers" 12 4 "2017-06-11T:00:00:00Z" ["Triceps"] 
    }

init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = PostExercise
    | StageMuscleGroup String


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        PostExercise ->
            ( model, Cmd.none )
        
        StageMuscleGroup muscle ->
            ( { model | currentExercise = (stageMuscleGroup model.currentExercise muscle)}, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container text-center" ]
        [ h1 [] [ text "Gainz" ]
        , p [] [ text <| toString model ]
        , div [] 
            [ div [ class "form-group form-inline" ]
                [ label [] [ text "Name" ]
                , input [] []
                ]
            , div [ class "form-group form-inline" ]
                [ label [] [ text "Sets" ] 
                , input [] []
                ]
            , div [ class "form-group form-inline" ]
                [ label [] [ text "Reps" ]
                , input [] []
                ]
            , div [ class "form-group form-inline" ]
                [ label [] [ text "Date" ] 
                , input [ type_ "date" ] []
                ]
            , div [ class "form-group form-inline" ]
                [ label [] [ text "Muscle Groups" ]
                , select [ onInput StageMuscleGroup ]
                    [ option [] [ text "Biceps" ]
                    , option [] [ text "Triceps" ]
                    , option [] [ text "Forearms" ]
                    , option [] [ text "Shoulders" ]
                    , option [] [ text "Quadriceps" ]
                    , option [] [ text "Hamstrings" ]
                    , option [] [ text "Abs" ]
                    , option [] [ text "Chest" ]
                    , option [] [ text "Back" ]
                    ]
                , textarea [] [ text (showStagedMuscleGroups model.currentExercise) ]
                ]
            , button [ class "btn btn-lg btn-success"
                     , onClick PostExercise
                     ] 
                     [ text "Submit Exercise" ]
            ]
        ]



-- helpers

stageMuscleGroup : Exercise -> String -> Exercise
stageMuscleGroup exercise muscle =
    { exercise | muscles = muscle :: exercise.muscles }

showStagedMuscleGroups : Exercise -> String
showStagedMuscleGroups exercise =
    String.join "," exercise.muscles
