--- Strict and Lazy Bytestrings
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

-- *Main> B.pack [99,97,110]
-- "can"
-- *Main> B.pack [98..120]
-- "bcdefghijklmnopqrstuvwx"
-- *Main> B.pack [336]
-- "P"

-- *Main> let by = B.pack [98,111,114,116]
-- *Main> by
-- "bort"
-- *Main> B.unpack by
-- [98,111,114,116]

-- *Main> :t B.toChunks
-- B.toChunks :: B.ByteString -> [S.ByteString]
-- *Main> :t B.fromChunks
-- B.fromChunks :: [S.ByteString] -> B.ByteString

-- *Main> B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]
-- "()*+,-./0"

-- *Main> B.cons 85 $ B.pack [80,81,82,84]
-- "UPQRT"

-- *Main> :t B.readFile
-- B.readFile :: FilePath -> IO B.ByteString
-- *Main> :t S.readFile
-- S.readFile :: FilePath -> IO S.ByteString

--- Copying Files with Bytestrings

-- to be continued
