module Main where

import           Protolude

import qualified Data.Text as T

import qualified Graphics.UI.Webviewhs as WHS

import           System.Clock
import           System.Directory


htmlGUI :: IO ()
htmlGUI = void $ do
  dir <- getCurrentDirectory
  eitherWindow <- WHS.createWindow (windowParams dir) windowCallback
  case eitherWindow of
    Left  _      -> pure ()
    Right window -> do
      windowPreLoop window
      windowLoop window
      windowPosLoop window
      WHS.terminateWindowLoop window
      WHS.destroyWindow window
  where
    windowLoop :: WHS.Window a -> IO ()
    windowLoop window = do
      timeIni <- getTime Monotonic
      shouldContinue  <- WHS.iterateWindowLoop window False
      timeEnd <- getTime Monotonic
      let target = 8333333 -- nanosecs for 120 fps
          elapsed = toNanoSecs (timeEnd - timeIni)
          remain = div 1000 (target - fromIntegral elapsed) -- millisecs
      when shouldContinue $ do
        threadDelay remain
        windowLoop window
    windowParams dir = WHS.WindowParams
      { WHS.windowParamsTitle = "haskell-gui-webviewhs"
      , WHS.windowParamsUri = T.pack $ "file://" ++ dir ++ "/src/Main.html"
      , WHS.windowParamsWidth = 600
      , WHS.windowParamsHeight = 400
      , WHS.windowParamsResizable = True
      , WHS.windowParamsDebuggable = True
      }
    windowPreLoop window = putText "Opening GUI"
    windowPosLoop window = putText "Closing GUI"
    windowCallback window msg = case msg of
      "click" -> do
        WHS.runJavaScript' window "increaseCount();"
        putText "button clicked!"
      _       -> pure ()

main :: IO ()
main = htmlGUI