module ExampleProgram exposing (program)

import Html exposing (Html)
import Html.Attributes
import Program exposing (ProgramRecord)
import Time


type alias Model =
    Int


type Msg
    = Increment
    | Double


program : ProgramRecord Model Msg
program =
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( (model + 1), Cmd.none )

        Double ->
            ( (model * 2), Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every Time.second (always Increment)
        , Time.every (2 * Time.second) (always Double)
        ]


view : Model -> Html Msg
view model =
    Html.div [ Html.Attributes.class "program" ]
        [ Html.text <| "program here! counter: " ++ toString model ]