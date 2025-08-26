defmodule Util do
  def mostrar_mensaje(mensaje) do
    System.cmd("python3", ["mostrar_mensaje.py", mensaje])
  end

  def ingresarJava(mensaje, :entero) do
    case System.cmd("java", ["-cp", ".", "IngresarMensaje", "input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente.")
        String.trim(output)

      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        nil
    end
  end

  def ingresar(mensaje, :texto) do
    IO.gets(mensaje <> ": ")
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        mostrar_error("❌ Error: se espera un número entero.")
        ingresar(mensaje, :entero)
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
