CLASS zcl_18_10table_ficbonacci DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_18_10table_ficbonacci IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
" Number of Fibonacci numbers to generate
  CONSTANTS max_count TYPE i VALUE 20.

  " Internal table to store Fibonacci numbers
  DATA numbers TYPE TABLE OF i.

  " Internal table for formatted output
  DATA output TYPE TABLE OF string.


  " Calculate Fibonacci numbers
  DO max_count TIMES.

    " sy-index = current iteration number
    CASE sy-index.

      " First Fibonacci number
      WHEN 1.
        APPEND 0 TO numbers.

      " Second Fibonacci number
      WHEN 2.
        APPEND 1 TO numbers.

      " Next number = sum of previous two numbers
      WHEN OTHERS.
        APPEND numbers[ sy-index - 2 ]
             + numbers[ sy-index - 1 ]
             TO numbers.

    ENDCASE.

  ENDDO.


  " Prepare formatted output
  DATA(counter) = 0.

  LOOP AT numbers INTO DATA(number).

    counter = counter + 1.

    " Add sequence number and Fibonacci number to output table
    APPEND |{ counter WIDTH = 4 ALIGN = LEFT }: { number WIDTH = 10 ALIGN = RIGHT }|
        TO output.

  ENDLOOP.


  " Display the result
  out->write(
    data = output
    name = |The first { max_count } Fibonacci Numbers|
  ).
  ENDMETHOD.
ENDCLASS.
