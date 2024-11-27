project "spdlog"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "include/spdlog/*.h",
        "include/spdlog/details/*.h",
        "include/spdlog/sinks/*.h",
        "include/spdlog/fmt/*.h",
        "include/spdlog/fmt/bundled/*.h",

        "src/spdlog.cpp",
        "src/stdout_sinks.cpp",
        "src/color_sinks.cpp",
        "src/file_sinks.cpp",
        "src/async.cpp",
        "src/cfg.cpp",

        "src/bundled_fmtlib_format.cpp",
	}

    includedirs 
    {
        "include"
    }

	defines
	{
		"SPDLOG_COMPILED_LIB"
	}


    filter "system:windows"
		systemversion "latest"
		staticruntime "On"
        buildoptions { "/utf-8" }
        
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"