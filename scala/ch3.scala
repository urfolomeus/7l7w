val movies = 
<movies>
	<movie genre="action">Pirates of the Carribean</movie>
	<movie genre="fairytale">Edward Scissorhands</movie>
</movies>

println(movies)
println(movies.text)

val movieNodes = movies \ "movie"

println(movieNodes)
println(movieNodes(0))
println(movieNodes(0) \ "@genre")

def doChore(chore:String): String = chore match {
	case "clean dishes" => "scrub, dry"
	case "cook dinner" => "chop, sizzle"
	case _ => "whine, complain"
}

println(doChore("clean dishes"))
println(doChore("mow lawn"))

def factorial(n:Int): Int = n match {
	case 0 => 1
	case x if x > 0 => factorial(n - 1) * n
}

println(factorial(3))
println(factorial(0))

val newMovies =
<movies>
	<movie>The Incredibles</movie>
	<movie>WALL E</movie>
	<short>Jack Jack Attack</short>
	<short>Geri's Game</short>
</movies>
(newMovies \ "_").foreach { movie =>
	movie match {
		case <movie>{movieName}</movie> => println(movieName)
		case <short>{shortName}</short> => println(shortName + " (short)")
	}
}
