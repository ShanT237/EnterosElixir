defmodule Util do
  @moduledoc """
  Utilidades para entrada y salida de datos en consola y manejo de errores.
  """

  @doc """
  Solicita al usuario que ingrese un texto mostrando el `mensaje` dado.
  Retorna el texto ingresado sin espacios al inicio o final.
  """
  def ingresar(mensaje, :texto) do
    IO.gets(mensaje <> ": ")
    |> String.trim()
  end

  @doc """
  Llama a un script Python para mostrar un mensaje.
  """
  def mostrar_mensaje_py(mensaje) do
    System.cmd("python3", ["mostrar_mensaje.py", mensaje])
  end

  @doc """
  Muestra un mensaje en la consola estándar.
  """
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  @doc """
  Solicita al usuario que ingrese un número entero mostrando el `mensaje` dado.
  Valida la entrada y repite hasta que sea válida.
  """
  def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)

  @doc """
  Solicita al usuario que ingrese un número real mostrando el `mensaje` dado.
  Valida la entrada y repite hasta que sea válida.
  """
  def ingresar(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)

  @doc false
  # Función interna para manejar la entrada y validación de datos numéricos.
  defp ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número #{tipo_dato}\n"
        |> mostrar_error()

        mensaje
        |> ingresar(parser, tipo_dato)
    end
  end

  @doc """
  Muestra un mensaje de error en la salida estándar de errores.
  """
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
