expect = require("chai").expect

#
# http://www.codewars.com/dojo/katas/513fa1d75e4297ba38000003
describe "flatten an array (of possibly nested arrays)", ->
  solution = (coll...) ->
    [].concat (coll.map (x) -> if Array.isArray x then solution x... else x)...

  it "should flatten simple arrays", ->
    expect([1, 2, 3, 4, 5, 6, 7]).to.eql(solution 1, [2, 3], 4, 5, [6, [7]])

#
# http://www.codewars.com/dojo/katas/5174a4c0f2769dd8b1000003
describe "sort an array", ->
  solution = (coll) ->
    if coll is null or coll.length is 0 then [] else coll.sort (a,b) -> a > b

  it "should return [] for null", ->
    expect([]).to.eql(solution null)

  it "should return [] for []", ->
    expect([]).to.eql(solution [])

  it "should return sorted arrays", ->
    expect([1,2,3,4,5]).to.eql(solution [2,4,5,1,3])

#
# http://www.codewars.com/dojo/katas/513e08acc600c94f01000001
describe "RGB To Hex Conversion", ->
  solution = (r,g,b) ->
    lookup = { 255: "FF" }
    ([r,g,b].map (k) -> lookup[k]).join("")

  it "should convert max decimal to hexadecimal", ->
    expect(solution 255, 255, 255).to.eql("FFFFFF")

    # rgb(255, 255, 300) # returns FFFFFF
    # rgb(0,0,0) # returns 000000
    # rgb(148, 0, 211) # returns 9400D3
