CLASS zcl_18_32text_symbol DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_18_32text_symbol IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( 'Hello World'(001) ).
  out->write( TEXT-002 ).

  ENDMETHOD.
ENDCLASS.
