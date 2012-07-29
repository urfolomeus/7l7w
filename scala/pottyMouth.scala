trait MouthWash {
	var curseMap = Map[String, String]()

	val censorList = io.Source.fromFile("censor_list.txt")

	curseMap = censorList.getLines.foldLeft(curseMap) {(memo, line) =>
		val conversion = line.split("=")
		memo + (conversion(0) -> conversion(1))
	}

	// ORIGINAL MAP BEFORE GETTING FROM FILE
	// curseMap = Map[String, String](
	// 	"shoot" -> "pucky",
	// 	"Shoot" -> "Pucky",
	// 	"darn" -> "beans",
	// 	"Darn" -> "Beans"
	// )

	def wireBrushAndDetol(pottyText:String):String = {
		return pottyText.lines.foldLeft("")((memo, line) =>
			memo + decurse(line) + "\n"
		)
	}

	private def decurse(line:String):String = {
		return curseMap.keys.foldLeft(line)((memo, key) =>
			memo.replaceAll(key, curseMap(key))
		)
	}
}

class PolitePerson(val words:String) extends MouthWash {
	def say():String = {
		return wireBrushAndDetol(words)
	}
}

val multiLine = """
Shoot but if this ain't a line
Oh shoot, so is this
This is also a darn line
"""

val pp = new PolitePerson(multiLine)
println(pp.say)