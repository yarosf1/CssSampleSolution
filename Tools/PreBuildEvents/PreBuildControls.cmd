set ProjectDir=%~1

copy "%ProjectDir%Stylesheets\*.less" %ProjectDir%CombinedStylesheets\common-controls.less

call "%ProjectDir%..\Tools\lessc\lessc.cmd" %ProjectDir%CombinedStylesheets\common-controls.less %ProjectDir%CombinedStylesheets\common-controls.css
