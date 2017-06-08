module Types exposing (..)

type alias Exercise =
    { name: String
    , reps: Int
    , sets: Int
    , date: String
    , muscles: List String
    }