Rectangle = require("./elements/Rectangle")
DataCircle = require('./data/circles')

class App extends PIXI.Application
  animation: true
  animationNodes: []
  columns: 12
  rows: 12
  width: window.innerWidth
  height: window.innerHeight
  PosX: 0
  PosY: 0
  constructor: (w, h, o) ->
    super(w, h, o)
    document.body.appendChild @view
    @build()
    @animate()

  build: =>
    MyWidth = @width / @columns
    MyHeight = @height / @rows
    for r in [1..@rows]
      for c in [1..@columns]
        a = new Rectangle(@PosX, @PosY, MyWidth, MyHeight, 0xFFA200)
        @PosY = MyHeight + @PosY
        @addAnimationNodes a
        @stage.addChild (a)
        # console.log r,c, @PosX
      @PosX = MyWidth + @PosX
      @PosY = 0

  addAnimationNodes: (child) =>
    @animationNodes.push child
    null

  animate: =>
    @ticker.add () =>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App