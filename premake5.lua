-- premake5.lua
workspace "Lua41"
   configurations { "Debug", "Release" }

project "Lua41"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   includedirs { "include" }

   files { "include/**.h", "src/**.h", 
      "src/lapi.c",   "src/ldo.c",     "src/lmem.c",    	"src/lstate.c",  "src/ltm.c",
      "src/lcode.c",  "src/lfunc.c",   "src/lobject.c",  "src/lstring.c", "src/lundump.c",
      "src/ldebug.c", "src/lgc.c",     "src/lopcodes.c", "src/ltable.c",  "src/lvm.c",
      "src/llex.c",   "src/lparser.c", "src/ltests.c",   "src/lzio.c",    "src/lexit.c" }

   filter { "action:vs*", "configurations:Release" }
	   buildoptions "/GL"
 	   linkoptions "/LTCG" 

   filter "action:vs*"
  	   defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }
      linkoptions "/DEF:Lua41.def"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      optimize "On"

project "Lua41Lib"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua41" }
   libdirs { "bin/%{cfg.buildcfg}" }
   includedirs { "include" }

   files { "include/**.h", "src/**.h",
	   "src/lib/lauxlib.c",  "src/lib/lbaselib.c", "src/lib/ldblib.c",  "src/lib/liolib.c", 
      "src/lib/lmathlib.c", "src/lib/lstrlib.c" } 

   filter { "action:vs*", "configurations:Release" }
	   buildoptions "/GL"
 	   linkoptions "/LTCG" 

   filter "action:vs*"
  	   defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }
      linkoptions "/DEF:Lua41Lib.def"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      optimize "On"

project "Lua"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua41", "Lua41lib" }
   libdirs { "bin/%{cfg.buildcfg}" }
   includedirs { "include" }

   files { "include/**.h", "src/**.h", "src/lua/lua.c" }

   filter { "action:vs*", "configurations:Release" }
	   buildoptions "/GL"
 	   linkoptions "/LTCG" 

   filter "action:vs*"
  	   defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      optimize "On"

project "Luac"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua41lib" }
   libdirs { "bin/%{cfg.buildcfg}" }
   includedirs { "include", "src" }

   files { "include/**.h", "src/**.h", 
      "src/luac/luac.c", "src/luac/dump.c", "src/luac/ldumplib.c", 
      "src/luac/luac.h", "src/luac/opt.c",  "src/luac/print.c",
      "src/lapi.c",      "src/lcode.c",     "src/ldebug.c",
      "src/ldo.c",       "src/lfunc.c",     "src/lgc.c",
      "src/llex.c",      "src/lmem.c",      "src/lobject.c",
      "src/lopcodes.c",  "src/lparser.c",   "src/lstate.c",
      "src/lstring.c",   "src/ltable.c",    "src/ltests.c",
      "src/ltm.c",       "src/lundump.c",   "src/lvm.c",
      "src/lzio.c"  }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_OPNAMES" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      optimize "On"
