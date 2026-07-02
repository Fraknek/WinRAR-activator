# WinRAR Activator - GitHub EXE Downloader
# by Fraknek
# Repo: https://github.com/Fraknek/WinRAR-activator

Clear-Host

$ascii = @"

 __          ___                            
 \ \        / (_)                           
  \ \  /\  / / _ _ __  _ __ __ _ _ __       
   \ \/  \/ / | | '_ \| '__/ _` | '__|      
    \  /\  /  | | | | | | | (_| | |         
     \/  \/   |_|_| |_|_|  \__,_|_|         
             _   _            _             
            | | (_)          | |            
   __ _  ___| |_ ___   ____ _| |_ ___  _ __ 
  / _` |/ __| __| \ \ / / _` | __/ _ \| '__|
 | (_| | (__| |_| |\ V / (_| | || (_) | |   
  \__,_|\___|\__|_| \_/ \__,_|\__\___/|_|   
                                            
        WinRAR Activator v2.0
"@

Write-Host $ascii -ForegroundColor Cyan
Write-Host "=" * 50
Write-Host "Downloading WinRAR Activator from GitHub..." -ForegroundColor Yellow
Write-Host "=" * 50
Write-Host ""

# URL do Twojego pliku EXE na GitHub
$exeUrl = "https://github.com/Fraknek/WinRAR-activator/raw/main/main.exe"

# Alternatywny URL (Releases - jeśli utworzysz)
# $exeUrl = "https://github.com/Fraknek/WinRAR-activator/releases/download/v1.0/main.exe"

# Ścieżka tymczasowa
$tempPath = "$env:TEMP\WinRAR_Activator.exe"

try {
    $ProgressPreference = 'SilentlyContinue'
    
    Write-Host "[*] Connecting to GitHub..." -ForegroundColor Gray
    Write-Host "[*] Downloading main.exe..." -ForegroundColor Gray
    
    # Pobierz plik EXE
    Invoke-WebRequest -Uri $exeUrl -OutFile $tempPath -ErrorAction Stop
    
    if (Test-Path $tempPath) {
        $fileSize = (Get-Item $tempPath).Length / 1MB
        Write-Host "[✓] Downloaded successfully! ($([math]::Round($fileSize, 2)) MB)" -ForegroundColor Green
        Write-Host ""
        Write-Host "[*] Launching activator as administrator..." -ForegroundColor Yellow
        Write-Host "[*] Follow the instructions in the activator window" -ForegroundColor Gray
        Write-Host ""
        
        # Uruchom jako administrator i czekaj
        $process = Start-Process -FilePath $tempPath -Verb RunAs -Wait -PassThru
        
        Write-Host ""
        Write-Host "[✓] Activator closed with exit code: $($process.ExitCode)" -ForegroundColor Green
        
    } else {
        Write-Host "[✗] File download failed!" -ForegroundColor Red
    }
    
} catch {
    Write-Host ""
    Write-Host "[✗] Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible solutions:" -ForegroundColor Yellow
    Write-Host "  1. Check your internet connection" -ForegroundColor Gray
    Write-Host "  2. Temporarily disable antivirus (false positive)" -ForegroundColor Gray
    Write-Host "  3. Run PowerShell as Administrator manually" -ForegroundColor Gray
    Write-Host "  4. Try alternative download link" -ForegroundColor Gray
    
} finally {
    Write-Host ""
    Write-Host "=" * 50
    
    # Sprzątanie
    Start-Sleep -Seconds 3
    if (Test-Path $tempPath) {
        Remove-Item $tempPath -Force -ErrorAction SilentlyContinue
        Write-Host "[✓] Temporary files cleaned" -ForegroundColor Green
    }
    
    Write-Host ""
    Write-Host "Press Enter to exit..."
    Read-Host
}