module Siteelm.Html.Ogp exposing
    ( prefix
    , description, image, locale, siteName, title, type_, url
    , twitterCard
    )

{-|

@docs prefix
@docs description, image, locale, siteName, title, type_, url
@docs twitterCard

-}

import Html exposing (Attribute, Html)
import Html.Attributes exposing (attribute, name)
import Siteelm.Html exposing (meta)
import Siteelm.Html.Attributes exposing (content)


prefix : String -> Attribute msg
prefix p =
    attribute "prefix" p


og : String -> String -> Html msg
og p c =
    meta
        [ attribute "property" ("og:" ++ p)
        , content c
        ]


description : String -> Html msg
description str =
    og "description" str


image : String -> Html msg
image str =
    og "image" str


locale : String -> Html msg
locale str =
    og "locale" str


siteName : String -> Html msg
siteName str =
    og "site_name" str


title : String -> Html msg
title str =
    og "title" str


type_ : String -> Html msg
type_ str =
    og "type" str


url : String -> Html msg
url str =
    og "url" str



-- TWITTER CARD


twitterCard : String -> Html msg
twitterCard str =
    meta [ name "twitter:card", content str ]
