Vector = require('@datatypes/vector')

class Point
	constructor: (@x = 0, @y = 0, @z = 0) ->
		return @

	@fromObject: (object) ->
		return new Point(
			object.x,
			object.y,
			object.z
		)

	@fromArray: (array) ->
		return new Point(
			array[0],
			array[1],
			array[2]
		)

	toObject: (array) ->
		return {
			x: @x
			y: @y
			z: @z
		}

	subtract: (point) ->
		return new Vector(
			@x - point.x,
			@y - point.y,
			@z - point.z
		)

	euclideanDistanceTo: (point) ->
		return @subtract(point).length()


module.exports = Point
