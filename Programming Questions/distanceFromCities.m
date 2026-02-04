1;
#Author: Hy Pham
#3644179

cities = "Cities.csv";
locations = "Locations.csv";

citiesMatrix = csvread(cities);
locationMatrix = csvread(locations);

#Function to calculate distance between 2 vectors using
#Euclidian distance formula
function distance = calcDistance (p1, p2)
  x = (p1 - p2).^2;
  distance = sqrt(sum(x));
endfunction

cityA = citiesMatrix(2, 2:3);
cityB = citiesMatrix(3, 2:3);
cityC = citiesMatrix(4, 2:3);
cityD = citiesMatrix(5, 2:3);

closestA = [];
closestB = [];
closestC = [];
closestD = [];

nearestLocationA = 0;
nearestLocationB = 0;
nearestLocationC = 0;
nearestLocationD = 0;

for i = 1:(rows(locationMatrix) - 1)
  curLocation = locationMatrix(1 + i, 2:3);
  disToA = calcDistance(cityA, curLocation);
  disToB = calcDistance(cityB, curLocation);
  disToC = calcDistance(cityC, curLocation);
  disToD = calcDistance(cityD, curLocation);

  distArr = ([disToA, disToB, disToC, disToD]);

  if (min(distArr) == disToA)
    closestA = [closestA; i min(distArr)];
  elseif (min(distArr) == disToB)
    closestB = [closestB; i min(distArr)];
  elseif (min(distArr) == disToC)
    closestC = [closestC; i min(distArr)];
  else 
    closestD = [closestD; i min(distArr)];
  endif
endfor

totalA = rows(closestA);
[minval, rowA] = min(closestA(:, 2));
nearestLocationA = closestA(rowA, 1);

totalB = rows(closestB);
[minval, rowB] = min(closestB(:, 2));
nearestLocationB = closestB(rowB, 1);

totalC = rows(closestC);
[minval, rowC] = min(closestC(:, 2));
nearestLocationC = closestC(rowC, 1);

totalD = rows(closestD);
[minval, rowD] = min(closestD(:, 2));
nearestLocationD = closestD(rowD, 1);

printf("City     |     #Closest   |  Nearest Location\n");
printf("===============================================\n");
printf("A        |     %d         |       %d\n", totalA, nearestLocationA);
printf("B        |     %d         |       %d\n", totalB, nearestLocationB);
printf("C        |     %d         |       %d\n", totalC, nearestLocationC);
printf("D        |     %d         |       %d\n", totalD, nearestLocationD);