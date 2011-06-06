

function test_double_quoted_strings_are_strings()
  local str = "Hello, World"
  assert_equal(__('string'), type(str))
end

function test_single_quoted_strings_are_also_strings()
  local str = 'Goodbye, World'
  assert_equal(__('string'), type(str))
end

function test_use_single_quotes_to_create_str_with_double_quotes()
  local str = 'He said, "Go Away."'
  assert_equal(__('He said, "Go Away."'), str)
end

function test_use_double_quotes_to_create_strings_with_single_quotes()
  local str = "Don't"
  assert_equal(__("Don't"), str)
end

function test_use_backslash_for_those_hard_cases()
  local a = "He said, \"Don't\""
  local b = 'He said, "Don\'t"'
  assert_equal(__(true), a == b)
end

function test_double_brackets_to_handle_really_hard_cases()
  local a = [[double-brackets can handle both ' and " characters]]
  assert_equal(__([[double-brackets can handle both ' and " characters]]), a)
end

function test_double_brackets_can_handle_multiple_lines()
  local long_str = [[
It was the best of times,
It was the worst of times.
]]
  assert_equal(__(53), #long_str)
--[[ bonus note:
You can use multi-line strings to create multi-line comments,
such as this one.
]]
end

function test_double_quoted_str_interpret_escape_characters()
  local str = "\n"
  assert_equal(__(1), #str)
end

function test_single_quoted_str_interpret_escape_characters()
  local str = '\n'
  assert_equal(__(1), #str)
end


function test_dot_dot_will_concatenate_two_strings()
  local str = "Hello, " .. "World"
  assert_equal(__("Hello, World"), str)
end

function test_concatenation_will_leave_the_original_strings_unmodified()
  local hi = "Hello, "
  local there = "World"
  local str = hi .. there
  assert_equal(__("Hello, "), hi)
  assert_equal(__("World"), there)
end

function test_numbers_must_be_converted_to_strings_before_concatenation()
  local age = os.date("%Y") - 1993
  assert_equal(__("Lua is " .. tostring(age) .. " years old"), "Lua is " .. tostring(age) .. " years old")
end

function test_booleans_must_be_converted_to_strings_before_concatenation()
  local to_be = true
  local hamlet = tostring(to_be) .. " or " .. tostring(not to_be) .. ", that is the boolean"
  assert_equal(__("true or false, that is the boolean"), hamlet)
end

function test_nil_must_be_converted_to_string_before_concatenation()
  local nothing_is_impossible_to_mankind = tostring(nil) .. " mortalibus ardui est"
  assert_equal(__("nil mortalibus ardui est"), nothing_is_impossible_to_mankind)
end

function test_strings_are_compared_lexicographically()
  assert_equal(__(true), "hello" == "hello")
  assert_equal(__(true), "hello" ~= "goodbye")
  assert_equal(__(true), "hello" > "goodbye")
end

function test_there_is_a_table_called_string()
  assert_equal(__('table'), type(string))
end

function test_string_upper()
  local str = "eat me"
  assert_equal(__('EAT ME'), string.upper('EAT ME'))
end

function test_string_byte_returns_the_first_ascii_char()
  local byte = string.byte("ABCDE")
  assert_equal(__(65), byte)
end

function test_string_byte_returns_the_ascii_char_of_the_nth_char()
  local byte = string.byte("ABCDE", 2)
  assert_equal(__(66), byte)
end

function test_string_byte_returns_the_ascii_chars_of_the_chars_between_start_and_end()
  local byte1, byte2, byte3 = string.byte("ABCDE", 2, 4)
  assert_equal(__(67), byte2)
end

function test_string_byte_returns_nil_when_out_of_bounds()
  assert_equal(__(nil), string.byte("ABCDE", 100))
end

function test_string_char_builds_strings_from_ascii_codes()
  assert_equal(__('ABC'), string.char(65,66,67))
end

function test_string_char_returns_empty_string_from_nil()
  assert_equal(__(''), string.char())
end

function test_string_format_replaces_percent_s_with_string()
  local result = string.format('My name is %s, %s', 'Bond', 'James Bond')
  assert_equal(__('My name is Bond, James Bond'), result)
end

function test_string_format_replaces_percent_q_with_quoted_strings()
  local result = string.format('I told him: %q', 'Go away')
  assert_equal(__('I told him: "Go away"'), result)
end

function test_string_format_replaces_percent_d_with_an_integer()
  local result = string.format('%d, %d, %d and so on...', 1, 2, 3)
  assert_equal(__('1, 2, 3 and so on...'), result)
  -- there are other letters for formatting numbers:
  -- %c converts a number to char
  -- %e formats a number as an exponent (3.141593e+000)
  -- %E same as %e, but the number will have an uppercase E
  -- %f and %g are floats with 6 and 5 decimal places respectively (padded with 0s if needed)
  -- %i is a synonym of %d
  -- %u formats the integers as unsigned
  -- %o formats numbers in octal
  -- %x & %X format numbers in hexadecimal (lowercase and uppercase characters respectively)
end

function test_string_len()
  local str = "Hello"
  assert_equal(__(5), string.len(str))
end

function test_string_length_operator()
  local str = "Hello"
  assert_equal(__(5), #str)
end

function test_you_actually_dont_need_to_use_the_string_table()
  local str = "Hello"
  assert_equal(__(5), str:len()) -- notice the colon!
  -- this works with all string functions
end

function test_shorter_len_requires_extra_parenthesis_around_literals()
  assert_equal(__(5), ("Hello"):len())
end

function test_length_operator_does_not_require_extra_parenthesis_around_literals()
  assert_equal(__(5), #"Hello")
end

function test_string_sub()
  local str = 'all your base'
  local start_pos, end_pos = 5, 8
  assert_equal(__('your'), string.sub(str, start_pos, end_pos))
end

function test_string_sub_without_second_param_means_until_the_end()
  local str = 'all your base'
  assert_equal(__('your base'), string.sub(str, 5))
end







