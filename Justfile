set shell := ["sh", "-c"]
set windows-shell := ["pwsh.exe", "-c"]

export LOVR_PATH := "C:\\Program Files\\LOVR\\lovr.exe"

current_directory := invocation_directory()
source_directory := current_directory / "src"
zip_path := current_directory / "loverspades.zip"

package:
    just package-{{os_family()}}

package-linux:
    zip -9qr loverspades.zip {{source_directory / "*"}}
    cat {{LOVR_PATH}} {{zip_path}} > loverspades

package-windows:
    7z a "{{zip_path}}" "{{source_directory / "*"}}"
    Get-Content -Path "{{LOVR_PATH}}", "{{zip_path}}" -AsByteStream -Raw | Set-Content -Path "loverspades.exe" -AsByteStream
    New-Item -Path "{{current_directory / "build" / os_family() / ""}}" -ItemType Directory -Force | Out-Null
    Move-Item -Path "loverspades.*" -Destination "{{current_directory / "build" / os_family() / ""}}" -Force