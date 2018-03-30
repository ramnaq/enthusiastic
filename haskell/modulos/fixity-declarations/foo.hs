module Foo where

import qualified Bar
infix 3 `op`

a `op` b = (a `Bar.op` b) + 1
f x = let p `op` 1 = (p `Foo.op` q) * 2
...
