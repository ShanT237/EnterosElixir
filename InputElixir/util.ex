defmodule Util do
  @doc """
  Muestra un mensaje utilizando un script externo de Python.

  ## Parámetros
    - mensaje: El mensaje a mostrar.

  ## Ejemplo
      Util.mostrar_mensaje("Hola mundo")
  """
  def mostrar_mensaje(mensaje) do
    System.cmd("python3", ["mostrar_mensaje.py", mensaje])
  end

  @doc """
  Solicita al usuario que ingrese un texto.

  ## Parámetros
    - mensaje: El mensaje a mostrar como prompt.
    - :texto: Indica que se espera un texto.

  ## Ejemplo
      Util.ingresar("Ingrese su nombre", :texto)
  """
  def ingresar(mensaje, :texto) do
    IO.gets(mensaje <> ": ")
    |> String.trim()
  end

  @doc """
  Solicita al usuario que ingrese un número entero. Si la entrada no es válida,
  muestra un error y vuelve a solicitar la entrada.

  ## Parámetros
    - mensaje: El mensaje a mostrar como prompt.
    - :entero: Indica que se espera un entero.

  ## Ejemplo
      Util.ingresar("Ingrese su edad", :entero)
  """
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

  @doc """
  Muestra un mensaje de error en la salida estándar de error.

  ## Parámetros
    - mensaje: El mensaje de error a mostrar.

  ## Ejemplo
      Util.mostrar_error("Ocurrió un error")
  """
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
