valid([]).
valid([Head|Tail]) :-
  fd_all_different(Head),
  valid(Tail).

sudoku_6(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle   = [S11, S12, S13, S14, S15, S16,
              S21, S22, S23, S24, S25, S26,
              S31, S32, S33, S34, S35, S36,
              S41, S42, S43, S44, S45, S46,
              S51, S52, S53, S54, S55, S56,
              S61, S62, S63, S64, S65, S66],
  fd_domain(Puzzle, 1, 6),

  Row1 = [S11, S12, S13, S14, S15, S16],
  Row2 = [S21, S22, S23, S24, S25, S26],
  Row3 = [S31, S32, S33, S34, S35, S36],
  Row4 = [S41, S42, S43, S44, S45, S46],
  Row5 = [S51, S52, S53, S54, S55, S56],
  Row6 = [S61, S62, S63, S64, S65, S66],

  Col1 = [S11, S21, S31, S41, S51, S61],
  Col2 = [S12, S22, S32, S42, S52, S62],
  Col3 = [S13, S23, S33, S43, S53, S63],
  Col4 = [S14, S24, S34, S44, S54, S64],
  Col5 = [S15, S25, S35, S45, S55, S65],
  Col6 = [S16, S26, S36, S46, S56, S66],

  Square1 = [S11, S12, S13, S21, S22, S23],
  Square2 = [S14, S15, S16, S24, S25, S26],
  Square3 = [S31, S32, S33, S41, S42, S43],
  Square4 = [S34, S35, S36, S44, S45, S46],
  Square5 = [S51, S52, S53, S61, S62, S63],
  Square6 = [S54, S55, S56, S64, S65, S66],

  valid([Row1, Row2, Row3, Row4, Row5, Row6,
         Col1, Col2, Col3, Col4, Col5, Col6,
         Square1, Square2, Square3, Square4, Square5, Square6]),

  print('\n'),
  print(Row1),
  print('\n'),
  print(Row2),
  print('\n'),
  print(Row3),
  print('\n'),
  print(Row4),
  print('\n'),
  print(Row5),
  print('\n'),
  print(Row6).

% sudoku_6([
% _,_,6,_,_,3,
% 3,2,1,6,5,4,
% 2,_,5,1,_,6,
% _,_,4,_,_,5,
% 4,6,2,5,3,1,
% 1,_,3,4,_,2],
% Solution).
%
% [5,4,6,2,1,3]
% [3,2,1,6,5,4]
% [2,3,5,1,4,6]
% [6,1,4,3,2,5]
%
% Solution = [5,4,6,2,1,3,3,2,1,6,5,4,2,3,5,1,4,6,6,1,4,3,2,5,4,6,2,5,3,1,1,5,3,4,6,2]
%
% yes


