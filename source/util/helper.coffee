
exports.concat = (args...) ->
  list = []
  for arg in args
    list.push arg if arg?
  list.join(' ')