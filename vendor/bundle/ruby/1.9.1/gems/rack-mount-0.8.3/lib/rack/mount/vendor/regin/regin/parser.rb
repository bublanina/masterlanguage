# -*- encoding : utf-8 -*-
#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'
module Regin
  class Parser < Racc::Parser #:nodoc: all

def self.parse_regexp(regexp)
  options = Options.from_int(regexp.options)

  parser = new
  parser.options_stack << options.to_h

  expression = parser.scan_str(regexp.source)
  expression = expression.dup(options.to_h) if options.any?
  expression
end

attr_accessor :options_stack

def initialize
  @capture_index = 0
  @capture_index_stack = []
  @options_stack = []
end

##### State transition tables begin ###

racc_action_table = [
    43,    44,    46,    48,     4,    52,    17,     9,    10,    11,
    13,    30,    28,    19,    20,    21,     4,     6,     7,     9,
    10,    11,    13,    55,    45,    47,    49,    50,     4,     6,
     7,     9,    10,    11,    13,    80,    56,    47,    49,    50,
     4,     6,     7,     9,    10,    11,    13,    83,    47,    49,
    50,    81,     4,     6,     7,     9,    10,    11,    13,    74,
    47,    49,    50,    31,     4,     6,     7,     9,    10,    11,
    13,    47,    49,    50,    32,    85,     4,     6,     7,     9,
    10,    11,    13,    47,    49,    50,    86,    33,     4,     6,
     7,     9,    10,    11,    13,    47,    49,    50,    88,    89,
     4,     6,     7,     9,    10,    11,    13,    47,    49,    50,
    27,    91,     4,     6,     7,     9,    10,    11,    13,    22,
    34,    23,    36,    41,    25,     6,     7,    58,    60,    62,
    63,    64,    65,    66,    67,    68,    69,    70,    57,    59,
    61,    22,    22,    38,    22,    72,    25,    39,    95,    39,
    47,    49,    50 ]

racc_action_check = [
    28,    28,    28,    28,    13,    29,     3,    13,    13,    13,
    13,    14,    13,     3,     3,     3,    31,    13,    13,    31,
    31,    31,    31,    35,    28,    28,    28,    28,     0,    31,
    31,     0,     0,     0,     0,    51,    35,    84,    84,    84,
    80,     0,     0,    80,    80,    80,    80,    73,    73,    73,
    73,    71,     1,    80,    80,     1,     1,     1,     1,    42,
    42,    42,    42,    15,    48,     1,     1,    48,    48,    48,
    48,    83,    83,    83,    19,    75,    46,    48,    48,    46,
    46,    46,    46,    87,    87,    87,    76,    20,    30,    46,
    46,    30,    30,    30,    30,    77,    77,    77,    78,    79,
    43,    30,    30,    43,    43,    43,    43,    74,    74,    74,
    12,    81,    44,    43,    43,    44,    44,    44,    44,     4,
    21,     4,    22,    27,     4,    44,    44,    36,    36,    36,
    36,    36,    36,    36,    36,    36,    36,    36,    36,    36,
    36,    23,    24,    24,    37,    37,    23,    24,    90,    37,
    45,    45,    45 ]

racc_action_pointer = [
    25,    49,   nil,    -5,   116,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   110,     1,     9,    61,   nil,   nil,   nil,    63,
    76,   112,   108,   138,   139,   nil,   nil,   123,   -12,    -5,
    85,    13,   nil,   nil,   nil,    15,   105,   141,   nil,   nil,
   nil,   nil,    23,    97,   109,   113,    73,   nil,    61,   nil,
   nil,    21,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    37,   nil,    11,    70,    65,    76,    58,    88,    89,
    37,   107,   nil,    34,     0,   nil,   nil,    46,   nil,   nil,
   138,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
   -59,    -5,    -7,    -9,   -59,   -10,   -23,   -24,   -15,   -13,
   -14,   -16,   -59,   -59,    -1,    -2,    -6,   -27,    -8,   -25,
   -26,   -59,   -59,   -59,   -59,   -36,   -35,   -59,   -59,   -59,
   -59,   -59,   -28,   -29,   -32,   -59,   -59,   -59,   -11,   -34,
   -33,    96,   -59,   -59,   -59,   -59,   -59,   -56,   -59,   -57,
   -58,   -59,   -17,    -3,    -4,   -31,   -30,   -49,   -38,   -50,
   -39,   -51,   -40,   -41,   -42,   -43,   -44,   -45,   -46,   -47,
   -48,   -59,   -12,   -59,   -59,   -59,   -59,   -59,   -59,   -59,
   -59,   -59,   -55,   -59,   -59,   -18,   -19,   -59,   -21,   -22,
   -59,   -37,   -54,   -53,   -52,   -20 ]

