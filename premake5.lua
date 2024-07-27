project "tracy"
    kind "StaticLib"
    language "C++"
    staticruntime "On"

    targetdir(envir_work_space_directory .. "/bin/" .. envir_output_directory .. "/%{prj.name}")
    objdir(envir_work_space_directory .. "/bin-int/" .. envir_output_directory .. "/%{prj.name}")

    defines {
      "_CRT_SECURE_NO_WARNINGS",
      "TRACY_ENABLE"
    }

    files {
          "public/tracyClient.cpp",
          "public/tracy/tracy.hpp",

          "premake5.lua"
    }

    includedirs {
        "*"
    }

    links {

    }

    postbuildcommands {
        ("{COPY} %{cfg.buildtarget.relpath} \"../../bin/" .. envir_output_directory .. "/sandbox/\""),
        ("{COPY} %{cfg.buildtarget.relpath} \"../../bin/" .. envir_output_directory .. "/unittest/\"")
    }


    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
