defmodule Stone do
  def challenge([], []) do
    {:error, :empty_lists}
  end

  def challenge([], _) do
    {:error, :empty_shopping_list}
  end

  def challenge(_, []) do
    {:error, :empty_email_list}
  end

  def challenge(shopping_list, email_list) do
    total_value =
      shopping_list
      |> Enum.map(fn {qtd, value} -> qtd * value end)
      |> Enum.reduce(fn x, acc -> x + acc end)

    each_value = round(total_value / length(email_list))
    map = Map.new(email_list, fn x -> {x, each_value} end)

    cond do
      each_value * length(email_list) == total_value ->
        {:ok, map}

      each_value * length(email_list) < total_value ->
        {:ok, %{map | List.first(email_list) => each_value + 1}}

      each_value * length(email_list) > total_value ->
        {:ok, %{map | List.first(email_list) => each_value - 1}}
    end
  end
end
