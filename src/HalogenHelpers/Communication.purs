module HalogenHelpers.Communication where

-- Not sure if this is revisable with the latest Halogen release.
-- module HalogenHelpers.Communication ( passAlongTo
--                                     , getBackFrom
--                                     ) where

-- import Prelude

-- import Data.Foldable (class Foldable)
-- import Data.Foldable as F
-- import Data.Maybe (Maybe)
-- import Data.Traversable as T
-- import Halogen as H

-- passAlongTo :: forall l state action slots output m a. Eq slots =>
--                Foldable l =>
--                l slots ->
--                (H.Request action) ->
--                H.HalogenM state action slots output m Unit
-- passAlongTo slots query = do
--   let action slot = H.query slot $ H.request query
--   _ <- T.traverse_ action slots
--   pure unit

-- getBackFrom :: forall l s f g p o m a b.
--                Eq p =>
--                Foldable l =>
--                l p ->
--                (b -> Maybe a -> b) -> b ->
--                (H.Request g a) ->
--                H.HalogenM s f g p o m b
-- getBackFrom slots accumulator def query = do
--   let action acc slot = do
--         these <- H.query slot $ H.request query
--         pure $ accumulator acc these
--   F.foldM action def slots
