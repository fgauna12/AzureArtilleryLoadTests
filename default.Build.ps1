
$ImageName = "fgauna12/gaunastressyou:latest"

task DockerBuild{
    exec { 
        docker build -t $ImageName .
    }
}

task DockerPush {
    exec {
        az acr login -n nebbiaregistry

        docker push $ImageName
    }
}

task . DockerBuild, DockerPush