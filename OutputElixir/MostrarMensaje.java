// Archivo: MostrarMensaje.java
public class MostrarMensaje {
    public static void main(String[] args) {
        if (args.length > 0) {
            String mensaje = args[0]; // Tomamos el primer argumento
            System.out.println("Mensaje recibido: " + mensaje);
        } else {
            System.out.println("No se recibió ningún mensaje.");
        }
    }
}
