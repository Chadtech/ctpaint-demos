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
      [ text "CtPaint Home"]
    , searchBar
    ]
  , profile
  , div
    [ class "storage-view" ]
    [ drawingSearchBar
    , drawingContainer
    ]
  , feed
  ]

feed : Html Msg
feed = 
  div
  [ class "card feed"
  , size "250px" "100%"
  ]
  [ message 
      "./twitter-profile-pic.jpg"  
      [ text "You commented "
      , messageName "'wow cool'"
      , text " on "
      , span [ class "message-name-other" ] [ text "Henrys " ]
      , text "drawing"
      ] 
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'aye'"
      ]
  , message
      "./CIA.png" 
      [ span [ class "message-name-other" ] [text "CIA " ]
      , text "commented on "
      , span [ class "message-name-other" ] [ text "mosquito mans "]
      , text "drawing 'BANE?'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'the maske..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'He works ..'"
      ]
  , message
      "./japan.png"
      [ messageName "Japan "
      , text "made a new drawing called "
      , messageName "'tasty looking sushi'"
      ]
  , message
      "./phoenix.png"
      [ messageName "Cryptoparty Phoenix "
      , text "made a new drawing called "
      , messageName "'logo-0'"
      ]
  , message 
      "./twitter-profile-pic.jpg"  
      [ text "You worked on "
      , span [ class "message-name-other" ] [ text "'Planet'" ]
      ] 
  , message 
      "./twitter-profile-pic.jpg"  
      [ text "You worked on "
      , span [ class "message-name-other" ] [ text "'Doge'" ]
      ] 
  , message 
      "./poke-profile-pic.png"  
      [ messageName "Forretress "
      , text "worked on "
      , span [ class "message-name-other" ] [ text "'robots'" ]
      ] 
  , message 
      "./poke-profile-pic.png"  
      [ messageName "Forretress "
      , text "cloned "
      , span [ class "message-name-other" ] [ text "'robots'" ]
      , text " from you"
      ] 
  , message 
      "./poke-profile-pic.png"  
      [ messageName "Forretress "
      , text "made a new drawing called "
      , messageName "'scary-fire-type-p..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'aye'"
      ]
  , message
      "./CIA.png" 
      [ span [ class "message-name-other" ] [text "CIA " ]
      , text "commented on "
      , span [ class "message-name-other" ] [ text "mosquito mans "]
      , text "drawing 'BANE?'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'the maske..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'He works ..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'aye'"
      ]
  , message
      "./CIA.png" 
      [ span [ class "message-name-other" ] [text "CIA " ]
      , text "commented on "
      , span [ class "message-name-other" ] [ text "mosquito mans "]
      , text "drawing 'BANE?'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'the maske..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'He works ..'"
      ]
  , message
      "./japan.png"
      [ messageName "Japan "
      , text "made a new drawing called "
      , messageName "'tasty looking sushi'"
      ]
  , message
      "./phoenix.png"
      [ messageName "Cryptoparty Phoenix "
      , text "made a new drawing called "
      , messageName "'logo-0'"
      ]
  , message 
      "./twitter-profile-pic.jpg"  
      [ text "You worked on "
      , span [ class "message-name-other" ] [ text "'Planet'" ]
      ] 
  , message 
      "./twitter-profile-pic.jpg"  
      [ text "You worked on "
      , span [ class "message-name-other" ] [ text "'Doge'" ]
      ] 
  , message 
      "./poke-profile-pic.png"  
      [ messageName "Forretress "
      , text "worked on "
      , span [ class "message-name-other" ] [ text "'robots'" ]
      ] 
  , message 
      "./poke-profile-pic.png"  
      [ messageName "Forretress "
      , text "cloned "
      , span [ class "message-name-other" ] [ text "'robots'" ]
      , text " from you"
      ] 
  , message 
      "./poke-profile-pic.png"  
      [ messageName "Forretress "
      , text "made a new drawing called "
      , messageName "'scary-fire-type-p..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'aye'"
      ]
  , message
      "./CIA.png" 
      [ span [ class "message-name-other" ] [text "CIA " ]
      , text "commented on "
      , span [ class "message-name-other" ] [ text "mosquito mans "]
      , text "drawing 'BANE?'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'the maske..'"
      ]
  , message
      "./aye.jpg"
      [ span [ class "message-name-other" ] [text "mosquito man " ]
      , text "commented on his "
      , span [ class "message-name-other" ] [ text " own drawing " ]
      , text " 'He works ..'"
      ]
  ]

messageName : String -> Html Msg
messageName str =
  span [ class "message-name-other" ] [ text str ]


