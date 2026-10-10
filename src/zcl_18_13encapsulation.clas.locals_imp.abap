class lcl_connection definition.

  public section.
    METHODS constructor
      IMPORTING
        i_carrier_id TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id

      RAISING
        cx_ABAP_INVALID_VALUE.
* Methods
*    METHODS set_attributes
*      IMPORTING
*        i_carrier_id    TYPE /dmo/carrier_id  DEFAULT 'LH'
*        i_Connection_id TYPE /dmo/connection_id
*      RAISING
*        cx_abap_invalid_value.
CLASS-DATA conn_counter TYPE i READ-ONLY.

METHODS get_output
  RETURNING VALUE(rv_output) TYPE string.

  protected section.
  private section.
* Attributes

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

endclass.

class lcl_connection implementation.

  method constructor.

 IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.

    conn_counter = conn_counter + 1.

  endmethod.

  METHOD get_output.

  rv_output = |Carrier: { me->carrier_id }, Connection: { me->connection_id }|.

ENDMETHOD.

* METHOD set_attributes.

*    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

*    carrier_id    = i_carrier_id.
*    connection_id = i_connection_id.


*ENDMETHOD.

ENDCLASS.



*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

