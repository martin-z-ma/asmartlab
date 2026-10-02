$ErrorActionPreference = "Stop"

$indexPath = Join-Path $PSScriptRoot "layouts\index.html"
$cssPath = Join-Path $PSScriptRoot "static\css\site.css"

if (!(Test-Path $indexPath) -or !(Test-Path $cssPath)) {
  throw "Place this script in the root of your Hugo site, next to hugo.toml, then run it again."
}

$index = Get-Content $indexPath -Raw -Encoding UTF8
$old = '<div><div class="lab-identity"><strong>A-SMART Lab</strong><span>Applied Systems Modeling, Analytics, Research & Technology</span></div><h1>AI-Enabled Modeling, Optimization <span>&amp; Decision Intelligence</span></h1><p class="hero-domain">for resilient energy and infrastructure systems.</p><p class="lede">We develop trustworthy computational methods to support robust, risk-informed decisions across energy transition, CCUS, subsurface systems, and infrastructure.</p>'
$new = '<div><div class="lab-identity"><h1 class="lab-title">A-SMART Lab</h1><p class="lab-full-name">Applied Systems Modeling, Analytics, Research &amp; Technology (A-SMART) Lab</p></div><h2 class="research-headline">AI-Enabled Modeling, Optimization &amp; Decision Intelligence</h2><p class="hero-domain">for resilient energy and infrastructure systems.</p><p class="lede">We develop trustworthy computational methods to support robust, risk-informed decisions across energy transition, CCUS, subsurface systems, and infrastructure.</p>'

if (!$index.Contains($old)) {
  throw "The expected redesigned hero block was not found. Confirm you are applying this to a-smart-lab-home-redesigned."
}
$index = $index.Replace($old, $new)
Set-Content $indexPath $index -Encoding UTF8

$css = Get-Content $cssPath -Raw -Encoding UTF8
$addition = @'

/* Lab-name-first hero hierarchy */
.hero .lab-identity{margin-bottom:30px}
.hero .lab-title{font-size:clamp(58px,7.4vw,96px);line-height:.94;letter-spacing:-.05em;color:var(--navy);margin:0 0 15px;max-width:none}
.hero .lab-full-name{font-size:clamp(18px,2vw,27px);line-height:1.28;color:var(--teal);font-weight:780;max-width:760px;margin:0}
.hero .research-headline{font-size:clamp(28px,3.3vw,44px);line-height:1.12;letter-spacing:-.025em;color:var(--navy);margin:0 0 9px;max-width:780px}
.hero .hero-domain{font-size:clamp(20px,2vw,28px);margin:0 0 24px;color:var(--blue);font-weight:600}
.hero .lede{font-size:17px;max-width:650px}
@media(max-width:650px){.hero .lab-title{font-size:58px}.hero .lab-full-name{font-size:18px}.hero .research-headline{font-size:30px}.hero .hero-domain{font-size:21px}}
'@
if (!$css.Contains("/* Lab-name-first hero hierarchy */")) {
  Add-Content $cssPath $addition -Encoding UTF8
}
Write-Host "Hero hierarchy updated successfully. Run: hugo server"
