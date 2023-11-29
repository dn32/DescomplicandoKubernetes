param([string]$type = "pdf", [boolean]$start = $true)

if ($start) {
	Remove-Item  Output -Force -Recurse -ErrorAction SilentlyContinue | out-null 
}

MkDir Output -ErrorAction SilentlyContinue  | out-null


$output = ".\Output\Descomplicando Kubernetes.$type"

pandoc --table-of-contents --toc-depth=3 `
    --epub-metadata=metadata.xml `
    --highlight-style=espresso `
    --embed-resources --standalone `
    --top-level-division=part `
	--listings `
    --pdf-engine=xelatex `
    --number-sections `
	--epub-cover-image=..\images\kubernetes_architecture.png `
	-o $output `
    .\title.txt `
    .\SUMMARY.md `
    .\day_one\README.md .\day_two\README.md .\day_three\README.md .\day_four\README.md  .\day_five\README.md  .\day_six\README.md  .\day_seven\README.md  .\day_eight\README.md  .\day_nine\README.md `
