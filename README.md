# Stone Challenge

## How to execute it

With `iex -S mix`:
```
iex(1)> Stone.challenge([{1, 100}, {2, 100}], ["email1@gmail.com", "email2@gmail.com"])
{:ok, %{"email1@gmail.com" => 150, "email2@gmail.com" => 150}}
```

## How I solved it

First I made the function accept two arguments, a list of tuples for the shopping list and a list of strings for the emails, then, using the shopping list, I set so that it multiplies the value of the item by it's ammount, sums them all with the reduce and set it as the variable `total_value`.

After that, I set the variable `each_value` with the rounded down result of the division of the `total_value` by the length of the email list, and then I made a map with every email as a key with the `each_value` variable as their values.

Then, I made a cond block so that it checks wether the `each_value` variable is equal, higher or lower than the `total_value` after multiplying it by the ammount of emails, where if it is equal, it just returns the map unchanged and if it isn't it adds or removes 1 cent to the value of the first email on the list so that there isn't any money missing.

Lastly I made the other guard functions for when one or both of the lists is empty it returns a error depending on which of them are empty.

## Tests

This was my first time creating tests, so I studied exUnit and made the tests in `test/stone_test.exs` file.

I made a function so that I could create as much emails I wanted easily, then I made two tests, one to check wether it's working as expected with lists, doing the correct math and adding the +1 when it should, and another to check if it gives the correct error message when either or both lists are empty. 

To execute it I just open the terminal in the code's folder and run `mix test`.
