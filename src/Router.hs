module Router where

import Control.Monad.Except (MonadError (..))
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Reader (ask, asks)
import Env
import Lens.Micro ((&), (.~), (^.))
import Lens.Micro.Extras (view)
import Servant.API
import Servant.Auth.Server
import Servant.HTML.Lucid
import Servant.Server
import Servant.Server.StaticFiles (serveDirectoryFileServer)