defmodule StoneTest do
  use ExUnit.Case
  doctest Stone

  def email_list(qtd) do
    Enum.map(1..qtd, fn x -> "email#{x}@gmail.com" end)
  end

  describe "challenge" do
    test "with lists" do
      assert {:ok, %{"email1@gmail.com" => 100}} = Stone.challenge([{1, 100}], email_list(1))

      assert {:ok,
              %{"email1@gmail.com" => 34, "email2@gmail.com" => 33, "email3@gmail.com" => 33}} =
               Stone.challenge([{1, 100}], email_list(3))

      assert {:ok,
              %{"email1@gmail.com" => 300, "email2@gmail.com" => 300, "email3@gmail.com" => 300}} =
               Stone.challenge([{5, 300}], email_list(5))

      assert {:ok, %{"email1@gmail.com" => 3100}} =
               Stone.challenge([{1, 100}, {5, 300}, {10, 150}], email_list(1))

      assert {:ok,
              %{
                "email1@gmail.com" => 5112,
                "email2@gmail.com" => 5112,
                "email50@gmail.com" => 5112
              }} =
               Stone.challenge(
                 [{1, 100}, {5, 300}, {10, 150}, {100, 2500}, {20, 125}],
                 email_list(50)
               )

      assert {:ok,
              %{"email1@gmail.com" => 99, "email2@gmail.com" => 100, "email3@gmail.com" => 100}} =
               Stone.challenge([{1, 4999}], email_list(50))
    end

    test "empty lists" do
      assert Stone.challenge([], []) == {:error, :empty_lists}
      assert Stone.challenge([{1, 100}], []) == {:error, :empty_email_list}
      assert Stone.challenge([], email_list(10)) == {:error, :empty_shopping_list}
    end
  end
end
