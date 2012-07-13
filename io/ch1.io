Car := Object clone
Car drive := method("Vroom!" println)

SportsCar := Car clone
SportsCar engine := "rear"

ferrari := SportsCar clone
ferrari drive()

m := "engine"

"Getting engine" println

ferrari getSlot(m) println
