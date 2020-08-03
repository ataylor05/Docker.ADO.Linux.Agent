New-Item $env:AZP_WORK -ItemType directory | Out-Null
Set-Location agent

$env:VSO_AGENT_IGNORE = "$env:VSO_AGENT_IGNORE,__DOTNET_ADD_32BIT,__DOTNET_PREFERRED_BITNESS,__VSCMD_PREINIT_PATH"
$env:VSO_AGENT_IGNORE = "$env:VSO_AGENT_IGNORE,ALLUSERSPROFILE,APPDATA,Cmd,COMPLUS_NGenProtectedProcess_FeatureEnabled,ComSpec,DOTNET_SKIP_FIRST_TIME_EXPERIENCE,DriverData,INCLUDE,InteractiveSession,LOCALAPPDATA"
$env:VSO_AGENT_IGNORE = "$env:VSO_AGENT_IGNORE,AZP_POOL,AZP_URL,AZP_WORK"
$env:VSO_AGENT_IGNORE = "$env:VSO_AGENT_IGNORE,NUMBER_OF_PROCESSORS,OS,Path,PATHEXT,PROCESSOR_ARCHITECTURE,PROCESSOR_IDENTIFIER,PROCESSOR_LEVEL,PROCESSOR_REVISION"
$env:VSO_AGENT_IGNORE = "$env:VSO_AGENT_IGNORE,PROMPT,PSExecutionPolicyPreference,PSModulePath,PUBLIC,SystemDrive,SystemRoot,USERNAME,TEMP,TMP,USERDOMAIN,VERBOSE_ARG,VSCMD_ARG_app_plat,VSCMD_ARG_HOST_ARCH,VSCMD_ARG_TGT_ARCH,VSO_AGENT_IGNORE,windir,WindowsLibPath,WindowsSDKVersion"

cd C:\azp\agent
.\config.cmd --unattended `
    --url "$env:AZP_URL" `
    --auth PAT `
    --token "$env:AZP_TOKEN" `
    --pool "$env:AZP_POOL" `
    --work "$env:AZP_WORK" `
    --replace

$env:AZP_TOKEN = $null

.\run.cmd --once