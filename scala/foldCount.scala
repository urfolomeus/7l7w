var stringList = List("is", "this", "seriously", "a", "task")
println("Count = " + stringList.foldLeft(0)((count, el) => count + 1))

