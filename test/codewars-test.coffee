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
# Useful information available: http://www.statman.info/conversions/hexadecimal.html
describe "RGB To Hex Conversion", ->
  solution = (r,g,b) ->
    hex_value = "0123456789ABCDEF"
    [r,g,b]
      .map((n) -> Math.min 255, Math.max(0, n))
      .map((n) -> hex_value[Math.floor(n/16)] + hex_value[n%16])
      .join("")

  it "should convert max decimal to hexadecimal", ->
    expect(solution 255, 255, 255).to.eql("FFFFFF")

  it "should convert min decimal to hexadecimal", ->
    expect(solution 0,0,0).to.eql("000000")

  it "should round down numbers > max = 255", ->
    expect(solution 255, 255, 300).to.eq("FFFFFF")

  it "should round up numbers < min = 0", ->
    expect(solution 0,0,-20).to.eql("000000")

  it "should convert all valid decimal to hexadecimal numbers", ->
    expect(solution 148, 0, 211).to.eql("9400D3")

#
# http://www.codewars.com/dojo/katas/51e704f2d8dbace389000279
describe 'Arrays Similar', ->
  solution = (a, b) ->
    if a.length is b.length
      a = a.sort()
      b = b.sort()
      [ 0 .. a.length - 1 ].every((i) -> a[i] is b[i])
    else
      false

  describe 'for different sized arrays', ->
    it 'should always return false', ->
      expect(solution [], [1]).to.eql(false)

  describe 'for same sized arrays', ->
    it 'should be true for empty arrays', ->
      expect(solution [], []).to.eql(true)

    it 'should be false for single elment arrays with different elements', ->
      expect(solution [1], [2]).to.eql(false)

    it 'should be order independent', ->
      expect(solution [1,2], [2,1]).to.eql(true)
