module B where

import Prelude

import Effect (Effect)
import Effect.Console (log)

logB :: Effect Unit
logB = do
  log "B"
