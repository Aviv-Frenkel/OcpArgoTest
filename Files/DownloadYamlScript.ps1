param (
    [string]$Namespace = "aviv-hafifa",    # Default namespace
    [string]$ResourceType = "deployment"   # Default resource type (deployment, statefulset, service, configmap, route, etc.)
)

# Get all resources of the specified type in the namespace
$resources = oc get $ResourceType -n $Namespace -o name

# Loop through each resource and save its YAML to a file
foreach ($resource in $resources) {
    $resourceName = $resource.Split("/")[1].ToLower()
    $fileName = "$resourceName-$ResourceType.yaml"
    oc get $resource -n $Namespace -o yaml > $fileName
    Write-Output "Saved $resource to $fileName"
}
