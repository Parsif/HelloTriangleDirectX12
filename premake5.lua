workspace "HelloTriangleDirectX12"
    configurations { "Debug", "Release" }   
    startproject "HelloTriangleDirectX12"

architecture "x86_64"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "HelloTriangleDirectX12"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    targetdir ("bin-int/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "precheader.h"
	pchsource "%{prj.name}/src/precheader.cpp"

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
    }

    filter "system:windows"
        staticruntime "On"
        systemversion "latest"

        kind "WindowedApp"
        entrypoint "WinMainCRTStartup"

        warnings "Extra" 

        defines
        {
            "HT_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        symbols "On"
        defines { "HT_CONFIGURATION_DEBUG" }

    filter "configurations:Release"
        optimize "On"
        defines { "HT_CONFIGURATION_RELEASE" }