defmodule Util do

  def ingresar(mensaje, :texto) do
    IO.gets(mensaje <> ": ")
    |> String.trim()
  end


  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "MostrarMensaje", mensaje])
  end


  def ingresar(mensaje, :entero), do: ingresar_privado(mensaje, &String.to_integer/1, :entero)
  def ingresar(mensaje, :real), do: ingresar_privado(mensaje, &String.to_float/1, :real)

  defp ingresar_privado(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        mostrar_error("❌ Error, se espera que ingrese un número #{tipo_dato}")
        ingresar_privado(mensaje, parser, tipo_dato)
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