racc_goto_table = [
    12,    24,    40,    35,    42,    53,    54,    16,    18,    71,
    51,   nil,   nil,    29,   nil,    40,   nil,   nil,    73,   nil,
    37,    77,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    75,    76,   nil,    78,   nil,    79,    82,
    84,   nil,   nil,    87,   nil,   nil,   nil,   nil,   nil,    92,
    93,   nil,   nil,    94,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    90 ]

racc_goto_check = [
     1,     9,    13,    12,    15,     3,     3,     5,     7,    14,
    11,   nil,   nil,     1,   nil,    13,   nil,   nil,    15,   nil,
     9,    15,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     1,     1,   nil,     1,   nil,     1,    15,
    15,   nil,   nil,    15,   nil,   nil,   nil,   nil,   nil,    15,
    15,   nil,   nil,    15,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     1 ]

racc_goto_pointer = [
   nil,     0,   nil,   -25,   nil,     6,   nil,     5,   nil,    -3,
   nil,   -18,   -18,   -22,   -27,   -24 ]

racc_goto_default = [
   nil,   nil,    14,    15,     1,     2,     3,   nil,     5,   nil,
     8,   nil,   nil,    26,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 41, :_reduce_1,
  1, 41, :_reduce_none,
  3, 42, :_reduce_3,
  3, 42, :_reduce_4,
  1, 43, :_reduce_5,
  2, 44, :_reduce_6,
  1, 44, :_reduce_7,
  2, 45, :_reduce_8,
  1, 45, :_reduce_none,
  1, 46, :_reduce_none,
  3, 46, :_reduce_11,
  4, 46, :_reduce_12,
  1, 46, :_reduce_13,
  1, 46, :_reduce_14,
  1, 46, :_reduce_15,
  1, 46, :_reduce_16,
  3, 48, :_reduce_17,
  5, 48, :_reduce_18,
  5, 48, :_reduce_19,
  6, 48, :_reduce_20,
  5, 48, :_reduce_21,
  5, 48, :_reduce_22,
  1, 50, :_reduce_none,
  1, 50, :_reduce_none,
  1, 47, :_reduce_none,
  1, 47, :_reduce_none,
  1, 47, :_reduce_none,
  2, 47, :_reduce_28,
  2, 47, :_reduce_29,
  3, 47, :_reduce_30,
  2, 52, :_reduce_31,
  1, 52, :_reduce_none,
  2, 49, :_reduce_33,
  2, 49, :_reduce_34,
  1, 49, :_reduce_none,
  1, 49, :_reduce_none,
  5, 53, :_reduce_37,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  4, 51, :_reduce_52,
  4, 51, :_reduce_53,
  4, 51, :_reduce_54,
  3, 51, :_reduce_55,
  1, 55, :_reduce_56,
  1, 55, :_reduce_57,
  1, 55, :_reduce_58 ]

racc_reduce_n = 59

racc_shift_n = 96

racc_token_table = {
  false => 0,
  :error => 1,
  :BAR => 2,
  :LBRACK => 3,
  :RBRACK => 4,
  :NEGATE => 5,
  :CCLASS => 6,
  :DOT => 7,
  :CHAR => 8,
  :LPAREN => 9,
  :RPAREN => 10,
  :QMARK => 11,
  :EQUAL => 12,
  :BANG => 13,
  :COLON => 14,
  :NAME => 15,
  :L_ANCHOR => 16,
  :R_ANCHOR => 17,
  :STAR => 18,
  :PLUS => 19,
  :LCURLY => 20,
  :RCURLY => 21,
  "alnum" => 22,
  "alpha" => 23,
  "ascii" => 24,
  "blank" => 25,
  "cntrl" => 26,
  "digit" => 27,
  "graph" => 28,
  "lower" => 29,
  "print" => 30,
  "punct" => 31,
  "space" => 32,
  "upper" => 33,
  "word" => 34,
  "xdigit" => 35,
  :MINUS => 36,
  :MULTILINE => 37,
  :IGNORECASE => 38,
  :EXTENDED => 39 }

