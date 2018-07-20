module HalogenHelpers.SVG ( svg
                          , text
                          , circle
                          , rect
                          , line
                          , arc
                          , circlePath
                          , width
                          , strokeWidth
                          , height
                          , opacity
                          , viewBox
                          , x
                          , y
                          , cx
                          , cy
                          , r
                          , x1
                          , y1
                          , x2
                          , y2
                          , stroke
                          , fill
                          , class_
                          , toInt
                          , class Numeric
                          ) where

import Data.Array as A
import Data.Int (round)
import Halogen.HTML (AttrName(..), ElemName(..), HTML, Namespace(..))
import Halogen.HTML.Elements (elementNS)
import Halogen.HTML.Properties (IProp, attr)
import Prelude (show, (<<<), identity, class Show)

class Numeric a where
  toInt :: a -> Int

instance numericNum :: Numeric Number where
  toInt n = round n

instance numericInt :: Numeric Int where
  toInt = identity

svgns :: String
svgns = "http://www.w3.org/2000/svg"

svgNamespace :: Namespace
svgNamespace = Namespace svgns

svgElement :: forall r p i. ElemName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i
svgElement = elementNS svgNamespace

svg :: forall r p i. Array (IProp r i) -> Array (HTML p i) -> HTML p i
svg = svgElement (ElemName "svg")

text :: forall r p i. Array (IProp r i) -> Array (HTML p i) -> HTML p i
text = svgElement (ElemName "text")

circle :: forall r p i. Array (IProp r i) -> HTML p i
circle props = svgElement (ElemName "circle") props []

rect :: forall r p i. Array (IProp r i) -> HTML p i
rect props = svgElement (ElemName "rect") props []

line :: forall r p i. Array (IProp r i) -> HTML p i
line props = svgElement (ElemName "line") props []

arc :: forall r p i. Array (IProp r i) -> HTML p i
arc props = svgElement (ElemName "path") props []

circlePath :: forall r i.
              Number -> Number ->
              Number ->
              Number -> Number -> IProp (circlePath :: String | r) i
circlePath fromx fromy radius tox toy =
  let
    path = A.intercalate " " [ "M"
                             , show fromx
                             , show fromy
                             , "A"
                             , show radius
                             , show radius
                             , "0"
                             , "1"
                             , "1"
                             , show tox
                             , show toy
                             ]
  in
   attr (AttrName "d") path

width :: forall a r i. Numeric a => Show a => a -> IProp (width :: a | r) i
width = attr (AttrName "width") <<< show

strokeWidth :: forall a r i. Numeric a => Show a => a -> IProp (strokeWidth :: a | r) i
strokeWidth = attr (AttrName "stroke-width") <<< show

opacity :: forall a r i. Numeric a => Show a => a -> IProp (opacity :: a | r) i
opacity = attr (AttrName "opacity") <<< show

height :: forall a r i. Numeric a => Show a => a -> IProp (height :: a | r) i
height = attr (AttrName "height") <<< show

viewBox :: forall r i. String -> IProp (viewBox :: String | r) i
viewBox = attr (AttrName "viewBox")

x :: forall a r i. Numeric a => Show a => a -> IProp (x :: a | r) i
x = attr (AttrName "x") <<< show

y :: forall a r i. Numeric a => Show a => a -> IProp (y :: a | r) i
y = attr (AttrName "y") <<< show

cx :: forall a r i. Numeric a => Show a => a -> IProp (cx :: a | r) i
cx = attr (AttrName "cx") <<< show

cy :: forall a r i. Numeric a => Show a => a -> IProp (cy :: a | r) i
cy = attr (AttrName "cy") <<< show

r :: forall rty i. Int -> IProp (r :: Int | rty) i
r = attr (AttrName "r") <<< show

x1 :: forall a r i. Numeric a => Show a => a -> IProp (x1 :: a | r) i
x1 = attr (AttrName "x1") <<< show

y1 :: forall a r i. Numeric a => Show a => a -> IProp (y1 :: a | r) i
y1 = attr (AttrName "y1") <<< show

x2 :: forall a r i. Numeric a => Show a => a -> IProp (x2 :: a | r) i
x2 = attr (AttrName "x2") <<< show

y2 :: forall a r i. Numeric a => Show a => a -> IProp (y2 :: a | r) i
y2 = attr (AttrName "y2") <<< show

stroke :: forall r i. String -> IProp (stroke :: String | r) i
stroke = attr (AttrName "stroke")

fill :: forall r i. String -> IProp (fill :: String | r) i
fill = attr (AttrName "fill")

class_ :: forall r i. String -> IProp (class_ :: String | r) i
class_ = attr (AttrName "class")
