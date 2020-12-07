module Siteelm.Html.Ogp exposing
    ( prefix
    , description, image, locale, siteName, title, type_, url
    , twitterCard, twitterDescription, twitterSite, twitterImage, twitterTitle
    )

{-|

@docs prefix
@docs description, image, locale, siteName, title, type_, url
@docs twitterCard, twitterDescription, twitterSite, twitterImage, twitterTitle

-}

import Html exposing (Attribute, Html)
import Html.Attributes exposing (attribute, name)
import Siteelm.Html exposing (meta)
import Siteelm.Html.Attributes as Attributes


prefix : String -> Attribute msg
prefix p =
    attribute "prefix" p


og : String -> String -> Html msg
og p c =
    meta
        [ attribute "property" ("og:" ++ p)
        , Attributes.content c
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


twitter : String -> String -> Html msg
twitter n c =
    meta
        [ name ("twitter:" ++ n)
        , Attributes.content c
        ]


twitterCard : String -> Html msg
twitterCard str =
    twitter "card" str


twitterDescription : String -> Html msg
twitterDescription str =
    twitter "description" str


twitterImage : String -> Html msg
twitterImage str =
    twitter "image" str


twitterSite : String -> Html msg
twitterSite str =
    twitter "site" str


twitterTitle : String -> Html msg
twitterTitle str =
    twitter "title" str
