function aseprite {
    $steamPath = "~/Library/Application Support/Steam/steamapps/common/Aseprite/Aseprite.app/Contents/MacOS/aseprite"
    $normalPath = "/Applications/Aseprite.app/Contents/MacOS/aseprite"
    if ($IsWindows) {
        $steamPath = "C:\Program Files (x86)\Steam\steamapps\common\Aseprite\Aseprite.exe"
        $normalPath = "C:\Program Files (x86)\Aseprite\Aseprite.exe"
    }

    if (Test-Path $steamPath) {
        . $steamPath $args
    } elseif (Test-Path $normalPath) {
        . $normalPath $args
    } else {
        throw "Please install aseprite before using the aseprite command"
    }

}