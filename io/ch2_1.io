exercise := method(number,
  writeln
  writeln(number, ")")
)

exercise(4)

writeln("Only calc numbers")
writeln("=================")

List myAverage := method(
  numbers := list()
  self foreach(item,
    if(item isKindOf(Number),
      numbers append(item)
    )
  )
  if(numbers isEmpty, 0, numbers average)
)

writeln( "(1,2,3,4) = ", list(1,2,3,4) myAverage )
writeln( "(1,'a',3,'b') = ", list(1,"a",3,"b") myAverage )
writeln( "('a','b','c','d') = ", list("a","b","c","d") myAverage )

writeln("Raise error instead")
writeln("===================")

List myAverage := method(
  self foreach(item,
    if(item isKindOf(Number),
      continue,
      Exception raise("List contains non-numbers")
    )
  )
  self average
)

writeln( "(1,2,3,4) = ", list(1,2,3,4) myAverage )
writeln( "(1,'a',3,'b') = ", list(1,"a",3,"b") myAverage )