message : String -> List (Html Msg) -> Html Msg
message source content =
  div
  [ class "card message-container" ]
  [ div
    [ class "message-profile-pic-container" ]
    [ img [ class "message-profile-pic", src source ] [] ]
  , div 
    [ class "message-text-container" ]
    [ p [ class "text small" ] content ]
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

drawingContainer : Html Msg
drawingContainer =
  div
  [ class "card drawing-container" 
  , size "641px" "100%"
  ]
  [ drawing "Planet" "Yesterday" "./planet.png" ""
  , drawing "other-ship" "3 days ago" "./other-ship.png" ""
  , drawing "ship-exploded" "5 days ago" "./ship-exploded.png" ""
  , drawing "ship-1" "5 days ago" "./ship-1.png" " end"
  , drawing "key-diagram" "1 week ago" "./key-diagram.png" ""
  , drawing "ship-0" "1 week ago" "./ship.png" ""
  , drawing "fuel-tank" "2 weeks ago" "./fuel-tank.png" ""
  , drawing "doge" "1 month ago" "./doge.png" " end"
  , drawing "fuzzy-planet" "1 month ago" "./fuzzy-planet.png" ""
  , drawing "jasper-b-day" "3 months ago" "./jasper.png" ""
  , drawing "robots" "4 months ago" "./robot-0.png" ""
  , drawing "magnamite" "6 months ago" "./magnamite_0.png" " end"
  , drawing "drill" "1 year ago" "./drill.png" ""
  , drawing "safety-glasses" "1 year ago" "./safety-glasses.png" ""
  , drawing "knives" "1 year ago" "./knives.png" ""
  , drawing "cable" "1 year ago" "./cable.png" " end"
  , drawing "cryptopartyTokyo" "1 year ago" "./cryptopartyTokyo.png" ""
  , drawing "soviet-lander" "1 year ago" "./moonlander_0.png" ""
  , drawing "AT&T long lines" "1 year ago" "./hackphx5.png" ""
  , drawing "pikachus" "1 year ago" "./pikachus.png" " end"
  ]

searchBar : Html Msg
searchBar =
  input 
  [ class "main-search"
  , placeholder "search CtPaint"
  ]
  []


drawing : String -> String -> String -> String -> Html Msg
drawing title date source extra =
  let
    titleClass =
      if String.length title > 11 then
        " small"
      else ""
  in
  div
  [ class ("card drawing" ++ extra)
  , size "150px" "150px"
  ]
  [ div 
    [ class "drawing-image-container" ]
    [ img [ class "drawing-image", src source ] [] 
    , div
      [ class "drawing-text-container" ]
      [ p
        [ class ("text" ++ titleClass )]
        [ text title ]
      , p
        [ class "text ignorable small" ]
        [ text date ]
      ]
    ]
  ]


profile : Html Msg
profile =
  div
  [ class "card profile"
  , size "250px" "100%"
  ]
  [ div
    [ class "cover-photo-container"]
    [ img 
      [ src "./planet.png"
      , style [ ("margin-left", "1em"), ("margin-top", "-22px")]
      ]
      []
    ]
  , img 
    [ class "profile-pic" 
    , src "./twitter-profile-pic.jpg"
    ]
    []
  , p 
    [ class "text name" ]
    [ text "Chadtech" ]
  , p 
    [ class "text veryIgnorable small" ] 
    [ text "dankMemer420"]
  , br [] []
  , p [ class "text small ignorable" ] [ text "groups" ]
  , group "https://avatars1.githubusercontent.com/u/2939686?v=3&s=460" "Chadtech"
  , group "https://s3-us-west-2.amazonaws.com/slack-files2/avatars/2015-10-21/12928747781_7682a42f709fcd66cc08_88.jpg" "Pixelation"
  , group "https://s3-us-west-2.amazonaws.com/slack-files2/avatars/2015-10-16/12616560499_67fd7e70e8af5bd3f43c_88.jpg" "Elm lang"
  , group "https://lh6.googleusercontent.com/-TLZWVhAOXq8/AAAAAAAAAAI/AAAAAAAAKAc/GODEbQ44RGg/s0-c-k-no-ns/photo.jpg" "Local Motors"
  , group "https://avatars2.githubusercontent.com/u/1425305?v=3&s=84" "HeatSync Labs"
  , div 
    [ style [ ("height", "17px"), ("margin-top", "5px"), ("margin-left", "19px")] ]
    [ p 
      [ class "text group small" ]
      [ text "more groups.."]
    ]
  , br [] []
  , p [ class "text small ignorable" ] [ text "year of drawings" ]
  , img [ src "./calendar.png", style [("margin-top", "2px"), ("margin-left", "9px")] ] []
  , p [ class "text" ] [ text " " ]
  , br [] []
  , p [ class "text" ] [ text " " ]
  , input [ class "settings", type' "submit", value "edit profile" ] []
  , input [ class "settings", type' "submit", value "settings"] []
  ]

group : String -> String -> Html Msg
group imgSrc str =
  div
  [ style [ ("height", "21px"), ("margin-top", "0px")] ]
  [ img 
    [ class "group-pic", src imgSrc ] 
    []
  , p [ class "text group" ] [ text str ]
  ]

size : String -> String -> Attribute Msg
size w h =
  style [ ("width", w), ("height", h) ]