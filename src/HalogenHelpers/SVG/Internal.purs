module HalogenHelpers.SVG.Internal where

import Data.Int (toNumber)
import Halogen.HTML (Namespace(..))
import Prelude (identity)

class Numeric a where
  toNumeric :: a -> Number

instance numericNum :: Numeric Number where
  toNumeric = identity

instance numericInt :: Numeric Int where
  toNumeric = toNumber

svgns :: String
svgns = "http://www.w3.org/2000/svg"

svgNamespace :: Namespace
svgNamespace = Namespace svgns
