runTest = require('ava')
Vector = require('@datatypes/vector')
Point = require('../index')


runTest 'Instantiates a point at the origin if no arguments are given',
	(test) ->
		point = new Point()
		test.same(point.toObject(), {x: 0, y: 0, z: 0})


runTest 'Instantiates a point from x, y & z arguments', (test) ->
	point = new Point(1, 2, 3)
	test.same(point.toObject(), {x: 1, y: 2, z: 3})


runTest 'Instantiates a point from an object', (test) ->
	point = Point.fromObject({x: 1, y: 2, z: 3})
	test.same(point.toObject(), {x: 1, y: 2, z: 3})


runTest 'Instantiates a point from an array', (test) ->
	point = Point.fromArray([1, 2, 3])
	test.same(point.toObject(), {x: 1, y: 2, z: 3})


runTest 'Outputs JSON', (test) ->
	point = new Point(1, 2, 3)
	test.same(JSON.stringify(point), '{"x":1,"y":2,"z":3}')


runTest 'Subtracts a point', (test) ->
	pointA = new Point(4, 2, 0)
	pointB = new Point(3, 5, 7)
	vector = pointA.subtract(pointB)
	expectedVector = new Vector(1, -3, -7)
	test.same(vector, expectedVector)


runTest 'Returns the euclidian distance to a point', (test) ->
	pointA = new Point(4, 2, 0)
	pointB = new Point(3, 5, 7)
	expectedDistance = 7.681145747868608
	test.same(pointA.euclideanDistanceTo(pointB), expectedDistance)
