
= exports.loading $ \ (store kind)
  ... store
    setIn ([] :device :isLoading) true
    setIn ([] :device :loadingKind) kind

= exports.loaded $ \ (store)
  ... store
    setIn ([] :device :isLoading) false
    setIn ([] :device :loadingKind) null
