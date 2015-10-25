
var
  React $ require :react
  Immutable $ require :immutable

var
  TopicList $ React.createFactory $ require :./topic-list
  TopicDetail $ React.createFactory $ require :./topic-detail
  AppWireframe $ React.createFactory $ require :./app-wireframe
  TopicWireframe $ React.createFactory $ require :./topic-wireframe

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-reader

  :propTypes $ {}
    :store $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    var
      store @props.store
      isLoading $ store.getIn $ [] :device :isLoading
      loadingKind $ store.getIn $ [] :device :loadingKind
      routerName $ store.getIn $ [] :router :name
      routerId $ store.getIn $ [] :router :data :id

    cond (and isLoading (is loadingKind :start))
      AppWireframe
      div ({} (:style $ @styleRoot))
        div ({} (:style $ @styleMain))
          TopicList $ {} (:topics $ @props.store.get :topics)
          cond (and isLoading (is loadingKind :topic))
            TopicWireframe
            cond (is routerName :topic)
              TopicDetail $ {}
                :topic $ store.getIn $ [] :topicDetails routerId

  :styleRoot $ \ ()
    {}
      :position :absolute
      :width :100%
      :height :100%
      :overflowX :auto

  :styleMain $ \ ()
    {}
      :width :2200px
      :display :flex
      :height :100%
