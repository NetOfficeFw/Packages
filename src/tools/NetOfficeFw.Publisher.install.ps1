param($installPath, $toolsPath, $package, $project)

$ref = $project.Object.References.Item("PublisherApi")
if ($ref -and $ref.EmbedInteropTypes)
{
    $ref.EmbedInteropTypes = $false
}
