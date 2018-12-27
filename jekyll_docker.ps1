$env:JEKYLL_SITE_DIR = $PWD
$env:DOCKER_IMAGE_NAME = "praqma/jekyll:latest"

if (-Not (Get-Variable JEKYLL_SITE_DIR -Scope Global -ErrorAction SilentlyContinue) -and !($env:JEKYLL_SITE_DIR)) {
    Write-Host "`$env:JEKYLL_SITE_DIR was not defined."
    $env:JEKYLL_SITE_DIR = "$PWD"
}

$env:JEKYLL_SITE_DIR = $env:JEKYLL_SITE_DIR -replace "\\", "/"
$volume = "$($env:JEKYLL_SITE_DIR):/website"

Write-Host "`$env:JEKYLL_SITE_DIR: $env:JEKYLL_SITE_DIR"
Write-Host "`$env:DOCKER_IMAGE_NAME: $env:DOCKER_IMAGE_NAME"
Write-Host "`$volume: $volume"

docker run `
--interactive `
--rm `
--tty `
--volume $volume `
--workdir /website `
--publish 4444:4000 `
$env:DOCKER_IMAGE_NAME `
bash -c "ls && bundle install && jekyll --version && ruby --version && jekyll serve --watch --host=0.0.0.0 --incremental --unpublished --future"