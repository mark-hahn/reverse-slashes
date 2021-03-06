
module.exports =
  activate: ->
    @sub = atom.commands.add 'atom-text-editor', 'reverse-slashes:toggle': =>
      if (editor = atom.workspace.getActiveTextEditor())
        text = editor.getSelectedText()
        ranges = editor.getSelectedBufferRanges()
        editor.insertText(
          if (text.match(/\//)?.length ? 0) > (text.match(/\\/)?.length ? 0)
            text.replace /\//g, '\\'
          else
            text.replace /\\/g, '/'
        )
        editor.setSelectedBufferRanges ranges
        
  deactivate: ->
    @sub.dispose()
        