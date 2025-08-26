defmodule EntradaEnteros do
  @moduledoc """
  Módulo para solicitar valores de factura y pago, y calcular la devuelta.
  """

  @doc """
  Función principal que solicita los valores al usuario, calcula la devuelta y muestra el resultado.
  """
  def main do
    valor_total =
      "Ingrese valor total de la factura: "
      |> ingresar(:entero)

    valor_entregado =
      "Ingrese valor entregado para el pago: "
      |> ingresar(:entero)

    calcular_devuelta(valor_entregado, valor_total)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  @doc """
  Solicita al usuario un número entero usando Util.ingresar/2.

  ## Parámetros
    - mensaje: El mensaje a mostrar como prompt.
    - :entero: Indica que se espera un entero.

  ## Retorna
    - El número entero ingresado por el usuario.
  """
  defp ingresar(mensaje, :entero) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.to_integer()
  end

  @doc """
  Calcula la cantidad de dinero a devolver al cliente.

  ## Parámetros
    - valor_pago: El valor entregado por el cliente.
    - valor_total: El valor total de la factura.

  ## Retorna
    - La diferencia entre valor_pago y valor_total.
  """
  defp calcular_devuelta(valor_pago, valor_total) do
    valor_pago - valor_total
  end

  @doc """
  Genera el mensaje que indica el valor de la devuelta.

  ## Parámetros
    - devuelta: El valor calculado a devolver.

  ## Retorna
    - Un string con el mensaje para mostrar al usuario.
  """
  defp generar_mensaje(devuelta) do
    "El valor de devuelta es $ #{devuelta}"
  end
end

EntradaEnteros.main()
