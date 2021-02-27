defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file}) do
    result =
      file
      |> String.split(",")
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Arquivo invalido"}}
end
