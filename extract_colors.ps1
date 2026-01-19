$txt = Get-Content -Raw 'c:\Users\Western-Highways\Desktop\BUILD YOUR TMA BED ONLINE\classic 1 web.HTML'
$patterns = @(
    '(?i)color\s*:\s*([^;\r\n]+)',
    '(?i)background-color\s*:\s*([^;\r\n]+)',
    '(?i)border-color\s*:\s*([^;\r\n]+)',
    '(?i)stroke\s*:\s*([^;\r\n]+)',
    '#[0-9a-fA-F]{3,6}',
    'rgba?\([^\)]+\)'
)
$res = @()
foreach ($p in $patterns) {
    $m = [regex]::Matches($txt, $p)
    foreach ($mm in $m) {
        if ($mm.Groups.Count -gt 1) { $res += $mm.Groups[1].Value.Trim() } else { $res += $mm.Value.Trim() }
    }
}
$res = $res | Where-Object { $_ -ne '' } | Sort-Object -Unique
$res | ForEach-Object { Write-Output $_ }
