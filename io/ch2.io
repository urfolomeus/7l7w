"Scratch" println
"-------" println
writeln

Object ancestors := method(
  prototype := self proto
  if(prototype != Object,
    writeln("Slots of ", prototype type, "\n---------------")
    prototype slotNames foreach(slotName, writeln(slotName))
    writeln
    prototype ancestors
  )
)

Animal := Object clone
Animal speak := method("ambiguous animal noise" println)

Duck := Animal clone
Duck speak := method("quack" println)

Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors

"Exercises" println
"---------" println

exercise := method(number,
  writeln
  writeln(number, ")")
)

exercise(1)

calcFib := method(target, current, n1, n2,
  ( if(target == current,
      (return n1 + n2),
      (return calcFib(target, current + 1, n2, n1 + n2))
    )
  )
)

fib := method(target,
  ( n := if(target <= 2, 1, calcFib(target, 3, 1, 1))
    writeln("fib(", target, ") = ", n)
  )
)

fib(1)
fib(2)
fib(3)
fib(4)
fib(5)
fib(6)
fib(7)
fib(8)


exercise(2)

Number setSlot("div", Number getSlot("/"))

Number setSlot("/",
  method(denominator,
    if(denominator == 0, return 0, self div(denominator))
  )
)

writeln("6 / 3 = ", 6 / 3)
writeln("6 / 0 = ", 6 / 0)


exercise(3)

a := list(1,2,3,4)
b := list(5,6,7,8)
c := list(a,b)

total := 0

c foreach(array, total = total + (array sum))

writeln("Total sum of ", c, " = ", total)


exercise(4)

writeln("See separate file")


exercise(5)

TwoDimensionalList := List clone do(
  dim := method(x, y,
    self setSize(x)
    self mapInPlace(value, list setSize(y))
  )
  set := method(x, y, value,
    self at(x) atPut(y, value)
  )
  get := method(x, y,
    self at(x) at(y)
  )
)


a := TwoDimensionalList clone

a dim(2, 3)
writeln("dim(2, 3)")
writeln(a)

writeln
writeln("set(1, 1, 'hello')")
a set(1, 1, "hello")
writeln(a)

writeln
writeln("set(0, 2, 'world')")
a set(0, 2, "world")
writeln(a)

writeln
writeln("get(0, 2)")
writeln(a get(0, 2))


exercise(6)

TwoDimensionalList transpose := method(
  xDim := self size
  yDim := self first size

  transList := self clone dim(yDim, xDim)

  for(x, 0, (xDim - 1),
    for(y, 0, (yDim -1),
      transList set(y, x, self get(x, y))
    )
  )

  return transList
)

a := TwoDimensionalList clone

a dim(2, 3)
writeln("dim(2, 3)")
writeln(a)

writeln
writeln("set(1, 1, 'hello')")
a set(1, 1, "hello")
writeln(a)

writeln
writeln("set(0, 2, 'world')")
a set(0, 2, "world")
writeln(a)

writeln
writeln("transpose")
b := a transpose
writeln(b)

writeln
writeln("a get(0, 2)")
writeln(a get(0, 2))

writeln
writeln("b get(2, 0)")
writeln(b get(2, 0))


exercise(7)

TwoDimensionalList writeToFile := method(filename,
  File with(filename) open write(self serialized)
)

TwoDimensionalList readFromFile := method(filename,
  doFile(filename)
)

a := TwoDimensionalList clone

a dim(2, 3)
writeln("dim(2, 3)")
writeln(a)

writeln
writeln("set(1, 1, 'hello')")
a set(1, 1, "hello")
writeln(a)

writeln
writeln("set(0, 2, 'world')")
a set(0, 2, "world")
writeln(a)

writeln
writeln("write to matrix.txt")
a writeToFile("matrix.txt")

a := nil
writeln(a)

writeln
writeln("read from matrix.txt")
a := TwoDimensionalList readFromFile("matrix.txt")
writeln(a)

