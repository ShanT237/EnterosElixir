defmodule EntradaReales do
  @moduledoc """
  Módulo para calcular el descuento y el valor final de un producto
  a partir de su valor y el porcentaje de descuento ingresados por el usuario.
  """

  @doc """
  Función principal que solicita los datos al usuario, calcula el descuento y el valor final,
  y muestra el resultado usando un script Python.
  """
  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> Util.ingresar(:entero)

    porcentaje_descuento =
      "Ingrese el porcentaje de descuento: "
      |> Util.ingresar(:real)

    valor_descuento = calcular_valor_descuento(valor_producto, porcentaje_descuento)
    valor_final = calcular_valor_final(valor_producto, valor_descuento)

    generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje_py()
  end

  @doc """
  Calcula el valor del descuento multiplicando el valor del producto por el porcentaje de descuento.
  """
  defp calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  @doc """
  Calcula el valor final restando el valor del descuento al valor del producto.
  """
  defp calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  @doc """
  Genera un mensaje con el valor del descuento y el valor final, ambos redondeados a un decimal.
  """
  defp generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = valor_descuento |> Float.round(1)
    valor_final = valor_final |> Float.round(1)
    "Valor de descuento de $#{valor_descuento} y el valor final $#{valor_final}"
  end
end

EntradaReales.main()
