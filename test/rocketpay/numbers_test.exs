defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "Retorna um numero somado de acordo com o arquivo quando ele existe" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "Nao retorna um numero porque o arquivo nao existe" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Arquivo invalido"}}

      assert response == expected_response
    end
  end
end
