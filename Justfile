set shell := ["sh", "-c"]
set windows-shell := ["pwsh.exe", "-c"]

current_directory := invocation_directory()
source_directory := current_directory / "src"
zip_path := current_directory / "loverspades.zip"
build_directory := current_directory / "build" / os() / arch() / ""

package:
    just package-{{os()}}

package-linux:
    zip -9qr loverspades.zip {{source_directory / "*"}}
    cat $(which lovr) {{zip_path}} > loverspades

package-windows:
    7z a "{{zip_path}}" "{{source_directory / "*"}}"
    Get-Content -Path "$((Get-Command lovr).Path)", "{{zip_path}}" -AsByteStream -Raw | Set-Content -Path "loverspades.exe" -AsByteStream
    New-Item -Path "{{build_directory}}" -ItemType Directory -Force | Out-Null
    Move-Item -Path "loverspades.*" -Destination "{{build_directory}}" -Force

run: package
    just run-{{os()}}

run-windows:
    {{build_directory / "loverspades.exe"}}

run-linux:
    {{build_directory / "loverspades"}}
