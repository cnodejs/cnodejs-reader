
var
  hsl $ require :hsl
  React $ require :react

var
  reset $ require :../util/reset

var
  ({}~ div) React.DOM

var
  now $ new Date
  thisYear $ now.getFullYear
  thisMonth $ now.getMonth
  thisDay $ now.getDate

= module.exports $ React.createClass $ {}
  :displayName :app-time

  :propTypes $ {}
    :time React.PropTypes.string.isRequired

  :getTime $ \ ()
    var
      thatTime $ new Date @props.time
      current $ new Date
      thatYear $ thatTime.getFullYear
      thatMonth $ thatTime.getMonth
      thatDay $ thatTime.getDate
      thatHour $ thatTime.getHours
      thatMin $ thatTime.getMinutes
      currentHour $ current.getHours
      currentMin $ current.getMinutes

    if (isnt thatYear thisYear) $ do $ return
      + thatYear :/ thatMonth :/ thatDay
    if (isnt thatMonth thisMonth) $ do $ return
      + thisMonth :/ thatDay
    if (isnt thatDay thisDay) $ do $ return
      + : (- thisDay thatDay) ": " :days
    if (isnt thatHour currentHour) $ do $ return
      + thatHour :: thatMin
    if (isnt thatMin currentMin) $ do $ return
      + thatHour :: thatMin
    , :now

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      @getTime

  :styleRoot $ \ ()
    {}
      :backgroundColor $ hsl 0 80 80
      :color $ hsl 0 0 100
      :fontFamily reset.fashionFonts
      :padding ":0 10px"
      :lineHeight :20px
      :height :20px
      :fontSize :12px
