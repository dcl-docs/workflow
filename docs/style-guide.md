


# Style guide

This style guide will introduce you to the style used in the Data Challenge Lab. It expands on the style introduced in the [tidyverse style guide](https://style.tidyverse.org/index.html).

## Why does style matter?

Style guides can seem like a list of arbitrary, pointless rules, but code style does matter.

Good, consistent style makes code much easier to read, helping others---including your future self---understand what a bit of code is trying to accomplish. You'll rarely recall exactly what code does without reading it again, so think of good code style like a gift to Future You from Present You. Also, the clearer and simpler your code is, the easier it will be to identify and fix bugs.

## Style helpers

RStudio includes several features that will help you practice good style. These include:

-   80-character margin
    -   Go to *Tools* \> *Global Options...* \> *Code* \> *Display*, check *Show Margin*, and make sure that *Margin column* is set to 80. This turns on a line in all files that marks the 80-character cutoff. As you'll see, you never want a line of code to exceed 80-characters.
    -   The lower lefthand corner of the RStudio editor also displays the row:column numbers. The column number gives the *next* position, so you're OK if it says 81.
-   Style diagnostics
    -   Go to *Tools* \> *Global Options...* \> *Code* \> *Diagnostics* and check *Provide R style diagnostics*. This turns on a feature that will tell you if you've violated some simple style rules. This tool will underline your bad code with a blue squiggle and put a blue *i* icon in the lefthand margin. Hover over the *i* to see the issue.
-   Indentation fixer
    -   Cmd/Ctrl + I fixes some indentation issues. Highlight the code and press Cmd/Ctrl + I.

## Spacing

-   Put spaces after commas.


```r
# Bad
sum(1,2)

# Good
sum(1, 2)
```

-   Put spaces before and after mathematical operators.


```r
# Bad
1+2

# Good
1 + 2
```

-   Put spaces before and after assignment operators.


```r
# Bad
df |> 
  mutate(c=a)

# Good
df |> 
  mutate(c = a)
```


```r
# Bad
df<-data

# Good
df <- data
```

## Pipes

-   Put a space before a pipe.


```r
# Bad
df|>
  verb()

# Good
df |> 
  verb()
```

-   Add a new line after each pipe and indent each verb.


```r
# Bad
df |> verb1() |> verb2()

# Bad
df |> 
  verb1() |> verb2()

# Good
df |> 
  verb1() |> 
  verb2()
```

-   When assigning the result of a pipe to a variable, begin the pipe on a new, indented line.


```r
# Bad
data <- df |> verb()

# Bad
data <- df |> 
  verb()

# Good
data <-
  df |> 
  verb()
```

-   Avoid assigning unnecessary variables. Try to use a single pipe when possible.


```r
# Bad
data1 <-
  df |> 
  verb1()

data2 <-
  data1 |> 
  verb2()

# Good
data <-
  df |> 
  verb1() |> 
  verb2()
```

## Verb arguments

-   Place short verb arguments on the same line as their verb.


```r
# Bad
df |> 
  verb(
    arg = something_simple
  )

# Good
df |> 
  verb(arg = something_simple)
```

-   When changing, creating, or renaming *multiple* variables with `mutate()`, `summarize()`, `select()`, etc. put each variable on a new line.
    -   The opening parenthesis stays with the verb.
    -   The closing parenthesis gets its own line, and is aligned with the start of the verb name (Cmd/Ctrl + I will correctly do this for you).


```r
# Bad
data |> 
  mutate(
    new_var_1 = something, new_var_2 = something
  )

# Bad
data |> 
  mutate(new_var_1 = something, 
         new_var_2 = something
  )

# Good
data |> 
  mutate(
    new_var_1 = something, 
    new_var_2 = something
  )
```

-   Code should never extend beyond the 80-characters line. Sometimes, all you'll need to do is put the function argument on a new line and indent.
    -   Again, make sure that the first parenthesis stays with the verb, and the second is on its own line and is aligned with the verb name.


```r
# Bad
data |> 
  verb(very_long_argument_name_1 = something_so_complicated_it_goes_past_the_line)

# Bad
data |> 
  verb(
    very_long_argument_name_1 = something_so_complicated_it_goes_past_the_line)

# Bad
data |> 
  verb(
    very_long_argument_name_1 = something_so_complicated_it_goes_past_the_line
)

# Good
data |> 
  verb(
    very_long_argument_name_1 = something_so_complicated_it_goes_past_the_line
  )
```

-   If the verb has multiple arguments and those arguments exceed 80 characters, put each argument on its own line.


```r
# Bad
data |> 
  verb(very_long_argument_name_1 = something_complicated_1, very_long_argument_name_2 = something_complicated_2)

# Bad
data |> 
  verb(
    very_long_argument_name_1 = something_complicated_1, very_long_argument_name_2 = something_complicated_2
  )

# Good
data |> 
  verb(
    very_long_argument_name_1 = something_complicated_1, 
    very_long_argument_name_2 = something_complicated_2
  )
```

-   Sometimes, just putting the arguments on their own lines won't solve the length problem. In these cases, a more complicated indenting scheme is required. In the next section, we'll walk through this scheme in more detail. For now, here are some examples.


```r
# Bad
data |> 
  mutate(var = complicated_fun(arg1 = "something", arg2 = "something else", arg3 = "another thing"))

# Good
data |> 
  mutate(
    var = 
      complicated_fun(
        arg1 = "something", 
        arg2 = "something else", 
        arg3 = "another thing"
      )
  )
```


```r
# Bad
df |> 
  ggplot(mapping = aes(x = a_long_variable_name, y = another_long_variable_name, fill = a_third_long_variable_name), position = "dodge") +
  geom_col()

# Good
df |> 
  ggplot(
    mapping = 
      aes(
        x = a_long_variable_name, 
        y = another_long_variable_name, 
        fill = a_third_long_variable_name
      ), 
    position = "dodge"
  ) +
  geom_col()
```

## An indentation example

The indentation scheme introduced above can be confusing. Here, we'll walk through an example so you can it in action.


```r
# Bad
data |> 
  mutate(var = complicated_fun(arg1 = "something", arg2 = "something else", arg3 = "another thing"))
```

**Step 1**

Put the contents of the verb on its own line.


```r
data |> 
  mutate(
    var = complicated_fun(arg1 = "something", arg2 = "something else", arg3 = "another thing")
  )
```

If none of the code goes over the 80-character line, you're done! In this case, the code still exceeds 80 characters, so we'll need to proceed to **Step 2**.

**Step 2**

Add a newline after the "=".


```r
data |> 
  mutate(
    var = 
      complicated_fun(arg1 = "something", arg2 = "something else", arg3 = "another thing")
  )
```

Again, if none of the code goes over the line, you're done. Our code still surpasses 80-characters, so we'll head to **Step 3**.

**Step 3**

Give each function argument its own line.


```r
data |> 
  mutate(
    var = 
      complicated_fun(
        arg1 = "something", 
        arg2 = "something else", 
        arg3 = "another thing"
      )
  )
```

Now, everything is under 80 characters and the code is easy to read.

There are also situations where you'll want to put each function argument on its own line even if the code doesn't extend past 80 characters. functions that should usually have each argument on its own line include `if_else()`, `recode()`, and `case_when()`.


```r
# Not great
data |> 
  mutate(
    var = recode(v1 = "something", v2 = "something else", v3 = "another thing")
  )

# Better
data |> 
  mutate(
    var = 
      recode(
        v1 = "something", 
        v2 = "something else", 
        v3 = "another thing"
      )
  )
```

Remember to line up the closing parenthesis with the start of the function name. You can always check your indenting by highlighting the code and doing Cmd/Ctrl + I.
