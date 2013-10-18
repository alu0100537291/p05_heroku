# SYTW - Práctica 4 #
## Test en Rock, Paper and Scissors ##

### Guión  
El guión de esta práctica se encuentra [aquí](https://github.com/coromoto/PruebasUnitarias)

### Ejecución
Para la ejecución de la **práctica**

    rake

Para la ejecución de los **test**

    rake test

### Implementación
Ésta práctica contiene 4 ficheros:
   1. `racional.rb`, donde se encuentra la clase `Fraccion`
   2. `tc_racional.rb`, donde se encuentran los test
   3. `mcm.rb`, método del Mínimo Común Múltiplo
   4. `mcd.rb`, método del Máximo Común Divisor

El guión provee de una clase `Fraccion` para la representación de los números racionales.
Cada objeto de dicha clase debe representar un número racional reducido a su mínima expresión.

    class Fraccion
       def initialize(*args)
          ...
          Constructor. Almacena un número racional reducido a su mínima expresión
          ...
       end

       def to_s
          ...
          Cadena con la representación del número racional
          ...
       end

       def operandoMin(c, d)
          ...
          Reducción de un número (c/d) a su mínima expresión
          ...
       end

       def suma(*args)
          ...
          Suma del número (objeto) actual y otro número
          ...
       end

       def resta(*args)
          ...
          Resta del número (objeto) actual y otro número
          ...
       end

       def producto(*args)
          ...
          Producto del número (objeto) actual y otro número
          ...
       end

       def division(*args)
          ...
          División del número (objeto) actual y otro número
          ...
       end
    end

Autor
-------
| ALUMNO | CORREO |
| ---------- | ---------- |
| José Alberto Pérez Melián   | alu0100537291[AT]ull.edu.es   |