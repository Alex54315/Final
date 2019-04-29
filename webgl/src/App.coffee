Rectangle = require("./elements/Rectangle")
DataCircle = require('./data/circles')

class App extends PIXI.Application
  animation: true
  animationNodes: []
  columns: 12
  rows: 12
  width: window.innerWidth
  height: window.innerHeight
  constructor: (w, h, o) ->
    super(w, h, o)
    document.body.appendChild @view
    @build()
    @animate()

  build: =>
    MyWidth = @width / @columns
    MyHeight = @height / @rows
    @PosX = 0
    for r in [0..@rows]
      r = new Rectangle(@PosX, @PosY, MyWidth, MyHeight, 0xFFA200)
      @PosX = MyWidth + @PosX
      @PosY = 0
      @addAnimationNodes r
      @stage.addChild (r)
      for c in [0..@columns]
        c = new Rectangle(@PosX, @PosY, MyWidth, MyHeight, 0xFFA200)
        @PosY = MyHeight + @PosY
        @addAnimationNodes c
        @stage.addChild (c)


  addAnimationNodes: (child) =>
    @animationNodes.push child
    null

  animate: =>
    @ticker.add () =>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App