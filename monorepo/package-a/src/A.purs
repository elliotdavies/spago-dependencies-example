module A where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import B (logB)

logA :: Effect Unit
logA = do
  log "A"
  logB
