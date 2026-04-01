1;

test1 = ["Catfish"; "Squid"; "Shark"];
test2 = ["Shark1"; "Stringray"; "Squid"];

a1 = aquarium (test1);

a1

testOut = get (a1, "animals");
testOut

testTwo = set (a1, test2);
testTwo

b = firstAnimal(a1);
b