defmodule Shortname do
   def short_name(name) do
      name = Regex.replace(~r{ +}, name, " ")
      name = name |> String.lstrip |> String.rstrip
      name = String.split(name, " ")

      case name do
         [head |[]]  -> head
         [_head | _tail] -> _short_name(name)
      end
   end

   defp _short_name([head | [] ], acc), do: Enum.reverse([head|acc]) |> Enum.join(" ")

   defp _short_name([head | tail], acc), do: _short_name(tail,[String.first(head) <> "." | acc])

   defp _short_name([head | tail]), do: _short_name(tail, [head])
end

IO.inspect Shortname.short_name("George Michael Harrison Bleuth")
# iex> "George M. H. Bleuth"
