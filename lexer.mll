{
  open Parser
}

rule lex = parse
  | [' ' '\t' '\n'] { lex lexbuf }
  | ['0'-'9']+ as n { INT (int_of_string n) }
  | '"' (['\x00'-'\xFF']+ as s) '"' { STRING s }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '+' { ADD }
  | '-' { SUB }
  | '*' { MUL }
  | '/' { DIV }
  | ',' { COMMA }
  | '#' { HASH }
  | '=' { EQUAL }
  | ';' { SEMI }
  | "true" { TRUE }
  | "false" { FALSE }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "print" { PRINT }
  | "let" { LET }
  | (['a'-'z']|['A'-'Z']|['0'-'9'])+ as s { IDENT s }
  | eof { EOF }
