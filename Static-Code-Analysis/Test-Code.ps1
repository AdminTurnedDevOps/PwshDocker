$docker = "./Docker/*"
Foreach ($script in $docker) {
    Invoke-ScriptAnalyzer -Path $script
}