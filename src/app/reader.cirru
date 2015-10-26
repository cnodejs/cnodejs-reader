
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  controller $ require :../controller

var
  Space $ React.createFactory $ require :./space
  Button $ React.createFactory $ require :./button
  TopicList $ React.createFactory $ require :./topic-list
  TopicPost $ React.createFactory $ require :./topic-post
  UserDetail $ React.createFactory $ require :./user-detail
  TopicDetail $ React.createFactory $ require :./topic-detail
  AppWireframe $ React.createFactory $ require :./app-wireframe
  TopicWireframe $ React.createFactory $ require :./topic-wireframe

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-reader

  :propTypes $ {}
    :store $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :getInitialState $ \ ()
    {}
      :token :

  :onTokenChange $ \ (event)
    @setState $ {} (:token event.target.value)

  :onLogin $ \ ()
    controller.userAccesstoken @state.token

  :onPost $ \ ()
    controller.routerPost

  :onRefresh $ \ ()

  :render $ \ ()
    var
      store @props.store
      isLoading $ store.getIn $ [] :device :isLoading
      loadingKind $ store.getIn $ [] :device :loadingKind
      routerName $ store.getIn $ [] :router :name
      routerId $ store.getIn $ [] :router :data :id
      loginname $ store.getIn $ [] :router :data :loginname
      user $ store.getIn $ [] :device :loginname

    cond (and isLoading (is loadingKind :start))
      AppWireframe
      div ({} (:style $ @styleRoot))
        div ({} (:style $ @styleMain))
          div ({} (:style $ @styleList))
            cond (? user)
              div ({} (:style $ @styleToolbar))
                Button $ {} (:text :refresh) (:onClick @onRefresh)
                Space $ {} (:width 10)
                Button $ {} (:text :post) (:onClick @onPost)
              div ({} (:style $ @styleToolbar))
                input $ {}
                  :style $ @styleToken
                  :value @state.token
                  :onChange @onTokenChange
                  :placeholder ":put token here"
                Space $ {} (:width 10)
                Button $ {} (:text :login) (:onClick @onLogin)
            TopicList $ {} (:topics $ @props.store.get :topics)
          cond (and isLoading (is loadingKind :topic))
            TopicWireframe
            case routerName
              :topic $ TopicDetail $ {}
                :topic $ store.getIn $ [] :topicDetails routerId
                :isLogined $ ? user
              :user $ UserDetail $ {}
                :user $ store.getIn $ [] :users loginname
              :post $ TopicPost

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

  :styleList $ \ ()
    {}
      :height :100%
      :display :flex
      :flexDirection :column

  :styleToolbar $ \ ()
    {}
      :height :30px
      :display :flex
      :alignItems :center
      :padding ":0 10px"
      :justifyContent :flex-end

  :styleToken $ \ ()
    {}
      :border :none
      :outline :none
      :borderBottom $ + ":1px solid " (hsl 240 80 90)
      :lineHeight :24px
      :padding ":0 5px"
      :width 200
