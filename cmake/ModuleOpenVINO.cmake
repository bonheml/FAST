if(FAST_MODULE_OpenVINO)
    message("-- Enabling Intel OpenVINO inference engine module")
    if(WIN32)
        fast_download_dependency(openvino
                2021.1
                69628ba6f40094834b0f8b6f38efee6e7fc67cfb44805ffd638177de571aff3e
        )
    else()
        fast_download_dependency(openvino
                2021.1
                70c5c352748dabf85f119027c281fb37a968421ef6c7cf47de8fd520acb41b99
        )
    endif()
endif()