racc_nt_base = 40

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "BAR",
  "LBRACK",
  "RBRACK",
  "NEGATE",
  "CCLASS",
  "DOT",
  "CHAR",
  "LPAREN",
  "RPAREN",
  "QMARK",
  "EQUAL",
  "BANG",
  "COLON",
  "NAME",
  "L_ANCHOR",
  "R_ANCHOR",
  "STAR",
  "PLUS",
  "LCURLY",
  "RCURLY",
  "\"alnum\"",
  "\"alpha\"",
  "\"ascii\"",
  "\"blank\"",
  "\"cntrl\"",
  "\"digit\"",
  "\"graph\"",
  "\"lower\"",
  "\"print\"",
  "\"punct\"",
  "\"space\"",
  "\"upper\"",
  "\"word\"",
  "\"xdigit\"",
  "MINUS",
  "MULTILINE",
  "IGNORECASE",
  "EXTENDED",
  "$start",
  "expression",
  "alternation",
  "subexpression",
  "expression_ary",
  "quantified_atom",
  "atom",
  "quantifier",
  "group",
  "bracket_expression",
  "anchor",
  "options",
  "quantifier_char",
  "posix_bracket_expression",
  "posix_bracket_type",
  "modifier" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
 result = Expression.new(val[0]) 
    result
end

# reduce 2 omitted

def _reduce_3(val, _values, result)
 result = val[0] + [val[2]] 
    result
end

def _reduce_4(val, _values, result)
 result = Alternation.new(val[0], val[2])  
    result
end

def _reduce_5(val, _values, result)
 result = Expression.new(val[0]) 
    result
end

def _reduce_6(val, _values, result)
 result = val[0] + [val[1]] 
    result
end

def _reduce_7(val, _values, result)
 result = [val[0]] 
    result
end

def _reduce_8(val, _values, result)
 result = val[0].dup(:quantifier => val[1]) 
    result
end

# reduce 9 omitted

# reduce 10 omitted

def _reduce_11(val, _values, result)
 result = CharacterClass.new(val[1]) 
    result
end

def _reduce_12(val, _values, result)
 result = CharacterClass.new(val[2], :negate => true) 
    result
end

def _reduce_13(val, _values, result)
 result = CharacterClass.new(val[0]) 
    result
end

def _reduce_14(val, _values, result)
 result = CharacterClass.new('.') 
    result
end

def _reduce_15(val, _values, result)
 result = Anchor.new(val[0]) 
    result
end

def _reduce_16(val, _values, result)
 result = Character.new(val[0]) 
    result
end

def _reduce_17(val, _values, result)
	  result = Group.new(val[1], :index => @capture_index_stack.pop)
	
    result
end

def _reduce_18(val, _values, result)
	 result = Group.new(val[3], :index => @capture_index_stack.pop, :lookahead => :postive)
       
    result
end

def _reduce_19(val, _values, result)
	 result = Group.new(val[3], :index => @capture_index_stack.pop, :lookahead => :negative)
       
    result
end

def _reduce_20(val, _values, result)
	  result = Group.new(val[4], val[2].merge(:capture => false))
	  @options_stack.pop
	
    result
end

def _reduce_21(val, _values, result)
	  result = Group.new(val[3], :capture => false);
	
    result
end

def _reduce_22(val, _values, result)
	  result = Group.new(val[3], :name => val[2], :index => @capture_index_stack.pop);
	
    result
end

# reduce 23 omitted

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

def _reduce_28(val, _values, result)
 result = val.join 
    result
end

def _reduce_29(val, _values, result)
 result = val.join 
    result
end

def _reduce_30(val, _values, result)
 result = val.join 
    result
end

def _reduce_31(val, _values, result)
 result = val.join 
    result
end

# reduce 32 omitted

def _reduce_33(val, _values, result)
 result = val.join 
    result
end

def _reduce_34(val, _values, result)
 result = val.join 
    result
end

# reduce 35 omitted

# reduce 36 omitted

def _reduce_37(val, _values, result)
 result = val.join 
    result
end

# reduce 38 omitted

# reduce 39 omitted

# reduce 40 omitted

# reduce 41 omitted

# reduce 42 omitted

# reduce 43 omitted

# reduce 44 omitted

# reduce 45 omitted

# reduce 46 omitted

# reduce 47 omitted

# reduce 48 omitted

# reduce 49 omitted

# reduce 50 omitted

# reduce 51 omitted

def _reduce_52(val, _values, result)
	    @options_stack << result = { val[1] => false, val[2] => false, val[3] => false }
	  
    result
end

def _reduce_53(val, _values, result)
	    @options_stack << result = { val[0] => true, val[2] => false, val[3] => false }
	  
    result
end

def _reduce_54(val, _values, result)
	    @options_stack << result = { val[0] => true, val[1] => true, val[3] => false }
	  
    result
end

def _reduce_55(val, _values, result)
	    @options_stack << result = { val[0] => true, val[1] => true, val[2] => true }
	  
    result
end

def _reduce_56(val, _values, result)
 result = :multiline 
    result
end

def _reduce_57(val, _values, result)
 result = :ignorecase 
    result
end

def _reduce_58(val, _values, result)
 result = :extended 
    result
end

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end   # module Regin

require 'regin/tokenizer'
