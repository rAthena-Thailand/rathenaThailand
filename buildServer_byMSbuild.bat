@ECHO OFF
msbuild rAthena.sln -t:rebuild -property:Configuration=Release /p:DefineConstants="BUILDBOT" /warnaserror
ECHO rAthena Build successfully. 

PAUSE