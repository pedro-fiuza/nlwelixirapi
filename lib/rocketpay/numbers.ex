defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  @doc """
  Enum/Stream, stream eh um operador lazy, soh executa quando precisa do resultado,
  Ele ira agrupar o converter pra inteiro e somar o resultado
  """

  defp handle_file({:ok, file}) do
    result =
      file
      |> String.split(",")
      |> Stream.map(fn x -> String.to_integer(x) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Arquivo invalido"}}
end
