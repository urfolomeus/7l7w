/**
 * 1x check scoring lines to see if there is a winner
 * 2x if so declare winner
 * 2. if not and all scoring squares full declare draw
 * 4. if not and still scoring squares left game open
 */

class Game(val board: List[Char]) {
  val scoringLines = List(
    List[Integer](0,1,2),
    List[Integer](3,4,5),
    List[Integer](6,7,8),
    List[Integer](0,3,6),
    List[Integer](1,4,7),
    List[Integer](2,5,8),
    List[Integer](0,4,8),
    List[Integer](2,4,6)
  )

  def scoreBoard() {
    val winner = findWinner()
    if ('_' != winner) {
      println("Player " + winner + " has won the game!")
    } else if (gameOver()) {
      println("Game is a draw.")
    } else {
      println("Game on!")
    }
  }

  def findWinner():Char = {
    var result = '_'
    scoringLines.foreach { line =>
      var tic = board( line(0) )
      var tac = board( line(1) )
      var toe = board( line(2) )
      if ( (tic != '_') && (tic == tac) && (tac == toe) ) {
        result = tic
      }
    }
    result
  }

  def gameOver():Boolean = {
    scoringLines.foreach { line =>
      var tic = board( line(0) )
      var tac = board( line(1) )
      var toe = board( line(2) )
      if ( (tic == '_') || (tac == '_') || (toe == '_') ) {
        return false
      }
    }
    true
  }
}

val emptyBoard = List[Char](
  '_', '_', '_',
  '_', '_', '_',
  '_', '_', '_'
)

val drawingBoard = List[Char](
  'x', 'o', 'o',
  'o', 'x', 'x',
  'x', 'o', 'o'
)

val xWinningBoard = List[Char](
  'x', '_', '_',
  'x', '_', '_',
  'x', '_', '_'
)

val oWinningBoard = List[Char](
  'o', '_', '_',
  'o', '_', '_',
  'o', '_', '_'
)

var g = new Game(emptyBoard)
/*g.printScoringLines()*/
g.scoreBoard()

g = new Game(drawingBoard)
/*g.printScoringLines()*/
g.scoreBoard()

g = new Game(xWinningBoard)
/*g.printScoringLines()*/
g.scoreBoard()

g = new Game(oWinningBoard)
/*g.printScoringLines()*/
g.scoreBoard()

