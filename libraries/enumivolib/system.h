/**
 *  @file
 *  @copyright defined in enumivo/LICENSE
 */
#pragma once
#include "types.h"

#warning "<enumivolib/system.h> is deprecated use <enumivo/system.h>. If you are using C++ the .h header files will be removed from inclusion entirely in v1.7.0"
#ifdef __cplusplus
extern "C" {
#endif

   /**
    * @addtogroup system
    * @ingroup c_api
    * @brief Defines API for interacting with system level intrinsics
    * @{
    */

   /**
    *  Aborts processing of this action and unwinds all pending changes if the test condition is true
    *
    *  @param test - 0 to abort, 1 to ignore
    *
    *  Example:
    *
    *  @code
    *  enumivo_assert(1 == 2, "One is not equal to two.");
    *  enumivo_assert(1 == 1, "One is not equal to one.");
    *  @endcode
    *
    *  @param msg - a null terminated string explaining the reason for failure
    */
   __attribute__((enumivo_wasm_import))
   void  enumivo_assert( uint32_t test, const char* msg );

   /**
    *  Aborts processing of this action and unwinds all pending changes if the test condition is true
    *
    *  @param test - 0 to abort, 1 to ignore
    *  @param msg - a pointer to the start of string explaining the reason for failure
    *  @param msg_len - length of the string
    */
   __attribute__((enumivo_wasm_import))
   void  enumivo_assert_message( uint32_t test, const char* msg, uint32_t msg_len );

   /**
    *  Aborts processing of this action and unwinds all pending changes if the test condition is true
    *
    *  @brief Aborts processing of this action and unwinds all pending changes
    *  @param test - 0 to abort, 1 to ignore
    *  @param code - the error code
    */
   __attribute__((enumivo_wasm_import))
   void  enumivo_assert_code( uint32_t test, uint64_t code );

    /**
    *  This method will abort execution of wasm without failing the contract. This is used to bypass all cleanup / destructors that would normally be called.
    *
    *  @param code - the exit code
    *  Example:
    *
    *  @code
    *  enumivo_exit(0);
    *  enumivo_exit(1);
    *  enumivo_exit(2);
    *  enumivo_exit(3);
    *  @endcode
    */
   __attribute__((enumivo_wasm_import, noreturn))
   void enumivo_exit( int32_t code );

   /**
    *  Returns the time in microseconds from 1970 of the current block
    *
    *  @return time in microseconds from 1970 of the current block
    */
   __attribute__((enumivo_wasm_import))
   uint64_t  current_time();

   /**
    *  Get time (rounded down to the nearest second) of the current block (i.e. the block including this action)
    *
    *  @return time in seconds from 1970 of the current block
    */
   __attribute__((enumivo_wasm_import))
   inline uint32_t  now() {
      return (uint32_t)( current_time() / 1000000 );
   }

#ifdef __cplusplus
}
#endif
  ///@}

