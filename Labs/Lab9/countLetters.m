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
    retval(1, curChar - 96) += 1;
  endfor
endfunction
