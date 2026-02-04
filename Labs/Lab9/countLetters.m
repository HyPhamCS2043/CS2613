## Copyright (C) 2026 Hy Pham
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} countLetters (@var{input1})
##
## @seealso{}
## @end deftypefn

## Author: Hy Pham <hpham@gc112m13.cs.unb.ca>
## Created: 2026-02-04

function retval = countLetters (inputStr)
  cleaned = tolower(inputStr);
  retval = zeros (1, 26);
  for i = 1:length(cleaned)
    curChar = cleaned(1, i);
    switch (curChar)
      case "a"
	      retval(1, 1) += 1;
      case "b"
	      retval(1, 2) += 1;
      case "c"
	      retval(1, 3) += 1;
      case "d"
	      retval(1, 4) += 1;
      case "e"
	      retval(1, 5) += 1;
      case "f"
	      retval(1, 6) += 1;
      case "g"
	      retval(1, 7) += 1;
      case "h"
	      retval(1, 8) += 1;
      case "i"
	      retval(1, 9) += 1;
      case "j"
	      retval(1, 10) += 1;
      case "k"
	      retval(1, 11) += 1;
      case "l"
	      retval(1, 12) += 1;
      case "m"
	      retval(1, 13) += 1;
      case "n"
	      retval(1, 14) += 1;
      case "o"
	      retval(1, 15) += 1;
      case "p"
	      retval(1, 16) += 1;
      case "q"
	      retval(1, 17) += 1;
      case "r"
	      retval(1, 18) += 1;
      case "s"
	      retval(1, 19) += 1;
      case "t"
	      retval(1, 20) += 1;
      case "u"
	      retval(1, 21) += 1;
      case "v"
	      retval(1, 22) += 1;
      case "w"
	      retval(1, 23) += 1;
      case "x"
	      retval(1, 24) += 1;
      case "y"
	      retval(1, 25) += 1;
      case "z"
	      retval(1, 26) += 1;
    endswitch
  endfor
endfunction
