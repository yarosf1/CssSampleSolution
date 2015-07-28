set ProjectDir=%~1

@REM Copy common controls stylesheet
COPY %ProjectDir%..\CommonControls\CombinedStylesheets\common-controls.css "%ProjectDir%Skins\common-controls.css" /Y

@REM Combine CDN LESS files and run preprocessor
copy "%ProjectDir%Skins\_cssparts\*.less" %ProjectDir%Skins\combined.less
call "%ProjectDir%..\Tools\lessc\lessc.cmd" %ProjectDir%Skins\combined.less %ProjectDir%Skins\combined.css

@REM Regenerate custom skins using their LESS templates
for /r "%ProjectDir%Skins\" %%i in (*.less) do (
    if "%%~nxi"=="skin.less" call "%ProjectDir%..\Tools\lessc\lessc.cmd" "%%~dpnxi" "%%~dpni.css"
)

