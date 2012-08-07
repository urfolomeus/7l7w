import scala.io._
import scala.actors._
import scala.xml._
import Actor._

object PageLoader {
	
// 	def getPageSource(url:String) = """
// <html>
// <head>
// 	<title>This is the title</title>
// </head>
// <body>
// 	<p>This is a paragraph</p>
// 	<p>This is a paragraph with a <a href="#" title="link">link</a> in it</p>
// 	<a href="http://www.google.com" title="google">This is just a link</a>
// </body>
// </html>
// 	"""

	def getPageSource(url:String) = io.Source.fromURL(url).mkString

	def getPageSize(url : String) = getPageSource(url).length

	def getLinkCount(url:String):Int = {
		val page = XML.loadString(getPageSource(url))
		val links = page \\ "a"
		links.length
	}
}

val urls = List(
	"http://www.amazon.com/",
	"http://www.twitter.com/",
	"http://www.google.com/",
	"http://www.cnn.com/"
)

def timeMethod(method: () => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
	for(url <- urls) {
		println("Size for " + url + ": " + PageLoader.getPageSize(url))
		println("Link count for " + url + ": " + PageLoader.getLinkCount(url))
	}
}

def getPageSizeConcurrently() = {
	val caller = self
	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url), PageLoader.getLinkCount(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, size, linkCount) =>
				println("Size for " + url + ": " + size)
				println("Link count for " + url + ": " + linkCount)
		}
	}
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }