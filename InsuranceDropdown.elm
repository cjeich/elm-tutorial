module InsuranceDropdown where

import Html exposing(..)
import Html.Attributes exposing (..)

main : Html
main =
  div
      [ class "row"]
      [ div [ class "col-sm6" ]
          [select [ id "InsuranceProviderId"]
            [ option [ value "1"] [text "Carrier 1"],
              option [ value "2"] [text "Carrier 2"],
              option [ value "3"] [text "Carrier 3"],
              option [ value "4"] [text "Carrier 4"]
            ]
          ],
        div [ class "col-sm6" ]
          [select [ id "InsuranceCarrierId"]
            [ option [ value "1"] [text "Rep 1"],
              option [ value "2"] [text "Rep 2"],
              option [ value "3"] [text "Rep 3"],
              option [ value "4"] [text "Rep 4"]
            ]
          ]
      ]
