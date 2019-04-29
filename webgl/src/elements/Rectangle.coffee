class Rectangle extends PIXI.Graphics
    over: false
    flip: false
    interactive: true
    doit: false

    constructor: (x, y, w, h, c) ->
        super()
        @positionX = x
        @positionY = y
        @Width = w
        @Height = h
        @color = c
        @on 'mouseover', @onMouseOver
        @on 'mouseout', @onMouseOut
        @draw()

    draw: ->
        @lineStyle(2, 0xFF0000, 1)
        @beginFill(@color)
        @drawRect(@positionX, @positionY, @Width, @Height)
        @endFill()

    onMouseOver: (e) =>
        @over = true
        @flip = true
        @doit = true
        console.log 'pasa'
        # console.log @over
        # console.log @flip
        # console.log @doit
    
    onMouseOut: (e) =>
        @over = false
        console.log 'se quita'
        # console.log @over
        # console.log @flip
        # console.log @doit

    animate: ->
        return if @doit
            if @flip is true
                @.scale.x -= 0.5
                # @.position.x += @Width/2
            if @.scale.x <= 0.1
                @flip = false
            if @flip is false
                @.scale.x += 0.1
                # @.position.x -= @Width/2
            if @.scale.x >= 1
                @.scale.x = 1
                @.x = @positionX
                @.y = @positionY

module.exports = Rectangle