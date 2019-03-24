add_custom_command( TARGET EnumivoClang POST_BUILD COMMAND mkdir -p ${CMAKE_BINARY_DIR}/bin )
macro( enumivo_clang_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/enumivo_llvm/bin)
   add_custom_command( TARGET EnumivoClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( enumivo_clang_install )

macro( enumivo_clang_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/enumivo_llvm/bin)
   add_custom_command( TARGET EnumivoClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET EnumivoClang POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( enumivo_clang_install_and_symlink )

macro( enumivo_tool_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET EnumivoTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( enumivo_tool_install )

macro( enumivo_tool_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET EnumivoTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET EnumivoTools POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( enumivo_tool_install_and_symlink )

macro( enumivo_libraries_install)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/lib)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/include)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/lib/ DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/include/ DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR})
endmacro( enumivo_libraries_install )

enumivo_clang_install_and_symlink(llvm-ranlib enumivo-ranlib)
enumivo_clang_install_and_symlink(llvm-ar enumivo-ar)
enumivo_clang_install_and_symlink(llvm-nm enumivo-nm)
enumivo_clang_install_and_symlink(llvm-objcopy enumivo-objcopy)
enumivo_clang_install_and_symlink(llvm-objdump enumivo-objdump)
enumivo_clang_install_and_symlink(llvm-readobj enumivo-readobj)
enumivo_clang_install_and_symlink(llvm-readelf enumivo-readelf)
enumivo_clang_install_and_symlink(llvm-strip enumivo-strip)
enumivo_clang_install(opt)
enumivo_clang_install(llc)
enumivo_clang_install(lld)
enumivo_clang_install(ld.lld)
enumivo_clang_install(ld64.lld)
enumivo_clang_install(clang-7)
enumivo_clang_install(wasm-ld)
enumivo_tool_install(enumivo-pp)
enumivo_tool_install(enumivo-wast2wasm)
enumivo_tool_install(enumivo-wasm2wast)
enumivo_tool_install(enumivo-cc)
enumivo_tool_install(enumivo-cpp)
enumivo_tool_install(enumivo-ld)
enumivo_tool_install(enumivo-abigen)
enumivo_tool_install(enumivo-abidiff)
enumivo_tool_install(enumivo-init)
enumivo_clang_install(../lib/LLVMEnumivoApply${CMAKE_SHARED_LIBRARY_SUFFIX})
enumivo_clang_install(../lib/LLVMEnumivoSoftfloat${CMAKE_SHARED_LIBRARY_SUFFIX})
enumivo_clang_install(../lib/enumivo_plugin${CMAKE_SHARED_LIBRARY_SUFFIX})
enumivo_libraries_install()
