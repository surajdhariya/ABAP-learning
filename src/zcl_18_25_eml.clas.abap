CLASS zcl_18_25_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_18_25_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencytp.
    DATA agencies_upd1 TYPE TABLE FOR CREATE /dmo/i_agencytp.

    agencies_upd = VALUE #( ( agencyid = '070018' name = 'Some fancy suraj dhariya' ) ).
    agencies_upd1 = VALUE #(
  ( %cid     = 'AGENCY1'
    agencyid = '070051'
    name     = 'suraj dhariya create' )
).
    MODIFY ENTITIES OF /dmo/i_agencytp
      ENTITY /dmo/agency
      UPDATE FIELDS ( name )
        WITH agencies_upd.

    COMMIT ENTITIES.

   MODIFY ENTITIES OF /dmo/i_agencytp
  ENTITY /dmo/agency
  CREATE FIELDS (  name )
    WITH agencies_upd1
  FAILED DATA(failed)
  REPORTED DATA(reported).

COMMIT ENTITIES.

    out->write( `Method execution finished!`  ).

  ENDMETHOD.
ENDCLASS.
