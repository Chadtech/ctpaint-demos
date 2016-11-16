module View exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import Components       exposing (..)
import Json.Encode as Json
import String


view : Model -> Html Msg
view m = 
  div 
  [ class "main" ]
  [ div
    [ class "title-bar" ]
    [ p 
      [ class "text link"
      , style [ ("float", "left"), ("margin-left", "100px") ]
      ]
      [ text "CtPaint / Chadtech / Planet-full" ]
    ]

  , div 
    [ class "left-hud"
    , size "" "auto"
    ]
    [ div 
      [ class "card projects" 
      , size "504px" "800px"
      ]
      [ img
        [ src "./planet-full.png" 
        , style [ ("border", "2px #54474d solid") ]
        ]
        []
      , input
        [ class "new-drawing"
        , type' "submit"
        , value "clone"
        , style [ ("width", "100%") ]
        ]
        []
      , p
        [ class "text small veryIgnorable" ]
        [ text "last updated 4 hours ago" ]
      , br [] []
      , p 
        [ class "text" ]
        [ text "Paint software that runs in your internet browser" ]
      ]
    ]

  , div 
    [ class "card threads"
    , size "500px" "100%"
    ]
    [ comment 
        "./poke-profile-pic.png" 
        "forretress"
        "the clouds, particularly in the center of the drawing, are kind of... uhm... speckle-y? It doesnt look very realistic. Other than that I think it looks pretty good. nice work!"
        "3 hours ago"
    , comment 
        "./twitter-profile-pic.jpg" 
        "Chadtech"
        "Thanks! Ye I know what you mean. The problem is those speckles are about one pixel each, and I dont know how to make details smaller than that to be honest."
        "2 hours ago"
    , textarea
      [ style
        [ ("border", "2px solid #54474d")
        , ("width", "501px")
        , ("height", "100px")
        , ("outline", "none")
        , ("background-color", "030907")
        , ("font-family", "HFNSS")
        , ("color", "#b0a69a")
        , ("font-size", "2em")
        , ("-webkit-font-smoothing", "none")
        ]
      , placeholder "type your comment here.."
      ]
      []
    , input
      [ class "new-drawing"
      , type' "submit"
      , value "comment"
      , style 
        [ ("width", "501px") 
        , ("margin-top", "9px")
        ]
      ]
      []
    ]
  ]

comment : String -> String -> String -> String -> Html Msg
comment imagesrc name content time =
  div
  [ class "image-comment" ]
  [ div
    [ class "image-header" ]
    [ div
      [ class "image-comment-pic-container" ]
      [ img
        [ class "image-comment-pic" 
        , src imagesrc
        ]
        []
      ]
    , div
      [ class "image-header-body" ] 
      [ p
        [ class "text important" ]
        [ text name ]
      , p
        [ class "text small" ]
        [ text time ]
      ]
    ]
  , div
    [ class "image-comment-body" ]
    [ p
      [ class "text small" ]
      [ text content ]
    ]
  ]


thread : String -> String -> Html Msg
thread title details =
  div
  [ class "thread-item" ]
  [ p [ class "text important" ] [ text title ] 
  , p [ class "text small" ] [ text details ] 
  ]

project : String -> String -> String -> String -> String -> String -> Html Msg
project imagesrc title drawings lastUpdate threads details =
  div
  [ class "project-item" ]
  [ img 
    [ src imagesrc 
    , class "project-image"
    ] 
    [] 
  , div
    [ style 
      [ ("border-right", "2px #807872 solid") 
      , ("width", "0px")
      , ("height", "100%")
      , ("position", "absolute")
      , ("top", "0px")
      , ("left", "100px")
      ] 
    ]
    []
  , div
    [ class "project-body" ]
    [ p [ class "text important" ] [ text title ] 
    , p [ class "text small project-text" ] [ text drawings ]
    , p [ class "text small project-text" ] [ text lastUpdate ]
    , p [ class "text small project-text" ] [ text threads ]
    ]
  , div
    [ class "project-details" ]
    [ p [ class "text small"] [ text details ] ]
  ]



drawingSearchBar : Html Msg
drawingSearchBar =
  div
  [ class "card drawing-search-bar" 
  , size "641px" "29px"
  ]
  [ input [ class "new-drawing", type' "submit", value "new drawing" ] []
  , input [ class "drawing-search", placeholder "search drawings" ] [ ] 
  ]


searchBar : Html Msg
searchBar =
  input 
  [ class "main-search"
  , placeholder "search CtPaint"
  ]
  []


size : String -> String -> Attribute Msg
size w h =
  style [ ("width", w), ("height", h) ]